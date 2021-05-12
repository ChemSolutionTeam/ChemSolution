<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Створення матеріалу:
      <span
        class="from-cslightgreen via-csgreen to-csblue bg-clip-text bg-gradient-to-tr"
        >{{ material.name }}</span
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
            label="ID"
            v-model="material.id"
            type="number"
            placeholder="Уведіть ID"
          />
          <BaseInput
            label="Формула"
            v-model="material.formula"
            placeholder="Уведіть символ"
          />
          <BaseInput
            label="Зображення"
            v-model="material.image"
            placeholder="Уведіть символ"
          />
          <BaseInput
            label="Назва"
            v-model="material.name"
            placeholder="Уведіть назву"
          />

          <BaseTextArea
            label="Інформація"
            v-model="material.info"
            placeholder="Уведіть інформацію"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import apiService from '@/services/index'
import BaseInput from '@/components/BaseInput'
// import BaseCheck from '@/components/BaseCheck'
import BaseTextArea from '@/components/BaseTextArea'
import Button from '@/components/HomePageButtons'
import router from '../../../router'

export default {
  name: 'MaterialCreate',
  components: {
    BaseInput,
    Button,

    BaseTextArea,
  },
  methods: {
    submit() {
      apiService.putMaterial(this.material)
    },
    goBack() {
      router.push('/admin/material')
    },
  },
  data() {
    return {
      material: {},
    }
  },
}
</script>

<style></style>
