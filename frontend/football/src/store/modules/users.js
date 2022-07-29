
export const users = {
    state: () => ({
        users: [],
        me: {},
    }),
    getters:{
        users(state){
            return state.users
        },
        me(state){
            return state.me
        }
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
        }
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
        me_data(ctx){
            const response = {photo: 'kuwsh1n.jpg', firstname: 'Arseniy', lastname: 'Bogachev', nickname: 'kuwsh1n', age: 22,}
            ctx.commit('MeUser', response)
        }
    },
}