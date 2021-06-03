<template>
  <div class="inset-0 z-20 fixed w-full h-full bg-csblack">
    <div
      class="mt-0 flex flex-row bg-white absolute inset-3 rounded-3xl self-center p-2"
    >
      <div class="w-full overflow-scroll">
        <h1 class="text-2xl">Відновлення паролю</h1>
        <BaseInput
          label="Email"
          type="email"
          placeholder="Уведіть E-mail"
          v-model="user.email"
          :isIncorrect="emailIsIncorrect"
          :isMultiline="true"
        ></BaseInput>
        <BaseInput
          label="Новий пароль"
          type="password"
          placeholder="Уведіть пароль"
          v-model="user.newPass"
          :isIncorrect="passWrong"
          :isMultiline="true"
          errorMassage="Пароль має містити 8 знаків, 1 цифру, 1 велику , 1 малу літери та 1 символ"
        />
        <BaseInput
          label="Повторіть пароль"
          type="password"
          placeholder="Уведіть пароль"
          v-model="user.newPass2"
          :isIncorrect="passDontMatch"
          :isMultiline="true"
          errorMassage="Паролі не співпадають"
        />
        <button
          @click="changePassword"
          id="sign-in"
          type="submit"
          class="shadow-lg p-3 border border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen"
        >
          Відновити пароль
        </button>
        <div class="text-center">
          <div class="m-3 ml-0 mt-1 mb-1 justify-center">
            <p>
              Посилання для підтвердження зміни паролю буде відправлено на вашу
              пошту
            </p>
            <p>
              Якщо лист не прийшов, перевірте правильність написання пошти та
              перевірте розділ "Спам"
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BaseInput from '../components/BaseInput.vue'
import apiService from '@/services/index.js'

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
      emailWrong: false,
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
    changePassword() {
      this.validatePassRepeat()
      this.validatePass()
      if (!this.passWrong && !this.passDontMatch) {
        apiService.recoverPassword(this.user.email, this.user.newPass)
      }
    },
  },
}
</script>

<style></style>
