<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Редагувати звязок між
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
// import BaseTextArea from '@/components/BaseTextArea'
// import BaseCheck from '@/components/BaseCheck'
import Button from '@/components/HomePageButtons'
import router from '../../../router'
export default {
  name: 'ElementEdit',
  components: {
    BaseInput,
    Button,
  },
  computed: {
    id() {
      let id = this.$route.params.id
      return id
    },
  },
  mounted() {
    let elementMaterial = apiService.getMaterial(
      this.elementId,
      this.materialId
    )
    if (elementMaterial != null && elementMaterial != undefined) {
      this.elementMaterial = elementMaterial
    }
  },
  methods: {
    submit() {
      apiService.putElement(this.elementMaterial)
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
