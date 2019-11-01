import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import SignupFormContainer from "./session/signup_form_cointainer";
import LoginFormContainer from "./session/login_form_container";

const App = () => (
  <div>
    <header>
    <h1>Bench BnB</h1>
    <GreetingContainer />

    <Route path="/login" component={LoginFormContainer} />
    <Route path="/signup" component={SignupFormContainer} />
    </header>
  </div>
);

export default App;