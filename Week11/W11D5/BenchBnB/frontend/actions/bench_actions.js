import { getBenches } from "../util/bench_api_util";

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";

export const recieveBenches = benches => ({
    type: RECEIVE_BENCHES,
    benches
});

export const fetchBenches = () => dispatch => getBenches()
    .then( benches => dispatch(recieveBenches(benches)));