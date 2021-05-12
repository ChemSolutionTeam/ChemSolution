<template>
  <button
    :class="[
      isDanger
        ? 'bg-gradient-to-tr from-purple-400 to-red-500 text-white hover:border-csblack'
        : white
        ? 'bg-white hover:text-csgreen hover:border-csgreen'
        : isYellow
        ? ' bg-gradient-to-tr text-white  hover:border-pink-300 from-yellow-300 to-pink-600'
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
    isYellow: {
      type: Boolean,
      default: false,
    },
  },
}
</script>

<style></style>
