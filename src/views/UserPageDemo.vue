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
          <p class="text-5xl font-semibold text-center">Досягнення</p>
          <ol class="text-left text-4xl">
            <li>
              <img src="list-marker.png" class="icons-achievement pl-10 float-left" />
              <p class="achievement-text pl-10 float-left">13 мільйонів джоулей</p>
              <div style="float: right">
                <img src="coin.png" class="icons-achievement pl-10 float-left" />
                <p class="achievement-text pl-20 float-left">25</p>
                <img src="rating.png" class=" icons-achievement pl-10 float-left" />
                <p class="achievement-text pl-20 float-left pr-5">25</p>
              </div>
            </li>
            <br />
            <li>
              <img src="list-marker.png" class="icons-achievement pl-10 float-left" />
              <p class="achievement-text pl-10 float-left">13 мільйонів джоулей</p>
              <div style="float: right">
                <img src="coin.png" class="icons-achievement pl-10 float-left" />
                <p class="achievement-text pl-20 float-left">25</p>
                <img src="rating.png" class=" icons-achievement pl-10 float-left" />
                <p class="achievement-text pl-20 float-left pr-5">25</p>
              </div>
            </li>
            <br />
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
import apiService from '@/services/index.js'

export default {
name: 'UserPageDemo',
    data() {
  return {
    element: {}
  }
},
methods: {
  getData(id) {
    apiService.getAchievement(id).then((resp) => {
      console.log(resp.data)
      this.element = resp.data
    })
  },
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
</style>
