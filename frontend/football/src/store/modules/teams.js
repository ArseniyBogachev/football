import axios from "axios";

export const teams = {
    state: () => ({
        teams: [],
        club: {},
    }),
    getters:{
        teams(state){
            return state.teams
        },
        club(state){
            return state.club
        },
    },
    mutations:{
        updateTeams(state, teams){
            state.teams = teams
        },
        updateClub(state, club){
            state.club = club
        }
    },
    actions: {
        async teams_data(ctx){
            const response = await axios.get('http://127.0.0.1:8000/api/v1/club/', {params: {year: 1}})
            ctx.commit('updateTeams', response.data)
        },
        async club_data(ctx, title){
            const response = await axios.get(`http://127.0.0.1:8000/api/v1/club/${title}/`,)
            ctx.commit('updateClub', response.data)
        },
    },
}