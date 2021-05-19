<template>
  <div>
    <h1 class="text-5xl">BlogPosts Inspect page</h1>

    <Button label="Додати пост" class="w-3/12" @click="create()" />
    <Button label="Повернутися" class="w-3/12" @click="goBack()" white="true" />

    <!-- <div>TODO Search</div> -->
    <div class="flex flex-wrap mx-3 my-5">
      <div
        class="border-2 overflow-x-auto border-csgreen rounded-xl rounded-b-none bg-cslightgreen bg-opacity-25 shadow-lg"
      >
        <table class="w-11/12 py-2 px-5 divide-y divide-gray-200 table-auto">
          <thead class="">
            <tr class="text-csblack uppercase">
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Id
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Title
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Category
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Information
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                Image
              </th>
              <th
                class="py-1 hover:text-csgreen cursor-pointer px-6 text-center border-csgreen border-b-4"
              >
                IsLocked
              </th>
            </tr>
          </thead>
          <tbody class="text-csblack">
            <tr
              class="hover:bg-gray-100"
              v-for="(blogpost, index) in blogposts"
              :key="index"
            >
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ blogpost.blogPostId }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ blogpost.title }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ blogpost.сategory }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ blogpost.information }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ blogpost.image }}
              </td>
              <td
                class="border border-t-0 border-csgreen py-3 px-6 whitespace-nowrap"
              >
                {{ blogpost.isLocked }}
              </td>

              <td
                class="border border-t-0 px-5 border-csgreen whitespace-nowrap"
              >
                <div class="flex justify-end">
                  <button
                    class="px-4 focus:outline-none focus:ring focus:ring-offset-2 focus:ring-csgreen shadow-md bg-gradient-to-tr from-csgreen to-cslightgreen w-full p-1 m-1 border rounded-xl"
                    @click="edit(blogpost)"
                  >
                    Edit
                  </button>
                  <button
                    @click="remove(blogpost)"
                    class="focus:outline-none focus:ring focus:ring-offset-2 focus:ring-red-300 shadow-md bg-gradient-to-tr from-red-400 to-red-500 text-white w-full p-1 m-1 border rounded-xl"
                  >
                    Remove
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import Button from '@/components/HomePageButtons.vue'
import router from '@/router/index'
import apiService from '@/services/index'

export default {
  name: 'Inspect',
  components: { Button },
  methods: {
    goBack() {
      router.push('/admin')
    },
    edit(blogpost) {
      blogpost
      router.push('/admin/blogposts/edit/' + blogpost.blogPostId)
    },
    remove(blogpost) {
      blogpost
      router.push('/admin/blogposts/delete/' + blogpost.blogPostId)
    },
    create() {
      router.push('/admin/blogposts/create/')
    },
  },
  mounted() {
    let blogposts = apiService.getBlogPosts()
    if (blogposts == null || blogposts == undefined) return
    else this.blogposts = blogposts
  },
  data() {
    return {
      blogposts: [
        {
          blogPostsId: 1,
        },
      ],
    }
  },
}
</script>

<style></style>
