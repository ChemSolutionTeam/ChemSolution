import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ '../views/About.vue'),
  },
  {
    path: '/admin',
    name: 'Admin',
    component: () => import('../views/Admin.vue'),
  },
  {
    path: '/admin/inspect',
    name: 'Inspect',
    component: () => import('../views/Inspect.vue'),
  },
  {
    path: '/periodicTable',
    name: 'PeriodicTable',
    component: () => import('../views/PeriodicTable.vue'),
  },
  {
    path: '/periodicTableDemo',
    name: 'PeriodicTableDemo',
    component: () => import('../views/PeriodicTableDemo.vue'),
  },
  {
    path: '/404',
    name: 'NotFound',
    component: () => import('../views/NotFound.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
