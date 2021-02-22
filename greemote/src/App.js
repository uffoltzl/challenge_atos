import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import './index.css';

import DefaultLayout from './layouts/Default';
import MapLayout from './layouts/Map';

import LandingPageView from './views/index';
import WorkingSpacesView from './views/workingSpaces';
import WorkingSpaceView from './views/workingSpaces/_workingSpace';

function App() {
	return (
		<Router>
			<Route exact path="/" component={LandingPageView} />
			<Route path="/working-spaces">
				<Route exact path="/working-spaces">
					<MapLayout>
						<Route exact path="/working-spaces" component={WorkingSpacesView} />
					</MapLayout>
				</Route>
				<Route path="/working-spaces/:id">
					<DefaultLayout>
						<Route path="/working-spaces/:id" component={WorkingSpaceView} />
					</DefaultLayout>
				</Route>
			</Route>
		</Router>
	);
}

export default App;
