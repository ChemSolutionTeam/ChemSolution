<template>
  <div>
    <title>{{ title }}</title>
    <h1 class="text-5xl">Welcome to Admin Panel</h1>
    <div class="grid lg:grid-cols-5 md:grid-cols-3 sm:grid-cols-2">
      <AdminCard
        label="Элементы"
        path="/admin/elements"
        image="https://us.123rf.com/450wm/ismagilov/ismagilov1808/ismagilov180802052/107257812-red-and-blue-abstract-atom-nucleus-model-over-a-blurred-red-blue-atoms-background-concept-of-science.jpg?ver=6"
      />
      <AdminCard
        label="Речовини"
        path="/admin/materials"
        image="https://www.innovationnewsnetwork.com/wp-content/uploads/2019/12/ST27-McGillU1-image-%C2%A9-iStock-Garsya.jpg"
      />
      <AdminCard
        label="Пости"
        path="/admin/blogposts"
        image="https://blog.hootsuite.com/wp-content/uploads/2019/03/Schedule-Facebook-Posts.jpg"
      />
      <AdminCard
        label="Досягнення"
        path="/admin/achievements"
        image="https://i.pinimg.com/originals/c7/80/5e/c7805ee9aa1a16baaa33a7b1be2f220e.png"
      />
      <AdminCard image="https://i.imgur.com/bAaiGiu.jpeg" /><AdminCard
        image="https://i.imgur.com/bAaiGiu.jpeg"
      /><AdminCard image="https://i.imgur.com/bAaiGiu.jpeg" /><AdminCard
        image="https://i.imgur.com/bAaiGiu.jpeg"
      />
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
