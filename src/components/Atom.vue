<template>
  <div :id="divId" :class="fill" style="width:70px; height: 70px; font-size: 31.32px;">
    {{ symbol }}
  </div>
</template>

<script>
export default {
  name: 'Atom',
  props: {
    id: {
      type: Number,
      default: 1,
    },
    symbol: {
      type: String,
      default: 'H',
    },
    category: {
      type: String,
      default: '1',
    },
    divId: {
      type: String,
      default: '1',
    }
  },
  computed: {
    fill() {
      return 'rounded-full w-70 h-70 text-white text-center font-bold flex items-center justify-center bg-category'
          + this.category
    },
  },
}
</script>
<style></style>
