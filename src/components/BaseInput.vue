<template>
  <label class="mt-1 text-2xl m-3">{{ label }}</label>
  <div class="m-3 mt-1 mb-1 flex flex-row justify-between">
    <input
      v-bind="$attrs"
      :placeholder="placeholder"
      :value="modelValue"
      @input="$emit('update:modelValue', $event.target.value)"
      class="focus:ring-cslightgreen focus:border-csgreen focus:outline-none focus:ring-4 focus:ring-opacity-20 text-lg w-11/12 border-2 border-csblack rounded-2xl mr-5 pr-0 px-3 py-1 text-center"
    />
  </div>
  <div class="m-2 flex flex-row justify-end">
    <div class="w-11/12 mr-5">
      <p class="text-center text-red-600">Пароль невірний</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    placeholder: {
      type: String,
      default: 'default',
    },
    label: {
      type: String,
      default: 'default',
    },
    modelValue: {
      type: [String, Number],
      default: '',
    },
  },
}
</script>

<style>
@font-face {
  font-family: 'Century Gothic';
  src: url('/public/CenturyGothic.ttf');
}
form {
  font-family: 'Century Gothic', serif;
}
</style>
