<template>
  <li>
    <!--Find better way to show achievements-->
    <img src="{{achievement.achievementPicture}}" class="pl-10 w-10 h-10 float-left">
    <p class="pl-20 float-left">{{ achievement.heading }}</p>
    <div style="float: right;">
    <!-- CHANGE PATH TO IMAGE -->
    <img src="coin.png" class="pl-10 w-10 h-10 float-left">
    <p class="pl-20 float-left">{{achievement.moneyReward}}</p>
    <!-- CHANGE PATH TO IMAGE -->
    <img src="rating.png" class="pl-10 w-10 h-10 float-left">
      <p class="pl-20 float-left">{{achievement.ratingReward}}</p>
    </div>
  </li>
  <br>
</template>

<script>
export default {
  props: {
    number: {
      type: Number,
      default: 1,
    },
  },
  computed: {
    achievement() {
      return {
        //not sure if this is what we need
        countGoal: 1,
        achievementPicture:'achievementpicture.png',
        description: 'Справжній пельмень',
        heading: 'Справжній пельмень',
        moneyReward: 25,
        ratingReward: 25,
      }
    }
  }
}
</script>

<style>
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}

</style>