<template>
  <footer>
    <div class="flex flex-row bg-csblue px-48 py-6 place-content-between">
      <div class="text-2xl self-center">
        <p class="text-center items-center self-center">
          Ви можете нас знайти в соціальних мережах!
        </p>
      </div>
      <div class="text-7xl">
        <i class="fab fa-twitter-square mx-6"></i>
        <i class="fab fa-telegram mx-6"></i>
        <i class="fab fa-instagram mx-6"></i>
        <i class="fab fa-facebook-square mx-6"></i>
      </div>
    </div>

    <div
      class="bg-csblack text-white flex flex-row px-48 py-6 place-content-between"
    >
      <div class="w-1/3 content-start text-left">
        <h1 class="text-2xl">ChemSolution</h1>
        <hr class="my-3" />
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean
          euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan
          et viverra justo commodo. Lorem ipsum dolor sit amet, consectetur.
        </p>
      </div>
      <div class="w-1/3 content-end text-right">
        <h1 class="text-2xl">Контакти</h1>
        <hr class="my-3" />
        <div class="flex flex-row-reverse text-xl">
          <i class="fas fa-warehouse self-center m-3"></i>
          <p class="self-center">Address</p>
        </div>
        <div class="flex flex-row-reverse text-xl">
          <i class="fas fa-envelope-open-text self-center m-3"></i>
          <p class="self-center">chemsolution@gmail.com</p>
        </div>
        <div class="flex flex-row-reverse text-xl">
          <i class="fas fa-phone self-center m-3"></i>
          <p class="self-center">+380-96-23-234-23</p>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'Footer',
}
</script>

<style></style>
