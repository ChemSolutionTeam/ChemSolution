<template>
  <div>
    <h1 class="text-5xl">Request Inspect page</h1>

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
                Email
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                DateTime
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Theme
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Text
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Status Id
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Status
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Actions
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
                {{ request.userEmail }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ request.dateTimeSended }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ request.theme }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ request.statusId }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ request.status }}
              </td>

              <td
                class="border border-t-0 px-5 border-csgreen whitespace-nowrap"
              >
                <div class="flex justify-end">
                  <button
                    class="px-4 focus:outline-none focus:ring focus:ring-offset-2 focus:ring-csgreen shadow-md bg-gradient-to-tr from-csgreen to-cslightgreen w-full p-1 m-1 border rounded-xl"
                    @click="confirm(request)"
                  >
                    Confirm
                  </button>
                  <button
                    @click="reject(request)"
                    class="focus:outline-none focus:ring focus:ring-offset-2 focus:ring-red-300 shadow-md bg-gradient-to-tr from-red-400 to-red-500 text-white w-full p-1 m-1 border rounded-xl"
                  >
                    Reject
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
      router.push('/admin/elements/edit/' + material.elementId)
    },
    delete(material) {
      material
      router.push('/admin/elements/delete/' + material.elementId)
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
