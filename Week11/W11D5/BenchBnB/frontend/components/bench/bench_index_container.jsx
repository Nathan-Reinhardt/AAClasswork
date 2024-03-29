import BenchIndex from "./bench_index.jsx";
import { connect } from "react-redux";
import { fetchBenches } from "../../actions/bench_actions";

const mapStateToProps = state => ({
  benches: state.entities.benches
});

const mapDispatchToProps = dispatch => ({
    fetchBenches: () => dispatch(fetchBenches())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(BenchIndex);