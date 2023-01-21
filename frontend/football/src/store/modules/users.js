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
                    await axios.patch(`${process.env.VUE_APP_URL}/api/v1/articlesrelation/${id}/`, {'bookmarks': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
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
                    await axios.delete(`${process.env.VUE_APP_URL}/api/v1/articlesrelation/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
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
                await axios.post(`${process.env.VUE_APP_URL}/api/token/verify/`, {token: `${token.access}`})
                await ctx.dispatch('me_data', token.access)
                await ctx.commit('UpdateVerify', true)
            }
            catch (e){
                ctx.dispatch('refresh_fn', token.refresh)
            }
        },
        async refresh_fn(ctx, token){
            try {
                const response = await axios.post(`${process.env.VUE_APP_URL}/api/token/refresh/`, {"refresh": `${token}`})
                localStorage.setItem('access', response.data.access)
                await ctx.dispatch('me_data', response.data.access)
                ctx.commit('UpdateVerify', true)
            }
            catch (e){
                ctx.commit('UpdateVerify', false)
                localStorage.removeItem('access')
                localStorage.removeItem('refresh')
                localStorage.removeItem('username')
                await ctx.dispatch('me_data')
            }
        },
        async refresh_without_reboot(ctx){
            try{
                const response = await axios.post(`${process.env.VUE_APP_URL}/api/token/refresh/`, {"refresh": `${localStorage.getItem('refresh')}`})
                localStorage.setItem('access', response.data.access)
            }
            catch (e) {
                localStorage.removeItem('access')
                localStorage.removeItem('refresh')
                localStorage.removeItem('username')
                ctx.commit('UpdateVerify', false)
            }
        },
        async me_data(ctx, access){
            try{
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/me/`, {headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`}})
                localStorage.setItem("username", response.data.username)
                ctx.commit('MeUser', response.data)
            }
            catch (e) {
                ctx.commit('MeUser', {bookmarks: []})
            }
        },
        async me_update(ctx, data){
            let formData = new FormData();
            if (data.image){
                formData.append('image', data.image);
            }
            formData.append('first_name', data.first_name);
            formData.append('last_name', data.last_name);
            formData.append('email', data.email);
            formData.append('username', data.username);
            try{
                const response = await axios.put(`${process.env.VUE_APP_URL}/api/v1/me/`, formData, {headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`,}})
                ctx.dispatch('me_data', localStorage.getItem('access'))
            }
            catch (e) {
                console.log(e)
            }
        },
        async user_data(ctx, user){
            try{
                await ctx.commit('updateLoading', true)
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/user/${user}/`, {headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`}})
                ctx.commit('UpdateUser', response.data)
            }
            catch (e) {
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/user/${user}/`)
                ctx.commit('UpdateUser', response.data)
            }
            finally {
                await ctx.commit('updateLoading', false)
            }
        },
        async user_subscriber(ctx, id){
            try{
                await axios.patch(`${process.env.VUE_APP_URL}/api/v1/subscription/${id}/`, {'add': false}, {headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`}})
            }
            catch (e) {
                router.push({name: 'login'})
            }
        },
        async user_unsubscribe_reject(ctx, id){
            try{
                await axios.delete(`${process.env.VUE_APP_URL}/api/v1/subscription/${id}/`,{headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`}})
            }
            catch (e) {
                console.log(e)
            }
        },
        async user_accept(ctx, id){
            try{
                await axios.patch(`${process.env.VUE_APP_URL}/api/v1/subscription/${id}/`,{'add': true},{headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`}})
            }
            catch (e) {
                console.log(e)
            }
        },
    },
}