<template>
  <svg
    id="Слой_1"
    data-name="Слой 1"
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 70 70"
    class="w-1/4"
  >
    <circle :class="fill" cx="35" cy="35" r="34.88" />
    <path
      d="M35,.25A34.75,34.75,0,1,1,.25,35,34.79,34.79,0,0,1,35,.25M35,0A35,35,0,1,0,70,35,35,35,0,0,0,35,0Z"
    />
    <text
      class="cls-2"
      style="font-size: 31.32px; font-family: 'Century Gothic'; fill: #ffffff"
      transform="translate(24.33 45.8)"
    >
      {{ symbol }}
    </text>
  </svg>
</template>

<script>
export default {
  name: 'Atom',
  props: {
    id: {
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
  },
  computed: {
    fill() {
      return 'fill-current text-category' + this.category
    },
  },
}
</script>
<style></style>
