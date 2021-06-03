<template>
  <div :id="idCounter" @click="displayDebug">
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

    // начальное положение
    translate(molecule, moleculePosition.x, moleculePosition.y)
    /*------------------------------------*/
    molecule.addEventListener('mousedown', onMouseDown)
    molecule.addEventListener('mousedown', onMouseDown)

    function onMouseDown(e) {
      e.preventDefault()
      console.log(e.target.id)
      // координаты нажатия мыши внутри молекулы
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
    /*------------------------------------*/
    function translate(el, x, y) {
      el.style.transform = `translate(${x}px, ${y}px)`
    }
  },
  methods: {
    displayDegbug() {
      console.log(this.formula)
      console.log(this.idCounter)
      console.log(this.materialId)
      console.log(this.info)
    }
  }
}
</script>
<style></style>