import { createApp } from 'vue'
import App from './App.vue'
import i18n from './i18n'
import router from './router'

import './assets/styles.css'
import './assets/table.css'
import './assets/article.css'
//import 'bootstrap/dist/css/bootstrap.min.css'
//import 'bootstrap/dist/js/bootstrap.bundle.min.js'

createApp(App)
.use(i18n)
.use(router)
.mount('#app')
