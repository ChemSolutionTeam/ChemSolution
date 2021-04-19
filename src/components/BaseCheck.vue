<template>
  <div class="flex items-start ml-1">
    <div class="flex items-center h-6">
      <input
        type="checkbox"
        :checked="modelValue"
        @change="$emit('update:modelValue', $event.target.checked)"
        class="focus:animate-pulse focus:ring-cslightgreen border-2 m-2 h-4 w-4 text-csgreen border-csblack-300 rounded"
      />
    </div>
    <div class="ml-1 h-auto text-sm">
      <label v-if="label" class="text-lg text-gray-700">{{ label }}</label>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      default: '',
    },
    modelValue: {
      type: Boolean,
      default: false,
    },
  },
}
</script>

<style></style>
