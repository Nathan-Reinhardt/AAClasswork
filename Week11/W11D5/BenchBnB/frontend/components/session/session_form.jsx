import React from "react";
import { Link } from "react-router-dom";

class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        }
        this.handleInput = this.handleInput.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(type) {
        return (e) => {
            this.setState({ [type]: e.target.value })
        }
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user)
            .then( () => this.props.history.push[`/`]);
    }

    render() {
        return (
            <div>
                <h2>{this.props.formHeader}</h2>
                <form>
                    <label>Username:
                        <input type="text"
                               value={this.state.username}
                               onChange={this.handleInput("username")}
                        />
                    </label>
                    <label>Password:
                        <input type="password"
                               value={this.state.password}
                               onChange={this.handleInput("password")}
                        />
                    </label>
                    <button onClick={this.handleSubmit}>{this.props.formType}</button>
                </form>
                <Link to={this.props.otherFormUrl}><h3>{this.props.otherForm}</h3></Link>
                <h4>Errors</h4>
                <h4>{Array.from(this.props.errors)}</h4>
            </div>
        )
    }
}

export default SessionForm;