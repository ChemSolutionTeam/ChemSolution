<template>
  <div class="column mt-20 mb-10 w-1/5 rounded">
    <div id="elementLogo" class="reactiveNonMetal">
      <p class="number"> {{ element.elementId }} </p>
      <p class="symbol">{{ element.symbol }}</p>
      <p class="name">{{ element.name }}</p>
      <p class="weight">{{ element.atomicWeight }}</p>
    </div>
    <div id="elementInfo" class="bg-csblack p-2 text-white float-left">
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Порядковий номер:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p id="infoNumber" class="text-right font-bold">{{ element.elementId }}</p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Позначення:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p id="infoSymbol" class="text-right font-bold">{{ element.symbol }}</p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Назва:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p id="infoName" class="text-right font-bold">{{ element.name }}</p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Категорія:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p id="infoCategory" class="text-right font-bold">{{ element.category }}</p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Атомна маса:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p id="infoMass" class="text-right font-bold">{{ element.atomicWeight }}</p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Валентність:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p id="infoValency" class="text-right font-bold">{{ element.valency }}</p>
      </div>


      <div class="p-1 float-left w-8/12">
        <p class="text-left">Атомний радіус:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p id="infoRadius" class="text-right text-red-500">Недоступно</p>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Електронегативність:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p id="infoElectronegativity" class="text-right text-red-500">Недоступно</p>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Температура кіпіння:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p id="infoBoiling" class="text-right text-red-500">Недоступно</p>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Температура плавління:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p id="infoMelting" class="text-right text-red-500">Недоступно</p>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість електронів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p id="infoElectrons" class="text-right text-red-500">Недоступно</p>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість протонів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p id="infoProtons" class="text-right text-red-500">Недоступно</p>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість нейтронів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p id="infoNeutrons" class="text-right text-red-500">Недоступно</p>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>

    </div>


  </div>
</template>

<script>
export default {
  data() {
    return this.element
  },
  props: {
    element: {
      type: Object,
      default: function () {
        return {
          atomicRadius: 454.59,
          atomicWeight: 1.008,
          boilingTemperature: 607,
          category: "Неметали",
          electronQuantity: 588,
          electronegativity: 511.1,
          elementId: 1,
          energyLevels: 0,
          group: 1,
          meltingTemperature: 1,
          name: "Гідроген",
          neutronQuantity: 733,
          protonQuantity: 936,
          symbol: "H",
          valency: 1,
        }
      }
    }
  },
  methods: {
    /*setInfo(data) {
      this.element.elementId = data.elementId
      this.element.atomicRadius = data.atomicRadius
      this.element.atomicWeight = data.atomicWeight
      this.element.symbol = data.symbol
      this.element.name = data.name
      this.element.boilingTemperature = data.boilingTemperature
      this.element.category = data.category
      this.element.electronegativity = data.electronegativity
      this.element.electronQuantity = data.electronegativity
      this.element.energyLevels = data.energyLevels
      this.element.group = data.group
      this.element.meltingTemperature = data.meltingTemperature
      this.element.neutronQuantity = data.neutronQuantity
      this.element.protonQuantity = data.protonQuantity
      this.element.valency = data.valencies[0]*/
  }
}
</script>

<style scoped>

</style>