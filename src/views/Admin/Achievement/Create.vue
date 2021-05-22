<template>
  <div>
    <h1 class="font-bold text-csblack text-5xl">
      Створення досягнення:
      <span
        class="from-cslightgreen via-csgreen to-csblue bg-clip-text bg-gradient-to-tr"
        >{{ achievement.heading }}</span
      >
    </h1>
    <div class="justify-items-center grid">
      <div class="w-2/3 flex">
        <Button label="Зберігти" class="w-1/2" @click="submit()" />
        <Button
          label="Повернутися"
          class="w-1/2"
          @click="goBack()"
          white="true"
        />
      </div>
      <div
        class="w-1/2 m-8 bg-gradient-to-tr from-cslightgreen via-csgreen to-csblue rounded-3xl transform sm:-rotate-3"
      >
        <div
          class="transform rotate-3 bg-white p-5 rounded-3xl shadow-xl border-csblack border-2"
        >
          <BaseInput
            label="Назва досягнення"
            v-model="achievement.heading"
            placeholder="Уведіть назву досягнення"
          />

          <BaseInput
            label="Зображення"
            v-model="achievement.imgAchievement"
            placeholder="Уведіть зображення досягнення"
          />

          <BaseTextArea
            label="Опис"
            v-model="achievement.description"
            placeholder="Уведіть опис"
          />

          <BaseInput
            label="Грошова винагорода"
            v-model="achievement.moneyReward"
            type="number"
            placeholder="Уведіть грошову винагороду"
          />

          <BaseInput
            label="Рейтинг"
            v-model="achievement.ratingReward"
            type="number"
            placeholder="Уведіть рейтингову винагороду"
          />
          <BaseInput
            label="Кількість елементів"
            v-model="achievement.countGoal"
            type="number"
            placeholder="Уведіть кількість зібраних елементів"
          />

          <BaseInput
            label="Група елементів"
            v-model="achievement.materialGroup"
            placeholder="Уведіть групу елементів"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import apiService from '@/services/index'
import BaseInput from '@/components/BaseInput'
import BaseTextArea from '@/components/BaseTextArea'
import Button from '@/components/HomePageButtons'
import router from '../../../router'

export default {
  name: 'AchievementCreate',
  components: {
    BaseInput,
    Button,
    BaseTextArea,
  },
  methods: {
    submit() {
      apiService.postAchievement(this.achievement)
    },
    goBack() {
      router.push('/admin/achievements')
    },
  },
  data() {
    return {
      achievement: {},
    }
  },
}
</script>
