<template>
  <div class="flex flex-row p-3">
    <i class="fas self-center w-1/12 text-csgreen text-5xl" :class="icon"></i>
    <div class="text-left m-3 p-1 w-10/12 self-center">
      <h1 class="text-2xl font-bold">{{ header }}</h1>
      <p class="text-xl">{{ description }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'KeyFeature',
  props: {
    header: {
      type: String,
      default: 'Кросплатформеність',
    },
    description: {
      type: String,
      default:
        'Доступ до сервісу можна отримати з будь-якого пистрою, як із телефону, так і з компьютера.',
    },
    icon: {
      type: String,
      default: 'fa-book',
    },
  },
}
</script>

<style></style>
