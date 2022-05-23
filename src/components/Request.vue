<template>
  <div
    id="approved"
    class="w-full p-3 border border-csblack rounded-xl my-1 text-2xl"
    :class="bgColor"
  >
    <div class="flex m-1">
      <h1 class="mr-3">Тема:</h1>
      <p>{{ request.theme }}</p>
      <p class="ml-auto mr-1">{{ number }}</p>
    </div>
    <div class="flex m-1">
      <h1 class="mr-3">Текст:</h1>
      <p>{{ request.text }}</p>
    </div>
    <div class="flex m-1">
      <h1 class="mr-3">Дата:</h1>
      <p>{{ fixDate(request.dateTimeSended) }}</p>
    </div>
    <div class="flex m-1">
      <h1 class="mr-3">Статус:</h1>
      <p>{{ request.status }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Request',
  props: {
    number: {
      type: Number,
      default: 1,
    },

    request: {
      type: Object,
    },
  },
  computed: {
    bgColor() {
      switch (this.request.status) {
        case 'Accepted':
          return 'bg-requestaccept'
        case 'Consider':
          return 'bg-requestwait'
        case 'Rejected':
          return 'bg-requestcancel'
        default:
          return 'bg-requestwait'
      }
    },
  },
  methods: {
    fixDate(date) {
      let d = date.split('T')[0].split('-')
      return d[2] + '.' + d[1] + '.' + d[0]
    },
  },
}
</script>

<style>
@font-face {
  font-family: 'Open Sans';
  src: url('/fonts/OpenSans-Regular-webfont.woff2') format('woff2'),
    url('/fonts/OpenSans-Regular-webfont.woff') format('woff');
}
</style>
