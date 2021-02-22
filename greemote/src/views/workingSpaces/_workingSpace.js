import React from 'react';
import { makeStyles } from '@material-ui/core/styles';

import { Grid } from '@material-ui/core';

import Colors from '../../static/Colors';

const useStyles = makeStyles((theme) => ({
	root: {
		backgroundColor: Colors.LightBrown
	},
	header: {
		backgroundColor: Colors.DarkBrown,
		color: Colors.LightBrown
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
