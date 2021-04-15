<template>
  <div v-show="!isMultiline">
    <div class="m-3 mt-1 mb-1 flex flex-row justify-between">
      <label class="mt-1 text-2xl">{{ label }}</label>
      <input
        v-bind="$attrs"
        :placeholder="placeholder"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        class="focus:ring-cslightgreen focus:border-csgreen focus:outline-none focus:ring-4 focus:ring-opacity-20 text-lg w-3/5 border-2 border-csblack rounded-2xl mr-5 pr-0 px-3 py-1 text-center"
      />
    </div>
  </div>

  <div v-show="isMultiline">
    <label class="text-2xl m-3">{{ label }}</label>
    <div
      class="m-3 w-6/12 mb-1 flex flex-row justify-between"
      v-show="isHalfSize"
    >
      <input
        v-bind="$attrs"
        :placeholder="placeholder"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        class="focus:ring-cslightgreen focus:border-csgreen focus:outline-none focus:ring-4 focus:ring-opacity-20 text-lg w-full border-2 border-csblack rounded-2xl mr-0 pr-0 px-3 py-1 text-center"
      />
    </div>
    <div
      class="m-3 w-11/12 mb-1 flex flex-row justify-between"
      v-show="!isHalfSize"
    >
      <input
        v-bind="$attrs"
        :placeholder="placeholder"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        class="focus:ring-cslightgreen focus:border-csgreen focus:outline-none focus:ring-4 focus:ring-opacity-20 text-lg w-full border-2 border-csblack rounded-2xl mr-0 pr-0 px-3 py-1 text-center"
      />
    </div>
  </div>
  <div class="m-2 flex flex-row justify-end" v-show="!isCorrect()">
    <div class="w-11/12 mr-5">
      <p class="text-center text-red-600">{{ label }} неправильний</p>
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
    isMultiline: {
      type: Boolean,
      default: false,
    },
    isHalfSize: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    isCorrect() {
      return false
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
