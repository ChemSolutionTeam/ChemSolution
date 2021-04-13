<template>
  <nav class="flex items-center justify-between flex-wrap bg-csblack p-2">
    <div class="flex items-center flex-shrink-0 text-white ml-3 mr-6">
      <svg
        width="75"
        hight="75"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        viewBox="0 0 512 512"
      >
        <defs>
          <radialGradient
            id="Безымянный_градиент_17"
            cx="256"
            cy="256"
            r="241"
            gradientUnits="userSpaceOnUse"
          >
            <stop offset="0.72" stop-color="#34f4c5" />
            <stop offset="1" stop-color="#18d0ea" />
          </radialGradient>
        </defs>
        <g class="cls-1">
          <g id="Слой_1" data-name="Слой 1">
            <circle class="cls-2" cx="256" cy="256" r="241" />
            <g class="cls-3">
              <path
                class="cls-4"
                d="M256,15.25a240.81,240.81,0,0,1,93.71,462.58A240.81,240.81,0,0,1,162.29,34.17,239.31,239.31,0,0,1,256,15.25m0-.25C122.9,15,15,122.9,15,256S122.9,497,256,497,497,389.1,497,256,389.1,15,256,15Z"
              />
            </g>
            <text class="cls-5" transform="translate(58.79 351.96)">Cs</text>
          </g>
        </g>
      </svg>
    </div>
    <div class="block lg:hidden">
      <button
        class="flex items-center px-3 py-2 border rounded text-teal-200 border-teal-400 hover:text-white hover:border-white"
      >
        <svg
          class="fill-current h-3 w-3"
          viewBox="0 0 20 20"
          xmlns="http://www.w3.org/2000/svg"
        >
          <title>Menu</title>
          <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
        </svg>
      </button>
    </div>
    <div class="w-full block flex-grow lg:flex lg:items-center lg:w-auto">
      <div class="text-lg lg:flex-grow flex justify-start">
        <a
          href="#responsive-header"
          class="block mt-4 lg:inline-block lg:mt-0 text-csgreen hover:text-cslightgreen mr-4"
        >
          Docs
        </a>
        <a
          href="#responsive-header"
          class="block mt-4 lg:inline-block lg:mt-0 text-white hover:text-cslightgreen mr-4"
        >
          Examples
        </a>
        <a
          href="#responsive-header"
          class="block mt-4 lg:inline-block lg:mt-0 text-white hover:text-cslightgreen"
        >
          Blog
        </a>
      </div>
      <div>
        <a
          href="#"
          class="inline-block text-sm px-4 py-2 leading-none border rounded text-white border-white hover:border-transparent hover:text-teal-500 hover:bg-white mt-4 lg:mt-0"
          >Download</a
        >
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'Navigation',
  components: {},
}
</script>

<style>
.cls-1 {
  isolation: isolate;
}
.cls-2 {
  fill: url(#Безымянный_градиент_17);
}
.cls-3 {
  mix-blend-mode: darken;
}
.cls-4 {
  fill: #2f455c;
}
.cls-5 {
  font-size: 407.58px;
  fill: #fff;
  stroke: #278585;
  stroke-miterlimit: 10;
  stroke-width: 5px;
  font-family: ColonnaMT, Colonna MT;
}
</style>
