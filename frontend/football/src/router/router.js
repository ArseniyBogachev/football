import store from '@/store'
import {createRouter, createWebHistory} from "vue-router"
import HomeApp from "@/pages/HomeApp";
import AboutApp from "@/pages/AboutApp";
import ProfileApp from "@/pages/ProfileApp";
import ArticleApp from "@/pages/ArticleApp";
import TeamsApp from "@/pages/TeamsApp";
import ClubApp from "@/pages/ClubApp";
import PlayerApp from "@/pages/PlayerApp";
import CatArticles from "@/components/CatArticles";
import LoginApp from "@/pages/LoginApp";
import RegisterApp from "@/pages/RegisterApp";
import UserApp from "@/pages/UserApp";




const routes = [
    {
        path: '/',
        component: HomeApp,
        name: 'home'
    },
    {
        path: '/about',
        component: AboutApp,
        name: 'about'
    },
    {
        path: `/profile/:slug`,
        component: ProfileApp,
        name: 'profile',
        props: true,
    },
    {
        path: '/article',
        component: ArticleApp,
        name: 'article'
    },
    {
        path: '/teams',
        component: TeamsApp,
        name: 'teams'
    },
    {
        path: '/teams/club',
        component: ClubApp,
        name: 'club'
    },
    {
        path: '/teams/lineup/:slug',
        component: PlayerApp,
        name: 'lineup'
    },
    {
        path: '/article/:slug',
        component: CatArticles,
        name: 'article_cat',
        props: true,
    },
    {
        path: '/login',
        component: LoginApp,
        name: 'login'
    },
    {
        path: '/register',
        component: RegisterApp,
        name: 'register'
    },
    {
        path: '/user/:slug',
        component: UserApp,
        name: 'user',
        props: true,
    },
]

const router = createRouter({
    routes,
    history: createWebHistory(process.env.BASE_URL),
})

// router.afterEach((to, from, failure) => {
//   store.dispatch('verify_fn', {access: localStorage.getItem('access'), refresh: localStorage.getItem('refresh')})
// })

router.beforeEach((to, from, next)=>{
    if ( to.name === 'profile' && !localStorage.getItem('access')){
        next({
            path: '/login',
            replace: true
        })
    }
    else {
        next();
    }
})

export default router
