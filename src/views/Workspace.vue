<template>
  <div class="flex flex-row my-20">
    <div
      class="column border border-csblack rounded-3xl rounded-l-none w-1/4 h-11/12 bg-csbluewhite p-4 shadow-xl mt-20"
    >
      <!-- Search -->
      <div class="w-full text-xl my-5">
        <i class="fas fa-search mx-3 self-center scale-125 transform w-1/12" />
        <input
          class="w-10/12 border-csblack border rounded-xl outline-none px-5"
          placeholder="Уведіть назву елемента.."
          v-model="search"
        />
      </div>
      <div
        class="elementCollection mt-3 pt-3 overflow-y-scroll scrollbar-thin scrollbar-thumb-blue-400 scrollbar-track-blue-100 scrollbar-thumb-rounded-full scrollbar-track-rounded-full"
      >
        <div v-for="element in filteredElements" :key="element.elementId">
          <ElementChooser
              v-bind:symbol="element.symbol"
              v-bind:name="element.name"
              v-bind:category="element.categoryId.toString()"
              draggable="true"
              @click="addElement(element)"
              @dragstart="startDrag($event, element)"
          />
        </div>
      </div>
    </div>
    <!-- scrollbar:
    overflow-y-auto
      scrollbar-thin scrollbar-thumb-blue-0 scrollbar-track-blue-0 scrollbar-thumb-rounded-full scrollbar-track-rounded-full
      !-->

    <WorkspaceComp id="workspaceCanvas"
                   @mouseup="atomKeyupLeft()"
                   v-bind:atoms="atoms"
                   v-bind:value="value"
                   @drop="onDrop($event)"
                   @dragenter.prevent
                   @dragover.prevent
                   @remove="removeElement"
                   @dragAndDrop="dragAndDropElement"
    />
  </div>

  <Footer />
</template>

<script>
import ElementChooser from '@/components/ElementChooser'
import WorkspaceComp from '@/components/WorkspaceComp'
import Footer from '@/components/Footer'
import storage from '@/store'
import apiService from '@/services'

export default {
  data() {
    return {
      search: null,
      dragElement: null,
      dragAtom: null,
      elements: [],
      unlockableElements: [],
      atoms: [],
      value: [],
    }
  },
  name: 'Workspace',
  components: {
    ElementChooser,
    WorkspaceComp,
    Footer,
  },
  created() {
    apiService.getElements().then((resp) => {
      this.elements = resp.data.filter(e => !e.isLocked)
      this.unlockableElements = resp.data.filter(e => e.isLocked)
      console.log(resp)
    })
    if (storage.state.token.length !== 0) {
      this.getUserElements()
    }
  },
  watch: {
    isUserAuthorised: function () {
      this.getUserElements()
    },
  },
  methods: {
    async getUserElements() {
      if (this.isUserAuthorised) {
        await apiService.getUser().then((resp) => {
          console.log(resp.data.elements)
          for (let i = 0; i < resp.data.elements.length; ++i) {
            if (!this.elements.some(e => e.elementId === resp.data.elements[i].elementId)) {
              resp.data.elements[i].isLocked = false
              this.elements.push(resp.data.elements[i])
            }
          }
        })
      }
    },
    atomKeydownLeft(element) {
      console.warn(element)
    },
    atomKeyupLeft() {
      console.warn('end')
    },
    move($event) {
      console.log($event)
    },
    startDrag(event, element) {
      console.warn(element)
      event.dataTransfer.dropEffect = 'move'
      event.dataTransfer.effectAllowed = 'move'
      this.dragElement = element
    },
    onDrop(event) {
      console.warn(event)
      if (this.dragElement != null) {
        this.atoms.push({
          id: this.dragElement.elementId,
          symbol: this.dragElement.symbol,
          category: this.dragElement.category.categoryId,
          clientX: event.offsetX,
          clientY: event.offsetY,
          movementX: event.movementX,
          movementY: event.movementY,
        })
        if (
            this.value.filter((el) => el.elementId === this.dragElement.elementId)
                .length === 0
        ) {
          this.value.push({
            amount: 1,
            elementId: this.dragElement.elementId,
          })
        } else {
          for (let i = 0; i < this.value.length; i += 1) {
            if (this.value[i].elementId === this.dragElement.elementId) {
              this.value[i].amount += 1

            }
          }
        }
        console.log(this.value)
        this.dragElement = null
        apiService
          .searchMaterial(this.value)
          .then((resp) => console.log(resp.data))
      }
      if (this.dragAtom != null) {
        this.atoms.push({
          id: this.dragAtom.id,
          symbol: this.dragAtom.symbol,
          category: this.dragAtom.category,
          clientX: event.offsetX,
          clientY: event.offsetY,
          movementX: event.movementX,
          movementY: event.movementY,
        })
        this.atoms = this.atoms.filter((el) => el !== this.dragAtom)
        this.dragAtom = null
      }
    },
    removeElement(atom) {
      this.atoms = this.atoms.filter((el) => el !== atom)
      for (let i = 0; i < this.value.length; i += 1) {
        if (this.value[i].elementId === atom.id) {
          this.value[i].amount -= 1
        }
      }
      this.value = this.value.filter((el) => el.amount !== 0)
      console.log(this.value)
      apiService
        .searchMaterial(this.value)
        .then((resp) => console.log(resp.data))
    },
    dragAndDropElement(obj) {
      console.log(obj.atom)
      console.log(obj.event)
      this.dragAtom = obj.atom
    },
  },
  computed: {
    isUserAuthorised() {
      return storage.state.token.length !== 0
    },
    filteredElements() {
      try {
        if (this.search) {
          return this.elements.filter((element) => {
            return (
                (element.name != null &&
                    element.name
                        .toLowerCase()
                        .includes(this.search.toLowerCase())) ||
                element.symbol.toLowerCase().includes(this.search.toLowerCase())
            )
          })
        } else {
          return this.elements
        }
      } catch (e) {
        console.error(e)
        return []
      }
    },
    mounted: {},
  },
}
</script>

<style>
.elementCollection {
  height: 70vh;
}
</style>
