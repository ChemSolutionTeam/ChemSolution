<template>
  <div class="about">
    <!-- <h1>This is an about page</h1> -->
    <RegisterForm msg="Welcome to Your Vue.js App" />
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

// width = 1vw; // height = 1vw;
