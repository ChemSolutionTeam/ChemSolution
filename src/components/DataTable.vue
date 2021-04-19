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
              <tr class="bg-cslightgreen bg-opacity-40 text-csblack uppercase">
                <th
                  scope="col"
                  class="py-3 px-6 text-center border-csgreen border-b-4 border"
                  v-for="(column, index) in columns"
                  :key="index"
                >
                  {{ column }}
                </th>
                <th
                  class="py-3 px-6 text-center border-csgreen border-b-4 border"
                ></th>
              </tr>
            </thead>
            <tbody class="text-csblack">
              <tr
                class="hover:bg-gray-100"
                v-for="(item, index) in sortedArray"
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
                  class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
                >
                  <div class="items-center"></div>
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
      items: [
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
    }
  },
  computed: {
    columns: function () {
      return Object.keys(this.items[0])
    },
    sortedArray: function () {
      return _.sortBy(this.items, ['id'])
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
