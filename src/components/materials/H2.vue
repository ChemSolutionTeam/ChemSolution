<template>
  <div
    style="position: absolute; width: 70px; height: 70px"
    v-for="atom in atoms"
    :key="atom.id"
  >
    <Atom :div-id="atom.id" id="1" symbol="H" category="1" class="w-full" />
  </div>
  <canvas id="canvas" class="block"></canvas>
</template>

<script>
import Atom from '@/components/Atom'
export default {
  name: 'H2',
  data() {
    return {
      atoms: [],
    }
  },
  components: {
    Atom,
  },
  props: {
    elementsNumber: {
      type: Number,
      default: 2,
    },
    workspaceAtoms: {
      type: Number,
      default: 0,
    },
  },
  created() {
    for (let i = 0; i < this.elementsNumber; ++i) {
      this.atoms.push({ id: 'el' + (i + this.workspaceAtoms) })
    }
  },
  mounted() {
    const canvas = document.getElementById('canvas')
    const context = canvas.getContext('2d')
    let width = (canvas.width = innerWidth / 1.4)
    let height = (canvas.height = innerHeight / 1.3)

    const elements = {}
    const num = this.elementsNumber
    const fromNum = this.workspaceAtoms
    const size = 70
    let current = null

    for (let i = 0; i < num; ++i) {
      let id = i + fromNum
      const element = document.getElementById('el' + id)
      element.addEventListener('mousedown', onMouseDown)

      // тут будут храниться и изменяться все его координаты
      elements['el' + id] = {
        x: Math.random() * (width - size) / 3,
        y: Math.random() * (height - size) / 3,
        startX: 0,
        startY: 0,
      }
      // начальное положение
      translate(element, elements['el' + id].x, elements['el' + id].y)
    }
    connect(elements)

    function onMouseDown(e) {
      e.preventDefault()
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
      connect(elements)
    }

    function onMouseUp() {
      document.body.removeEventListener('mousemove', onMouseMove)
      document.body.removeEventListener('mouseup', onMouseUp)
    }

    /*------------------------------------*/

    function translate(el, x, y) {
      el.style.transform = `translate(${x}px, ${y}px)`
    }

    function connect(elements) {
      context.clearRect(0, 0, width, height)

      for (let i = 0; i < num - 1; ++i) {
        drawLine(
          elements['el' + (i + fromNum)].x,
          elements['el' + (i + 1 + fromNum)].x,
          elements['el' + (i + fromNum)].y,
          elements['el' + (i + 1 + fromNum)].y
        )
      }
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
