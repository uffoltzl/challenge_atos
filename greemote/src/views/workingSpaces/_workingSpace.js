import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Avatar from '@material-ui/core/Avatar';
import Grid from '@material-ui/core/Grid';
import HomeIcon from '@material-ui/icons/Home';
import IconButton from '@material-ui/core/IconButton';

import Colors from '../Colors';

import Logo from '../images/greemote_profil_pic.png';

const useStyles = makeStyles((theme) => ({
	root: {
		backgroundColor: Colors.LightBrown,
		height: '100vh'
	},
	header: {
		backgroundColor: Colors.DarkBrown,
		color: Colors.LightBrown
	},
	logo: {
		margin: 10
	},
	iconbutton: {
		margin: 5
	},
	block: {
		borderWidth: '2px',
		borderStyle: 'solid',
		borderColor: Colors.DarkBrown,
		borderRadius: '10px',
		padding: '15px',
		margin: '5px',
		width: '70%',
		color: Colors.DarkBrown
	}
}));

export default function WorkingSpace() {
	const classes = useStyles();

	return (
		<div className={classes.root}>
			<AppBar position="static" className={classes.header}>
				<Grid container spacing={0}>
					<Grid item>
						<Avatar className={classes.logo} alt="Logo" src={Logo} />
					</Grid>
					<Grid item>
						<IconButton className={classes.iconbutton}>
							<HomeIcon />
						</IconButton>
					</Grid>
				</Grid>
			</AppBar>
			<Grid
				container
				spacing={0}
				style={{ width: '100%' }}
				alignItems="center"
				justify="center"
				direction="column"
			>
				<Grid item className={classes.block}>
					Infos salle
				</Grid>
				<Grid item className={classes.block}>
					Réservations
				</Grid>
				<Grid item className={classes.block}>
					Graphiques
				</Grid>
			</Grid>
		</div>
	);
}
