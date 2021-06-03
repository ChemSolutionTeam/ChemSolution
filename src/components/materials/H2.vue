<template>
  <div style="position: absolute; width: 70px; height: 70px">
    <Atom
      :div-id="el1"
      id="1"
      symbol="H"
      category="1"
      class="w-full"
      name="Гідроген"
      category-name="неметали"
      atomic-weight="1.008"
      :valences="valences"
    />
  </div>

  <div style="position: absolute; width: 70px; height: 70px">
    <Atom
      :div-id="el2"
      id="1"
      symbol="H"
      category="1"
      class="w-full"
      name="Гідроген"
      category-name="неметали"
      atomic-weight="1.008"
      :valences="valences"
    />
  </div>
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
      valences: [1],
      el1: 'el' + this.initNumber,
      el2: 'el' + (parseInt(this.initNumber) + 1),
    }
  },
  emits: ['added'],
  created() {
    this.$emit('added', 2)
  },
  props: {
    initNumber: {
      type: Number,
      default: 0,
    },
    /*el1: {
      type: String
    },
    el2: {
      type: String
    }*/
  },
  mounted() {
    /*this.el1 += this.initNumber.toString()
    this.el2 += this.initNumber.toString() + 1*/
    //let componentId = this._uid
    const el1 = document.getElementById(this.el1)
    const el2 = document.getElementById(this.el2)
    const size = 70
    const canvas = document.getElementById('canvas')
    const context = canvas.getContext('2d')
    let width = (canvas.width = innerWidth / 1.4)
    let height = (canvas.height = innerHeight / 1.3)
    /*------------------------------------*/
    let current = null
    let elements = {}
    elements[this.el1] = {
      x: (Math.random() * (width - size)) / 3,
      y: (Math.random() * (height - size)) / 3,
      startX: 0,
      startY: 0,
    }
    elements[this.el2] = {
      x: (Math.random() * (width - size)) / 3,
      y: (Math.random() * (height - size)) / 3,
      startX: 0,
      startY: 0,
    }
    let elementIds = [this.el1, this.el2]
    // начальное положение
    translate(el1, elements[this.el1].x, elements[this.el1].y)
    translate(el2, elements[this.el2].x, elements[this.el2].y)
    drawLine(
      elements[this.el1].x,
      elements[this.el2].x,
      elements[this.el1].y,
      elements[this.el2].y
    )
    /*------------------------------------*/
    el1.addEventListener('mousedown', onMouseDown)
    el2.addEventListener('mousedown', onMouseDown)
    /*dragWrapper(el1, this.el1, this.el2)
    dragWrapper(el2, this.el1, this.el2)
    function dragWrapper(targetElement, el1, el2) {
      targetElement.addEventListener('mousedown', function onMouseDown(e) {
        e.preventDefault()
        console.log(e.target.id)
        // координаты нажатия мыши внутри элемента
        targetElement.startX = e.x - targetElement.x
        targetElement.startY = e.y - targetElement.y
        mouseMoveWrap(targetElement, el1, el2)
      })
    }*/
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
    /*function mouseMoveWrap(currentElement, el1, el2) {
      currentElement.addEventListener('mousemove', function onMouseMove(e) {
        const x = (elements[current.id].x = e.x - elements[current.id].startX)
        const y = (elements[current.id].y = e.y - elements[current.id].startY)
        translate(current, x, y)
        drawLine(elements[el1].x, elements[el2].x, elements[el1].y, elements[el2].y)
      })
      document.body.addEventListener('mouseup', onMouseUp)
    }
*/
    function onMouseMove(e) {
      const x = (elements[current.id].x = e.x - elements[current.id].startX)
      const y = (elements[current.id].y = e.y - elements[current.id].startY)
      translate(current, x, y)
      drawLine(
        elements[elementIds[0]].x,
        elements[elementIds[1]].x,
        elements[elementIds[0]].y,
        elements[elementIds[1]].y
      )
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
  methods: {},
}
</script>
