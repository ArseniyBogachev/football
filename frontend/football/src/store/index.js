import { createStore } from 'vuex';
import {players} from "@/store/modules/players";
import {articles} from "@/store/modules/articles";

export default createStore({
  modules: {
    players: players,
    articles: articles
  }
})
