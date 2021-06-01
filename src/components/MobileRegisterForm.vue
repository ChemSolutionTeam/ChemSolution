<template>
  <div class="inset-0 z-20 fixed w-full h-full bg-csblack">
    <div
      class="mt-0 flex flex-row bg-white absolute inset-3 rounded-3xl self-center p-2"
    >
      <div class="w-full overflow-scroll">
        <h1 class="text-2xl">Реєстрація</h1>
        <BaseInput
          label="Ім'я користувача"
          type="text"
          placeholder="Уведіть ваше ім'я"
          :isMultiline="true"
          v-model="user.username"
          errorMassage=""
        />
        <BaseInput
          label="Email"
          type="email"
          placeholder="Уведіть E-mail"
          :isMultiline="true"
          v-model="user.email"
        />
        <BaseInput
          label="Пароль"
          type="password"
          placeholder="Уведіть пароль"
          :isMultiline="true"
          @change="validate()"
          v-model="user.pass"
          :isIncorrect="passWrong"
          errorMassage="Пароль має містити 8 знаків, 1 цифру, 1 велику , 1 малу літери та 1 символ"
        />

        <BaseInput
          label="Підтвердження паролю"
          type="password"
          placeholder="Уведіть пароль"
          :isMultiline="true"
          v-model="user.passRepeat"
          @change="validate()"
          :isIncorrect="passDontMatch"
          errorMassage="Паролі не співпадають"
        />
        <BaseInput
          label="Дата народження"
          type="date"
          :isMultiline="true"
          v-model="user.birthDate"
          errorMassage="Уведіть правильну дату"
          :isIncorrect="dateWrong"
          @change="validate()"
        />
        <BaseCheck
          v-model="user.agreeToTerms"
          label="Я даю згоду на обробку персональних даних та
            погоджуюсь із правилами користування сервісом"
        />
        <BaseCheck
          v-model="user.isMyInfoTrue"
          label="Я підтверджую достовірність внесених даних"
        />
        <button
          id="sign-up"
          type="submit"
          :disabled="!registerable"
          class="hover:text-csblack disabled:opacity-25 shadow-lg p-3 border border-grey-300 bg-csblue button-enter w-11/12 ml-3 m-5 focus:outline-none focus:ring-4 focus:ring-csgreen"
        >
          Створити акаунт
        </button>
        <hr class="mt-3 mb-3" />

        <button
          id="google-sign-up"
          class="hover:text-csblack shadow-lg p-3 border border-grey-300 button-enter w-11/12 ml-3 m-5 sm:text-xl"
        >
          <i
            class="text-white animate-pulse fab fa-google mr-3 transform scale-200"
          />
          Зареєструватися з Google
        </button>

        <button
          id="facebook-sign-up"
          class="hover:text-csblack shadow-lg border p-3 border-grey-300 button-enter w-11/12 ml-3 mt-0 m-5 text-xl"
        >
          <i
            class="text-white animate-pulse fab fa-facebook mr-3 transform scale-200"
          />
          Зареєструватися з Facebook
        </button>
        <hr class="mt-3 mb-3" />
        <div class="text-center">
          <div class="mb-3 mt-3">
            <button
              type="button"
              class="focus:outline-none hover:text-csgreen link"
              @click="this.$emit('openReset')"
            >
              Забули пароль?
            </button>
          </div>
          <div>
            <button
              type="button"
              @click="this.$emit('openLogin')"
              class="link focus:outline-none hover:text-csgreen"
            >
              Увійти
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BaseInput from '@/components/BaseInput'
import BaseCheck from '@/components/BaseCheck'
export default {
  name: 'MobileRegister',
  components: {
    BaseInput,
    BaseCheck,
  },
  data() {
    return {
      user: {
        email: '',
        username: '',
        pass: '',
        passRepeat: '',
        birthDate: '',
        agreeToTerms: false,
        isMyInfoTrue: false,
      },
      passDontMatch: false,
      passWrong: false,
      dateWrong: false,
    }
  },
}
</script>

<style></style>
