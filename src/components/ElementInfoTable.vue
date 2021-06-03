<template>
  <div class="column my-20 w-1/5 rounded">
    <div
      id="elementLogo"
      class="infoTable"
      :style="{ backgroundColor: bgColor, borderColor: borderColor }"
      @click="logStorage"
    >
      <p class="number">{{ element.elementId }}</p>
      <p class="symbol">{{ element.symbol }}</p>
      <p class="name">{{ element.name }}</p>
      <p class="weight">{{ element.atomicWeight }}</p>
    </div>
    <div id="elementInfo" class="bg-csblack p-2 text-white float-left">
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Порядковий номер:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p id="infoNumber" class="text-right font-bold">
          {{ element.elementId }}
        </p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Позначення:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p id="infoSymbol" class="text-right font-bold">{{ element.symbol }}</p>
      </div>
      <div class="p-1 float-left w-4/12">
        <p class="text-left">Назва:</p>
      </div>
      <div class="p-1 float-right text-right w-7/12">
        <p id="infoName" class="text-right font-bold">{{ element.name }}</p>
      </div>
      <div class="p-1 float-left w-3/12">
        <p class="text-left">Категорія:</p>
      </div>
      <div class="p-1 float-right text-right w-8/12">
        <p class="text-right font-bold">{{ element.category.categoryName }}</p>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Атомна маса:</p>
      </div>
      <div class="p-1 float-right text-right">
        <p class="text-right font-bold">{{ element.atomicWeight }}</p>
      </div>
      <div class="p-1 float-left w-4/12">
        <p class="text-left">Валентність:</p>
      </div>
      <div class="p-1 float-right text-right w-8/12">
        <p class="text-right font-bold">{{ valencyString }}</p>
      </div>

      <div @show="getUserElements()" class="p-1 float-left w-8/12">
        <p class="text-left">Атомний радіус:</p>
      </div>
      <div class="p-1 float-right text-right font-bold">
        <BaseTooltip v-if="!isUserAuthorised">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
        <p
          v-else-if="
            !element.isLocked ||
            userElements.some((e) => e.elementId === element.elementId)
          "
          class="text-right"
        >
          {{ element.atomicRadius }}
        </p>
        <BaseTooltip v-else text="Елемент не відкрито">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
      </div>

      <div class="p-1 float-left w-8/12">
        <p class="text-left">Електронегативність:</p>
      </div>
      <div class="p-1 float-right text-right font-bold">
        <BaseTooltip v-if="!isUserAuthorised">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
        <p
          v-else-if="
            !element.isLocked ||
            userElements.some((e) => e.elementId === element.elementId)
          "
          class="text-right"
        >
          {{ element.electronegativity }}
        </p>
        <BaseTooltip v-else text="Елемент не відкрито">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
      </div>

      <div class="p-1 float-left w-8/12">
        <p class="text-left">Температура кіпіння:</p>
      </div>
      <div class="p-1 float-right text-right font-bold">
        <BaseTooltip v-if="!isUserAuthorised">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
        <p
          v-else-if="
            !element.isLocked ||
            userElements.some((e) => e.elementId === element.elementId)
          "
          class="text-right"
        >
          {{ element.boilingTemperature }}
        </p>
        <BaseTooltip v-else text="Елемент не відкрито">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Температура плавління:</p>
      </div>
      <div class="p-1 float-right text-right font-bold">
        <BaseTooltip v-if="!isUserAuthorised">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
        <p
          v-else-if="
            !element.isLocked ||
            userElements.some((e) => e.elementId === element.elementId)
          "
          class="text-right"
        >
          {{ element.meltingTemperature }}
        </p>
        <BaseTooltip v-else text="Елемент не відкрито">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість електронів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold">
        <BaseTooltip v-if="!isUserAuthorised">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
        <p
          v-else-if="
            !element.isLocked ||
            userElements.some((e) => e.elementId === element.elementId)
          "
          class="text-right"
        >
          {{ element.elementId }}
        </p>
        <BaseTooltip v-else text="Елемент не відкрито">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
      </div>
      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість протонів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold">
        <BaseTooltip v-if="!isUserAuthorised">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
        <p
          v-else-if="
            !element.isLocked ||
            userElements.some((e) => e.elementId === element.elementId)
          "
          class="text-right"
        >
          {{ Math.round(element.atomicWeight) - element.neutronQuantity }}
        </p>
        <BaseTooltip v-else text="Елемент не відкрито">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
      </div>

      <div class="p-1 float-left w-8/12">
        <p class="text-left">Кількість нейтронів:</p>
      </div>
      <div class="p-1 float-right text-right font-bold">
        <BaseTooltip v-if="!isUserAuthorised">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>
        <p
          v-else-if="
            !element.isLocked ||
            userElements.some((e) => e.elementId === element.elementId)
          "
          class="text-right"
        >
          {{ element.neutronQuantity }}
        </p>
        <BaseTooltip v-else text="Елемент не відкрито">
          <i class="fas fa-lock mx-3 self-end scale-125 transform w-1/12" />
        </BaseTooltip>

        <div
          v-if="
            !isUserAuthorised ||
            !element.isLocked ||
            userElements.some((e) => e.elementId === element.elementId)
          "
          class="clear-none float-right"
        />

        <div v-else class="clear-none float-right">
          <button
            @click="buyElement(element.elementId)"
            class="shadow-lg p-3 border border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen"
          >
            Купити елемент
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import storage from '@/store'
import BaseTooltip from '@/components/BaseTooltip'
import apiService from '@/services'
import router from '../router'

