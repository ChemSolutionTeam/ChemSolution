<template>
  <li>
    <p class="rating-text float-left font-semibold pl-5">01:</p>
    <p class="rating-text float-left">{{ rating.userName }}</p>
    <div style="float: right">
      <p class="rating-text pl-20 float-left pr-5">
        {{ rating.numberInRating }}
      </p>
    </div>
  </li>
</template>

<script>
export default {
  computed: {
    rating() {
      return {
        userName: 'Наріман Намазов',
        numberInRating: 1,
      }
    },
  },
}
</script>

<style scoped>
@font-face {
  font-family: 'Open Sans';
  src: url('/fonts/OpenSans-Regular-webfont.woff2') format('woff2'),
    url('/fonts/OpenSans-Regular-webfont.woff') format('woff');
}
</style>
