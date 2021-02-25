import TopBar from '../components/layouts/TopBar';
import { Container } from '@material-ui/core';
import { makeStyles } from '@material-ui/core/styles';

import Colors from '../static/Colors';

const useStyles = makeStyles((theme) => ({
	root: {
		backgroundColor: Colors.LightBrown,
		height: "100vh"
	}
}));

function DefaultLayout({ children }) {
	const styles = useStyles();

	return (
		<div className={styles.root}>
			<TopBar />
			<Container component="main">{children}</Container>
		</div>
	);
}
export default DefaultLayout;
