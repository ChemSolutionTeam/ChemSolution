<template>
  <div class="">
    {{ elementSymbol }}
    <br>
    {{ elementName }}
  </div>
</template>

<script>
export default {
  data: {
    elementNumber: {
      type: Number,
      default: 55
    },
    elementSymbol: {
      type: String,
      default: "Cs"
    },
    elementName: {
      type: String,
      default: "Цезій"
    },
    mas: {
      type: Number,
      default: 132.90
    }
  }
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