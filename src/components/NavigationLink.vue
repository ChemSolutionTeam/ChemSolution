<template>
  <a
    :href="href"
    class="block mt-4 lg:inline-block lg:mt-0 hover:text-cslightgreen mr-8"
    :class="[{ 'text-csgreen': isCurrent }, { 'text-white': !isCurrent }]"
  >
    {{ label }}
  </a>
</template>

<script>
export default {
  props: {
    label: {
      type: [String, Number],
      default: 'Link',
    },
    href: {
      type: String,
      default: 'default',
    },
    isCurrent: {
      type: Boolean,
      default: false,
    },
  },
}
</script>

<style></style>
