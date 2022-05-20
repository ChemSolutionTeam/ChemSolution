<template>
  <div class="column w-3/4 h-11/12 p-4 mt-20" style="position: relative">
    <div v-for="molecule in materials" :key="molecule.idCounter">
      <Molecule
        :id-counter="molecule.idCounter"
        :materialId="molecule.materialId"
        :formula="molecule.formula"
        :info="molecule.info"
        v-on:click.ctrl="this.$emit('removeMolecule', molecule)"
      />
    </div>

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
import Atom from '@/components/Atom'
import Molecule from '@/components/Molecule'
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
    materials: { type: Array },
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
    Molecule,
  },
  methods: {
    incCounter(value) {
      this.elementCounter += value
    },
  },
  computed() {},
  mounted() {
    setTimeout(function () {}, 3000)
    document.getElementById('moleculeInfoText').innerText =
      'Спробуйте зібрати молекулу!'
    document.getElementById('moleculeInfo').style.right = '3vw'
    setTimeout(closeHint, 3000)
    function closeHint() {
      if (
        document.getElementById('moleculeInfoText').innerText ===
        'Спробуйте зібрати молекулу!'
      )
        document.getElementById('moleculeInfo').style.right = '-61vw'
    }
  },
}
</script>
