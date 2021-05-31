<template>
  <div style="position: absolute; width: 70px; height: 70px; z-index: 50">
    <Atom
      div-id="el1"
      v-bind:id="1"
      v-bind:symbol="H"
      v-bind:category="1"
      class="w-full z-10"
    />
  </div>

  <div style="position: absolute; width: 70px; height: 70px; z-index: 50">
    <Atom
      div-id="el2"
      v-bind:id="1"
      v-bind:symbol="H"
      v-bind:category="1"
      class="w-full z-10"
    />
  </div>
  <canvas id="canvas" class="block"> </canvas>
</template>

<script>
import Atom from '@/components/Atom'
export default {
  name: 'H2',
  components: {
    Atom,
  },
  mounted() {
    const el1 = document.getElementById('el1')
    const el2 = document.getElementById('el2')
    const size = 70

    const canvas = document.getElementById('canvas')
    const context = canvas.getContext('2d')
    let width = (canvas.width = innerWidth / 1.4)
    let height = (canvas.height = innerHeight / 2)

    /*------------------------------------*/

    let current = null
    const elements = {
      el1: {
        x: Math.random() * (width - size),
        y: Math.random() * (height - size),
        startX: 0,
        startY: 0,
      },

      el2: {
        x: Math.random() * (width - size),
        y: Math.random() * (height - size),
        startX: 0,
        startY: 0,
      },
    }

    // начальное положение
    translate(el1, elements.el1.x, elements.el1.y)
    translate(el2, elements.el2.x, elements.el2.y)
    drawLine(elements.el1.x, elements.el2.x, elements.el1.y, elements.el2.y)

    /*------------------------------------*/

    el1.addEventListener('mousedown', onMouseDown)
    el2.addEventListener('mousedown', onMouseDown)

    function onMouseDown(e) {
      e.preventDefault()
      console.log(e.target.id)
      // координаты нажатия мыши внутри элемента
      elements[e.target.id].startX = e.x - elements[e.target.id].x
      elements[e.target.id].startY = e.y - elements[e.target.id].y

      current = e.target

      document.body.addEventListener('mousemove', onMouseMove)
      document.body.addEventListener('mouseup', onMouseUp)
    }

    function onMouseMove(e) {
      const x = (elements[current.id].x = e.x - elements[current.id].startX)
      const y = (elements[current.id].y = e.y - elements[current.id].startY)

      translate(current, x, y)
      drawLine(elements.el1.x, elements.el2.x, elements.el1.y, elements.el2.y)
    }

    function onMouseUp() {
      document.body.removeEventListener('mousemove', onMouseMove)
      document.body.removeEventListener('mouseup', onMouseUp)
    }

    /*------------------------------------*/

    function translate(el, x, y) {
      el.style.transform = `translate(${x}px, ${y}px)`
    }

    function drawLine(x1, x2, y1, y2) {
      context.clearRect(0, 0, width, height)
      context.beginPath()

      context.moveTo(x1 + size / 2, y1 + size / 2)
      context.lineTo(x2 + size / 2, y2 + size / 2)
      context.stroke()
    }
  },
  methods: {
    translate(el, x, y) {
      el.style.transform = `translate(${x}px, ${y}px)`
    },
    drawLine(x1, x2, y1, y2) {
      this.context.clearRect(0, 0, this.width, this.height)
      this.context.beginPath()
      this.context.moveTo(x1 + this.size / 2, y1 + this.size / 2)
      this.context.lineTo(x2 + this.size / 2, y2 + this.size / 2)
      this.context.stroke()
    },
  },
  onMouseDown(e) {
    console.log('MOUSE DOWN')
    e.preventDefault()
    // координаты нажатия мыши внутри элемента
    this.atoms[e.target.id].startX = e.x - this.atoms[e.target.id].x
    this.atoms[e.target.id].startY = e.y - this.atoms[e.target.id].y

    this.currentAtom = e.target

    document.body.addEventListener('mousemove', this.onMouseMove)
    document.body.addEventListener('mouseup', this.onMouseUp)
  },
  onMouseMove(e) {
    const x = (this.atoms[this.currentAtom.id].x =
      e.x - this.atoms[this.currentAtom.id].startX)
    const y = (this.atoms[this.currentAtom.id].y =
      e.y - this.atoms[this.currentAtom.id].startY)

    this.translate(this.currentAtom, x, y)
    this.drawLine(
      this.atoms.el1.x,
      this.atoms.el2.x,
      this.atoms.el1.y,
      this.atoms.el2.y
    )
  },
  onMouseUp() {
    document.body.removeEventListener('mousemove', this.onMouseMove)
    document.body.removeEventListener('mouseup', this.onMouseUp)
  },
}
</script>
