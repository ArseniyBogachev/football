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
import OpenarticleApp from "@/pages/OpenarticleApp";
import CreatearticlesApp from "@/pages/CreatearticlesApp";




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
        path: '/category',
        component: ArticleApp,
        name: 'category'
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
        path: '/category/:slug',
        component: CatArticles,
        name: 'category_articles',
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
    {
        path: '/article/:slug',
        component: OpenarticleApp,
        name: 'article',
        props: true,
    },
    {
        path: '/profile/:slug/create',
        component: CreatearticlesApp,
        name: 'create-article',
        props: true,
    },
]

const router = createRouter({
    routes,
    history: createWebHistory(process.env.BASE_URL),
})

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
