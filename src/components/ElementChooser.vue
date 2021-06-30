<template>
  <div
    v-if="!isLocked"
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
      <div class="w-9/12">
        <p class="self-center text-center text-2xl w-full">
          {{ name }}
        </p>
        <div class="flex flex-row self-center text-2xl">
          <div class="mx-auto">
            <p style="float: left; text-align: right" class="text-csgreen p-0">
              {{ price }}
            </p>
            <img
              style="
                margin-right: 0px;
                position: relative;
                bottom: -3px;
                left: 3px;
              "
              src="AtomCoinGreen.png"
              class="w-7 h-7 p-0"
            />
          </div>
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
      default: false,
    },
    price: {
      type: Number,
      default: 20,
    },
    category: {
      type: String,
      default: '1',
    },
    atomicWeight: {
      type: Number,
      default: 1.008,
    },
    valences: {
      type: Array,
      default: function () {
        return [1]
      },
    },
  },
}
</script>
