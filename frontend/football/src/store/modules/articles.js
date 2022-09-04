import axios from 'axios';
import router from '@/router/router';

export const articles = {
    state: () => ({
        articles_all: [],
        articles_tactical: [],
        articles_player: [],
        articles_xg: [],
        articles_manager: [],
        articles_team: [],
        category: [],
        comment: [],
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
        comment(state){
            return state.comment
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
        updateComment(state, comment){
            for (let i of comment){
                i['reply'] = false
            }
            state.comment = comment
        },
    },
    actions: {
        async like_fn(ctx, id){
            let article = ctx.state.articles_all.find(item => item.id === id)
            try{
                if (localStorage.getItem('access')) {
                    if (article.like_dislike.like === article.like_dislike.dislike) {
                        await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                        article.like_dislike.like = 1
                        article.count_true += 1
                    }
                    else {
                        if (article.like_dislike.like === 1) {
                            await axios.delete(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                            article.like_dislike.like = 0
                            article.count_true -= 1
                        }
                        else {
                            await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                            article.like_dislike.like = 1
                            article.count_true += 1
                            article.like_dislike.dislike = 0
                            article.count_false -= 1
                        }
                    }
                }
                else{
                    router.push('/login')
                }
            }
            catch (e){
                await ctx.dispatch('refresh_without_reboot')
                await ctx.dispatch('like_fn', id)
            }
        },
        async dislike_fn(ctx, id){
            let article = ctx.state.articles_all.find(item => item.id === id)
            try{
                if (localStorage.getItem('access')){
                    if (article.like_dislike.like === article.like_dislike.dislike){
                        await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                        article.like_dislike.dislike = 1
                        article.count_false += 1
                    }
                    else{
                        if (article.like_dislike.dislike === 1){
                            await axios.delete(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                            article.like_dislike.dislike = 0
                            article.count_false -= 1
                        }
                        else{
                            await axios.patch(`http://127.0.0.1:8000/api/v1/articleslikes/${id}/`, {'likes': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                            article.like_dislike.dislike = 1
                            article.count_false += 1
                            article.like_dislike.like = 0
                            article.count_true -= 1
                        }
                    }
                }
                else{
                    router.push('/login')
                }
            }

            catch (e){
                await ctx.dispatch('refresh_without_reboot')
                await ctx.dispatch('dislike_fn', id)
            }
        },
        async articles_data(ctx){
            try{
                const response = await axios.get('http://127.0.0.1:8000/api/v1/articles/', {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                ctx.commit('updateArticles', response.data)
            }
            catch{
                const response = await axios.get('http://127.0.0.1:8000/api/v1/articles/')
                ctx.commit('updateArticles', response.data)
            }
        },
        async category_data(ctx){
            try{
                const response = await axios.get('http://127.0.0.1:8000/api/v1/articlescategory/')
                ctx.commit('updateCategory', response.data)
            }
            catch (e) {
                console.log(e)
            }
        },
        async article_create(ctx, data){
            try{
                const response = await axios.post('http://127.0.0.1:8000/api/v1/articles/', data.data, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                location.reload()
            }
            catch (e) {
                console.log(e)
            }
        },
        async article_update(ctx, data){
            try{
                const response = await axios.put(`http://127.0.0.1:8000/api/v1/articles/${data.id}/`, data.data, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                await ctx.dispatch('articles_data')
                router.push({name: 'profile', params:{slug: ctx.getters.me.username}})
            }
            catch (e) {
                console.log(e)
            }
        },
        async article_delete(ctx, id){
            try{
                const response = await axios.delete(`http://127.0.0.1:8000/api/v1/articles/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                await ctx.dispatch('articles_data')
                router.push({name: 'profile', params:{slug: ctx.getters.me.username}})
            }
            catch (e) {
                console.log(e)
            }
        },
        async article_comment_data(ctx, id){
            try {
                const response = await axios.get(`http://127.0.0.1:8000/api/v1/comment/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}, params: {article: id}})
                ctx.commit('updateComment', response.data)
            }
            catch (e) {
                console.log(e)
            }
        },
        async article_comment_create(ctx, data){
            try {
                const response = await axios.post(`http://127.0.0.1:8000/api/v1/comment/`, data.data, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}, params: {'article': data.id}})
            }
            catch (e) {
                console.log(e)
            }
        },
        async comment_rate_update(ctx, id){
            let comment = ctx.state.comment.find(item => item.id === id)
            await axios.delete(`http://127.0.0.1:8000/api/v1/rate/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
            if (comment.rate_user === 1){

                comment.rate_user = false
                comment.rate_count -= 1
            }
            else {
                comment.rate_user = false
                comment.rate_count += 1
            }
        },
        async comment_rate_update_true(ctx, id){
            let comment = ctx.state.comment.find(item => item.id === id)
            await axios.patch(`http://127.0.0.1:8000/api/v1/rate/${id}/`, {'rate': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
            if (comment.rate_user === false){
                comment.rate_user = 1
                comment.rate_count += 1
            }
            else{
                ctx.dispatch('comment_rate_update', id)
            }
        },
        async comment_rate_update_false(ctx, id){
            let comment = ctx.state.comment.find(item => item.id === id)
            await axios.patch(`http://127.0.0.1:8000/api/v1/rate/${id}/`, {'rate': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
            if (comment.rate_user === false){
                comment.rate_user = -1
                comment.rate_count -= 1
            }
            else{
                ctx.dispatch('comment_rate_update', id)
            }
        }
    },
}
