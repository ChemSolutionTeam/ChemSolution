<template>
  <div
      v-if="!isLocked"
      class="flex flex-wrap border p-3 w-11/12 my-1 rounded-full border-csblack"
  >
    <Atom
        :symbol="symbol"
        :category="category"
        :name="name"
        :category-name="categoryName"
        :id="id"
        :atomic-weight="atomicWeight"
        :valences="valences"
    />
    <p class="self-center overflow-y-auto text-2xl w-3/4">{{ name }}</p>
  </div>

  <BaseTooltip v-else text="Елемент не відкрито" size="larger">
    <div
        class="flex flex-wrap border p-3 w-11/12 my-1 rounded-full border-csblack"
        style="
        align-items: flex-start;
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      "
    >
      <Atom
          :symbol="symbol"
          :category="category"
          :name="name"
          :category-name="categoryName"
          :id="id"
          :atomic-weight="atomicWeight"
          :valences="valences"
      />
      <div style="flex: 1">
        <p class="self-center overflow-y-auto text-2xl h-1/2">{{ name }}</p>
        <div class="self-center overflow-y-auto text-2xl h-1/2 w-3/12 mx-auto">
          <p style="float:left; margin:auto;" class="text-csgreen">{{ price }}</p>
          <img style="float:right; margin:auto;" src="AtomCoinGreen.png" class="w-7 h-7"/>
          <div style="clear: left;"/>
        </div>
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
    BaseTooltip,
  },
  props: {
    id: {
      type: Number,
      default: 1,
    },
    symbol: {
      type: String,
      default: 'H',
    },
    name: {
      type: String,
      default: 'Гідроген',
    },
    categoryName: {
      type: String,
      default: 'неметали',
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
    atomicWeight: {
      type: Number,
      default: 1.008,
    },
    valences: {
      type: Array
    }
  },
}
</script>
