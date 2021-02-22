import { useState } from 'react';
import { useHistory } from 'react-router-dom';
import { makeStyles } from '@material-ui/core/styles';

import {
	Typography,
	Grid,
	Button,
	Dialog,
	DialogActions,
	DialogTitle,
	DialogContent,
	TextField,
	Radio,
	RadioGroup,
	FormControlLabel,
	FormControl,
	FormLabel
} from '@material-ui/core';

import useMediaQuery from '@material-ui/core/useMediaQuery';
import { useTheme } from '@material-ui/core/styles';

import EcoIcon from '@material-ui/icons/Eco';
import AttachMoneyIcon from '@material-ui/icons/AttachMoney';
import WorkOutlineIcon from '@material-ui/icons/WorkOutline';

import bck from '../images/greemote_bck_pic.png';
import Colors from '../Colors';

const useStyles = makeStyles((theme) => ({
	root: {
		// backgroundColor: Colors.LightBrown,
		height: '100%',
		margin: '0',
		padding: '0',
		textAlign: 'center'
	},
	upper: {
		height: '320px',
		color: Colors.NaturalWhite
	},
	pictureUpper: {
		position: 'absolute',
		left: '0',
		top: '0',
		width: '100%',
		height: '320px',
		opacity: '0.8',
		zIndex: -1
	},
	textGroupUpper: {
		padding: '40px',
		opacity: '1'
	},
	textUpper1: {
		textShadow: '2px 2px 8px black'
	},
	textUpper2: {
		fontFamily: 'Brush Script MT, Brush Script Std, cursive',
		textShadow: '2px 2px 8px black'
	},
	down: {
		width: '100%',
		color: Colors.DarkBrown
	},
	icons: {
		fontSize: '50px'
	}
}));

function AuthDialog({ open, onClose }) {
	const history = useHistory();
	const theme = useTheme();
	const fullScreen = useMediaQuery(theme.breakpoints.down('sm'));

	const [ role, setRole ] = useState('workspace');

	function handleClick() {
		history.push('/workingSpaces');
	}

	function handleClose() {
		onClose();
	}

	return (
		<Dialog fullScreen={fullScreen} open={open} onClose={handleClose} aria-labelledby="responsive-dialog-title">
			<DialogTitle id="responsive-dialog-title">{'Login'}</DialogTitle>
			<DialogContent>
				<TextField autoFocus id="enter_login" label="Login" fullWidth />
				<TextField autoFocus id="enter_pwd" label="Password" type="password" fullWidth />

				<FormControl component="fieldset" style={{ margin: '10px' }}>
					<FormLabel component="legend">You are:</FormLabel>
					<RadioGroup
						aria-label="role"
						name="role"
						value={role}
						onChange={(event) => setRole(event.target.value)}
					>
						<FormControlLabel value="workspace" control={<Radio />} label="Workspace manager" />
						<FormControlLabel value="employee" control={<Radio />} label="Employee" />
					</RadioGroup>
				</FormControl>
			</DialogContent>
			<DialogActions>
				<Button autoFocus onClick={handleClick} variant="outlined" color="secondary">
					Sign Up
				</Button>

				<Button onClick={handleClick} variant="outlined" color="secondary" autoFocus>
					Sign In
				</Button>
			</DialogActions>
		</Dialog>
	);
}

function Home() {
	const history = useHistory();
	const classes = useStyles();
	const theme = useTheme();
	const fullScreen = useMediaQuery(theme.breakpoints.down('sm'));

	const [ dialog, setDialog ] = useState(false);

	const open = () => {
		setDialog(true);
	};

	const handleClose = () => {
		setDialog(false);
	};

	return (
		<div className={classes.root}>
			<div className={classes.upper}>
				<img src={bck} className={classes.pictureUpper} />
				<div className={classes.textGroupUpper}>
					<Typography variant="h2" component="h3" className={classes.textUpper1}>
						BOOK YOUR WORKSPACE
					</Typography>
					<Typography variant="h4" component="h4" className={classes.textUpper2}>
						In respect with the environment
					</Typography>
					<Button variant="contained" size="large" onClick={open}>
						Login
					</Button>
					<AuthDialog open={dialog} onClose={handleClose} />
				</div>
			</div>
			<div className={classes.down}>
				<Grid container alignContent="center" justify="center" spacing={4}>
					<Grid item xs={3}>
						<WorkOutlineIcon className={classes.icons} />
						<Typography variant="body2">
							Work in a space dedicated environment, where efficiency is a key element.
						</Typography>
					</Grid>
					<Grid item xs={3}>
						<EcoIcon className={classes.icons} />
						<Typography variant="body2">
							Work in a space near your domicile, in order to reduce your carbon emissions.
						</Typography>
					</Grid>
					<Grid item xs={3}>
						<AttachMoneyIcon className={classes.icons} />
						<Typography variant="body2">Work at lower cost, in a space booked last minute.</Typography>
					</Grid>
				</Grid>
			</div>
		</div>
	);
}

export default Home;
