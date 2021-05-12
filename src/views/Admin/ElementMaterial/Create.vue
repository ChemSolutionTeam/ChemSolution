<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Створення зв'язку між:
      <span
        class="from-cslightgreen via-csgreen to-csblue bg-clip-text bg-gradient-to-tr"
        >{{ elementName }}</span
      >
      та
      <span
        class="from-cslightgreen via-csgreen to-csblue bg-clip-text bg-gradient-to-tr"
        >{{ materialName }}</span
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
            v-model="elementMaterial.elementId"
            type="number"
            placeholder="Уведіть ID"
          />
          <BaseInput
            label="ID"
            v-model="elementMaterial.materialId"
            type="number"
            placeholder="Уведіть ID"
          />
          <BaseInput
            label="ID"
            v-model="elementMaterial.amount"
            type="number"
            placeholder="Уведіть ID"
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
// import BaseTextArea from '@/components/BaseTextArea'
import Button from '@/components/HomePageButtons'
import router from '../../../router'

export default {
  name: 'MaterialCreate',
  components: {
    BaseInput,
    Button,
  },
  computed: {
    elementName() {
      let element = apiService.getElement(this.elementMaterial.elementId)
      return element != null && element != undefined ? element : 'NotFound'
    },
    materialName() {
      let material = apiService.getMaterial(this.elementMaterial.materialId)
      return material != null && material != undefined ? material : 'NotFound'
    },
  },
  methods: {
    submit() {
      apiService.putMaterial(this.elementMaterial)
    },
    goBack() {
      router.push('/admin/elementMaterial')
    },
  },
  data() {
    return {
      elementMaterial: {},
    }
  },
}
</script>

<style></style>
