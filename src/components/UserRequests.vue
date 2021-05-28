<template>
  <div class="request-block">
    <h3 class="text-4xl text-center pb-5">Запити</h3>

    <div
      v-for="(request, index) in requests"
      :key="index"
      class="request border border-csblack mr-5 ml-5 mb-5 rounded-xl text-csblack h-full block overflow-hidden"
    >
      <table>
        <tr>
          <td>
            <p class="font-bold">Тема:</p>
          </td>
          <td>
            <p>{{ request.Theme }}</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="font-bold">Дата:</p>
          </td>
          <td>
            <p>{{ request.DateTimeSended }}</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="font-bold">Статус:</p>
          </td>
          <td>
            <p>{{ request.StatusId }}</p>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import apiService from '@/services'
import storage from '@/store'

export default {
  data() {
    return {
      requests: [],
    }
  },
  components: {},
  created() {
    if (storage.state.token.length !== 0) {
      apiService.getUser().then((resp) => {
        console.log(resp)
        this.requests = resp.data.requests
      })
    }
  },
}
</script>

<style type="text/css">
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}

div {
  font-size: 2vw;
}

td {
  text-align: left;
}

#approved {
  background-color: #ceffb7;
}

#canceled {
  background-color: #ffb7b8;
}

#under-consideration {
  background-color: #c0f7fb;
}
</style>
