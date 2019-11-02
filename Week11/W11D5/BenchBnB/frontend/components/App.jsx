import React from "react";
import GreetingContainer from "./greeting/greeting_container";
import SignupFormContainer from "./session/signup_form_cointainer";
import LoginFormContainer from "./session/login_form_container";
import BenchIndexContainer from "./bench/bench_index_container";
import { AuthRoute } from "../util/route_util";
import { Route } from "react-router-dom";

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />

      <AuthRoute path="/login" component={LoginFormContainer} />
      <AuthRoute path="/signup" component={SignupFormContainer} />
      <Route exact path="/" component={BenchIndexContainer} />
    </header>
  </div>
);

export default App;