<template>
  <div :class="tooltip">Авторизуйтесь</div>
</template>

<script>
export default {
  name: "BaseTooltip",
  data() {
    return {
      isShown: false
    }
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
      ]
    },
  },
  methods: {
    toggle() {
      this.isShown = !this.isShown
    }
  }


}
</script>

<style scoped>

</style>