<template>
  <div>
    <div
      id="infoGraphics"
      class="bg-category1 m-4"
      style="height: 8vw; width: 8vw; margin-right: auto; margin-left: auto"
    >
      <!-- :class="fill" !-->
      <p id="infoNumber" class="number">{{ element.elementId }}</p>
      <p id="infoSymbol" class="symbol">{{ element.symbol }}</p>
      <p id="infoName" class="name">{{ element.name }}</p>
      <p id="infoWeight" class="weight">{{ element.atomicWeight }}</p>
    </div>

    <hr />
    <div class="m-4 text-csblack" style="font-size: 0.7vw">
      <div style="float: left; margin: auto">Порядковий номер:</div>
      <div id="infoNumber1" style="float: right; margin: auto"></div>
      <div style="clear: left"></div>

      <div style="float: left; margin: auto">Позначення:</div>
      <div id="infoSymbol1" style="float: right; margin: auto"></div>
      <div style="clear: left"></div>

      <div style="float: left; margin: auto">Назва:</div>
      <div id="infoName1" style="float: right; margin: auto"></div>
      <div style="clear: left"></div>

      <div style="float: left; margin: auto">Категорія:</div>
      <div id="infoCategory" style="float: right; margin: auto"></div>
      <div style="clear: left"></div>

      <div style="float: left; margin: auto">Атомна маса:</div>
      <div id="infoWeight1" style="float: right; margin: auto"></div>
      <div style="clear: left"></div>

      <div style="float: left; margin: auto">Валентність:</div>
      <div id="infoValences" style="float: right; margin: auto"></div>
      <div style="clear: left"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ElementWorkspaceInfo',
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

<style scoped></style>
