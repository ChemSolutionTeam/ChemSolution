<template>
  <div
    class="transform md:scale-50 lg:scale-100 flex items-start inset-0 my-4 shadow-lg max-w-6xl mx-auto"
    @click="getRequests()"
  >
    <div
      class="box self-center px-12 p-3 pb-16 text-left w-full bg-white border-csblack shadow-2xl border rounded-lg"
    >
      <div class="column w-full mt-4">
        <h3 class="text-4xl text-center pb-5">Запити</h3>
        <div
          v-for="(request, index) in requests"
          :key="index"
          class="grid grid-cols-1 gap-3"
        >
          <Request :number="index + 1" :request="request" />
        </div>
      </div>
      <div class="flex flex-row-reverse">
        <div class="w-1/2 flex flex-row-reverse">
          <Button
            label="Створити запит"
            @click="this.$emit('openCreateRequest')"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Request from '@/components/Request'
import Button from '@/components/HomePageButtons'

import apiService from '@/services/index'
import storage from '@/store/index'

export default {
  name: 'UserRequests',
  components: {
    Request,
    Button,
  },
  emits: ['openCreateRequest'],
  data() {
    return {
      requests: [],
    }
  },
  created() {
    if (storage.state.token.length !== 0) {
      apiService.getRequests().then((resp) => {
        this.requests = resp.data
      })
    }
  },
  methods: {
    getRequests() {
      if (storage.state.token.length !== 0) {
        apiService.getRequests().then((resp) => {
          this.requests = resp.data
        })
      }
    },
  },
}
</script>

<style type="text/css">
@font-face {
  font-family: 'Open Sans';
  src: url('/fonts/OpenSans-Regular-webfont.woff2') format('woff2'),
    url('/fonts/OpenSans-Regular-webfont.woff') format('woff');
}
</style>
