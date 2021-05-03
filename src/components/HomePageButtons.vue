<template>
  <button
    class="hover:border-csgreen border-csblack hover:text-white hover:animate-pulse text-csblack shadow-lg p-3 border-2 bg-gradient-to-tr from-cslightgreen via-csgreen to-csblue button-enter w-1/2 ml-3 m-5 focus:outline-none transform duration-500 ease-in-out hover:scale-125"
  >
    {{ label }}
  </button>
</template>

<script>
export default {
  props: {
    label: {
      type: [String, Number],
      default: 'Дізнатися більше',
    },
  },
}
</script>

<style></style>
