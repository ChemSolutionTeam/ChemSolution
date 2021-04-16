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

      <div class="flex items-start ml-1">
        <div class="flex items-center h-6">
          <input
            id="comments"
            name="comments"
            type="checkbox"
            class="focus:ring-cslightgreen border-2 m-2 h-4 w-4 text-csgreen border-csblack-300 rounded"
          />
        </div>
        <div class="ml-1 h-6 text-sm">
          <label for="comments" class="text-lg text-gray-700"
            >Запам'ятати мене</label
          >
        </div>
      </div>

      <button
        id="sign-in"
        class="shadow-lg p-3 border border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen"
      >
        Увійти
      </button>

      <hr class="m-3 w-11/12" />

      <button
        id="google-sign-in"
        class="shadow-lg p-3 border border-grey-300 button-enter w-11/12 ml-3 m-5 text-xl"
      >
        <i class="fab fa-google mr-3 transform scale-150"></i>Увійти з Google
      </button>

      <button
        id="facebook-sign-in"
        class="shadow-lg border p-3 border-grey-300 button-enter w-11/12 ml-3 mt-0 m-5 text-xl"
      >
        <i class="fab fa-facebook mr-3 transform scale-150"></i>Увійти з
        Facebook
      </button>

      <hr class="m-3 w-11/12" />
      <div class="w-11/12 text-center">
        <div class="mb-3 mt-3">
          <a href="" class="link mb-7">Забули пароль?</a>
        </div>
        <div><a href="" class="link">Створити аккаунт</a></div>
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
  padding-bottom: 1px;
  font-size: larger;
  font-weight: bolder;
}

#google-sign-in {
  background-color: #ea4335;
}

#facebook-sign-in {
  background-color: #4064ac;
}
</style>
