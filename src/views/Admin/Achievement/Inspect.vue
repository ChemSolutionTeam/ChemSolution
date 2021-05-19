<template>
  <div>
    <h1 class="text-5xl">Achievements Inspect page</h1>

    <Button label="Додати досягнення" class="w-3/12" @click="create()" />
    <Button label="Повернутися" class="w-3/12" @click="goBack()" white="true" />

    <!-- <div>TODO Search</div> -->
    <div class="flex flex-wrap mx-3 my-5">
      <div
        class="border-2 overflow-x-auto border-csgreen rounded-xl rounded-b-none bg-cslightgreen bg-opacity-25 shadow-lg"
      >
        <table class="w-11/12 py-2 px-5 divide-y divide-gray-200 table-auto">
          <thead class="">
            <tr class="text-csblack uppercase">
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Id
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Heading
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                ImgAchievement
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Description
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                MoneyReward
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                RatingReward
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                CountGoal
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                MaterialGroup
              </th>
            </tr>
          </thead>
          <tbody class="text-csblack">
            <tr
              class="hover:bg-gray-100"
              v-for="(achievement, index) in achievements"
              :key="index"
            >
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ achievements.achievementId }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ achievements.heading }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ achievements.imgAchievement }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ achievements.description }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ achievements.moneyReward }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ achievements.ratingReward }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ achievements.countGoal }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ achievements.materialGroup }}
              </td>

              <td
                class="border border-t-0 px-5 border-csgreen whitespace-nowrap"
              >
                <div class="flex justify-end">
                  <button
                    class="px-4 focus:outline-none focus:ring focus:ring-offset-2 focus:ring-csgreen shadow-md bg-gradient-to-tr from-csgreen to-cslightgreen w-full p-1 m-1 border rounded-xl"
                    @click="edit(achievement)"
                  >
                    Edit
                  </button>
                  <button
                    @click="remove(achievement)"
                    class="focus:outline-none focus:ring focus:ring-offset-2 focus:ring-red-300 shadow-md bg-gradient-to-tr from-red-400 to-red-500 text-white w-full p-1 m-1 border rounded-xl"
                  >
                    Remove
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import Button from '@/components/HomePageButtons.vue'
import router from '@/router/index'
import apiService from '@/services/index'

export default {
  name: 'Inspect',
  components: { Button },
  methods: {
    goBack() {
      router.push('/admin')
    },
    edit(achievement) {
      achievement
      router.push('/admin/achievements/edit/' + achievement.achievementId)
    },
    remove(achievement) {
      achievement
      router.push('/admin/achievements/delete/' + achievement.achievementId)
    },
    create() {
      router.push('/admin/achievements/create/')
    },
  },
  mounted() {
    let achievements = apiService.getMaterials()
    if (achievements == null || achievements == undefined) return
    else this.achievements = achievements
  },
  data() {
    return {
      achievements: [
        {
          achievementId: 1,
        },
      ],
    }
  },
}
</script>

<style></style>
