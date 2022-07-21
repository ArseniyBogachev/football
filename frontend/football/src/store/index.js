import { createStore } from 'vuex';
import {players} from "@/store/modules/players";

export default createStore({
  modules: {
    post: players,
  }
})
