<template>
  <div
    class="column w-3/4 h-11/12 p-4 shadow-xl mt-20"
    style="position: relative"
  >
    <div v-for="atom in atoms" :key="atom.id">
      <PositionAtom
        v-bind:id="atom.id"
        v-bind:symbol="atom.symbol"
        v-bind:category="atom.category"
        v-bind:positionX="atom.positionX"
        v-bind:positionY="atom.positionY"
      />
    </div>
  </div>
</template>

<script>
import Atom from '@/components/Atom'
export default {
  data() {
    return {
      atoms: [
        {
          id: 1,
          symbol: 'H',
          category: 1,
          positionX: 20,
          positionY: 20,
        },
        {
          id: 2,
          symbol: 'О',
          category: 2,
          positionX: 40,
          positionY: 40,
        },
      ],
    }
  },
  name: 'WorkspaceComp',
  components: {
    Atom,
  },
}
</script>
