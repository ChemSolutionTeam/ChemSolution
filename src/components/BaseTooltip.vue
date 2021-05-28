<template>
  <div class="relative">
    <div class="h-full" @mouseenter="toggle" @mouseleave="toggle">
      <slot />
    </div>
    <div v-show="isShown" :class="tooltip">{{ text }}</div>
  </div>
</template>

<script>
export default {
  name: 'BaseTooltip',
  data() {
    return {
      isShown: false,
    }
  },
  props: {
    text: {
      type: String,
      default: 'Авторизуйтесь',
    },
  },
  computed: {
    tooltip() {
      return [
        'bg-csgreen',
        'rounded-sm',
        'text-white',
        'text-xs',
        'bg-opacity-80',
        'whitespace-nowrap',
        'p-2',
        'absolute',
        'top-0',
      ]
    },
  },
  methods: {
    toggle() {
      this.isShown = !this.isShown
    },
  },
}
</script>

<style scoped></style>
