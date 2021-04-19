<template>
  <div class="flex items-start inset-0 my-4 shadow-lg max-w-2xl mx-auto">
    <div
      class="box self-center pl-12 p-3 text-left w-full bg-white border-csblack shadow-2xl border rounded-lg"
    >
      <form @submit.prevent="resetPass">
        <h3 class="text-4xl text-center heading pb-5">Відновлення</h3>
        <BaseInput
          label="Email"
          type="email"
          placeholder="Уведіть E-mail"
          v-model="user.email"
          :isIncorrect="emailIsIncorrect"
        ></BaseInput>
        <BaseInput
          label="Новий пароль"
          type="password"
          placeholder="Уведіть пароль"
          v-model="user.newPass"
          :isIncorrect="passWrong"
          errorMassage="Пароль має містити 8 знаків, 1 цифру, 1 велику , 1 малу літери та 1 символ"
        />
        <BaseInput
          label="Повторіть пароль"
          type="password"
          placeholder="Уведіть пароль"
          v-model="user.newPass2"
          :isIncorrect="passDontMatch"
          errorMassage="Паролі не співпадають"
        />
        <hr class="m-3 w-11/12" />

        <button
          id="sign-in"
          type="submit"
          class="shadow-lg p-3 border border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen"
        >
          Відновити пароль
        </button>
        <div class="text-center">
          <div class="m-3 ml-0 mt-1 mb-1 flex flex-row justify-center">
            <p>Лінк для підтвердження зміни паролю відправлено на вашу пошту</p>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import BaseInput from '../components/BaseInput.vue'

export default {
  name: 'ResetForm',
  components: { BaseInput },
  data() {
    return {
      user: {
        email: '',
        newPass: '',
        newPass2: '',
      },
      passDontMatch: false,
      passWrong: false,
      isShown: false,
      emailIsIncorrect: false,
      passIsIncorrect: false,
    }
  },
  methods: {
    resetPass() {
      this.validatePass()
      this.validatePassRepeat()
    },
    validatePass() {
      this.passWrong = !this.user.newPass.match(
        new RegExp(
          '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])(?=.{8,})'
        )
      )
    },
    validatePassRepeat() {
      this.passDontMatch = this.user.newPass !== this.user.newPass2
    },
  },
}
</script>

<style></style>
