<template>
  <div
    class="transform md:scale-50 lg:scale-100 flex items-start inset-0 my-4 shadow-lg max-w-6xl mx-auto"
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
    </div>
  </div>
</template>

<script>
// import apiService from '@/services'
// import storage from '@/store'
import Request from '@/components/Request'

export default {
  name: 'UserRequests',
  components: {
    Request,
  },
  data() {
    return {
      requests: [
        {
          userEmail: 'user@example.com',
          dateTimeSended: '2021-05-17T14:53:50.696',
          theme: 'string',
          text: 'string',
          statusId: 1,
          status: {
            statusId: 1,
            requests: null,
            statusName: 'Розглядається',
          },
          user: null,
        },
        {
          userEmail: 'user@gmail.com',
          dateTimeSended: '2021-05-23T15:26:56.391',
          theme: 'string',
          text: 'string',
          statusId: 1,
          status: {
            statusId: 1,
            requests: null,
            statusName: 'Розглядається',
          },
          user: null,
        },
        {
          userEmail: 'user@gmail.com',
          dateTimeSended: '2021-05-23T15:26:56.401',
          theme: 'string',
          text: 'string',
          statusId: 2,
          status: {
            statusId: 2,
            requests: null,
            statusName: 'Підтверджено',
          },
          user: null,
        },
        {
          userEmail: 'user@gmail.com',
          dateTimeSended: '2021-03-23T15:26:56.401',
          theme: 'string',
          text: 'string',
          statusId: 3,
          status: {
            statusId: 3,
            requests: null,
            statusName: 'Відхилено',
          },
          user: null,
        },
      ],
    }
  },

  // created() {
  //   if (storage.state.token.length !== 0) {
  //     apiService.getUser().then((resp) => {
  //       console.log(resp)
  //       this.requests = resp.data.requests
  //     })
  //   }
  // },
}
</script>

<style type="text/css">
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}
</style>
