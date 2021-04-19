<template>
  <h1 class="text-3xl text-csblack">{{ header }}</h1>
  <div class="overflow-x-auto">
    <div
      class="min-w-screen flex items-center justify-center text-xl font-sans overflow-hidden"
    >
      <div class="w-full lg:w-5/6">
        <div
          class="bg-white border-csgreen shadow-md border-2 my-6 rounded-xl overflow-hidden sm:rounded-lg"
        >
          <table class="min-w-full divide-y divide-gray-200">
            <thead class="">
              <tr class="bg-cslightgreen bg-opacity-30 text-csblack uppercase">
                <th
                  scope="col"
                  class="py-3 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4 border"
                  v-for="(column, index) in columns"
                  :key="index"
                >
                  <button
                    class="w-full focus:outline-none"
                    @click="sortArray(column)"
                  >
                    <span>
                      <span v-if="currentOrder === 'desc'">
                        <i
                          class="fas fa-chevron-up"
                          :class="[
                            { 'text-cslightgreen': orderBy !== column },
                            { 'text-opacity-0': orderBy !== column },
                          ]"
                        />
                      </span>
                      <span v-if="currentOrder === 'asc'">
                        <i
                          class="fas fa-chevron-down"
                          :class="[
                            { 'text-cslightgreen': orderBy !== column },
                            { 'text-opacity-0': orderBy !== column },
                          ]"
                        />
                      </span>
                    </span>
                    {{ column }}
                  </button>
                </th>
                <th
                  class="py-3 px-1 text-center border-csgreen border-b-4 border"
                >
                  Actions
                </th>
              </tr>
            </thead>
            <tbody class="text-csblack">
              <tr
                class="hover:bg-gray-100"
                v-for="(item, index) in items"
                :key="index"
              >
                <td
                  class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
                  v-for="(column, indexColumn) in columns"
                  :key="indexColumn"
                >
                  <div class="items-center">
                    <span class="text-center">
                      {{ item[column] }}
                    </span>
                  </div>
                </td>
                <td
                  class="border border-t-0 border-csgreen py-3 px-2 whitespace-nowrap"
                >
                  <div class="flex justify-end">
                    <button
                      class="focus:outline-none focus:ring focus:ring-offset-2 focus:ring-csgreen shadow-md bg-gradient-to-tr from-csgreen to-cslightgreen w-full p-1 m-1 border rounded-xl"
                    >
                      Edit
                    </button>
                    <button
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
  </div>
</template>

<script>
var _ = require('lodash')
export default {
  name: 'DataTable',
  components: {},
  props: {
    header: {
      type: String,
      default: 'Default Table Header',
    },
  },
  data() {
    return {
      items: _.sortBy(
        [
          {
            id: '2',
            title: 'hello',
            description: 'ok ok',
            created_date: '2018-09-09',
          },
          {
            id: '1',
            title: 'hello 2',
            description: 'ok ok 2',
            created_date: '2018-10-09',
          },
        ],
        ['id']
      ),
      orderBy: 'id',
      currentOrder: 'asc',
    }
  },
  computed: {
    columns: function () {
      return Object.keys(this.items[0])
    },
  },
  methods: {
    sortArray(column) {
      if (column != undefined) {
        if (column === this.orderBy) {
          if (this.currentOrder === 'asc') this.currentOrder = 'desc'
          else if (this.currentOrder === 'desc') this.currentOrder = 'asc'
        } else {
          this.currentOrder = 'asc'
        }
        this.items = _.orderBy(this.items, [column], [this.currentOrder])
        this.orderBy = column
      }
    },
  },
}
</script>

<style>
h1,
div,
table {
  font-family: 'Century Gothic';
  font-weight: 700;
}
</style>
