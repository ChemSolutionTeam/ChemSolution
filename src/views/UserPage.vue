<template>
  <div class="bg-csblack mt-20 h-screen">
    <div class="row">
      <div class="column mt-20 w-8/12">
        <div
          class="user-info w-11/12 bg-csblack text-white mb-20 border border-csblack block overflow-hidden"
        >
          <Link
            v-if="isUserAuthorised"
            label="Ваші запити"
            href="/UserRequests"
          />
          <img
            src="button-for-request.png"
            class="pl-10 w-20 h-20 float-left"
          />

          <p class="text-7xl font-semibold">{{ currentUserName }}</p>
        </div>

        <div
          class="scroll-achievements ml-10 w-11/12 bg-white text-csblack border border-csblack rounded-3xl block overflow-hidden"
        >
          <p class="text-5xl font-semibold text-center mb-4">Досягнення</p>
          <hr />
          <ol class="text-left text-4xl mt-4">
            <li
              v-for="achievement in achievements"
              :key="achievement.achievementId"
            >
              <div class="row">
                <span class="column w-7/12 ml-5 achievement-text">
                  <img
                    src="{{ achievement.imgAchievement }}"
                    class="icons-achievement mr-3 float-left"
                  />
                  {{ achievement.heading }}
                </span>
                <span class="column w-2/12 mr-1 achievement-text">
                  <img
                    src="coin.png"
                    class="icons-achievement float-left mr-1"
                  />
                  {{ achievement.moneyReward }}
                </span>
                <span class="column w-2/12 mr-1 achievement-text">
                  <img
                    src="rating.png"
                    class="icons-achievement float-left mr-1"
                  />
                  {{ achievement.ratingReward }}
                </span>
              </div>
            </li>
          </ol>
        </div>
      </div>

      <div class="column mt-20 w-4/12">
        <div
          class="scroll-rating border border-csblack mr-10 rounded-3xl bg-white text-csblack h-full block overflow-hidden"
        >
          <img src="cupImage.png" class="w-10 h-10 pl-20 float-left" />
          <p class="text-4xl font-semibold">Рейтинг</p>

          <table class="text-left">
            <tr v-for="(user, index) in users" :key="index">
              <td class="w-5/6">
                <p
                  style="display: inline"
                  class="rating-text font-semibold pl-5"
                >
                  {{ index + 1 }}:
                </p>
                <p style="display: inline" class="nickname-text">
                  {{ user.userName }}
                </p>
              </td>
              <td class="w-1/6">
                <p style="font-size: 2vw">{{ user.rating }}</p>
              </td>
            </tr>
            <br />
          </table>
        </div>
      </div>
    </div>
  </div>
  <Footer />
</template>

<script>
import apiService from '@/services'
import Footer from '../components/Footer'
import storage from '@/store'
import Link from '../components/NavigationLink.vue'

export default {
  data() {
    return {
      users: [],
      achievements: [],
      currentUserName: '',
    }
  },
  components: {
    Footer,
    Link,
  },
  computed: {
    isUserAuthorised() {
      return storage.state.token.length !== 0
    },
  },
  created() {
    apiService.getUsersByRating().then((resp) => (this.users = resp.data))

    if (storage.state.token.length !== 0) {
      apiService.getUser().then((resp) => {
        console.log(resp)
        this.currentUserName = resp.data.userName
        this.achievements = resp.data.achievement
      })
    }
  },
}
</script>

<style type="text/css">
.user-info {
  float: left;
}

.scroll-achievements {
  margin: 5px;
  padding: 5px;
  overflow: auto;
  text-align: justify;
  height: 25vw;
}

.scroll-rating {
  margin: 5px;
  padding: 5px;
  overflow: auto;
  height: 35vw;
}

.icons-achievement {
  height: 2vw;
  width: 2vw;
}

.achievement-text {
  font-size: 2vw;
}

.rating-text {
  font-size: 2vw;
}

.nickname-text {
  white-space: nowrap; /* Запрещаем перенос строк */
  overflow: hidden; /* Обрезаем все, что не помещается в область */
  text-overflow: ellipsis; /* Добавляем многоточие */
  font-size: 2vw;
}

.flex-container {
  display: -ms-inline-flexbox;
  display: -webkit-inline-flex;
  display: inline-flex;
  -webkit-flex-direction: column;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-flex-wrap: nowrap;
  -ms-flex-wrap: nowrap;
  flex-wrap: nowrap;
  -webkit-justify-content: flex-start;
  -ms-flex-pack: start;
  justify-content: flex-start;
  -webkit-align-content: flex-start;
  -ms-flex-line-pack: start;
  align-content: flex-start;
  -webkit-align-items: flex-start;
  -ms-flex-align: start;
  align-items: flex-start;
}
</style>
