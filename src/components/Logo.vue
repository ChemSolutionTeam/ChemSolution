<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    viewBox="0 0 512 512"
    class="cursor-pointer"
    :class="[{ 'hover:animate-spin-fast': !this.static }]"
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
            d="M256,19a237.07,237.07,0,0,1,92.25,455.38A237.07,237.07,0,0,1,163.75,37.62,235.64,235.64,0,0,1,256,19m0-4C122.9,15,15,122.9,15,256S122.9,497,256,497,497,389.1,497,256,389.1,15,256,15Z"
          />
        </g>
        <text class="cls-5" transform="translate(58.79 351.96)">Cs</text>
      </g>
    </g>
  </svg>
</template>

<script>
export default {
  props: {
    static: {
      type: Boolean,
      default: false,
    },
  },
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
