<template>
  <transition name="bounce">
    <button
      @click="toTop()"
      v-show="isShown"
      :class="[clicked ? 'bg-csgreen' : 'bg-csblue']"
      class="focus:outline-none hover:scale-150 duration-150 ease-in-out transform rounded-full w-16 h-16 fixed bottom-5 right-5 z-50 border-none p-auto cursor-pointer outline-none"
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
