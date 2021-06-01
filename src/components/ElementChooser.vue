<template>
  <div
      v-if="!isLocked"
      class="flex flex-wrap border p-3 w-11/12 my-1 rounded-full border-csblack"
  >
    <Atom :symbol="symbol" :category="category"/>
    <p class="self-center overflow-y-auto text-2xl w-3/4">{{ name }}</p>
  </div>

  <BaseTooltip v-else text="Елемент не відкрито" size="larger">
    <div
        class="flex flex-wrap border p-3 w-11/12 my-1 rounded-full border-csblack"
        style="-webkit-touch-callout: none;-webkit-user-select: none;-moz-user-select: none;
        -ms-user-select: none;user-select: none;"
    >
      <Atom :symbol="symbol" :category="category"/>
      <p class="self-center overflow-y-auto text-2xl w-3/4">{{ name }}</p>
      <div class="w-4/12 mr-1">
      </div>
      <div class="w-3/12 mr-1 text-right content-center">
        {{ price }}
      </div>
      <div class="w-1/12 mr-1 float-right">
        <img src="AtomCoinGreen.png" class="mr-1"/>
      </div>
    </div>
  </BaseTooltip>

</template>

<script>
import Atom from '@/components/Atom'
import BaseTooltip from '@/components/BaseTooltip'
export default {
  name: 'ElementChooser',
  components: {
    Atom,
    BaseTooltip
  },
  props: {
    symbol: {
      type: String,
      default: 'H',
    },
    name: {
      type: String,
      default: 'Hydrogen',
    },
    isLocked: {
      type: Boolean,
      default: true,
    },
    price: {
      type: Number,
      default: 20,
    },
    category: {
      type: String,
      default: 'csgreen',
    },
  },
}
</script>
