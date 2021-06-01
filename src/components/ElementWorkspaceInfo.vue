<template>
  <div>
    <div class="bg-category1">
      <!-- :class="fill" !-->
      <p class="number">{{ element.elementId }}</p>
      <p class="symbol">{{ element.symbol }}</p>
      <p class="name">{{ element.name }}</p>
      <p class="weight">{{ element.atomicWeight }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "ElementWorkspaceInfo",
  props: {
    element: {
      atomicRadius: {
        type: Number,
        default: 454.59,
      },
      atomicWeight: {
        type: Number,
        default: 1.008,
      },
      boilingTemperature: {
        type: Number,
        default: 607,
      },
      category: {
        type: String,
        default: 'Неметали',
      },
      electronQuantity: {
        type: Number,
        default: 588,
      },
      electronegativity: {
        type: Number,
        default: 511.1,
      },
      elementId: {
        type: Number,
        default: 1,
      },
      energyLevels: {
        type: Number,
        default: 0,
      },
      group: {
        type: Number,
        default: 1,
      },
      meltingTemperature: {
        type: Number,
        default: 1,
      },
      name: {
        type: String,
        default: 'Гідроген',
      },
      neutronQuantity: {
        type: Number,
        default: 733,
      },
      protonQuantity: {
        type: Number,
        default: 936,
      },
      symbol: {
        type: String,
        default: 'H',
      },
      valences: {
        type: Array,
        default: [],
      },
      isLocked: {
        type: Number,
        default: 0,
      },
    },
  },
}

</script>

<style scoped>

</style>