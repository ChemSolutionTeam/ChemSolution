<template>
  <td id="{{number}}" title="{{name}}">
    <sup>{{ number }}</sup
    >{{ symbol }}
  </td>
</template>

<script>
export default {
  props: {
    number: {
      type: Number,
      default: 55,
    },
  },
  data() {
    return {
      element: this.getElement(this.number),
    }
  },
  methods: {
    getElement(id) {
      //Запрос в API

      return {
        number: id,
        name: 'Цезій',
        symbol: 'Cs',
      }
    },
  },
}
</script>

<style>
@font-face {
  font-family: 'Open Sans';
  src: url('/fonts/OpenSans-Regular-webfont.woff2') format('woff2'),
    url('/fonts/OpenSans-Regular-webfont.woff') format('woff');
}

form {
  font-family: 'Open Sans', serif;
}
</style>
