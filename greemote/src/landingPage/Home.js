import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';

import EcoIcon from '@material-ui/icons/Eco';
import AttachMoneyIcon from '@material-ui/icons/AttachMoney';
import WorkOutlineIcon from '@material-ui/icons/WorkOutline';

import bck from "../images/greemote_bck_pic.png";

const useStyles = makeStyles((theme) => ({
    root: {
        height: "100%",
        margin: "0",
        padding: "0",
        textAlign: "center",
    },
    upper: {
        height: "320px",
        color: "#EEECE5",
    },
    pictureUpper: {
        position: "absolute",
        left: "0",
        top: "0",
        width: "100%",
        height: "320px",
        opacity: "0.8",
        zIndex: -1,
    },
    textGroupUpper: {
        padding: "40px",
        opacity: "1",
    },
    textUpper1: {
        textShadow: "2px 2px 8px black",
    },
    textUpper2: {
        fontFamily: "Brush Script MT, Brush Script Std, cursive",
        textShadow: "2px 2px 8px black",
    },
    down: {
        width: "100%",
        color: "#80604D",
    },
    icons: {
        fontSize: "50px",
    }
}));

export default function Home() {
    const classes = useStyles();

    return (
        <div className={classes.root} >
            <div className={classes.upper}>
              <img src={bck} className={classes.pictureUpper} />
              <div className={classes.textGroupUpper}>
                <Typography variant="h2" component="h3" className={classes.textUpper1} >
                  BOOK YOUR WORKSPACE
                </Typography>
                <Typography variant="h4" component="h4" className={classes.textUpper2} >
                  In respect with the environment
                </Typography>
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
                        <Typography variant="body2">
                            Work at lower cost, in a space booked last minute.
                        </Typography>
                    </Grid>
                </Grid>
            </div>
        </div>
    )
}