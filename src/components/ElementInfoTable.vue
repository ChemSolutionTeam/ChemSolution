<template>
  <div class="column my-20 w-1/5 rounded">
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
      <div class="p-1 float-left w-4/12">
        <p class="text-left">Категорія:</p>
      </div>
      <div class="p-1 float-right text-right w-7/12">
        <p class="text-right font-bold">{{ element.category.categoryName }}</p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Атомна маса:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p class="text-right font-bold">{{ element.atomicWeight }}</p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Валентність:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p lass="text-right font-bold">{{ valencyString }}</p>
      </div>


      <div class="p-1 float-left w-8/12">
        <p class="text-left">Атомний радіус:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p v-if="isElementUnlocked" class="text-right">{{ element.atomicRadius }}</p>
        <i v-else class="fas fa-lock mx-3 self-end scale-125 transform w-1/12"/>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Електронегативність:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p v-if="isElementUnlocked" class="text-right">{{ element.electronegativity }}</p>
        <i v-else class="fas fa-lock mx-3 self-end scale-125 transform w-1/12"/>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Температура кіпіння:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p v-if="isElementUnlocked" class="text-right">{{ element.boilingTemperature }}</p>
        <i v-else class="fas fa-lock mx-3 self-end scale-125 transform w-1/12"/>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Температура плавління:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p v-if="isElementUnlocked" class="text-right">{{ element.meltingTemperature }}</p>
        <i v-else class="fas fa-lock mx-3 self-end scale-125 transform w-1/12"/>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість електронів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p v-if="isElementUnlocked" class="text-right">{{ element.elementId }}</p>
        <i v-else class="fas fa-lock mx-3 self-end scale-125 transform w-1/12"/>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість протонів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p v-if="isElementUnlocked" class="text-right">{{
            Math.round(element.atomicWeight) - element.neutronQuantity
          }}</p>
        <i v-else class="fas fa-lock mx-3 self-end scale-125 transform w-1/12"/>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість нейтронів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold tooltip">
        <p v-if="isElementUnlocked" class="text-right">{{ element.neutronQuantity }}</p>
        <i v-else class="fas fa-lock mx-3 self-end scale-125 transform w-1/12"/>
        <span class="tooltiptext">Авторизуйтесь</span>
      </div>
    </div>
  </div>


</template>

<script>
import storage from "@/store";

export default {
  data() {
    return this.element
  },
  computed: {
    isUserAuthorised() {
      return storage.state.token.length !== 0
    },
    isElementUnlocked() {
      return this.isUserAuthorised
    },
    valencyString() {
      if (!this.element.valences)
        return "Невизначено"

      let result = ""

      for (let i = 0; i < this.element.valences.length; i++) {
        switch (this.element.valences[i].valenceVal) {
          case 1:
            result += "I, "
            break
          case 2:
            result += "II, "
            break
          case 3:
            result += "III, "
            break
          case 4:
            result += "IV, "
            break
          case 5:
            result += "V, "
            break
          case 6:
            result += "VI, "
            break
          case 7:
            result += "VII, "
            break
          default:
            break
        }
      }
      return result.substr(0, result.length - 2)
    }
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
      valences: {
        type: Array,
        default: []
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

