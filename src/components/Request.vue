<template>
  <!-- CHANGE DIV ID DEPENDING ON STATUS   -->

  <div
    id="approved"
    class="request border border-csblack mr-5 ml-5 mb-5 rounded-xl text-csblack h-full block overflow-hidden"
  >
    <table>
      <tr>
        <td>
          <p class="font-bold">Тема:</p>
        </td>
        <td>
          <p>{{ request.Theme }}</p>
        </td>
      </tr>
      <tr>
        <td>
          <p class="font-bold">Дата:</p>
        </td>
        <td>
          <p>{{ request.DateTimeSended }}</p>
        </td>
      </tr>
      <tr>
        <td>
          <p class="font-bold">Статус:</p>
        </td>
        <td>
          <p>{{ request.StatusId }}</p>
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
export default {
  name: 'Request',
  props: {
    number: {
      type: Number,
      default: 1,
    },
  },
  computed: {
    request() {
      return {
        //not sure if this is what we need
        userEmail: 'aaaaaa@gmail.com',
        DateTimeSended: '12.01.2021',
        Text: 'Please add H2O to your app',
        Theme: 'Adding element',
        UserEmail1: 'bbbbbb@gmail.com',
        StatusId: 1,
      }
    },
  },
}
</script>

<style>
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}
</style>
