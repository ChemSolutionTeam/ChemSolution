<template>
  <div
    class="
      transform
      md:scale-50
      lg:scale-100
      flex
      items-start
      inset-0
      my-4
      shadow-lg
      max-w-4xl
      mx-auto
    "
  >
    <div
      class="
        box
        self-center
        px-12
        p-3
        pb-16
        text-left
        w-full
        bg-white
        border-csblack
        shadow-2xl
        border
        rounded-lg
      "
    >
      <h1 class="text-4xl text-center py-3">Запит розробникам</h1>
      <div class="p-3">
        <BaseInput
          label="Тема"
          placeholder="Уведіть тему запиту"
          v-model="request.theme"
        />
        <BaseTextArea
          label="Текст запиту"
          :placeholder="'Текст запиту.\nБудь ласка, опишіть виявлений недолік або вашу пропозицію щодо покращення нашого сервісу.'"
          v-model="request.text"
        />
        <div class="w-full flex flex-row">
          <button
            @click="submit()"
            class="
              bg-gradient-to-tr
              from-cslightgreen
              via-csgreen
              to-csblue
              hover:text-white hover:border-csgreen
              border-csblack
              hover:animate-pulse
              text-csblack
              shadow-lg
              p-3
              border-2
              button-enter
              w-full
              my-3
              mx-1
              focus:outline-none
              transform
              duration-500
              ease-in-out
              hover:scale-125
            "
          >
            Надіслати
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BaseInput from '@/components/BaseInput'
import BaseTextArea from '@/components/BaseTextArea'
import apiService from '@/services/index'
import storage from '@/store/index'

export default {
  name: 'CreateRequestForm',
  components: {
    BaseTextArea,
    BaseInput,
  },
  emits: ['openUserRequests'],
  data() {
    return {
      request: {
        theme: '',
        text: '',
      },
    }
  },
  methods: {
    async submit() {
      this.request.dateTimeSended = this.getDate()
      this.request.userEmail = storage.state.email
      await apiService.postRequest(this.request).then((resp) => {
        console.info(resp)
      })
      this.$emit('openUserRequests')
    },
    getDate() {
      let d = new Date()
      // "2021-06-01T16:42:26.440Z"
      let year = d.getFullYear()
      let month = d.getMonth()
      let day = d.getDate()
      let hour = d.getHours()
      let minute = d.getMinutes()
      let second = d.getSeconds()
      let milisecond = d.getMilliseconds()
      let result =
        year +
        '-' +
        (month < 10 ? '0' + month : month) +
        '-' +
        (day < 10 ? '0' + day : day) +
        'T' +
        (hour < 10 ? '0' + hour : hour) +
        ':' +
        (minute < 10 ? '0' + minute : minute) +
        ':' +
        (second < 10 ? '0' + second : second) +
        '.' +
        milisecond +
        'Z'
      return result
    },
  },
}
</script>

<style></style>
