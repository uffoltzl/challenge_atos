import React, { useState } from 'react';
import { makeStyles } from '@material-ui/core/styles';

import { 
	Grid,
	Card,
	CardContent,
	Typography,
	Table,
	TableHead,
	TableRow,
	TableCell,
	TableBody
} from '@material-ui/core';

import AccountCircleIcon from '@material-ui/icons/AccountCircle';
import RoomIcon from '@material-ui/icons/Room';

import Colors from '../../static/Colors';
import workspaces from '../../static/WorkingSpacesPoints';
import reservations from '../../static/Reservations';
import users from '../../static/Users';
import Graph from '../../components/layouts/Graph';

const useStyles = makeStyles((theme) => ({
	root: {
		alignItems: "center"
	},
	card: {
		width: "100%",
		minHeight: "200px",
		backgroundColor: Colors.DarkBrown,
		margin: '10px'
	},
	title: {
		fontSize: 17,
		color: Colors.NaturalWhite,
	},
	text: {
		color: Colors.NaturalWhite,
		fontSize: "15px"
	},
	tabHeader: {
		fontWeight: "bold",
		color: Colors.NaturalWhite,
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

function WorkspaceInfo({ workspaceId }){
	const classes = useStyles();

	const [ workspaceName, setWorkspaceName ] = useState(workspaces[workspaceId].name);
	const [ workspaceAddress, setWorkspaceAddress ] = useState(workspaces[workspaceId].address);

	return (
		<div>
			<Typography className={classes.text} >
				<AccountCircleIcon className={classes.text} /> {workspaceName}
			</Typography>
			<Typography className={classes.text} >
				<RoomIcon className={classes.text} /> {workspaceAddress}
			</Typography>
		</div>
	);
}

function ReservationList({ workspaceId }){
	const classes = useStyles();

	const reservationsForWorkspace = reservations[workspaceId];

	return (
		<div>
			<Table>
				<TableHead>
          			<TableRow>
            			<TableCell className={classes.tabHeader} >Employee</TableCell>
            			<TableCell align="right" className={classes.tabHeader} >Date</TableCell>
            			<TableCell align="right" className={classes.tabHeader} >Hour</TableCell>
          			</TableRow>
        		</TableHead>
				<TableBody>
				{
					Object.keys(reservationsForWorkspace).map((reservationId) => {
						return(
							<TableRow key={reservationId}>
								<TableCell>
									{users[reservationsForWorkspace[reservationId].employeeId].login}
								</TableCell>
								<TableCell align="right">
									{reservationsForWorkspace[reservationId].date}
								</TableCell>
								<TableCell align="right">
									{reservationsForWorkspace[reservationId].beginHour} - {reservationsForWorkspace[reservationId].beginHour + reservationsForWorkspace[reservationId].period}
								</TableCell>
							</TableRow>
					)})
				}
				</TableBody>
		    </Table>
		</div>
	)
}

export default function WorkingSpace() {
	const classes = useStyles();

	const workspaceId = localStorage.getItem("workspaceId");
	if(workspaceId === null){
		return null;
	}

	return (
		<div className={classes.root}>
			<Grid
				container
				spacing={3}
				style={{ width: '90%' }}
				justify="center"
			>
				<Grid item xs={3}>
					<Card className={classes.card} >
						<CardContent>
							<Typography className={classes.title} gutterBottom>
          						Workspace Infos
        					</Typography>
							<WorkspaceInfo
								workspaceId={workspaceId} 
							/>
						</CardContent>
					</Card>
				</Grid>
				<Grid item xs={4}>
					<Card className={classes.card} >
						<CardContent>
							<Typography className={classes.title} gutterBottom>
          						Reservations
        					</Typography>
							<ReservationList
								workspaceId={workspaceId} 
							/>
						</CardContent>
					</Card>
				</Grid>
				<Grid item xs={5}>
				<Card className={classes.card} >
						<Graph workspaceId={workspaceId} />
					</Card>
				</Grid>
			</Grid>
		</div>
	);
}
