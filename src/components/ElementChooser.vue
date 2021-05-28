<template>
  <div
    class="flex flex-wrap border p-3 w-11/12 my-1 rounded-full border-csblack"
  >
    <Atom :symbol="symbol" :category="category" />
    <p class="self-center overflow-y-auto text-2xl w-3/4">{{ name }}</p>
  </div>
</template>

<script>
import Atom from '@/components/Atom'
export default {
  name: 'ElementChooser',
  components: {
    Atom,
  },
  props: {
    symbol: {
      type: String,
      default: 'H',
    },
    name: {
      type: String,
      default: 'Hydrogen',
    },
    category: {
      type: String,
      default: 'csgreen',
    },
  },
}
</script>
