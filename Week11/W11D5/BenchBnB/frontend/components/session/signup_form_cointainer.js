import { connect } from "react-redux";
import { signup } from "../../actions/session_actions";
import SessionForm from "./session_form";

const mapStateToProps = (state) => ({
    errors: state.errors,
    formType: `Sign Up`,
    formHeader: `Sign Up`,
    otherForm: `Log In`,
    otherFormUrl: `/login`,
    currentUser: state.session.id
});

const mapDispatchToProps = (dispatch) => ({
    processForm: formUser => dispatch(signup(formUser))
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(SessionForm);