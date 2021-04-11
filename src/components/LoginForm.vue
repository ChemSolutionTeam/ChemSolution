<template>
  <div
    class="box m-5 pl-12 p-3 text-left w-4/12 bg-white border-csblack border-2 rounded-lg"
  >
    <form>
      <h3 class="text-4xl text-center heading pb-5">Авторизація</h3>
      <BaseInput label="Email"></BaseInput>
      <BaseInput label="Password"></BaseInput>
    </form>
  </div>
</template>

<script>
import BaseInput from '@/components/BaseInput.vue'
export default {
  name: 'LoginForm',
  components: {
    BaseInput,
  },
}
</script>

<style>
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}
form {
  font-family: 'Century Gothic', serif;
}
.heading {
  font-weight: 700;
}
</style>
