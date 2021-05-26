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
            @mousedown="atomKeydownLeft(element.elementId, element.symbol)"
            @mouseup="atomKeyupLeft()"
          />
        </div>
      </div>
    </div>
    <!-- scrollbar:
    overflow-y-auto
      scrollbar-thin scrollbar-thumb-blue-0 scrollbar-track-blue-0 scrollbar-thumb-rounded-full scrollbar-track-rounded-full
      !-->

    <WorkspaceComp
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
      atoms: [],
    }
  },
  name: 'Workspace',
  components: {
    ElementChooser,
    WorkspaceComp,
    Footer,
  },
  setup() {
    // eslint-disable-next-line no-unused-vars
    const startDrag = (event, element) => {
      console.log(element)
      event.dataTransfer.dropEffect = 'move'
      event.dataTransfer.effectAllowed = 'move'
      event.dataTransfer.setData('elementId', element.elementId)
    }

    const onDrop = (event) => {
      const elementId = event.dataTransfer.getData(elementId)
      const element = this.elements.value.find((e) => e.elementId == elementId)
      console.log(element.symbol)
    }

    return {
      startDrag,
      onDrop,
    }
  },
  created() {
    apiService.getElements().then((resp) => {
      this.elements = resp.data
      console.log(resp)
    })
  },
  methods: {
    atomKeydownLeft(id, name) {
      console.warn(id, name)
    },
    atomKeyupLeft() {
      console.warn('end')
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
