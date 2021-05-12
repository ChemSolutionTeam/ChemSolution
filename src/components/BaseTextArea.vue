<template>
  <div class="m-3 mt-1 mb-1 flex flex-row justify-between">
    <label class="mt-1 text-2xl self-center">{{ label }}</label>
    <textarea
      v-bind="$attrs"
      :placeholder="placeholder"
      :value="modelValue"
      @input="$emit('update:modelValue', $event.target.value)"
      :disabled="isDisabled"
      :class="[isDisabled ? 'bg-csblack bg-opacity-10' : ' bg-white']"
      class="focus:animate-pulse focus:ring-cslightgreen focus:border-csgreen focus:outline-none focus:ring-4 focus:ring-opacity-20 text-lg w-3/5 border-2 border-csblack rounded-lg mr-5 px-3 py-1 text-center"
    ></textarea>
  </div>
  <div class="m-2 flex flex-row justify-end">
    <div class="w-11/12 mr-5 h-6">
      <p class="text-center text-red-600">
        <span v-if="isIncorrect">{{ errorMassage }} </span>
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TextArea',
  props: {
    label: {
      type: String,
      default: 'default',
    },
    placeholder: {
      type: String,
      default: 'default',
    },
    modelValue: {
      type: [String, Number],
      default: '',
    },
    isDisabled: {
      type: Boolean,
      default: false,
    },
  },
}
</script>

<style></style>
