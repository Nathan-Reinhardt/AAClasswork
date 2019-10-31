import { connect } from "react-redux";
import { signup } from "../../actions/session_actions";
import SessionForm from "./session_form";

const mapStateToProps = (state, ownProps) => ({
    
});

const mapDispatchToProps = (dispatch, ownProps) => ({
    signup: formUser => dispatch(signup(formUser))
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);