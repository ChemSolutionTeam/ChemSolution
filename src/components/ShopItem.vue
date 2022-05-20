<template>
  <div
    class="
      w-full
      border border-csblack
      rounded-3xl
      bg-shopbg
      p-3
      flex
      cursor-pointer
    "
  >
    <img src="AtomCoinGreen.png" class="w-2/12 h-full self-center" />
    <div class="w-full">
      <h1 class="text-3xl text-center">{{ atoms }} atoms</h1>
      <div class="flex flex-row w-full text-2xl py-3 px-16">
        <h1 class="self-center mr-auto text-shopsale" v-if="this.sales != 0">
          -{{ sales }}%
        </h1>
        <h1 class="self-center ml-auto">{{ money }} грн</h1>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ShopItem',

  props: {
    atoms: {
      type: Number,
      default: 0,
    },
    money: {
      type: Number,
      default: 0,
    },
    sales: {
      type: Number,
      default: 0,
    },
  },
}
</script>

<style></style>
