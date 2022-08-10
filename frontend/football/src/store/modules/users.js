import axios from 'axios'

export const users = {
    state: () => ({
        users: [],
        me: {},
        verify: false,
    }),
    getters:{
        users(state){
            return state.users
        },
        me(state){
            return state.me
        },
        verify(state){
            return state.verify
        },
    },
    mutations:{
        UpdateUsers(state, users){
            state.users = []
            for (let i of users){
                i['display'] = false
                state.users.push(i)
            }
        },
        MeUser(state, me){
            state.me = me
        },
        UpdateMe(state, user){
            state.me = user['sub'].find(item => item.nickname.includes(user['nick']))
        },
        UpdateVerify(state, verify){
            state.verify = verify
        },
    },
    actions: {
        users_data(ctx){
            const response = [
                // {firstname: 'Arseniy', lastname: 'Bogachev', nickname: 'kuwsh1n', article: 20, rate: 4.5, photo: 'kuwsh1n.jpg'},
                {firstname: 'Daniil', lastname: 'Grigoryevskiy', nickname: 'dany228', article: 10, rate: 4.1, photo: 'dany228.jpg', age: 22,},
                {firstname: 'Dmitriy', lastname: 'Krinickiy', nickname: 'Mitay', article: 13, rate: 4.4, photo: '', age: 22,},
                {firstname: 'Kirill', lastname: 'Zherdev', nickname: 'uzumaki', article: 26, rate: 4.3, photo: 'uzumaki.jpg', age: 22,},
                {firstname: 'Daria', lastname: 'Utesheva', nickname: 'kuwsh1nka', article: 5, rate: 5, photo: 'kuwsh1nka.jpg', age: 22,},
            ]
            ctx.commit('UpdateUsers', response)
        },
        async verify_fn(ctx, token){
            try {
                await axios.post('http://127.0.0.1:8000/api/token/verify/', {token: `${token.access}`})
                ctx.dispatch('me_data', token.access)
                ctx.commit('UpdateVerify', true)
            }
            catch (e){
                ctx.dispatch('refresh_fn', token.refresh)
            }
        },
        async refresh_fn(ctx, token){
            try {
                const response = await axios.post('http://127.0.0.1:8000/api/token/refresh/', {"refresh": `${token}`})
                window.localStorage.setItem('access', response.data.access)
                ctx.dispatch('me_data', response.data.access)
                ctx.commit('UpdateVerify', true)
            }
            catch (e){
                ctx.commit('UpdateVerify', false)
                localStorage.removeItem('access')
                localStorage.removeItem('refresh')
            }
        },
        async me_data(ctx, access){
            try{
                const response = await axios.get('http://127.0.0.1:8000/api/v1/me/', {headers: {"Authorization" : `Bearer ${access}`}})
                ctx.commit('MeUser', response.data[0])
            }
            catch (e) {
                console.log(access)
            }
        }
    },
}