<template>
  <div>
    <h1 class="text-5xl">Elements Inspect page</h1>

    <Button label="Go Back" class="w-2/12" @click="goBack()" />

    <!-- <div>TODO Search</div> -->
    <div class="flex flex-wrap mx-3 my-5">
      <div
        class="border-2 overflow-x-auto border-csgreen rounded-xl rounded-b-none bg-cslightgreen bg-opacity-25 shadow-lg"
      >
        <table class="w-11/12 py-2 px-5 divide-y divide-gray-200 table-auto">
          <thead class="">
            <tr class="text-csblack uppercase">
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Id
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Image
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Formula
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Name
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Info
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Elements
              </th>
            </tr>
          </thead>
          <tbody class="text-csblack">
            <tr
              class="hover:bg-gray-100"
              v-for="(material, index) in materials"
              :key="index"
            >
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ material.id }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ material.image }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ material.formula }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ material.name }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ material.info }}
              </td>

              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                <p v-for="(element, index) in material.elements" :key="index">
                  {{ element }}
                </p>
              </td>

              <td
                class="border border-t-0 px-5 border-csgreen whitespace-nowrap"
              >
                <div class="flex justify-end">
                  <button
                    class="px-4 focus:outline-none focus:ring focus:ring-offset-2 focus:ring-csgreen shadow-md bg-gradient-to-tr from-csgreen to-cslightgreen w-full p-1 m-1 border rounded-xl"
                    @click="edit(material)"
                  >
                    Edit
                  </button>
                  <button
                    @click="remove(material)"
                    class="focus:outline-none focus:ring focus:ring-offset-2 focus:ring-red-300 shadow-md bg-gradient-to-tr from-red-400 to-red-500 text-white w-full p-1 m-1 border rounded-xl"
                  >
                    Remove
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import Button from '@/components/HomePageButtons.vue'
import router from '@/router/index'
import apiService from '@/services/index'

export default {
  name: 'Inspect',
  components: { Button },
  methods: {
    goBack() {
      router.push('/admin')
    },
    edit(material) {
      material
      router.push('/admin/materials/edit/' + material.elementId)
    },
    delete(material) {
      material
      router.push('/admin/materials/delete/' + material.elementId)
    },
  },
  mounted() {
    let materials = apiService.getMaterials()
    if (materials == null || materials == undefined) return
    else this.materials = materials
  },
  data() {
    return {
      materials: [],
    }
  },
}
</script>

<style></style>
