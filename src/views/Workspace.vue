<template>
  <div class="row my-20">
    <div class="column flex flex-row w-1/4">
      <div class="border border-csblack rounded-3xl rounded-l-none  h-11/12 bg-csbluewhite p-4 shadow-xl mt-20">
        <!-- Search -->
        <div class=" w-full text-xl my-5">
          <i class="fas fa-search mx-3 self-center scale-125 transform w-1/12"/>
          <input
              class="w-10/12 border-csblack border rounded-xl outline-none px-5"
              placeholder="Уведіть назву елемента.."
              v-model="search"
          />
        </div>
        <div class="elementCollection mt-3 pt-3 overflow-y-scroll scrollbar-thin scrollbar-thumb-blue-400
          scrollbar-track-blue-100 scrollbar-thumb-rounded-full scrollbar-track-rounded-full">
          <div v-for="element in filteredElements" :key="element.elementId">
            <ElementChooser
                v-bind:symbol="element.symbol"
                v-bind:name="element.name"
                v-bind:category="element.category.categoryId"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="column ml-10 border border-csblack rounded-3xl w-2/4 h-11/12 bg-csbluewhite p-4 shadow-xl">
      <WorkspaceComp/>
    </div>
  </div>
  <Footer/>
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
    }
  },
  name: 'Workspace',
  components: {
    ElementChooser,
    WorkspaceComp,
    Footer
  },
  created() {
    apiService.getElements().then((resp) => {
      this.elements = resp.data
      console.log(resp)
    })
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
