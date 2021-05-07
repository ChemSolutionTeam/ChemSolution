<template>
  <div>
    <title>{{ title }}</title>
    <h1 class="text-5xl">Welcome to Admin Panel</h1>
    <div class="flex">
      <AdminCard
        label="Элементы"
        path="/admin/elements"
        image="https://us.123rf.com/450wm/ismagilov/ismagilov1808/ismagilov180802052/107257812-red-and-blue-abstract-atom-nucleus-model-over-a-blurred-red-blue-atoms-background-concept-of-science.jpg?ver=6"
      />
      <AdminCard image="https://i.imgur.com/bAaiGiu.jpeg" />
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
