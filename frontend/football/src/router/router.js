import {createRouter, createWebHistory} from "vue-router"
import HomeApp from "@/pages/HomeApp";
import AboutApp from "@/pages/AboutApp";
import ProfileApp from "@/pages/ProfileApp";
import ArticleApp from "@/pages/ArticleApp";
import TeamsApp from "@/pages/TeamsApp";




const routes = [
    {
        path: '/',
        component: HomeApp,
    },
    {
        path: '/about',
        component: AboutApp,
    },
    {
        path: '/profile',
        component: ProfileApp,
    },
    {
        path: '/article',
        component: ArticleApp,
    },
    {
        path: '/teams',
        component: TeamsApp,
    },
]


const router = createRouter({
    routes,
    history: createWebHistory(process.env.BASE_URL)
})

export default router
