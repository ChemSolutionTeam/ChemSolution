<template>
  <div
    class="column w-3/4 h-11/12 p-4 shadow-xl mt-20"
    style="position: relative"
  >
    <div v-for="atom in atoms" :key="atom.id">
      <div
        draggable="true"
        v-on:click.ctrl="this.$emit('remove', atom)"
        v-bind:style="{
          position: 'absolute',
          top: atom.clientY + 'px',
          left: atom.clientX + 'px',
        }"
      >
        <Atom
          v-bind:id="atom.id"
          v-bind:symbol="atom.symbol"
          v-bind:category="atom.category"
        />
      </div>
    </div>
  </div>
</template>

<script>
import Atom from '@/components/Atom'
export default {
  data() {
    return {
      dragAtom: null,
    }
  },
  props: {
    atoms: { type: Array },
  },
  model: {
    prop: 'atoms',
    event: 'atomschange',
  },
  name: 'WorkspaceComp',
  components: {
    Atom,
  },
  methods: {},
  computed() {},
}
</script>
