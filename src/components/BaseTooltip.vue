<template>
  <div
    class="relative"
    style="
      -webkit-touch-callout: none;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    "
  >
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
    size: {
      type: String,
      default: 'default',
    },
  },
  computed: {
    tooltip() {
      if (this.size === 'larger') {
        return [
          'bg-csgreen',
          'rounded-sm',
          'text-white',
          'text-s',
          'bg-opacity-90',
          'whitespace-nowrap',
          'p-2',
          'absolute',
          'bottom-30',
        ]
      }
      return [
        'bg-csgreen',
        'rounded-sm',
        'text-white',
        'text-xs',
        'bg-opacity-80',
        'whitespace-nowrap',
        'p-2',
        'absolute',
        'bottom-6',
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
