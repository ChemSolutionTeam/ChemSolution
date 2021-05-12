<template>
  <div v-show="!big" class="flex items-start ml-1">
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
  <div v-show="big">
    <div class="m-3 mt-1 mb-1 flex flex-row justify-between">
      <label class="mt-1 text-2xl">{{ label }}</label>
      <input
        v-bind="$attrs"
        type="checkbox"
        :checked="modelValue"
        :disabled="isDisabled"
        :class="[isDisabled ? 'bg-csblack bg-opacity-10' : 'bg-red-300 ']"
        @change="$emit('update:modelValue', $event.target.checked)"
        class="focus:animate-pulse focus:ring-cslightgreen text-csgreen bg-opacity-20 focus:border-csgreen border-csblack-300 focus:outline-none focus:ring-4 focus:ring-opacity-20 text-lg h-10 w-3/5 border-2 border-csblack rounded-2xl mr-5 pr-0 px-3 py-1 text-center"
      />
    </div>
    <div class="m-2 flex flex-row justify-end">
      <div class="w-11/12 mr-5 h-6">
        <p class="text-center text-red-600">
          <span v-if="isIncorrect">{{ errorMassage }} </span>
        </p>
      </div>
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
    big: {
      type: Boolean,
      default: false,
    },
    isDisabled: {
      type: Boolean,
      default: false,
    },
  },
}
</script>

<style></style>
