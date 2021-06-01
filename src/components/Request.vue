<template>
  <!-- CHANGE DIV ID DEPENDING ON STATUS   -->

  <div
    id="approved"
    class="w-full p-3 border border-csblack rounded-xl my-1 text-2xl"
    :class="bgColor"
  >
    <div class="flex m-1">
      <h1 class="mr-3">Number:</h1>
      <p class="ml-auto mr-1">{{ number }}</p>
    </div>
    <div class="flex m-1">
      <h1 class="mr-3">User:</h1>
      <p>{{ request.userEmail }}</p>
    </div>
    <div class="flex m-1">
      <h1 class="mr-3">Theme:</h1>
      <p>{{ request.theme }}</p>
    </div>
    <div class="flex m-1">
      <h1 class="mr-3">Text:</h1>
      <p>{{ Text }}</p>
    </div>
    <div class="flex m-1">
      <h1 class="mr-3">DateTimeSended:</h1>
      <p>{{ request.dateTimeSended }}</p>
    </div>
    <div class="flex m-1">
      <h1 class="mr-3">Status:</h1>
      <p>{{ request.status.statusName }}</p>
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
    Text: {
      type: String,
      default: 'Please add H2O to your app',
    },
    request: {
      type: Object,
    },
  },
  computed: {
    bgColor() {
      switch (this.request.status.statusName) {
        case 'Підтверджено':
          return 'bg-requestaccept'
        case 'Розглядається':
          return 'bg-requestwait'
        case 'Відхилено':
          return 'bg-requestcancel'
        default:
          return ''
      }
    },
  },
}
</script>

<style>
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}
</style>
