import {createRouter, createWebHistory} from "vue-router"
import HomeApp from "@/pages/HomeApp";
import AboutApp from "@/pages/AboutApp";
import ProfileApp from "@/pages/ProfileApp";
import ArticleApp from "@/pages/ArticleApp";
import TeamsApp from "@/pages/TeamsApp";
import ClubApp from "@/pages/ClubApp";
import PlayerApp from "@/pages/PlayerApp";
import CatArticles from "@/components/CatArticles";




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
        path: '/profile/:slug',
        component: ProfileApp,
        name: 'profile',
        props: true,
    },
    {
        path: '/article',
        component: ArticleApp,
    },
    {
        path: '/teams',
        component: TeamsApp,
    },
    {
        path: '/teams/club',
        component: ClubApp,
    },
    {
        path: '/teams/lineup/:slug',
        component: PlayerApp,
    },
    {
        path: '/article/:slug',
        component: CatArticles,
        name: 'article_cat',
        props: true,
    },
]


const router = createRouter({
    routes,
    history: createWebHistory(process.env.BASE_URL)
})

export default router
