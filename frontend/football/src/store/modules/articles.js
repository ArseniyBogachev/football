import axios from 'axios'


export const articles = {
    state: () => ({
        articles_all: [],
        articles_tactical: [],
        articles_player: [],
        articles_xg: [],
        articles_manager: [],
        articles_team: [],
        category: [],
        like: false,
        dislike: false,
        like_count: 0,
        dislike_count: 0,
    }),
    getters:{
        articles_all(state){
            return state.articles_all
        },
        articles_tactical(state){
            return state.articles_tactical
        },
        articles_player(state){
            return state.articles_player
        },
        articles_xg(state){
            return state.articles_xg
        },
        articles_manager(state){
            return state.articles_manager
        },
        articles_team(state){
            return state.articles_team
        },
        category(state){
            return state.category
        },
        like(state){
            return state.like
        },
        dislike(state){
            return state.dislike
        },
        like_count(state){
            return state.like_count
        },
        dislike_count(state){
            return state.dislike_count
        },
    },
    mutations:{
        updateArticles(state, articles){
            state.articles_all = articles
            state.articles_tactical = [...articles].filter(item => item.cat === 1)
            state.articles_player = [...articles].filter(item => item.cat === 2)
            state.articles_xg = [...articles].filter(item => item.cat === 3)
            state.articles_manager = [...articles].filter(item => item.cat === 4)
            state.articles_team = [...articles].filter(item => item.cat === 5)
        },
        updateCategory(state, category){
            state.category = [{'title': 'all', 'link': 'all'}].concat([...category])
        },
        like_func(state){
          if (state.like === state.dislike){
            state.like = !state.like
            state.like_count += 1
          }
          else{
            if (state.like === true){
              state.like = false
              state.like_count -= 1
            }
            else{
              state.like = !state.like
              state.like_count += 1
              state.dislike = !state.dislike
              state.dislike_count -= 1
            }
          }
        },
        dislike_func(state){
          if (state.like === state.dislike){
            state.dislike = !state.dislike
            state.dislike_count += 1
          }
          else{
            if (state.dislike === true){
              state.dislike = false
              state.dislike_count -= 1
            }
            else{
              state.like = !state.like
              state.like_count -= 1
              state.dislike = !state.dislike
              state.dislike_count += 1
            }
          }
        },
    },
    actions: {
        async like_fn(ctx, id) {
            const response = await axios.put(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
        },
        async articles_data(ctx){
            if (localStorage.getItem('access')){
                const response = await axios.get('http://127.0.0.1:8000/api/v1/articles/', {headers: {"Authorization" : `Bearer ${localStorage.getItem('access')}`}})
                ctx.commit('updateArticles', response.data)
            }
            else{
                const response = await axios.get('http://127.0.0.1:8000/api/v1/articles/')
                ctx.commit('updateArticles', response.data)
            }

        },
        async category_data(ctx){
            const response = await axios.get('http://127.0.0.1:8000/api/v1/articlescategory/')
            console.log(response.data)
            ctx.commit('updateCategory', response.data)
        },
    },
}
