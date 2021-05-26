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
            v-bind:category="element.category.categoryId"
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

    <WorkspaceComp
      @mouseup="atomKeyupLeft()"
      @mousemove="move"
      v-bind:atoms="atoms"
      @drop="onDrop($event)"
      @dragenter.prevent
      @dragover.prevent
    />
  </div>

  <Footer />
</template>

<script>
import ElementChooser from '@/components/ElementChooser'
import WorkspaceComp from '@/components/WorkspaceComp'
import Footer from '@/components/Footer'

import apiService from '@/services'
export default {
  data() {
    return {
      search: null,
      elements: [],
      atoms: [
        {
          id: 1,
          symbol: 'H',
          category: 1,
          positionX: 100,
          positionY: 20,
        },
        {
          id: 2,
          symbol: 'He',
          category: 2,
          positionX: 40,
          positionY: 40,
        },
        {
          id: 3,
          symbol: 'Li',
          category: 3,
          positionX: 40,
          positionY: 100,
        },
        {
          id: 4,
          symbol: 'Be',
          category: 4,
          positionX: 40,
          positionY: 200,
        },
      ],
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
      this.elements = resp.data
      console.log(resp)
    })
  },
  methods: {
    atomKeydownLeft(element) {
      console.warn(element)
    },
    atomKeyupLeft() {
      console.warn('end')
    },
    addElement(element) {
      this.atoms.push({
        id: element.elementId,
        symbol: element.symbol,
        category: element.category.categoryId,
        positionX: 40,
        positionY: 300,
      })
    },
    move($event) {
      console.log($event)
    },
    startDrag(event, element) {
      console.warn(element)
      event.dataTransfer.dropEffect = 'move'
      event.dataTransfer.effectAllowed = 'move'
      event.dataTransfer.setData('atom', element)
    },
    onDrop(event) {
      const element = event.dataTransfer.getData('atom')
      console.log(element)
      this.atoms.push({
        /*  id: element.elementId,
        symbol: element.symbol,
        category: element.category.categoryId,
        positionX: 40,
        positionY: 300, */
        id: 5,
        symbol: 'Be',
        category: 7,
        positionX: 50,
        positionY: 200,
      })
    },
  },
  computed: {
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
