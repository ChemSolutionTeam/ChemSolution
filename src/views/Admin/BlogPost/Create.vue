<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Створення посту:
      <span
        class="from-cslightgreen via-csgreen to-csblue bg-clip-text bg-gradient-to-tr"
        >{{ blogpost.title }}</span
      >
    </h1>
    <div class="justify-items-center grid">
      <div class="w-2/3 flex">
        <Button label="Зберігти" class="w-1/2" @click="submit()" />
        <Button
          label="Повернутися"
          class="w-1/2"
          @click="goBack()"
          white="true"
        />
      </div>
      <div
        class="w-1/2 m-8 bg-gradient-to-tr from-cslightgreen via-csgreen to-csblue rounded-3xl transform sm:-rotate-3"
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
import BaseCheck from '@/components/BaseCheck'
import BaseTextArea from '@/components/BaseTextArea'
import Button from '@/components/HomePageButtons'
import router from '../../../router'

export default {
  name: 'BlogPostCreate',
  components: {
    BaseInput,
    Button,
    BaseCheck,
    BaseTextArea,
  },
  methods: {
    submit() {
      apiService.postBlogPost(this.blogpost)
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
