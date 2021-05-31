<template>
  <div
      id="el1"
      v-bind:style="{
      position: 'absolute',
      width: '70px',
      height: '70px',
    }"
  >
    <Atom v-bind:id="1" v-bind:symbol="H" v-bind:category="1" class="w-full"/>
  </div>

  <div
      id="el2"
      v-bind:style="{
      position: 'absolute',
      width: '70px',
      height: '70px',
    }"
  >
    <Atom v-bind:id="1" v-bind:symbol="H" v-bind:category="1" class="w-full"/>
  </div>
  <canvas id="canvas">

  </canvas>
</template>

<script>
import Atom from '@/components/Atom'
export default {
  name: 'H2',
  components: {
    Atom,
  },
  data() {
    return {
      el1: undefined,
      el2: undefined,
      size: 70,
      canvas: undefined,
      context: undefined,
      width: undefined,
      height: undefined,
      current: null,
      atoms: undefined,

    }
  },
  mounted() {
    this.el1 = document.getElementById('el1')
    this.el2 = document.getElementById('el2')
    this.canvas = document.getElementById('canvas')
    this.context = this.canvas.getContext('2d')
    this.width = this.canvas.width = innerWidth / 4
    this.height = this.canvas.height = innerHeight / 4
    this.atoms = {
      el1: {
        x: Math.random() * (this.width - this.size),
        y: Math.random() * (this.height - this.size),
        startX: 0,
        startY: 0
      },
      el2: {
        x: Math.random() * (this.width - this.size),
        y: Math.random() * (this.height - this.size),
        startX: 0,
        startY: 0
      }
    }
    this.translate(this.el1, this.atoms.el1.x, this.atoms.el1.y)
    this.translate(this.el2, this.atoms.el2.x, this.atoms.el2.y)
    this.drawLine(
        this.atoms.el1.x,
        this.atoms.el2.x,
        this.atoms.el1.y,
        this.atoms.el2.y
    )

    this.el1.addEventListener('mousedown', this.onMouseDown)
    this.el2.addEventListener('mousedown', this.onMouseDown)

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
    }
  },
  onMouseDown(e) {
    e.preventDefault()
    // координаты нажатия мыши внутри элемента
    this.atoms[e.target.id].startX = e.x - this.atoms[e.target.id].x
    this.atoms[e.target.id].startY = e.y - this.atoms[e.target.id].y

    this.current = e.target

    document.body.addEventListener('mousemove', this.onMouseMove)
    document.body.addEventListener('mouseup', this.onMouseUp)
  },
  onMouseMove(e) {
    const x = this.atoms[this.current.id].x = e.x - this.atoms[this.current.id].startX
    const y = this.atoms[this.current.id].y = e.y - this.atoms[this.current.id].startY

    this.translate(this.current, x, y)
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
