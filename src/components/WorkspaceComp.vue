<template>
  <div
    class="column w-3/4 h-11/12 p-4 shadow-xl mt-20"
    style="position: relative"
  >
    <div
      v-for="atom in atoms"
      :key="atom.id"
      v-bind:style="{
        position: 'absolute',
        top: atom.positionY + 'px',
        left: atom.positionX + 'px',
      }"
    >
      <Atom
        v-bind:id="atom.id"
        v-bind:symbol="atom.symbol"
        v-bind:category="atom.category"
      />
    </div>
  </div>
</template>

<script>
import Atom from '@/components/Atom'
export default {
  props: {
    atoms: { type: Array },
  },
  name: 'WorkspaceComp',
  components: {
    Atom,
  },
  methods: {},
  computed() {},
}
</script>
