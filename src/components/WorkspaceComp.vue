<template>
  <div
    class="column w-3/4 h-11/12 p-4 shadow-xl mt-20"
    style="position: relative"
  >
    <H2 @added="incCounter" v-once init-number="0" />
    <H2 @added="incCounter" init-number="2" />
    <canvas id="canvas" class="block"></canvas>
    <div v-for="atom in atoms" :key="atom.id">
      <div
        draggable="true"
        v-on:click.ctrl="this.$emit('remove', atom)"
        v-on:dragstart="
          this.$emit('dragAndDrop', { atom: atom, event: $event })
        "
        v-bind:style="{
          position: 'absolute',
          top: atom.clientY + 'px',
          left: atom.clientX + 'px',
          width: '70px',
          height: '70px',
        }"
      >
        <Atom
          v-bind:id="atom.id"
          v-bind:symbol="atom.symbol"
          v-bind:category="atom.category"
          class="w-full"
        />
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable vue/no-unused-components */
import Atom from '@/components/Atom'
import H2 from '@/components/materials/H2'
import O2 from '@/components/materials/O2'
export default {
  data() {
    return {
      dragAtom: null,
      isShown: true,
      elementCounter: this.counter,
    }
  },
  props: {
    atoms: { type: Array },
    value: { type: Array },
    counter: {
      type: Number,
    },
  },
  model: {
    prop: 'atoms',
    event: 'atomschange',
  },
  name: 'WorkspaceComp',
  components: {
    Atom,
    H2,
    O2,
  },
  methods: {
    incCounter(value) {
      this.elementCounter += value
    },
  },
  computed() {},
}
</script>
