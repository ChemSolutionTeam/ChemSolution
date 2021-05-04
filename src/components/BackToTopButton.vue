<template>
  <transition name="bounce">
    <button
      @click="toTop()"
      v-show="isShown"
      :class="[clicked ? 'bg-csgreen' : 'bg-csblue']"
      class="border border-opacity-10 shadow-lg border-csblack focus:outline-none hover:scale-150 duration-150 ease-in-out transform rounded-full w-16 h-16 fixed bottom-5 right-5 z-50 p-auto cursor-pointer outline-none"
    >
      <i class="fas fa-arrow-up transform scale-150 text-white"></i>
    </button>
  </transition>
</template>

<script>
export default {
  name: 'BackToTopButton',
  props: {
    isShown: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      clicked: false,
    }
  },
  methods: {
    toTop() {
      this.clicked = true
      window.scrollTo({
        top: 0,
        behavior: 'smooth',
      })
      setTimeout(() => {
        this.clicked = false
      }, 500)
    },
  },
}
</script>

<style></style>
