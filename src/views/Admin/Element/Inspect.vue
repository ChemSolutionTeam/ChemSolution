<template>
  <div>
    <h1 class="text-5xl">Elements Inspect page</h1>

    <Button label="Додати елемент" class="w-3/12" @click="create()" />
    <Button label="Повернутися" class="w-3/12" @click="goBack()" white="true" />

    <!-- <div>TODO Search</div> -->
    <div class="flex flex-wrap mx-3 my-5">
      <div
        class="border-2 overflow-x-visible border-csgreen rounded-xl rounded-b-none bg-cslightgreen bg-opacity-25 shadow-lg"
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
                Symbol
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Name
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                AtomicWeight
              </th>

              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                NeutronQuantity
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                AtomicRadius
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Electronegativity
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Category
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                EnergyLevels
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                MeltingTemperature
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                BoilingTemperature
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                IsLocked
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Info
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                ImgSymbol
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                ImgAtom
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Group
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Price
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Valences
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-1 text-center border-csgreen border-b-4"
              >
                Actions
              </th>
            </tr>
          </thead>
          <tbody class="text-csblack">
            <tr
              class="hover:bg-gray-100"
              v-for="(element, index) in elements"
              :key="index"
            >
              <td
                class="border border-t-0 border-csgreen py-3 px-1 whitespace-nowrap"
              >
                {{ element.elementId }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.symbol }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.name }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.atomicWeight }}
              </td>

              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.neutronQuantity }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.atomicRadius }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.electronegativity }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.category.categoryName }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.energyLevels }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.meltingTemperature }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.boilingTemperature }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.isLocked }}
              </td>
              <td class="border border-t-0 border-csgreen py-3 px-6">
                <div class="whitespace-normal w-half">{{ element.info }}</div>
              </td>
              <td class="border border-t-0 border-csgreen py-3 px-6">
                <div class="whitespace-normal break-words w-half">
                  <div class="truncate">{{ element.imgSymbol }}</div>
                </div>
              </td>
              <td class="border border-t-0 border-csgreen py-3 px-6">
                <div class="whitespace-normal break-words w-half">
                  <div class="truncate">{{ element.imgAtom }}</div>
                </div>
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.group }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ element.price }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                <p v-for="(valence, index) in element.valences" :key="index">
                  {{ valence.valenceVal }}
                </p>
              </td>
              <td
                class="border border-t-0 px-5 border-csgreen whitespace-nowrap"
              >
                <div class="flex justify-end">
                  <button
                    class="px-4 focus:outline-none focus:ring focus:ring-offset-2 focus:ring-csgreen shadow-md bg-gradient-to-tr from-csgreen to-cslightgreen w-full p-1 m-1 border rounded-xl"
                    @click="edit(element)"
                  >
                    Edit
                  </button>
                  <button
                    @click="remove(element)"
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
    edit(element) {
      element
      router.push('/admin/elements/edit/' + element.elementId)
    },
    remove(element) {
      element
      router.push('/admin/elements/delete/' + element.elementId)
    },
    create() {
      router.push('/admin/elements/create/')
    },
    delete(element) {
      alert(element)
    },
  },
  mounted() {
    /*let elements = apiService.getElements()
    if (elements == null || elements == undefined) return
    else this.elements = elements */
    apiService.getElements().then((resp) => {
      this.elements = resp.data
      console.log(resp)
    })
  },
  data() {
    return {
      elements: [
        /*   {
          elementId: 1,
          symbol: '538.14',
          name: '662.978.63',
          atomicWeight: 809.75,
          electronQuantity: 1973,
          protonQuantity: 661,
          neutronQuantity: 403,
          atomicRadius: 446.96,
          electronegativity: 1989,
          category: '"arm"',
          energyLevels: 1952,
          meltingTemperature: 337,
          boilingTemperature: 766,
          isLocked: false,
          info: '242.57',
          imgSymbol: '390.15',
          imgAtom: '583.64',
          group: 2008,
          elementMaterials: [],
          materials: [],
          valences: [],
        },
        {
          elementId: 2,
          symbol: '538.14',
          name: '662.978.63',
          atomicWeight: 809.75,
          electronQuantity: 1973,
          protonQuantity: 661,
          neutronQuantity: 403,
          atomicRadius: 446.96,
          electronegativity: 1989,
          category: '"arm"',
          energyLevels: 1952,
          meltingTemperature: 337,
          boilingTemperature: 766,
          isLocked: false,
          info: '242.57',
          imgSymbol: '390.15',
          imgAtom: '583.64',
          group: 2008,
          elementMaterials: [],
          materials: [],
          valences: [],
        }, */
      ],
    }
  },
}
</script>

<style></style>
