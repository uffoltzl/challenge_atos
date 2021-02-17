import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogTitle from '@material-ui/core/DialogTitle';
import DialogContent from '@material-ui/core/DialogContent';
import useMediaQuery from '@material-ui/core/useMediaQuery';
import { useTheme } from '@material-ui/core/styles';
import TextField from '@material-ui/core/TextField';
import Radio from '@material-ui/core/Radio';
import RadioGroup from '@material-ui/core/RadioGroup';
import FormControlLabel from '@material-ui/core/FormControlLabel';
import FormControl from '@material-ui/core/FormControl';
import FormLabel from '@material-ui/core/FormLabel';

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
    const [open, setOpen] = React.useState(false);
    const [isSignUp, setIsSignUp] = React.useState(false);
    const theme = useTheme();
    const fullScreen = useMediaQuery(theme.breakpoints.down('sm'));
    const [actor, setActor] = React.useState('workspace');

    const handleChangeRadio = (event) => {
        setActor(event.target.value);
      };
  
    const handleClickOpen = () => {
      setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
        setIsSignUp(false);
    };

    const handleLogin = () => {
        window.location.href = "/employee";
    }

    const handleSignUp = () => {
        if(isSignUp){
            if(actor === "workspace"){
                window.location.href = "/workspace";
            }
            else {
                window.location.href = "/employee";
            }
        }
        else {
            setIsSignUp(true);
        }
    }

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
                <Button variant="contained" size="large" onClick={handleClickOpen}>
                  Login
                </Button>
                <Dialog
                    fullScreen={fullScreen}
                    open={open}
                    onClose={handleClose}
                    aria-labelledby="responsive-dialog-title"
                >
                    <DialogTitle id="responsive-dialog-title">{"Login"}</DialogTitle>
                    <DialogContent>
                        <TextField
                            autoFocus
                            id="enter_login"
                            label="Login"
                            fullWidth
                            onInput = {(e) =>{
                                e.target.value = e.target.value.slice(0,10)
                            }}
                        />
                        <TextField
                            autoFocus
                            id="enter_pwd"
                            label="Password"
                            type="password"
                            fullWidth
                            onInput = {(e) =>{
                                e.target.value = e.target.value.slice(0,10)
                            }}
                        />
                        {isSignUp ?
                            <div>
                                <FormControl component="fieldset" style={{margin: "10px"}}>
                                    <FormLabel component="legend">You are:</FormLabel>
                                    <RadioGroup aria-label="actor" name="actor" value={actor} onChange={handleChangeRadio}>
                                        <FormControlLabel value="workspace" control={<Radio />} label="Workspace" />
                                        <FormControlLabel value="employee" control={<Radio />} label="Employee" />
                                    </RadioGroup>
                                </FormControl>
                            </div> : null
                        }
                    </DialogContent>
                    <DialogActions>
                        <Button autoFocus onClick={handleSignUp} variant="outlined" color="secondary">
                            Sign Up
                        </Button>
                        {isSignUp ? null :
                            <Button onClick={handleLogin} variant="outlined" color="secondary" autoFocus>
                                Sign In
                            </Button>
                        }
                    </DialogActions>
                </Dialog>
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