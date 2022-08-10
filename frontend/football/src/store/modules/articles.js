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
    },
    mutations:{
        updateArticles(state, articles){
            console.log('1')
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
    },
    actions: {
        async like_fn(ctx, id){
            let article = ctx.state.articles_all.find(item => item.id === id)

            if (article.like_true === article.like_false){
                article.like_true = 1
                article.count_true += 1
                await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
            }
            else{
                if (article.like_true === 1){
                    article.like_true = 0
                    article.count_true -= 1
                    await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                }
                else{
                    article.like_true = 1
                    article.count_true += 1
                    article.like_false = 0
                    article.count_false -= 1
                    await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                }
            }
        },
        async dislike_fn(ctx, id){
            let article = ctx.state.articles_all.find(item => item.id === id)

            if (article.like_true === article.like_false){
                article.like_false = 1
                article.count_false += 1
                await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
            }
            else{
                if (article.like_false === 1){
                    article.like_false = 0
                    article.count_false -= 1
                    await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                }
                else{
                    article.like_false = 1
                    article.count_false += 1
                    article.like_true = 0
                    article.count_true -= 1
                    await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                }
            }
        },
        async articles_data(ctx){
            try {
                const response = await axios.get('http://127.0.0.1:8000/api/v1/articles/', {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                ctx.commit('updateArticles', response.data)
            }
            catch{
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
