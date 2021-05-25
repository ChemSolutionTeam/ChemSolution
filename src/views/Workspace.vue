<template>
  <div class="flex flex-row h-screen">
    <div class="border border-csblack rounded-3xl rounded-l-none w-1/4 h-11/12 bg-csbluewhite p-4 shadow-xl">
      <!-- Search -->
      <div class="flex flex-wrap w-full text-xl mb-10">
        <i class="fas fa-search mx-3 self-center scale-125 transform w-1/12"/>
        <input class="w-10/12 border-csblack border rounded-xl outline-none px-5"
               placeholder="Уведіть назву елемента.."
               v-model="search"/>
      </div>
      <ul>
        <li v-for="element in filteredElements" :key="element.elementId" class="overflow-y-auto h-5/6">
          <ElementChooser
              v-bind:symbol="element.symbol"
              v-bind:name="element.name"
              v-bind:category="element.category.categoryId"
          />
        </li>
      </ul>
    </div>
    <div></div>
  </div>
</template>

<script>
import ElementChooser from '@/components/ElementChooser'
import apiService from "@/services";
export default {
  data() {
    return {
      search: null,
      elements: []
    }
  },
  name: 'Workspace',
  components: {
    ElementChooser,
  },
  created() {
    apiService.getElements().then(
        resp => {
          this.elements = resp.data
          console.log(resp)
        })
  },
  computed: {
    filteredElements() {
      try {
        if (this.search) {
          return this.elements.filter(element => {
            return (element.name != null && element.name.toLowerCase().includes(this.search.toLowerCase())
                || (element.symbol.toLowerCase().includes(this.search.toLowerCase())))
          })
        } else {
          return this.elements
        }
      } catch (e) {
        console.error(e)
        return []
      }
    },
    mounted: {}
  }
}
</script>

<style></style>
