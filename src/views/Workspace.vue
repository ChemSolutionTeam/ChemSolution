<template>
  <ElementWorkspaceInfo
    id="slider"
    class="z-50"
    v-bind:element="this.element"
  />
  <div class="flex flex-row my-20">
    <div
      class="column border border-csblack rounded-3xl rounded-l-none w-1/4 h-11/12 bg-csbluewhite p-4 shadow-xl mt-20"
    >
      <!-- Search -->
      <div class="w-full text-xl my-5">
        <i
          class="fas fa-search mx-3 self-center scale-125 transform w-1/12 cursor-pointer"
        />
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
            v-bind:atomic-weight="element.atomicWeight"
            v-bind:category-name="element.category.categoryName"
            v-bind:id="element.elementId"
            v-bind:valences="element.valences"
            v-bind:category="element.categoryId.toString()"
            v-bind:is-locked="element.isLocked"
            v-bind:draggable="!element.isLocked"
            v-bind:price="element.price"
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
        v-bind:atoms="atoms"
        v-bind:value="value"
        v-bind:counter="counter"
        @drop="onDrop($event)"
        @dragenter.prevent
        @dragover.prevent
        @remove="removeElement"
        @dragAndDrop="dragAndDropElement"
    />
  </div>

  <Footer />
  <div
    class="inset-0 z-20 fixed sm:pt-2 md:pt-5 overflow-auto lg:pt-10 w-full h-full bg-csblack bg-opacity-50"
    v-show="this.isBackgroundShown == 'achievement'"
    @click="closeForm('none')"
  >
    <transition name="bounce">
      <NewAchievement
        @mouseleave="this.isMouseOut = true"
        @mouseover="this.isMouseOut = false"
        v-show="this.isFormShow == 'achievement'"
        :heading="this.achievement.heading"
        :description="this.achievement.description"
        :moneyReward="this.achievement.moneyReward"
        :ratingReward="this.achievement.ratingReward"
      />
    </transition>
  </div>
</template>

<script>
import ElementChooser from '@/components/ElementChooser'
import ElementWorkspaceInfo from '@/components/ElementWorkspaceInfo'
import NewAchievement from '@/components/NewAchievement.vue'
import WorkspaceComp from '@/components/WorkspaceComp'
import Footer from '@/components/Footer'
import storage from '@/store'
import apiService from '@/services'

export default {
  data() {
    return {
      achievement: {
        heading: '',
        description: '',
        moneyReward: '',
        ratingReward: '',
      },
      isMouseOut: false,
      isFormShow: '',
      isBackgroundShown: '',
      search: null,
      dragElement: null,
      dragAtom: null,
      elements: [],
      unlockableElements: [],
      atoms: [],
      value: [],
      materials: [],
      counter: 0,
      element: {
        atomicRadius: 454.59,
        atomicWeight: 1.008,
        boilingTemperature: 607,
        category: {
          categoryName: 'неметали',
        },
        electronQuantity: 588,
        electronegativity: 511.1,
        elementId: 1,
        energyLevels: 0,
        group: 1,
        meltingTemperature: 1,
        name: 'Гідроген',
        neutronQuantity: 733,
        protonQuantity: 936,
        symbol: 'Н',
        valences: [{ valenceVal: 1 }],
        isLocked: 1,
      },
    }
  },
  name: 'Workspace',
  components: {
    ElementChooser,
    WorkspaceComp,
    Footer,
    ElementWorkspaceInfo,
    NewAchievement,
  },
  created() {
    apiService.getElements().then((resp) => {
      this.elements = resp.data
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
          for (let i = 0; i < resp.data.elements.length; ++i) {
            try {
              let el = this.unlockableElements.find(
                (e) => e.id === resp.data.elements[i].id
              )
              this.elements.push(el)
              this.unlockableElements.filter(
                (e) => e.id !== resp.data.elements[i].id
              )
            } catch (e) {
              continue
            }
          }
        })
      }
    },
    addElement(element) {
      console.log(element)
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
        this.counter += 1
        console.log(this.counter)
        this.atoms.push({
          id: this.dragElement.elementId,
          symbol: this.dragElement.symbol,
          category: this.dragElement.category.categoryId,
          clientX: event.offsetX,
          clientY: event.offsetY,
          movementX: event.movementX,
          movementY: event.movementY,

          name: this.dragElement.name,
          categoryName: this.dragElement.category.categoryName,
          atomicWeight: this.dragElement.atomicWeight,
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
        apiService.searchMaterial(this.value).then((resp) => {
          console.log(resp.data)
          if (resp.data != undefined) {
            this.materials.push({
              materialId: resp.data.resultMaterialId,
              formula: resp.data.formula,
            })
            //NEW ACHIEVEMENT
            if (
              resp.data.newAchievementsId !== undefined &&
              storage.state.token.length != 0 &&
              this.achievement.heading.length != 0
            )
              apiService
                .getAchievement(resp.data.newAchievementsId[0])
                .then((r) => {
                  this.achievement.heading = r.data.heading
                  this.achievement.description = r.data.description
                  this.achievement.moneyReward = r.data.moneyReward
                  this.achievement.ratingReward = r.data.ratingReward
                })
                .finally(() => {
                  this.openForm('achievement')
                })

            this.atoms = []
            this.value = []
            console.log(this.materials)
          }
        })
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

          name: this.dragAtom.name,
          categoryName: this.dragAtom.categoryName,
          atomicWeight: this.dragAtom.atomicWeight,
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
      apiService.searchMaterial(this.value).then((resp) => {
        console.log(resp.data)
        if (resp.data != undefined) {
          this.materials.push({
            materialId: resp.data.resultMaterialId,
            formula: resp.data.formula,
          })
          this.atoms = []
          this.value = []
          console.log(this.materials)
        }
      })
    },
    dragAndDropElement(obj) {
      console.log(obj.atom)
      console.log(obj.event)
      this.dragAtom = obj.atom
    },
    openForm(form) {
      //alert(form)
      this.isBackgroundShown = form
      this.isFormShow = form
    },

    //Form Close
    closeForm(form) {
      if (this.isMouseOut || form !== 'none') {
        this.isFormShow = 'none'
        this.hideBG(form)
      }
    },
    hideBG(args) {
      setTimeout(() => {
        this.isBackgroundShown = args
      }, 500)
    },
  },
  computed: {
    isUserAuthorised() {
      return storage.state.token.length !== 0
    },
    filteredElements() {
      if (this.search) {
        return this.elements.filter((element) => {
          return (
            element.name.toLowerCase().includes(this.search.toLowerCase()) ||
            element.symbol.toLowerCase().includes(this.search.toLowerCase())
          )
        })
      } else {
        return this.elements
      }
    },
  },
  mounted() {},
}
</script>

<style>
.elementCollection {
  height: 70vh;
}

.elementCollection:hover ~ #slider {
  right: 0;
}

#slider {
  position: fixed;
  top: 400px;
  right: -16vw;
  -webkit-transition-duration: 0.3s;
  -moz-transition-duration: 0.3s;
  -o-transition-duration: 0.3s;
  transition-duration: 0.3s;
  box-shadow: 0 0 5px #777;
  color: #fff;
  background: #ffffff;
  width: 15vw;
  height: 20vw;
  padding: 10px;
  box-sizing: initial;
}

#infoGraphics #infoNumber {
  font-size: 1vw;
  color: white;
}

#infoGraphics #infoSymbol {
  font-size: 2vw;
  color: white;
}

#infoGraphics {
  padding: 0.7vw;
  position: relative;
  font-size: 0.6vw;
  font-weight: bold;
}
</style>
