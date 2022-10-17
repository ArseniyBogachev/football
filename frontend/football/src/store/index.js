import { createStore } from 'vuex';
import {players} from "@/store/modules/players";
import {articles} from "@/store/modules/articles";
import {users} from "@/store/modules/users";
import {teams} from "@/store/modules/teams";
import {loading} from "@/store/modules/loading";

export default createStore({
  modules: {
    players: players,
    articles: articles,
    users: users,
    teams: teams,
    loading: loading,
  }
})
