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
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}

form {
  font-family: 'Century Gothic', serif;
}
</style>
