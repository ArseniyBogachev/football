import axios from 'axios'

export const players = {
    state: () => ({
        players_search: [],
        players: [],
        player: {},
    }),
    getters:{
        players(state){
            return state.players
        },
        player(state){
            return state.player
        },
        players_search(state){
            return state.players_search
        },
    },
    mutations:{
        updatePlayers(state, players){
            state.players = players
        },
        updatePlayer(state, player){
            state.player = player
        },
        playersSearch(state, players_search){
            state.players_search = players_search
        },
    },
    actions: {
        async player_data(ctx, last_name){
            try{
                await ctx.commit('updateLoading', true)
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/players/${last_name}/`)
                await ctx.commit('updatePlayer', response.data)
            }
            catch (e) {
                console.log(e)
            }
            finally {
                ctx.commit('updateLoading', false)
            }
        },
        async players_search_data(ctx){
            try {
                if (!ctx.state.players_search.length){
                    const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/players-all/`)
                    await ctx.commit('playersSearch', response.data)
                    console.log(ctx.getters.players_search)
                }
            }
            catch (e) {
                console.log(e)
            }
        }
    },
}

