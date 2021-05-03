<template>
  <div class="p-40">
    <title>{{ title }}</title>
    <h1 class="text-5xl">Welcome to Admin Panel</h1>
    <div class="flex">
      <AdminCard
        label="Добавить вещество"
        path="home"
        image="https://i.imgur.com/bAaiGiu.jpeg"
      />
      <AdminCard />
    </div>
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
