<template>
  <div
    class="column w-3/4 h-11/12 p-4 shadow-xl mt-20"
    style="position: relative"
  >
    <H2 el1="el0" el2="el1" />
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
          v-bind:name="atom.name"
          v-bind:categoryName="atom.categoryName"
          v-bind:atomicWeight="atom.atomicWeight"
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
    }
  },
  props: {
    atoms: { type: Array },
    value: { type: Array },
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
  methods: {},
  computed() {},
}
</script>
