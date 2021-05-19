<template>
  <div class="flex flex-row h-screen">
    <div
      class="border border-csblack rounded-3xl rounded-l-none w-1/4 h-11/12 bg-csbluewhite p-4 shadow-xl"
    >
      <!-- Search -->
      <div class="flex flex-wrap w-full text-xl mb-10">
        <i class="fas fa-search mx-3 self-center scale-125 transform w-1/12" />
        <input
          class="w-10/12 border-csblack border rounded-xl outline-none px-5"
        />
      </div>
      <div class="overflow-y-auto h-5/6">
        <ElementChooser
          symbol="C"
          name="Carbon"
          category="tReactiveNonMetal-light"
        />
        <ElementChooser />
        <ElementChooser />
        <ElementChooser />
        <ElementChooser />
        <ElementChooser />
        <ElementChooser />
        <ElementChooser />
        <ElementChooser />
      </div>
    </div>
    <div></div>
  </div>
</template>

<script>
import ElementChooser from '@/components/ElementChooser'
export default {
  name: 'Workspace',
  components: {
    ElementChooser,
  },
}
</script>

<style></style>
