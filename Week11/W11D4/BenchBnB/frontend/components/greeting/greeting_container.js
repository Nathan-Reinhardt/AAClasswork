import { connect } from 'react-redux';
import Greeting from './greeting';
import { selectUserId } from "../../reducers/selectors";

const mapStateToProps = state => ({
    currentUser: selectUserId(state)
});

const mapDispatchToProps = dispatch => ({
    logout: () => dispatch(logout())
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(Greeting);