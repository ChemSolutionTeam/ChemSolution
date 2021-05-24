<template>
  <div class="bg-csblack mt-0 h-screen">
    <div class="row">
      <div class="column w-8/12">
        <div
          class="user-info w-11/12 bg-csblack text-white mb-20 border border-csblack block overflow-hidden"
        >
          <a href="">
            <img
              src="button-for-request.png"
              class="pl-10 w-20 h-20 float-left"
            />
          </a>
          <p class="text-7xl font-semibold">Звичайний учень</p>
        </div>

        <div
            class="scroll-achievements ml-10 w-11/12 bg-white text-csblack border border-csblack rounded-3xl block overflow-hidden"
        >
          <p class="text-5xl font-semibold text-center mb-4">Досягнення</p>
          <hr>
          <ol class="text-left text-4xl mt-4">
            <li v-for="achievement in achievements" :key="achievement.achievementId">
              <div class="row">
                <span class="column w-7/12 ml-5 achievement-text">
                  <img src="{{achievement.imgAchievement}}" class="icons-achievement mr-3 float-left"/>
                  {{ achievement.heading }}
                </span>
                <span class="column w-2/12 mr-1 achievement-text">
                  <img src="coin.png" class="icons-achievement float-left mr-1"/>
                  {{ achievement.moneyReward }}
                  </span>
                <span class="column w-2/12 mr-1 achievement-text">
                  <img src="rating.png" class="icons-achievement float-left mr-1"/>
                  {{ achievement.ratingReward }}
                </span>
              </div>
            </li>
          </ol>
        </div>
      </div>

      <div class="column w-4/12">
        <div
          class="scroll-rating border border-csblack mr-10 rounded-3xl bg-white text-csblack h-full block overflow-hidden"
        >
          <img src="cupImage.png" class="w-10 h-10 pl-20 float-left" />
          <p class="text-4xl font-semibold">Рейтинг</p>

          <table class="text-left">
            <tr>
              <td class="w-5/6">
              <p style="display: inline" class="rating-text font-semibold pl-5">01:</p>
              <p style="display: inline" class="nickname-text">Наріман Намазов</p>
              </td>
              <td class="w-1/6">
                <p style="font-size: 2vw;">725</p>
              </td>
            </tr>
            <br />
            <tr>
              <td>
              <p style="display: inline" class="rating-text font-semibold pl-5 ">02:</p>
              <p style="" class="nickname-text inline">ффффaaaaaaaaaaa</p>
              </td >
              <td>
              <p style="font-size: 2vw;">231</p>
              </td>
            </tr>
            <br />

            <tr>
              <td>
              <p style="display: inline" class="rating-text font-semibold pl-5">03:</p>
              <p style="display: inline" class="nickname-text">Зумєр</p>
              </td>
              <td>
              <p style="font-size: 2vw;">199</p>
              </td>
            </tr>
            <br />

          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import apiService from "@/services";

export default {
  data() {
    return {
      achievements: []
    }
  },
  created() {
    apiService.getAchievements().then(resp => this.achievements = resp.data)
  },
  methods: {
    getData() {
      apiService.getAchievements().then((resp) => {
        console.log(resp.data)
        this.achievements = resp.data
      })
    }
  }
}
</script>

<style type="text/css">
.user-info {
  float: left;
}

.scroll-achievements {
  margin:5px;
  padding:5px;
  overflow: auto;
  text-align:justify;
  height: 25vw;
}

.scroll-rating {
  margin:5px;
  padding:5px;
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
