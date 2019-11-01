import { connect } from "react-redux";
import { login } from "../../actions/session_actions";
import SessionForm from "./session_form";

const mapStateToProps = (state) => ({
    errors: state.errors,
    formType: `Log In`,
    formHeader: `Log In`,
    otherForm: `Sign Up`,
    otherFormUrl: `/signup`,
    currentUser: state.session.id
});

const mapDispatchToProps = (dispatch) => ({
    processForm: formUser => dispatch(login(formUser))
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(SessionForm);