<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Редагувати:
      <span
        class="bg-clip-text bg-gradient-to-tr from-yellow-300 to-pink-600"
        style="color: transparent"
        >{{ element.name }}</span
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
          <BaseInput label="Символ" v-model="element.symbol" />
          <BaseInput label="Назва" v-model="element.name" />
          <BaseInput
            label="Атомна маса"
            v-model="element.atomicWeight"
            type="number"
            step="0.01"
          />
          <BaseInput
            label="Кількість електронів"
            v-model="element.electronQuantity"
            type="number"
          />
          <BaseInput
            label="Кількість протонів"
            type="number"
            v-model="element.protonQuantity"
          />
          <BaseInput
            label="Кількість нейтронів"
            v-model="element.neutronQuantity"
            type="number"
          />
          <BaseInput
            label="Радіус атома"
            v-model="element.atomicRadius"
            type="number"
            step="0.01"
          />
          <BaseInput
            label="Електронегативність"
            v-model="element.electronegativity"
            type="number"
            step="0.01"
          />
          <BaseInput label="Категорія" v-model="element.category" />
          <BaseInput label="Енергетичні рівні" v-model="element.energyLevels" />
          <BaseInput
            label="Температура плавління"
            v-model="element.meltingTemperature"
            type="number"
            step="0.01"
          />
          <BaseInput
            label="Температура кипіння"
            v-model="element.boilingTemperature"
            type="number"
            step="0.01"
          />
          <BaseCheck
            label="Заблоковано"
            v-model="element.isLocked"
            big="true"
          />
          <BaseTextArea label="Інформація" v-model="element.info" />
          <BaseInput label="Зображення символу" v-model="element.imgSymbol" />
          <BaseInput label="Зображення атому" v-model="element.imgAtom" />
          <BaseInput label="Група" v-model="element.group" />
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
  name: 'ElementEdit',
  components: {
    BaseInput,
    Button,
    BaseCheck,
    BaseTextArea,
  },
  computed: {
    id() {
      let id = this.$route.params.id
      console.log(id)
      return id
    },
  },
  mounted() {
    let element = apiService.getElement(this.id)
    console.log(apiService.getElement(this.id).PromiseResult)
    if (element != null && element != undefined) {
      this.element = element
    }
  },
  methods: {
    submit() {
      apiService.putElement(this.element)
    },
    goBack() {
      router.push('/admin/elements')
    },
  },
  data() {
    return {
      element: {
        /*  elementId: 1,
        symbol: 'C',
        name: 'Carbon',
        atomicWeight: 809.75,
        electronQuantity: 1973,
        protonQuantity: 661,
        neutronQuantity: 403,
        atomicRadius: 446.96,
        electronegativity: 1989,
        category: '"arm"',
        energyLevels: 1952,
        meltingTemperature: 337,
        boilingTemperature: 766,
        isLocked: false,
        info: '242.57',
        imgSymbol: '390.15',
        imgAtom: '583.64',
        group: 2008,
        elementMaterials: [],
        materials: [],
        valences: [], */
      },
    }
  },
}
</script>

<style></style>
