<template>
  <div class="column mt-20 mb-10 w-1/5 rounded">
    <div id="elementLogo" class="infoTable" :style="{ 'backgroundColor': bgColor, 'borderColor': borderColor }">
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
        <p id="infoCategory" class="text-right font-bold">{{ element.category.categoryName }}</p>
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
        <p id="infoMelting" class="text-right text-red-500"> Недоступно </p>
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
      atomicRadius: {
        type: Number,
        default: 454.59
      },
      atomicWeight: {
        type: Number,
        default: 1.008
      },
      boilingTemperature: {
        type: Number,
        default: 607
      },
      category: {
        type: String,
        default: "Неметали"
      },
      electronQuantity: {
        type: Number,
        default: 588
      },
      electronegativity: {
        type: Number,
        default: 511.1
      },
      elementId: {
        type: Number,
        default: 1
      },
      energyLevels: {
        type: Number,
        default: 0
      },
      group: {
        type: Number,
        default: 1
      },
      meltingTemperature: {
        type: Number,
        default: 1
      },
      name: {
        type: String,
        default: "Гідроген"
      },
      neutronQuantity: {
        type: Number,
        default: 733
      },
      protonQuantity: {
        type: Number,
        default: 936
      },
      symbol: {
        type: String,
        default: "H"
      },
      valency: {
        type: Number,
        default: 1
      }
    },
    bgColor: {
      default: "#a1c768",
    },
    borderColor: {
      default: "#657c41"
    }
  }
}
</script>

