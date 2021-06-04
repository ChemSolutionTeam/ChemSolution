<template>
  <div :id="idCounter" @mouseenter="changeItem"
    @mouseleave="rechangeItem">
    <img :src="imageSrc"/>
  </div>
</template>

<script>
export default {
  name: 'Molecule',
  data() {
    return { }
  },
  props: {
    idCounter: {
      type: Number,
      default: 12093,
    },
    materialId: {
      type: Number,
      default: 1,
    },
    formula: {
      type: String,
      default: 'H2'
    },
    info: {
      type: String,
      default: 'Information'
    },
  },
  computed: {
    imageSrc () {
      return (
        require(
        '../assets/materials/' + this.formula + '.png')
      )
    },
  },
  mounted() {
    
    const molecule = document.getElementById(this.idCounter)
    const moleculePosition = {
      x: 20,
      y: 20,
      startX: 0,
      startY: 0, 
    }

    translate(molecule, moleculePosition.x, moleculePosition.y)
    molecule.addEventListener('mousedown', onMouseDown)
    molecule.addEventListener('mousedown', onMouseDown)

    function onMouseDown(e) {
      e.preventDefault()
      console.log(e.target.id)
      moleculePosition.startX = e.x - moleculePosition.x
      moleculePosition.startY = e.y - moleculePosition.y
      document.body.addEventListener('mousemove', onMouseMove)
      document.body.addEventListener('mouseup', onMouseUp)
    }

    function onMouseMove(e) {
      const x = (moleculePosition.x = e.x - moleculePosition.startX)
      const y = (moleculePosition.y = e.y - moleculePosition.startY)
      translate(molecule, x, y)
    }
    function onMouseUp() {
      document.body.removeEventListener('mousemove', onMouseMove)
      document.body.removeEventListener('mouseup', onMouseUp)
    }
    function translate(el, x, y) {
      el.style.transform = `translate(${x}px, ${y}px)`
    }
    
  },
  methods: {
    changeItem() {
      document.getElementById('moleculeInfoText').innerText = this.info.toString()
      document.getElementById('moleculeInfo').style.right = '3vw'
    },
    rechangeItem() {
      document.getElementById('moleculeInfo').style.right = '-61vw'
    },
  }
}
</script>
<style></style>