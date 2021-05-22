<template>
  <li>
    <p class="rating-text float-left font-semibold pl-5">01:</p>
    <p class="rating-text float-left">{{rating.userName}}</p>
    <div style="float: right;">
      <p class="rating-text pl-20 float-left pr-5" >{{rating.numberInRating}}</p>
    </div>
  </li>
</template>

<script>
export default {
  computed: {
    rating() {
      return {
        //not sure if this is what we need
        userName: 'Наріман Намазов',
        numberInRating: 1,
      }
    }
  }
}
</script>

<style scoped>
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}

</style>