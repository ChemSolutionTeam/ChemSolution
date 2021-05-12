<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Видалити зв'язок між
      <span
        class="bg-gradient-to-tr bg-clip-text from-purple-400 to-red-500"
        style="color: transparent"
        >{{ elementName }}</span
      >
      та
      <span
        class="bg-gradient-to-tr bg-clip-text from-purple-400 to-red-500"
        style="color: transparent"
        >{{ materialName }}</span
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
        class="w-1/2 m-8 bg-gradient-to-tr from-purple-400 to-red-500 rounded-3xl transform sm:-rotate-3"
      >
        <div
          class="transform rotate-3 bg-white p-5 rounded-3xl shadow-xl border-csblack border-2"
        >
          <BaseInput
            label="ID"
            v-model="elementMaterial.elementId"
            type="number"
            placeholder="Уведіть ID"
            isDisabled="true"
          />
          <BaseInput
            label="ID"
            v-model="elementMaterial.materialId"
            type="number"
            placeholder="Уведіть ID"
            isDisabled="true"
          />
          <BaseInput
            label="ID"
            v-model="elementMaterial.amount"
            type="number"
            placeholder="Уведіть ID"
            isDisabled="true"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import apiService from '@/services/index'
import BaseInput from '@/components/BaseInput'
// import BaseTextArea from '@/components/BaseTextArea'
// import BaseCheck from '@/components/BaseCheck'
import Button from '@/components/HomePageButtons'
import router from '../../../router'
export default {
  name: 'ElementMaterial Edit',
  components: {
    BaseInput,
    Button,
  },
  computed: {
    elementId() {
      let id = this.$route.params.elementId
      return id
    },
    materialId() {
      let id = this.$route.params.materialId
      return id
    },
    elementName() {
      let element = apiService.getElement(this.elementId)
      return element != null && element != undefined ? element : 'NotFound'
    },
    materialName() {
      let material = apiService.getMaterial(this.materialId)
      return material != null && material != undefined ? material : 'NotFound'
    },
  },
  mounted() {
    let elementMaterial = apiService.getElementMaterial(
      this.elementId,
      this.materialId
    )
    if (elementMaterial != null && elementMaterial != undefined) {
      this.elementMaterial = elementMaterial
    }
  },
  methods: {
    submit() {
      apiService.deleteElementMaterial(this.material)
    },
    goBack() {
      router.push('/admin/elementMaterial')
    },
  },
  data() {
    return {
      elementMaterial: {
        elementId: 0,
        materialId: 0,
        amount: 0,
      },
    }
  },
}
</script>

<style></style>
