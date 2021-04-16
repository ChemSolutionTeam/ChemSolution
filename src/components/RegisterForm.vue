<template>
  <div
      class="box m-5 pl-12 p-3 pb-16 text-left w-6/12 bg-white border-csblack shadow-2xl border rounded-lg">
    <form>
      <div class="column w-8/12 mt-4">
        <h3 class="text-4xl text-center heading pb-5">Реєстрація</h3>
        <div class="column w-6/12">
          <BaseInput
              label="Email"
              type="email"
              placeholder="Уведіть E-mail"
              isMultiline=true
          ></BaseInput>
          <BaseInput
              label="Пароль"
              type="password"
              placeholder="Уведіть пароль"
              isMultiline=true
          ></BaseInput>
          <BaseInput
              label="Дата народження"
              type="date"
              isMultiline=true
          ></BaseInput>
        </div>
        <div class="column w-6/12">
          <BaseInput
              label="Ім'я користувача"
              type="password"
              placeholder="Уведіть ваше ім'я"
              isMultiline=true
          ></BaseInput>
          <BaseInput
              label="Підтвердження паролю"
              type="password"
              placeholder="Уведіть пароль"
              isMultiline=true
          ></BaseInput>

        </div>

        <div class="column">
          <div class="flex items-start ml-1 mt-3">
            <div class="flex items-center h-16">
              <input
                  id="personalData"
                  name="personalData"
                  type="checkbox"
                  class="focus:ring-cslightgreen border-2 m-2 h-4 w-4 text-csgreen border-csblack-300 rounded"
              />
            </div>
            <div class="ml-1 h-6 text-sm">
              <label for="personalData" class="text-lg text-gray-700">
                Я даю згоду на обробку персональних даних та погоджуюсь із правилами користування сервісом
              </label>
            </div>
          </div>

          <div class="flex items-start ml-1 mt-3">
          <div class="flex items-center h-6">
            <input
                id="correctData"
                name="correctData"
                type="checkbox"
                class="focus:ring-cslightgreen border-2 m-2 h-4 w-4 text-csgreen border-csblack-300 rounded"
            />
          </div>
          <div class="ml-1 h-6 text-sm">
            <label for="correctData" class="text-lg text-gray-700">
              Я підтверджую достовірність внесених даних
            </label>
          </div>
        </div>

        </div>
      </div>
      <!-- <div class="column w-[3.23rem] v-line"> </div> -->
      <div class="column w-4/12 mt-4">
        <div class="image-holder mb-5">
            <img id="logoOnPage" src="ChemSolutionLogo.svg" alt="ChemSolution logo">
        </div>
        <button
            id="sign-in"
            class="shadow-lg p-3 border border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen">
          Створити акаунт
        </button>
        <hr class="mt-3 mb-3">

        <button
            id="google-sign-in"
            class="shadow-lg p-3 border border-grey-300 button-enter w-11/12 ml-3 m-5 sm:text-xl"
        >
          <i class="fab fa-google mr-3 transform scale-200"></i>Зареєструватися з Google
        </button>

        <button
            id="facebook-sign-in"
            class="shadow-lg border p-3 border-grey-300 button-enter w-11/12 ml-3 mt-0 m-5 text-xl"
        >
          <i class="fab fa-facebook mr-3 transform scale-200"></i>Зареєструватися з
          Facebook
        </button>
        <hr class="mt-3 mb-3">
        <div class="text-center">
          <div class="mb-3 mt-3">
            <a href="" class="link mb-7">Вже є акаунт?</a>
          </div>
          <div><a href="" class="link">Увійти</a></div>
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

.v-line {
  margin-top: 1.5rem;
  border-left: 1px solid green;
  height: 550px;
  margin-left: -3px;
  top: 0;
}

.link {
  padding-bottom: 1px;
  font-size: larger;
  font-weight: bolder;
}

.column {
  display:inline-block;
  vertical-align: top;
}

.image-holder {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}

#google-sign-in {
  background-color: #ea4335;
}

#facebook-sign-in {
  background-color: #4064ac;
}
</style>