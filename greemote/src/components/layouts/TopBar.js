import { makeStyles } from '@material-ui/core/styles';
import { AppBar, Avatar, Grid } from '@material-ui/core';
import Colors from '../../static/Colors';
import Logo from '../../static/images/greemote_profil_pic.png';

const useStyles = makeStyles((theme) => ({
	header: {
		backgroundColor: Colors.DarkBrown,
		color: Colors.LightBrown
	},
	logo: {
		margin: 5,
		height: 50,
		width: 50
	},
	iconbutton: {
		margin: 5
	}
}));

function TopBar() {
	const classes = useStyles();
	return (
		<AppBar position="static" className={classes.header}>
			<Grid container spacing={0}>
				<Grid item>
					<Avatar className={classes.logo} alt="Logo" src={Logo} />
				</Grid>
			</Grid>
		</AppBar>
	);
}
export default TopBar;
