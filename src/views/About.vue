<template>
  <div class="about">
    <register-form msg="Welcome to Your Vue.js App" />
  </div>
</template>
<script>
import RegisterForm from '@/components/RegisterForm.vue'

export default {
  name: 'About',
  components: {
    RegisterForm,
  },
}
</script>
