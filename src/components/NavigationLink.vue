<template>
  <button
    class="focus:outline-none block mt-4 lg:inline-block lg:mt-0 hover:text-cslightgreen mr-8 cursor-pointer transform duration-300 ease-in-out hover:scale-125 hover:animate-pulse"
    :class="[isCurrent ? 'text-csgreen animate-pulse' : 'text-white']"
    @click="redirect()"
  >
    {{ label }}
  </button>
</template>

<script>
import store from '../store/index'
import router from '../router/index'
export default {
  props: {
    label: {
      type: [String, Number],
      default: 'Link',
    },
    href: {
      type: String,
      default: '',
    },
  },
  computed: {
    isCurrent() {
      return this.label == store.state.currentPage
    },
  },
  methods: {
    redirect() {
      store.commit('setCurrentPage', this.label)
      router.push(this.href)
    },
  },
}
</script>

<style></style>
