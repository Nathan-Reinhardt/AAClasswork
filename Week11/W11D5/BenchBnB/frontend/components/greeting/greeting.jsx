import React from 'react';
import { Link } from 'react-router-dom';

const GreetingContainer = (props) => {
    const display = props.currentUser ? (
        <div>
            <p>Hello, {props.currentUser.username}</p>
            <button onClick={() => props.logout()}>Log Out</button>
        </div>
    ) : (
        <div>
            <Link className="btn" to="/signup">Sign Up</Link>
            <br/>
            <Link className="btn" to="/login">Log In</Link>
        </div>
    );

    return (
        <div>
            {display}
        </div>
    );
};

export default GreetingContainer;