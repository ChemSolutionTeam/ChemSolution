<template>
  <title>{{ title }}</title>
  <h1 class="text-5xl">Welcome to Admin Panel</h1>
  <div class="flex">
    <AdminCard />
    <AdminCard />
  </div>
</template>

<script>
import AdminCard from '@/components/AdminCard.vue'
export default {
  data() {
    return { title: 'Admin Page' }
  },
  components: { AdminCard },
}
</script>

<style>
h1 {
  font-family: 'Century Gothic';
  font-weight: 700;
}
</style>
