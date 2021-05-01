<template>

  <div class="periodicTable">
    <div class="row">
      <div class="column w-1/6 mt-6 text-left bg-white border-csblack border rounded">
        <div class="container">
          <p>Element logo</p>
        </div>
        <div class="container bg-csblack text-white pl-6 pr-6 p-3 pt-1">
          <p>Element info</p>
        </div>
      </div>
      <div class="column w-9/12 pl-6 pr-6 p-3 pt-1 ml-2 mt-6 text-left bg-white border-csblack border rounded">

      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: "PeriodicTable"
}
</script>

<style>

div {
  display: block;
}

.group {
  justify-self: center;
  text-align: center;
}

.period {
  align-self: center;
  text-align: right;
  padding-right: 1px;
  z-index: 2;
}

</style>