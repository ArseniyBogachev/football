import { createStore } from 'vuex';
import {players} from "@/store/modules/players";
import {articles} from "@/store/modules/articles";
import {users} from "@/store/modules/users";

export default createStore({
  modules: {
    players: players,
    articles: articles,
    users: users,
  }
})
