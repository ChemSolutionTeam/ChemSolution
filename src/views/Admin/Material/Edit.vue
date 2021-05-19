<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Редагувати:
      <span
        class="bg-clip-text bg-gradient-to-tr from-yellow-300 to-pink-600"
        style="color: transparent"
        >{{ material.name }}</span
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
import BaseTextArea from '@/components/BaseTextArea'
// import BaseCheck from '@/components/BaseCheck'
import Button from '@/components/HomePageButtons'
import router from '../../../router'
export default {
  name: 'ElementEdit',
  components: {
    BaseInput,
    Button,

    BaseTextArea,
  },
  computed: {
    id() {
      let id = this.$route.params.id
      return id
    },
  },
  mounted() {
    let material = apiService.getMaterial(this.id)
    if (material != null && material != undefined) {
      this.material = material
    }
  },
  methods: {
    submit() {
      apiService.putElement(this.material)
    },
    goBack() {
      router.push('/admin/materials')
    },
  },
  data() {
    return {
      material: {
        id: 0,
        image: 'string',
        formula: 'string',
        name: 'string',
        info: 'string',
      },
    }
  },
}
</script>

<style></style>
