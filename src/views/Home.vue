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
        <Button />
      </div>
      <Logo class="w-4/5" static="true" />
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
        src="https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg"
        class="h-full my-36 m-3 rounded-3xl border-csblue border-2 transform duration-300 ease-in-out hover:scale-105"
      />
      <div class="text-center items-center py-36">
        <h1 class="text-5xl z-0 m-3 px-10">ChemSolution</h1>
        <p class="text-4xl m-3 px-10">
          Інтерактивна хімічна лабораторія дозволяє користувачу вивчати хімічні
          сполуки, шляхом комбінування відповідних атомів між собою.
        </p>
        <Button label="До хімічної лабораторії" />
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
        <Button label="До періодичної системи" />
      </div>
      <img
        src="https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg"
        class="h-full m-3 my-36 rounded-3xl border-csblue border-2 transform duration-300 ease-in-out hover:scale-105"
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
        src="https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg"
        class="h-full my-36 m-3 rounded-3xl border-csblue border-2 transform duration-300 ease-in-out hover:scale-105"
      />
      <div class="text-center items-center py-36">
        <h1 class="text-5xl z-0 m-3 px-10">ChemSolution</h1>
        <p class="text-4xl m-3 px-10">
          Зареєструйтеся для використання усіх можливостей ChemSolution.
        </p>
        <div class="flex my-10">
          <Button label="Авторизуватися" white="true" @click="auth()" />
          <Button label="Зареєструватися" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Logo from '../components/Logo'
import Button from '../components/HomePageButtons'

export default {
  name: 'Home',
  components: { Logo, Button },

  data() {
    return {}
  },
  computed: {},
  methods: {
    auth() {},
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
