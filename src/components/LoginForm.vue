<template>
  <div
    class="box m-5 pl-12 p-3 text-left w-4/12 bg-white border-csblack shadow-2xl border rounded-lg"
  >
    <form>
      <h3 class="text-4xl text-center heading pb-5">Авторизація</h3>
      <BaseInput
        label="Email"
        type="email"
        placeholder="Уведіть E-mail"
      ></BaseInput>
      <BaseInput
        label="Пароль"
        type="password"
        placeholder="Уведіть пароль"
      ></BaseInput>
      <div>
        <input type="checkbox" id="checkbox" class="ml-3" v-model="checked">
        <label for="checkbox"> Запам'ятати мене</label>
      </div>
      <button id="sign-in" class="button-enter w-11/12 ml-3 m-5">Увійти</button><br>
      <hr class="m-3 w-11/12">
      <button id="google-sign-in" class="button-enter w-11/12 ml-3 m-5"><i class="fab fa-google mr-3"></i>Увійти з Google</button>
      <button id="facebook-sign-in" class="button-enter w-11/12 ml-3 mt-0 m-5"><i class="fab fa-facebook mr-3"></i>Увійти з Facebook</button><br>
      <hr class="m-3 w-11/12">
      <div class="w-11/12 text-center">
      <div class = "mb-3 mt-3">
      <a href="" class="link mb-7">Забули пароль?</a><br>
      </div>
      <div>
      <a href="" class="link">Створити аккаунт</a><br>
      </div>
      </div>
    </form>
  </div>
</template>

<script>
import BaseInput from '@/components/BaseInput.vue'
export default {
  name: 'LoginForm',
  components: {
    BaseInput,
  },
}
</script>

<style>
form {
  font-family: 'Century Gothic', serif;
}
.heading {
  font-weight: 700;
}
.button-enter {
  height: auto;
  border-radius: 15px;
  font-size: larger;
  padding: 5px;
  color: #ffffff;
}

.link {
  padding-bottom: 50%;
  font-size: larger;
  font-weight: bolder;
}

#sign-in {
  background-color: #169BD5;
}

#google-sign-in {
  background-color: #EA4335;
}

#facebook-sign-in {
  background-color: #4064AC;
}

</style>
