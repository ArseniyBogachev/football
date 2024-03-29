import { createApp } from 'vue'
import App from './App.vue'
import store from '@/store'
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"
import router from "@/router/router";
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { faGithub, faInstagram, faTelegram } from '@fortawesome/free-brands-svg-icons'
const app = createApp(App)


library.add(fas, faGithub, faInstagram, faTelegram )
router.app = app

app
    .component('fa', FontAwesomeIcon)
    .use(router)
    .use(store)
    // .use(StoragePlugin)
    .mount('#app');
