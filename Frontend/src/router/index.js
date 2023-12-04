import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/teams',
      name: 'teams',
      component: () => import('../views/TeamView.vue')
    },
    {
      path: '/matches',
      name: 'matches',
      component: () => import('../views/MatchView.vue')
    }
  ]
})

export default router
