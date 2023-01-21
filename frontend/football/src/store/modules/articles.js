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
        comment_reply: {},
        page: 1,
        paginate: true,
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
        comment_reply(state){
            return state.comment_reply
        },
        articles_paginate(state){
            return state.articles_paginate
        },
        page(state){
            return state.page
        },
        paginate(state){
            return state.paginate
        }
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
                i['text_reply'] = ''
                i['click_loading'] = false
            }
            state.comment = comment
        },
        updateCommentReply(state, comment_reply){
            for (let i of comment_reply.data){
                i['text_reply'] = ''
            }
            state.comment_reply[comment_reply.id] = comment_reply.data
        },
        articlesPaginate(state, articles_paginate){
            state.articles_all = [...state.articles_all].concat(articles_paginate)
        },
        UpdatePage(state){
            state.page += 1
        },
        PageOne(state){
            state.page = 1
        },
        UpdatePaginate(state){
            state.paginate = false
        },
    },
    actions: {
        async like_fn(ctx, id){
            let article = ctx.state.articles_all.find(item => item.id === id)
            try{
                if (localStorage.getItem('access')) {
                    if (article.like_dislike.like === article.like_dislike.dislike) {
                        await axios.patch(`${process.env.VUE_APP_URL}/api/v1/articleslikes/${id}/`, {'likes': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                        article.like_dislike.like = 1
                        article.count_true += 1
                    }
                    else {
                        if (article.like_dislike.like === 1) {
                            await axios.delete(`${process.env.VUE_APP_URL}/api/v1/articleslikes/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                            article.like_dislike.like = 0
                            article.count_true -= 1
                        }
                        else {
                            await axios.patch(`${process.env.VUE_APP_URL}/api/v1/articleslikes/${id}/`, {'likes': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
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
                        await axios.patch(`${process.env.VUE_APP_URL}/api/v1/articleslikes/${id}/`, {'likes': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                        article.like_dislike.dislike = 1
                        article.count_false += 1
                    }
                    else{
                        if (article.like_dislike.dislike === 1){
                            await axios.delete(`${process.env.VUE_APP_URL}/api/v1/articleslikes/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                            article.like_dislike.dislike = 0
                            article.count_false -= 1
                        }
                        else{
                            await axios.patch(`${process.env.VUE_APP_URL}/api/v1/articleslikes/${id}/`, {'likes': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
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
        async articles_data(ctx, page){
            try{
                await ctx.commit('updateLoading', true)
                if (page === ctx.getters.page && ctx.getters.paginate){
                    const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/articles/?page=${page}`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                    ctx.commit('articlesPaginate', response.data.results)
                    if (Math.ceil(response.data.count / 4) > page){
                        ctx.commit('UpdatePage')
                    }
                    else{
                        ctx.commit('UpdatePaginate')
                    }
                }
            }
            catch (e){
                if (e.response.status === 401){
                    if (page !== 0 && ctx.getters.paginate){
                        const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/articles/?page=${page}`)
                        ctx.commit('articlesPaginate', response.data.results)
                        if (Math.ceil(response.data.count / 4) > page){
                            ctx.commit('UpdatePage')
                        }
                        else{
                            ctx.commit('UpdatePaginate')
                        }
                    }
                }
            }
            finally{
                await ctx.commit('updateLoading', false)
            }
        },
        async articles_all_data(ctx){
            try{
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/article-all/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                await ctx.commit('updateArticles', response.data)
            }
            catch (e) {
                if (e.response.status === 401){
                    const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/article-all/`)
                    await ctx.commit('updateArticles', response.data)
                }
            }
            finally {
                await ctx.commit('UpdatePaginate')
            }
        },
        async category_data(ctx){
            try{
                await ctx.commit('updateLoading', true)
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/articlescategory/`)
                ctx.commit('updateCategory', response.data)
            }
            catch (e) {
                console.log(e)
            }
            finally {
                await ctx.commit('updateLoading', false)
            }
        },
        async article_create(ctx, data){
            try{
                const response = await axios.post(`${process.env.VUE_APP_URL}/api/v1/articles/`, data.data, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                location.reload()
            }
            catch (e) {
                console.log(e)
            }
        },
        async article_update(ctx, data){
            try{
                const response = await axios.put(`${process.env.VUE_APP_URL}/api/v1/articles/${data.id}/`, data.data, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                await ctx.dispatch('articles_data')
                router.push({name: 'profile', params:{slug: ctx.getters.me.username}})
            }
            catch (e) {
                console.log(e)
            }
        },
        async article_delete(ctx, id){
            try{
                const response = await axios.delete(`${process.env.VUE_APP_URL}/api/v1/articles/${id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                await ctx.dispatch('articles_data')
                router.push({name: 'profile', params:{slug: ctx.getters.me.username}})
            }
            catch (e) {
                console.log(e)
            }
        },
        async article_comment_data(ctx, id){
            try {
                await ctx.commit('updateLoading', true)
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/comment/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}, params: {article: id}})
                ctx.commit('updateComment', response.data)
            }
            catch (e) {
                if (e.response.status === 401) {
                    const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/comment/`, {params: {article: id}})
                    ctx.commit('updateComment', response.data)
                }
                console.log(e)
            }
            finally {
                await ctx.commit('updateLoading', false)
            }
        },
        async comment_reply_data(ctx, data){
            let c = await ctx.state.comment.find(item => item.id === data.reply_data)
            try {
                c.click_loading = true
                const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/comment/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}, params: {article: data.article, reply: data.reply_data}})
                ctx.commit('updateCommentReply', {data: response.data, id: data.reply_data})
            }
            catch (e) {
                if (e.response.status === 401){
                    const response = await axios.get(`${process.env.VUE_APP_URL}/api/v1/comment/`, {params: {article: data.article, reply: data.reply_data}})
                    ctx.commit('updateCommentReply', {data: response.data, id: data.reply_data})
                }
                console.log(e)
            }
            finally {
                c.click_loading = false
            }
        },
        async article_comment_create(ctx, data){
            try {
                const response = await axios.post(`${process.env.VUE_APP_URL}/api/v1/comment/`, data.data, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}, params: {'article': data.article}})
            }
            catch (e) {
                if (e.response.status === 401){
                    router.push('/login')
                }
                console.log(e)
            }
        },
        async comment_reply_create(ctx, data){
            try {
                const response = await axios.post(`${process.env.VUE_APP_URL}/api/v1/comment/`, data.data, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}, params: {'article': data.article, reply: data.reply_post}})
            }
            catch (e) {
                if (e.response.status === 401){
                    router.push('/login')
                }
                console.log(e)
            }
        },
        async comment_rate_update(ctx, data){
            try {
                await axios.delete(`${process.env.VUE_APP_URL}/api/v1/rate/${data.id}/`, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                if (data.comment.rate_user === 1){
                    data.comment.rate_user = false
                    data.comment.rate_count -= 1
                }
                else {
                    data.comment.rate_user = false
                    data.comment.rate_count += 1
                }
            }
            catch (e) {
                if (e.response.status === 401){
                    router.push('/login')
                }
                console.log(e)
            }
        },
        async comment_rate_update_true(ctx, data){
            let comment = ctx.state.comment.find(item => item.id === data.comment_id)
            if (comment === undefined){
                comment = ctx.state.comment_reply[data.reply_id].find(item => item.id === data.comment_id)
            }
            try {
                if (comment.rate_user === false){
                    await axios.patch(`${process.env.VUE_APP_URL}/api/v1/rate/${data.comment_id}/`, {'rate': true}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                    comment.rate_user = 1
                    comment.rate_count += 1
                }
                else{
                    ctx.dispatch('comment_rate_update', {id: data.comment_id, comment: comment})
                }
            }
            catch (e) {
                if (e.response.status === 401){
                    router.push('/login')
                }
                console.log(e)
            }
        },
        async comment_rate_update_false(ctx, data){
            let comment = ctx.state.comment.find(item => item.id === data.comment_id)
            if (comment === undefined){
                comment = ctx.state.comment_reply[data.reply_id].find(item => item.id === data.comment_id)
            }
            try {
                if (comment.rate_user === false){
                    await axios.patch(`${process.env.VUE_APP_URL}/api/v1/rate/${data.comment_id}/`, {'rate': false}, {headers: {"Authorization": `Bearer ${localStorage.getItem('access')}`}})
                    comment.rate_user = -1
                    comment.rate_count -= 1
                }
                else{
                    ctx.dispatch('comment_rate_update', {id: data.comment_id, comment: comment})
                }
            }
            catch (e) {
                if (e.response.status === 401){
                    router.push('/login')
                }
                console.log(e)
            }
        }
    },
}
