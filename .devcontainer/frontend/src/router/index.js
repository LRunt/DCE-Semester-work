import { createRouter, createWebHistory } from 'vue-router'
import Home from '../pages/Home.vue'
import Projects from '../pages/Projects.vue'
import Sport from '../pages/Sport.vue'

const routes = [
    { path: '/', component: Home },
    { path: '/projects', component: Projects },
    { path: '/sport', component: Sport }
]

const router = createRouter({  
  history: createWebHistory(),  
  routes,  
  scrollBehavior(to, from, savedPosition) {   
    if (savedPosition) {  
      return savedPosition  
    }  
    if (to.hash) {  
      const offset = 100 //navbar height
      const el = document.querySelector(to.hash)  
  
      if (el) {  
        const y = el.getBoundingClientRect().top + window.scrollY - offset  
        return {  
          top: y,  
          behavior: 'smooth',
        }  
      }  
    }  
    return { top: 0, behavior: 'smooth' }  
  },  
})  
  
export default router