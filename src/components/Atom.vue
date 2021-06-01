<template>
  <div @mouseenter="changeItem" @mouseleave="rechangeItem"
       :id="divId"
       :class="fill"
       style="width: 70px; height: 70px; font-size: 31.32px; cursor: pointer"
  >
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
    name: {
      type: String,
      default: 'Гідроген',
    },
    category: {
      type: String,
      default: '1',
    },
    categoryName: {
      type: String,
      default: 'неметали',
    },
    divId: {
      type: String,
      default: '1',
    },
    atomicWeight: {
      type: Number,
      default: 1.008,
    }
  },
  computed: {
    fill() {
      return (
          'atom rounded-full w-70 h-70 text-white text-center font-bold flex items-center justify-center bg-category' +
          this.category
      )
    },
  },
  methods: {
    changeItem() {
      document.getElementById('infoGraphics').className = 'm-4 bg-category' + this.category
      document.getElementById('infoNumber').innerText = this.id.toString()
      document.getElementById('infoSymbol').innerText = this.symbol
      document.getElementById('infoName').innerText = this.name
      document.getElementById('infoWeight').innerText = this.atomicWeight

      document.getElementById('slider').style.right = '0vw';
    },
    rechangeItem() {
      document.getElementById('slider').style.right = '-16vw';

    }
  }
}
</script>
<style></style>
