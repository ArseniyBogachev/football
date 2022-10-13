import axios from 'axios'

export const players = {
    state: () => ({
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
    },
    mutations:{
        updatePlayers(state, players){
            state.players = players
        },
        updatePlayer(state, player){
            state.player = player
        }
    },
    actions: {
        async player_data(ctx, last_name){
            const response = await axios.get(`http://127.0.0.1:8000/api/v1/player/${last_name}/`)
            await ctx.commit(response.data)
        }
    },
}

