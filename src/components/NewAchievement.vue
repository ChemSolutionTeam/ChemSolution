<template>
  <div
    class="
      transform
      md:scale-50
      lg:scale-100
      flex
      items-start
      inset-0
      my-4
      shadow-lg
      max-w-4xl
      mx-auto
    "
  >
    <div
      class="
        box
        self-center
        px-12
        p-3
        pb-16
        text-left
        w-full
        bg-white
        border-csblack
        shadow-2xl
        border
        rounded-lg
      "
    >
      <h1 class="text-6xl text-center py-3">Ви отримали нове досягнення!</h1>
      <h1 class="text-8xl text-center py-3 font-bold">{{ this.heading }}</h1>
      <h2 class="text-4xl text-center py-3">{{ this.description }}</h2>
      <h1 class="text-5xl text-center py-3">Винагорода:</h1>

      <div class="flex space-x-4 justify-center">
        <div>
          <img src="AtomCoinGreen.png" class="icons-achievement" />
        </div>
        <h1 class="text-6xl text-center py-3">{{ this.moneyReward }}</h1>

        <div>
          <img src="../assets/ratingCup.png" class="icons-achievement" />
        </div>
        <h1 class="text-6xl text-center py-3">{{ this.ratingReward }}</h1>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NewAchievement',
  props: {
    heading: {
      type: String,
      default: 'По-середньому',
    },
    description: {
      type: String,
      default: 'Ви відкрили першу середню сіль!',
    },
    moneyReward: {
      type: Number,
      default: 20,
    },
    ratingReward: {
      type: Number,
      default: 20,
    },
  },
}
</script>

<style type="text/css">
.icons-achievement {
  height: 4vw;
  width: 4vw;
}
</style>
