<template>
  <div class="m-3 flex flex-row justify-between">
    <label class="text-2xl">{{ label }}</label>
    <input
      v-bind="$attrs"
      :placeholder="placeholder"
      :value="modelValue"
      @input="$emit('update:modelValue', $event.target.value)"
      class="w-2/3 border-2 ring-offset-2 rounded-3xl px-3 py-1 border-green-500 focus:outline-none focus:ring-2 focus:ring-green-200"
    />
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

<style></style>
