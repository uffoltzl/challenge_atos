import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route } from 'react-router-dom';
import EmployeeSearchPage from './employees/EmployeeSearchPage';
import './index.css';
import LandingPage from './landingPage/LandingPage'
import WorkingSpaceDashBoard from './workingspaces/WorkingSpaceDashBoard';

ReactDOM.render(
  <BrowserRouter>
    <Route exact path='/' component={LandingPage} />
    <Route path='/workspace' component={WorkingSpaceDashBoard} />
    <Route path='/employee' component={EmployeeSearchPage} />
  </BrowserRouter>,
  document.getElementById('root')
);
