<template>
  <div
    class="bg-csblack h-5/6 p-40 text-white justify-items-start text-left"
    id="block1"
  >
    <div class="flex flex-row w-full">
      <div class="text-center items-center py-36">
        <h1 class="text-8xl transform m-6 px-10">ChemSolution</h1>
        <p class="text-4xl text-center m-6 px-10">
          Відкрий для себе кросплатформенний сервіс дослідження хімічних сполук
          із можливістю оффлайн доступом до інформації.
        </p>
        <Button @click="learnMore()" />
      </div>
      <Logo class="w-4/5" :static="true" />
    </div>
  </div>
  <!-- Generator: Adobe Illustrator 25.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
  <svg
    class="bg-csblack"
    version="1.1"
    id="Слой_1"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    x="0px"
    y="0px"
    viewBox="0 0 1024 75.7"
    style="enable-background: new 0 0 1024 75.7"
    xml:space="preserve"
  >
    <g transform="matrix(1 0 0 1 1 -525 )">
      <path
        class="st0"
        d="M-1,1151.7v-576c0,0-5.6,22.3,190,14c94-4,212.5-17.2,330-40c351-68,504,26,504,26v576H-1z"
      />
    </g>
  </svg>
  <div
    id="block2"
    class="bg-csbluewhite h-5/6 px-40 py-5 text-csblack justify-items-start text-left"
  >
    <div class="flex flex-row w-full">
      <img
        src="@/assets/workspace.png"
        class="h-full w-1/2 my-36 m-3 rounded-3xl border-csblue border-2 transform duration-300 ease-in-out hover:scale-105"
      />
      <div class="text-center items-center py-36">
        <h1 class="text-5xl z-0 m-3 px-10">ChemSolution</h1>
        <p class="text-4xl m-3 px-10">
          Інтерактивна хімічна лабораторія дозволяє користувачу вивчати хімічні
          сполуки, шляхом комбінування відповідних атомів між собою.
        </p>
        <Button label="До хімічної лабораторії" @click="toLab()" />
      </div>
    </div>
  </div>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    viewBox="0 0 1440 320"
    class="bg-csbluewhite"
  >
    <path
      fill="#2f455c"
      fill-opacity="1"
      d="M0,224L60,234.7C120,245,240,267,360,256C480,245,600,203,720,170.7C840,139,960,117,1080,106.7C1200,96,1320,96,1380,96L1440,96L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"
    ></path>
  </svg>
  <div
    id="block3"
    class="bg-csblack h-5/6 px-40 py-5 text-white justify-items-start text-left"
  >
    <div class="flex flex-row w-full">
      <div class="text-center items-center py-36">
        <h1 class="text-5xl m-3 px-10">ChemSolution</h1>
        <p class="text-4xl m-3 px-10">
          Періодична система хімічних елементів є графічним виразом періодичного
          закону. Долучіться до світу хімії за допомогою періодичної системи
          хімічних елементів.
        </p>
        <Button label="До періодичної системи" @click="toTable()" />
      </div>
      <img
        src="@/assets/periodic.png"
        class="h-full w-1/2 m-3 my-36 rounded-3xl border-csblue border-2 transform duration-300 ease-in-out hover:scale-105"
      />
    </div>
  </div>
  <svg
    version="1.1"
    id="Слой_1"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    x="0px"
    y="0px"
    viewBox="0 0 1440 180"
    style="enable-background: new 0 0 1440 180"
    xml:space="preserve"
    class="bg-csblack"
  >
    <path
      class="st0"
      d="M0,0l60,15c60,14.8,180,45.2,300,57s240,6.2,360,15c120,9.2,240,32.8,360,33c120-0.2,240-23.8,300-36l60-12v108
	h-60c-60,0-180,0-300,0s-240,0-360,0s-240,0-360,0s-240,0-300,0H0V0z"
    />
  </svg>

  <div
    id="block4"
    class="bg-csbluewhite h-5/6 px-40 py-5 text-csblack justify-items-start text-left"
  >
    <div class="flex flex-row w-full">
      <img
        src="@/assets/userpage.png"
        class="h-full w-1/2 my-36 m-3 rounded-3xl border-csblue border-2 transform duration-300 ease-in-out hover:scale-105"
      />
      <div class="text-center items-center py-36">
        <h1 class="text-5xl z-0 m-3 px-10">ChemSolution</h1>
        <p class="text-4xl m-3 px-10">
          Зареєструйтеся для використання усіх можливостей ChemSolution.
        </p>
        <div class="flex my-10">
          <Button
            :white="true"
            label="Авторизуватися"
            @click="openForm('login')"
          />
          <Button label="Зареєструватися" @click="openForm('register')" />
        </div>
      </div>
    </div>
  </div>

  <svg
    version="1.1"
    id="Слой_1"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    x="0px"
    y="0px"
    viewBox="0 0 1440 106"
    style="enable-background: new 0 0 1440 106"
    xml:space="preserve"
    class="bg-csbluewhite"
  >
    <path
      fill="#1dcdfe"
      d="M0,0h48c48,0,144,0,240,14.1c96,14.4,192,42.2,288,46c96,3.5,192-17.7,288-31.8c96-14.4,192-21,288-7.1
	s192,49.7,240,67.1l48,17.7l0,0h-48c-48,0-144,0-240,0s-192,0-288,0s-192,0-288,0s-192,0-288,0s-192,0-240,0H0V0z"
    />
  </svg>

  <div id="block5" class="bg-csblue h-5/6 px-40 py-5 text-csblack text-left">
    <div class="w-full">
      <div class="text-center py-36 pt-1">
        <h1 class="text-4xl m-3 px-10">Ми у мобільному додатку!</h1>
        <p class="text-2xl m-3 px-10">
          Переглядай інформацію про елементи, читай новини та цікаві факти зі
          світу хімії користуйся "шпаргалками", які допоможуть тобі краще
          зрозуміти складний матеріал, а також лайкай цей матеріал і зберігай
          його на своєму смартфоні!
        </p>

        <!-- Slideshow -->
        <div class="flex flex-row items-center">
          <div
            class="bg-white flex w-2/4 self-center mx-auto border-2 border-csblack rounded-3xl"
          >
            <img
              src="@/assets/mobile.png"
              class="self-center w-full rounded-3xl"
            />
          </div>
        </div>
        <div class="w-auto flex my-3">
          <div
            @click="downloadAndroid()"
            class="shadow-2xl flex border mx-auto border-csblack bg-csblack text-white rounded-xl p-1 cursor-pointer hover:scale-125 transform duration-200 ease-in-out"
          >
            <i class="fab fa-android text-6xl text-csgreen"></i>
            <h1 class="self-center text-2xl m-1">Скачати для Android™</h1>
          </div>
        </div>
      </div>
    </div>
  </div>

  <svg
    version="1.1"
    id="Слой_1"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    x="0px"
    y="0px"
    viewBox="0 0 1440 106"
    style="enable-background: new 0 0 1440 106"
    xml:space="preserve"
    class="bg-csblue"
  >
    <path
      fill="#EAF9FE"
      d="M0,0h48c48,0,144,0,240,14.1c96,14.4,192,42.2,288,46c96,3.5,192-17.7,288-31.8c96-14.4,192-21,288-7.1
	s192,49.7,240,67.1l48,17.7l0,0h-48c-48,0-144,0-240,0s-192,0-288,0s-192,0-288,0s-192,0-288,0s-192,0-240,0H0V0z"
    />
  </svg>

  <div
    id="block6"
    class="bg-csbluewhite h-5/6 px-40 py-5 text-csblack text-left"
  >
    <div class="w-full">
      <div class="text-center py-36 pt-1">
        <h1 class="text-5xl m-3 px-10">Ключові функції</h1>
        <div class="grid grid-cols-2">
          <KeyFeature
            header="Відсутність аналогів"
            description="Сьогодні на ринку не існує сервісу, який має усі функції реалізовані у ChemSolution."
            icon="fa-heart hover:animate-ping"
          />
          <KeyFeature
            header="Кросплатформеність"
            description="Доступ до сервісу можна отримати з будь-якого пистрою, як із телефону, так і з компьютера."
            icon="fa-mobile hover:animate-wiggle-fast"
          />
          <KeyFeature
            header="Інтеграція із соц. мережами"
            description="Ви можете ділитися своїми досягненнями у соціальних мережах, таких, як Facebook."
            icon="fa-users hover:animate-bounce"
          />
          <KeyFeature
            header="Досягенення"
            description="Користувач отримує досягнення за покупку або відкриття речовини (або сукупностей речовин), ці досягнення можна переглянути у своєму профілі, а також отримати за них винагороду в якості ігрової валюти."
            icon="fa-trophy hover:animate-wiggle"
          />
          <KeyFeature
            header="Оффлайн доступ"
            description="При відсутності підключення до Інтернет додаток відображає дані, отримані під час останнього сеансу."
            icon="fa-cloud hover:animate-bounce"
          />
          <KeyFeature
            header="Оновленість"
            description="Якщо ористувач помітив, що існує певна речовина, однак її немає в базі даних веб-додатку, він може подати запит про її відсутність, а розробники додають речовину."
            icon="fa-database hover:animate-bonk"
          />
        </div>
      </div>
    </div>
  </div>

  <Footer />
</template>
<script>
import Logo from '../components/Logo'
import Button from '../components/HomePageButtons'
import Footer from '../components/Footer'
import KeyFeature from '../components/KeyFeature'
import router from '@/router/index'
export default {
  name: 'Home',
  components: {
    Logo,
    Button,
    Footer,
    KeyFeature,
  },
  emits: ['showForm'],
  data() {
    return {}
  },
  computed: {},
  methods: {
    downloadAndroid() {
      window.location = '../assets/ChemSolution.apk'
    },
    openForm(args) {
      this.$emit('showForm', args)
    },
    toLab() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth',
      })
      setTimeout(() => {
        router.push('/Workspace')
      }, 500)
    },
    toTable() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth',
      })
      setTimeout(() => {
        router.push('/PeriodicTable')
      }, 500)
    },
    learnMore() {
      window.location =
        'https://www.canva.com/design/DAEfwWSbAYU/g0dWRDjlVaAwJMkLdNny1w/view?utm_content=DAEfwWSbAYU&utm_campaign=designshare&utm_medium=link&utm_source=publishpresent#1'
    },
  },
}
</script>
<style>
div {
  font-family: 'Century Gothic';
}
.st0 {
  fill: #ebfaff;
  fill-opacity: 0.9961;
}
</style>
