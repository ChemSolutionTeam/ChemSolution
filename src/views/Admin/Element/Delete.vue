<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Видалити:
      <span class="text-csgreen">{{ element.name }}</span>
    </h1>
    <div class="justify-items-center grid">
      <div class="w-2/3 flex">
        <Button
          label="Видалити"
          class="w-1/2"
          isDanger="true"
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
        class="w-1/2 p-5 m-4 rounded-3xl shadow-lg border-cslightgreen border-2"
      >
        <BaseInput label="Символ" v-model="element.symbol" isDisabled="true" />
        <BaseInput label="Назва" v-model="element.name" isDisabled="true" />
        <BaseInput
          label="Атомна маса"
          v-model="element.atomicWeight"
          type="number"
          step="0.01"
          isDisabled="true"
        />
        <BaseInput
          label="Кількість електронів"
          v-model="element.electronQuantity"
          type="number"
          isDisabled="true"
        />
        <BaseInput
          label="Кількість протонів"
          type="number"
          v-model="element.protonQuantity"
          isDisabled="true"
        />
        <BaseInput
          label="Кількість нейтронів"
          v-model="element.neutronQuantity"
          type="number"
          isDisabled="true"
        />
        <BaseInput
          label="Радіус атома"
          v-model="element.atomicRadius"
          type="number"
          step="0.01"
          isDisabled="true"
        />
        <BaseInput
          label="Електронегативність"
          v-model="element.electronegativity"
          type="number"
          step="0.01"
          isDisabled="true"
        />
        <BaseInput
          label="Категорія"
          v-model="element.category"
          isDisabled="true"
        />
        <BaseInput
          label="Енергетичні рівні"
          v-model="element.energyLevels"
          isDisabled="true"
        />
        <BaseInput
          label="Температура плавління"
          v-model="element.meltingTemperature"
          type="number"
          step="0.01"
          isDisabled="true"
        />
        <BaseInput
          label="Температура кипіння"
          v-model="element.boilingTemperature"
          type="number"
          step="0.01"
          isDisabled="true"
        />
        <BaseCheck
          label="Заблоковано"
          v-model="element.isLocked"
          big="true"
          isDisabled="true"
        />
        <BaseTextArea
          label="Інформація"
          v-model="element.info"
          isDisabled="true"
        />
        <BaseInput
          label="Зображення символу"
          v-model="element.imgSymbol"
          isDisabled="true"
        />
        <BaseInput
          label="Зображення атому"
          v-model="element.imgAtom"
          isDisabled="true"
        />
        <BaseInput label="Група" v-model="element.group" isDisabled="true" />
      </div>
    </div>
  </div>
</template>

<script>
import BaseInput from '@/components/BaseInput'
import BaseTextArea from '@/components/BaseTextArea'
import BaseCheck from '@/components/BaseCheck'
import Button from '@/components/HomePageButtons'
import router from '../../../router'
import apiService from '@/services/index'
export default {
  name: 'ElementDelete',
  components: {
    BaseInput,
    BaseTextArea,
    BaseCheck,
    Button,
  },
  computed: {
    id() {
      let id = this.$route.params.id
      return id
    },
  },
  mounted() {
    let element = apiService.getElement(this.id)
    if (element != null && element != undefined) {
      this.element = element
    }
  },
  data() {
    return {
      element: {
        elementId: 1,
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
        isLocked: true,
        info: '242.57',
        imgSymbol: '390.15',
        imgAtom: '583.64',
        group: 2008,
        elementMaterials: [],
        materials: [],
        valences: [],
      },
    }
  },
  methods: {
    submit() {
      apiService.deleteElement(this.element)
    },
    goBack() {
      router.push('/admin/elements')
    },
  },
}
</script>

<style></style>
