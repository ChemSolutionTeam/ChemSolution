<template>
  <div
    @click="redirect()"
    class="
      shadow-xl
      self-center
      hover:border-csgreen
      border-4 border-opacity-25 border-csblack
      m-5
      rounded-xl
      cursor-pointer
    "
  >
    <div class="relative">
      <img :src="image" class="rounded-2xl p-3 pb-0 rounded-b-none" />
    </div>
    <div
      class="
        bg-gradient-to-tr
        text-2xl
        p-3
        from-csgreen
        to-cslightgreen
        rounded-b-lg
      "
    >
      <h1>{{ label }}</h1>
    </div>
  </div>
</template>

<script>
import router from '@/router/index'

export default {
  props: {
    path: {
      type: String,
      default: '404',
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
    redirect() {
      router.push(this.path)
    },
  },
}
</script>

<style></style>
