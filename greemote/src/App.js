import React from 'react';
import { BrowserRouter as Router, Route } from 'react-router-dom';
import './index.css';
import LandingPage from './views/index';

function App() {
	return (
		<Router>
			<Route exact path="/" component={LandingPage} />
		</Router>
	);
}

export default App;
