<template>
  <li>
    <img
      src="{{achievement.achievementPicture}}"
      class="icons-achievement pl-10 float-left"
    />
    <p class="achievement-text pl-20 float-left">{{ achievement.heading }}</p>
    <div style="float: right">
      <img src="coin.png" class="icons-achievement pl-10 float-left" />
      <p class="achievement-text pl-20 float-left">
        {{ achievement.moneyReward }}
      </p>
      <img src="rating.png" class="icons-achievement pl-10 float-left" />
      <p class="achievement-text pl-20 float-left">
        {{ achievement.ratingReward }}
      </p>
    </div>
  </li>
  <br />
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
        countGoal: 1,
        achievementPicture: 'achievementpicture.png',
        description: 'Справжній пельмень',
        heading: 'Справжній пельмень',
        moneyReward: 25,
        ratingReward: 25,
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
</style>
