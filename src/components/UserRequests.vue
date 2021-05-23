<template>
  <div class="request-block">
    <h3 class="text-4xl text-center pb-5">Запити</h3>

    <div id="approved" class="request border border-csblack mr-5 ml-5 mb-5 rounded-xl text-csblack h-full block overflow-hidden">
      <table>
        <tr>
          <td>
            <p class="font-bold">Тема:</p>
          </td>
          <td>
            <p>Додавання C2H5OH</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="font-bold">Дата:</p>
          </td>
          <td>
            <p>23.05.2021</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="font-bold">Статус:</p>
          </td>
          <td>
            <p>Схвалено</p>
          </td>
        </tr>
      </table>
    </div>

    <div id="canceled" class="request border border-csblack mr-5 ml-5 mb-5 rounded-xl text-csblack h-full block overflow-hidden">
      <table>
        <tr>
          <td>
            <p class="font-bold">Тема:</p>
          </td>
          <td>
            <p>Додавання C2H5OH</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="font-bold">Дата:</p>
          </td>
          <td>
            <p>23.05.2021</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="font-bold">Статус:</p>
          </td>
          <td>
            <p>Відхиленно</p>
          </td>
        </tr>
      </table>
    </div>

    <div id="under-consideration" class="request border border-csblack mr-5 ml-5 mb-5 rounded-xl text-csblack h-full block overflow-hidden">
      <table>
        <tr>
          <td>
            <p class="font-bold">Тема:</p>
          </td>
          <td>
            <p>Додавання C2H5OH</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="font-bold">Дата:</p>
          </td>
          <td>
            <p>23.05.2021</p>
          </td>
        </tr>
        <tr>
          <td>
            <p class="font-bold">Статус:</p>
          </td>
          <td>
            <p>Розглядається</p>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  name: "UserRequests",
  methods: {}
}
</script>

<style type="text/css">

@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}

div{
  font-size: 2vw;
}

td{
  text-align: left;
}

#approved{
  background-color: #CEFFB7;
}

#canceled{
  background-color: #FFB7B8;
}

#under-consideration{
  background-color: #C0F7FB;
}


</style>