
export const loading = {
    state: () => ({
        loading: false,
        click_loading: false,
    }),
    getters:{
        loading(state){
            return state.loading
        },
        click_loading(state){
            return state.click_loading
        },
    },
    mutations:{
        updateLoading(state, loading){
            state.loading = loading
        },
        updateClickLoading(state, click_loading){
            state.click_loading = click_loading
        }
    },
    actions: {
    },
}