import axios from 'axios'
import router from '@/router/router';

export const users = {
    state: () => ({
        me: {},
        verify: false,
        user: {},
    }),
    getters:{
        me(state){
            return state.me
        },
        verify(state){
            return state.verify
        },
        user(state){
            return state.user
        },
    },
    mutations:{
        MeUser(state, me){
            state.me = me
        },
        UpdateMe(state, user){
            state.me = user['sub'].find(item => item.username.includes(user['nick']))
        },
        UpdateVerify(state, verify){
            state.verify = verify
        },
        UpdateUser(state, user){
            state.user = user
        },
    },
    actions: {
        async bookmarks_true(ctx, id){
            try{
                if (localStorage.getItem('access')){
                    await axios.patch(`http://127.0.0.1:8000/api/v1/articlesrelation/${id}/`, {'bookmarks': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                    let user = ctx.state.me
                    user.bookmarks.push(id)
                }
                else{
                    router.push('/login')
                }
            }
            catch (e) {
                await ctx.dispatch('refresh_without_reboot')
                await ctx.dispatch('bookmarks_true', id)
            }
        },
        async bookmarks_false(ctx, id){
            try{
                if (localStorage.getItem('access')){
                    await axios.delete(`http://127.0.0.1:8000/api/v1/articlesrelation/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                    let user = ctx.state.me
                    let index = user.bookmarks.indexOf(id)
                    delete user.bookmarks[index]
                }
                else{
                    router.push('/login')
                }
            }
            catch (e) {
                await ctx.dispatch('refresh_without_reboot')
                await ctx.dispatch('bookmarks_false', id)
            }
        },
        async verify_fn(ctx, token){
            try {
                await axios.post('http://127.0.0.1:8000/api/token/verify/', {token: `${token.access}`})
                await ctx.dispatch('me_data', token.access)
                await ctx.dispatch('articles_data')
                ctx.commit('UpdateVerify', true)
            }
            catch (e){
                ctx.dispatch('refresh_fn', token.refresh)
            }
        },
        async refresh_fn(ctx, token){
            try {
                const response = await axios.post('http://127.0.0.1:8000/api/token/refresh/', {"refresh": `${token}`})
                localStorage.setItem('access', response.data.access)
                await ctx.dispatch('me_data', response.data.access)
                await ctx.dispatch('articles_data')
                ctx.commit('UpdateVerify', true)
            }
            catch (e){
                ctx.commit('UpdateVerify', false)
                localStorage.removeItem('access')
                localStorage.removeItem('refresh')
            }
        },
        async refresh_without_reboot(ctx){
            try{
                const response = await axios.post('http://127.0.0.1:8000/api/token/refresh/', {"refresh": `${localStorage.getItem('refresh')}`})
                localStorage.setItem('access', response.data.access)
            }
            catch (e) {
                localStorage.removeItem('access')
                localStorage.removeItem('refresh')
                ctx.commit('UpdateVerify', false)
            }
        },
        async me_data(ctx, access){
            try{
                const response = await axios.get('http://127.0.0.1:8000/api/v1/me/', {headers: {"Authorization" : `Bearer ${access}`}})
                ctx.commit('MeUser', response.data[0])
            }
            catch (e) {
                ctx.commit('MeUser', {bookmarks: []})
            }
        },
        async user_data(ctx, user){
            try{
                const response = await axios.get(`http://127.0.0.1:8000/api/v1/user/${user}/`, {headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`}})
                ctx.commit('UpdateUser', response.data)
            }
            catch (e) {
                console.log(e)
            }
        },
    },
}