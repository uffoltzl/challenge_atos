import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route } from 'react-router-dom';
import EmployeeSearchPage from './employees/EmployeeSearchPage';
import './index.css';
import LandingPage from './landingPage/LandingPage'
import reportWebVitals from './reportWebVitals';
import WorkingSpaceDashBoard from './workingspaces/WorkingSpaceDashBoard';

ReactDOM.render(
  <BrowserRouter>
    <Route exact path='/' component={LandingPage} />
    <Route path='/workspace' component={WorkingSpaceDashBoard} />
    <Route path='/employee' component={EmployeeSearchPage} />
  </BrowserRouter>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