export default {
  components: {
    BaseTooltip,
  },
  data() {
    return {
      userElements: [],
    }
  },
  watch: {
    isUserAuthorised: function () {
      this.getUserElements()
    },
  },
  methods: {
    async getUserElements() {
      if (this.isUserAuthorised) {
        await apiService.getUser().then((resp) => {
          console.error(resp.data.elements)
          this.userElements = resp.data.elements
          return resp.data.elements
        })
      } else {
        return 0
      }
    },
    logStorage() {
      console.log(storage.state.token)
    },
    buyElement(idElement) {
      apiService.buyElements(idElement)
      this.getUserElements()
      //router.push("/UserPage")
      router.push('/PeriodicTable')
    },
  },
  computed: {
    isUserAuthorised() {
      return storage.state.token.length !== 0
    },
    valencyString() {
      if (!this.element.valences.length) return 'невизначено'

      let result = ''

      for (let i = 0; i < this.element.valences.length; i++) {
        switch (this.element.valences[i].valenceVal) {
          case 1:
            result += 'I, '
            break
          case 2:
            result += 'II, '
            break
          case 3:
            result += 'III, '
            break
          case 4:
            result += 'IV, '
            break
          case 5:
            result += 'V, '
            break
          case 6:
            result += 'VI, '
            break
          case 7:
            result += 'VII, '
            break
          case 8:
            result += 'VIII, '
            break
          default:
            break
        }
      }
      return result.substr(0, result.length - 2)
    },
  },
  created() {
    if (storage.state.token.length !== 0) {
      apiService.getUser().then((resp) => {
        this.userElements = resp.data.elements
      })
    }
  },
  props: {
    element: {
      atomicRadius: {
        type: Number,
        default: 454.59,
      },
      atomicWeight: {
        type: Number,
        default: 1.008,
      },
      boilingTemperature: {
        type: Number,
        default: 607,
      },
      category: {
        type: String,
        default: 'Неметали',
      },
      electronQuantity: {
        type: Number,
        default: 588,
      },
      electronegativity: {
        type: Number,
        default: 511.1,
      },
      elementId: {
        type: Number,
        default: 1,
      },
      energyLevels: {
        type: Number,
        default: 0,
      },
      group: {
        type: Number,
        default: 1,
      },
      meltingTemperature: {
        type: Number,
        default: 1,
      },
      name: {
        type: String,
        default: 'Гідроген',
      },
      neutronQuantity: {
        type: Number,
        default: 733,
      },
      protonQuantity: {
        type: Number,
        default: 936,
      },
      symbol: {
        type: String,
        default: 'H',
      },
      valences: {
        type: Array,
        default: [],
      },
      isLocked: {
        type: Number,
        default: 0,
      },
    },
    bgColor: {
      default: '#a1c768',
    },
    borderColor: {
      default: '#657c41',
    },
  },
}
</script>
