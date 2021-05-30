<template>
  <div
    id="el1"
    v-bind:style="{
      position: 'absolute',
      width: '75px',
      height: '75px',
    }"
  >
    <Atom v-bind:id="1" v-bind:symbol="H" v-bind:category="1" class="w-full" />
  </div>

  <div
    id="el2"
    v-bind:style="{
      position: 'absolute',
      width: '75px',
      height: '75px',
      left: '100px',
    }"
  >
    <Atom v-bind:id="1" v-bind:symbol="H" v-bind:category="1" class="w-full" />
  </div>

  <canvas id="canvas"></canvas>
</template>

<script>
import Atom from '@/components/Atom'
export default {
  name: 'H2',
  components: {
    Atom,
  },
  methods: {},
}
</script>
