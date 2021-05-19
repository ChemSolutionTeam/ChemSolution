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
    path: '/workspace',
    name: 'Workspace',
    component: () => import('../views/Workspace.vue'),
  },
  {
    path: '/admin/elements',
    name: 'Elements',
    component: () => import('../views/Admin/Element/Inspect.vue'),
  },
  {
    path: '/admin/elements/edit/:id',
    name: 'Elements Edit',
    component: () => import('../views/Admin/Element/Edit.vue'),
    props: {
      id: true,
    },
  },
  {
    path: '/admin/elements/delete/:id',
    name: 'Elements Delete',
    component: () => import('../views/Admin/Element/Delete.vue'),
    props: {
      id: true,
    },
  },
  {
    path: '/admin/elements/create',
    name: 'Elements Create',
    component: () => import('../views/Admin/Element/Create.vue'),
  },
  {
    path: '/admin/achievements',
    name: 'Achievements',
    component: () => import('../views/Admin/Achievement/Inspect.vue'),
  },
  {
    path: '/admin/achievements/edit/:id',
    name: 'Achievements Edit',
    component: () => import('../views/Admin/Achievement/Edit.vue'),
    props: {
      id: true,
    },
  },
  {
    path: '/admin/achievements/delete/:id',
    name: 'Achievements Delete',
    component: () => import('../views/Admin/Achievement/Delete.vue'),
    props: {
      id: true,
    },
  },
  {
    path: '/admin/achievements/create',
    name: 'Achievements Create',
    component: () => import('../views/Admin/Achievement/Create.vue'),
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
  {
    path: '/userPageDemo',
    name: 'UserPageDemo',
    component: () => import('../views/UserPageDemo.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
