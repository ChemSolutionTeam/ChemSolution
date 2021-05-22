<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Редагувати:
      <span
        class="bg-clip-text bg-gradient-to-tr from-yellow-300 to-pink-600"
        style="color: transparent"
        >{{ blogpost.title }}</span
      >
    </h1>
    <div class="justify-items-center grid">
      <div class="w-2/3 flex">
        <Button
          label="Зберігти"
          isYellow="true"
          class="w-1/2"
          @click="submit()"
        />
        <Button
          label="Повернутися"
          class="w-1/2"
          @click="goBack()"
          white="true"
        />
      </div>
      <div
        class="w-1/2 m-8 bg-gradient-to-tr from-yellow-300 to-pink-600 rounded-3xl transform sm:-rotate-3"
      >
        <div
          class="transform rotate-3 bg-white p-5 rounded-3xl shadow-xl border-csblack border-2"
        >
          <BaseInput
            label="Заголовок"
            v-model="blogpost.title"
            placeholder="Уведіть заголовок"
          />
          <BaseInput
            label="Категорія"
            v-model="blogpost.сategory"
            placeholder="Уведіть категорію"
          />

          <BaseTextArea
            label="Інформація"
            v-model="blogpost.information"
            placeholder="Уведіть інформацію"
          />
          <BaseInput
            label="Зображення"
            v-model="blogpost.image"
            placeholder="Уведіть зображення"
          />

          <BaseCheck
            label="Заблоковано"
            v-model="blogpost.isLocked"
            big="true"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import apiService from '@/services/index'
import BaseInput from '@/components/BaseInput'
import BaseTextArea from '@/components/BaseTextArea'
import BaseCheck from '@/components/BaseCheck'
import Button from '@/components/HomePageButtons'
import router from '../../../router'
export default {
  name: 'BlogPostEdit',
  components: {
    BaseInput,
    Button,
    BaseCheck,
    BaseTextArea,
  },
  computed: {
    id() {
      let id = this.$route.params.id
      return id
    },
  },
  mounted() {
    let blogpost = apiService.getBlogPost(this.id)
    if (blogpost != null && blogpost != undefined) {
      this.blogpost = blogpost
    }
  },
  methods: {
    submit() {
      apiService.putBlogPost(this.blogpost)
    },
    goBack() {
      router.push('/admin/blogposts')
    },
  },
  data() {
    return {
      blogpost: {},
    }
  },
}
</script>

<style></style>
