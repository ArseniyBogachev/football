import axios from "axios";

export const teams = {
    state: () => ({
        teams: [],
        club: {},
        matches: [],
        match: {},
    }),
    getters:{
        teams(state){
            return state.teams
        },
        club(state){
            return state.club
        },
        matches(state){
            return state.matches
        },
        match(state){
            return state.match
        },
    },
    mutations:{
        updateTeams(state, teams){
            state.teams = teams
        },
        updateClub(state, club){
            state.club = club
        },
        updateMatches(state, matches){
            matches.data.forEach((item) => {
                if (item.home_team === matches.title){
                    if (item.amount_goals_home_team > item.amount_goals_guest_team){
                        item['style'] = {'background-color': 'rgba(9, 130, 21, 0.8)', 'color': 'white'}
                    }
                    else if (item.amount_goals_home_team < item.amount_goals_guest_team){
                        item['style'] = {'background-color': 'rgba(138, 8, 8, 0.8)', 'color': 'white'}
                    }
                    else{
                        item['style'] = {'background-color': 'rgba(127, 138, 8, 0.8)', 'color': 'white'}
                    }
                }
                else if (item.guest_team === matches.title){
                    if (item.amount_goals_home_team < item.amount_goals_guest_team){
                        item['style'] = {'background-color': 'rgba(9, 130, 21, 0.8)', 'color': 'white'}
                    }
                    else if (item.amount_goals_home_team > item.amount_goals_guest_team){
                        item['style'] = {'background-color': 'rgba(138, 8, 8, 0.8)', 'color': 'white'}
                    }
                    else{
                        item['style'] = {'background-color': 'rgba(127, 138, 8, 0.8)', 'color': 'white'}
                    }
                }
            })
            state.matches = matches.data
        },
        updateMatch(state, match){
            state.match = match
        },
    },
    actions: {
        async teams_data(ctx){
            try{
                await ctx.commit('updateLoading', true)
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/club/`, {params: {year: 1}})
                ctx.commit('updateTeams', response.data)
            }
            catch (e) {
                console.log(e)
            }
            finally {
                await ctx.commit('updateLoading', false)
            }
        },
        async club_data(ctx, title){
            try{
                await ctx.commit('updateLoading', true)
                const response_club = await axios.get(`${process.env.VUE_APP_URL}/api/v1/club/${title}/`,)
                const response_lineUp = await axios.get(`${process.env.VUE_APP_URL}/api/v1/players/`, {params: {club: title}})
                const response_matches = await axios.get(`${process.env.VUE_APP_URL}/api/v1/matches/`, {params: {team: title}})
                await ctx.commit('updateClub', response_club.data)
                await ctx.commit('updatePlayers', response_lineUp.data)
                await ctx.commit('updateMatches', {data: response_matches.data, title: title})
            }
            catch (e) {
                console.log(e)
            }
            finally {
                await ctx.commit('updateLoading', false)
            }
        },
        async match_data(ctx, id){
            try{
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/matches/${id}/`)
                ctx.commit('updateMatch', response.data)
            }
            catch (e) {
                console.log(e)
            }
        }
    },
}