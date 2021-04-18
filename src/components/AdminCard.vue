<template>
  <div
    @click="redirect(this.path)"
    class="shadow-xl hover:border-csgreen border-4 border-opacity-25 border-csblack w-1/5 m-5 rounded-xl h-full cursor-pointer"
  >
    <img :src="image" class="rounded-2xl p-3 pb-0 rounded-b-none" />
    <div
      class="bg-gradient-to-tr text-2xl p-3 from-csgreen to-cslightgreen rounded-b-lg"
    >
      <h1>{{ label }}</h1>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    path: {
      type: String,
      default: 'error',
    },
    label: {
      type: String,
      default: 'default label',
    },
    image: {
      type: String,
      default:
        'https://blog.nscsports.org/wp-content/uploads/2014/10/default-img.gif',
    },
  },
  methods: {
    redirect(path) {
      alert(path)
    },
  },
}
</script>

<style></style>
