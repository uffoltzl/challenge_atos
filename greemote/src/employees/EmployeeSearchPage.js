import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Avatar from '@material-ui/core/Avatar';
import Grid from '@material-ui/core/Grid';
import HomeIcon from '@material-ui/icons/Home';
import IconButton from '@material-ui/core/IconButton';
import GoogleMap from 'google-map-react';

import Colors from '../Colors';
import Marker from './Marker';

import Logo from '../images/greemote_profil_pic.png';

const useStyles = makeStyles((theme) => ({
    root: {
        backgroundColor: Colors.LightBrown,
        height: "90vh"
    },
    header: {
        backgroundColor: Colors.DarkBrown,
        color: Colors.LightBrown
    },
    logo: {
        margin: 10,
    },
    iconbutton: {
        margin: 5,
    },
}));

export default function EmployeeSearchPage() {
    const classes = useStyles();
    const [center, setCenter] = React.useState([59.938043, 30.337157]); // update with the domicile of the employee
    const [zoom, setZoom] = React.useState(9);

    return (
        <div className={classes.root}>
        <AppBar position="static" className={classes.header}>
            <Grid container spacing={0}>
                <Grid item>
                    <Avatar className={classes.logo} alt="Logo" src={Logo} />
                </Grid>
                <Grid item>
                    <IconButton className={classes.iconbutton} >
                        <HomeIcon />
                    </IconButton>
                </Grid>
            </Grid>
        </AppBar>
        <GoogleMap
            center={center}
            zoom={zoom}
        >
            <Marker lat={59.955413} lng={30.337844} text={'A'} />
            {/* on fait une boucle pour afficher tous les éléments proches de chez nous */}
        </GoogleMap>
        </div>
    )
}