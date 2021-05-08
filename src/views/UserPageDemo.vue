<template>
  <div class="bg-csblack mt-0 h-screen">
  <div class="row">

    <div class="column w-8/12">

    <div class="user-info w-11/12 bg-csblack text-white mb-20 border border-csblack block overflow-hidden">
      <a href="">
        <img src="button-for-request.png" class="pl-10 w-20 h-20 float-left">
      </a>
      <p class="text-7xl font-semibold">Звичайний учень</p>
    </div>

    <div class="achievements ml-10 w-11/12 bg-white text-csblack border border-csblack rounded-3xl block overflow-hidden">
      <p class=" text-5xl font-semibold text-center" >Досягнення</p>
      <ol class="text-left text-4xl">
        <li>
          <img src="list-marker.png" class="pl-10 w-10 h-10 float-left">
          <p class="pl-10 float-left" >13 мільйонів джоулей</p>
          <div style="float: right;">
          <img src="coin.png" class="pl-10 w-10 h-10 float-left ">
          <p class="pl-20 float-left" >25</p>
          <img src="rating.png" class="pl-10 w-10 h-10 float-left">
          <p class="pl-20 float-left pr-5" >25</p>
          </div>
        </li>
        <br>

      </ol>
    </div>

    </div>

    <div class="column w-4/12">
    <div class="rating border border-csblack mr-10 rounded-3xl bg-white text-csblack h-full block overflow-hidden">

      <img src="cupImage.png" class="w-10 h-10 pl-20 float-left">
      <p class="text-4xl font-semibold">Рейтинг</p>

      <ol class="text-left text-2xl">

        <li>
          <p class="float-left font-semibold pl-5">01:</p>
          <p class="float-left">Наріман Намазов</p>
          <div style="float: right;">
            <p class="pl-20 float-left pr-5" >725</p>
          </div>
        </li>
        <br>
        <li>
          <p class="float-left font-semibold pl-5">02:</p>
          <p class="float-left">Вовк</p>
          <div style="float: right;">
            <p class="pl-20 float-left pr-5" >231</p>
          </div>
        </li>
        <br>

      </ol>
    </div>

    </div>

  </div>
  </div>
</template>

<script>
export default {
  name: "UserPageDemo"
}
</script>

<style type="text/css">

.user-info {
  float: left;
}

.page{
  position: absolute;
  height: auto;
  bottom: 0;
  top: 0;
  left: 0;
  right: 0;
}

</style>