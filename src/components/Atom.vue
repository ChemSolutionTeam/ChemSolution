<template>
  <div
    @mouseenter="changeItem"
    @mouseleave="rechangeItem"
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
    },
    valences: {
      type: Array,
    },
  },
  computed: {
    fill() {
      return (
        'atom rounded-full w-70 h-70 text-white text-center font-bold flex items-center justify-center bg-category' +
        this.category
      )
    },
    valencyString() {
      if (!this.valences || !this.valences.length) return 'невизначено'

      let result = ''

      for (let i = 0; i < this.valences.length; ++i) {
        switch (this.valences[i].valenceVal) {
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
      return result.substring(0, result.length - 2)
    },
  },
  methods: {
    changeItem() {
      document.getElementById('infoGraphics').className =
        'm-4 bg-category' + this.category
      document.getElementById('infoNumber').innerText = this.id.toString()
      document.getElementById('infoNumber1').innerText = this.id.toString()
      document.getElementById('infoSymbol').innerText = this.symbol
      document.getElementById('infoSymbol1').innerText = this.symbol
      document.getElementById('infoName').innerText = this.name
      document.getElementById('infoName1').innerText = this.name
      document.getElementById(
        'infoWeight'
      ).innerText = this.atomicWeight.toString()
      document.getElementById(
        'infoWeight1'
      ).innerText = this.atomicWeight.toString()
      document.getElementById('infoValences').innerText = this.valencyString
      document.getElementById('infoCategory').innerText = this.categoryName
      document.getElementById('slider').style.right = '0vw'
    },
    rechangeItem() {
      document.getElementById('slider').style.right = '-16vw'
    },
  },
}
</script>
<style></style>
