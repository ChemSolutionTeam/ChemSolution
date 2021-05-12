<template>
  <button
    :class="[
      isDanger
        ? 'bg-gradient-to-tr from-red-400 via-red-500 to-pink-600 text-white hover:border-csblack'
        : white
        ? 'bg-white hover:text-csgreen hover:border-csgreen'
        : 'bg-gradient-to-tr from-cslightgreen via-csgreen to-csblue hover:text-white hover:border-csgreen',
    ]"
    class="border-csblack hover:animate-pulse text-csblack shadow-lg p-3 border-2 button-enter w-1/2 ml-3 m-5 focus:outline-none transform duration-500 ease-in-out hover:scale-125"
  >
    {{ label }}
  </button>
</template>

<script>
export default {
  name: 'HomePageButton',
  props: {
    label: {
      type: [String, Number],
      default: 'Дізнатися більше',
    },
    white: {
      type: Boolean,
      default: false,
    },
    isDanger: {
      type: Boolean,
      default: false,
    },
  },
}
</script>

<style></style>
