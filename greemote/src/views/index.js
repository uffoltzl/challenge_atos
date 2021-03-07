import { useState } from "react";
import { useHistory } from "react-router-dom";
import { makeStyles } from "@material-ui/core/styles";

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
  FormLabel,
} from "@material-ui/core";

import useMediaQuery from "@material-ui/core/useMediaQuery";
import { useTheme } from "@material-ui/core/styles";

import EcoIcon from "@material-ui/icons/Eco";
import AttachMoneyIcon from "@material-ui/icons/AttachMoney";
import WorkOutlineIcon from "@material-ui/icons/WorkOutline";

import bck from "../static/images/greemote_bck_pic.png";
import Colors from "../static/Colors";
import users from "../static/Users";
import PROFILE from "../static/Profiles";

const useStyles = makeStyles((theme) => ({
  root: {
    position: "absolute",
    backgroundColor: Colors.LightBrown,
    height: "100vh",
    margin: "0",
    padding: "0",
    textAlign: "center",
    width: "100%",
    zIndex: -2,
  },
  upper: {
    height: "320px",
    color: Colors.NaturalWhite,
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
    color: Colors.DarkBrown,
  },
  spaceElement: {
    padding: "20px",
  },
  icons: {
    fontSize: "50px",
  },
}));

function AuthDialog({ open, onClose }) {
  const history = useHistory();
  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down("sm"));

  const [login, setLogin] = useState("");
  const [pwd, setPwd] = useState("");
  const [role, setRole] = useState("workspace");
  const [isSignUp, setIsSignUp] = useState(false);
  const [error, setError] = useState(false);

  function updateLogin(event) {
    setError(false);
    setLogin(event.target.value);
  }

  function updatePwd(event) {
    setError(false);
    setPwd(event.target.value);
  }

  function handleClick() {
    var found = false;
    var i;
    for (i in users) {
      const user = users[i];
      if (user.login === login && user.pwd === pwd) {
        found = true;
        break;
      }
    }
    if (found) {
      localStorage.setItem("userId", i);
      if (users[i].role.type === PROFILE.EMPLOYEE) {
        history.push("/working-spaces");
      } else {
        const workspaceId = users[i].role.space_id;
        localStorage.setItem("workspaceId", workspaceId);
        history.push("/working-spaces/" + workspaceId);
      }
    } else {
      setError(true);
    }
  }

  function handleClickSignUp() {
    if (isSignUp) {
      history.push("/working-spaces");
    } else {
      setIsSignUp(true);
    }
  }

  function handleClose() {
    setIsSignUp(false);
    onClose();
  }

  return (
    <Dialog
      fullScreen={fullScreen}
      open={open}
      onClose={handleClose}
      aria-labelledby="responsive-dialog-title"
    >
      <DialogTitle id="responsive-dialog-title">{"Login"}</DialogTitle>
      <DialogContent>
        {error ? (
          <Typography style={{ color: "red" }}>
            Verify your login and password
          </Typography>
        ) : null}
        <TextField
          autoFocus
          id="enter_login"
          label="Login"
          fullWidth
          onChange={updateLogin}
          error={error}
        />
        <TextField
          autoFocus
          id="enter_pwd"
          label="Password"
          type="password"
          fullWidth
          onChange={updatePwd}
          error={error}
        />

        {isSignUp ? (
          <FormControl component="fieldset" style={{ margin: "10px" }}>
            <FormLabel component="legend">You are:</FormLabel>
            <RadioGroup
              aria-label="role"
              name="role"
              value={role}
              onChange={(event) => setRole(event.target.value)}
            >
              <FormControlLabel
                value="workspace"
                control={<Radio />}
                label="Workspace manager"
              />
              <FormControlLabel
                value="employee"
                control={<Radio />}
                label="Employee"
              />
            </RadioGroup>
          </FormControl>
        ) : null}
      </DialogContent>
      <DialogActions>
        <Button
          autoFocus
          onClick={handleClickSignUp}
          variant="outlined"
          color="secondary"
        >
          Sign Up
        </Button>

        {isSignUp ? null : (
          <Button
            onClick={handleClick}
            variant="outlined"
            color="secondary"
            autoFocus
          >
            Sign In
          </Button>
        )}
      </DialogActions>
    </Dialog>
  );
}

function Home() {
  const history = useHistory();
  const classes = useStyles();
  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down("sm"));

  const [dialog, setDialog] = useState(false);

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
          <Typography
            variant="h2"
            component="h3"
            className={classes.textUpper1}
          >
            BOOK YOUR WORKSPACE
          </Typography>
          <Typography
            variant="h4"
            component="h4"
            className={classes.textUpper2}
          >
            In respect with the environment
          </Typography>
          <Button variant="contained" size="large" onClick={open}>
            Login
          </Button>
          <AuthDialog open={dialog} onClose={handleClose} />
        </div>
      </div>
      <div className={classes.down}>
        <Grid container alignContent="center" justify="center" spacing={0}>
          <Grid item xs={3} className={classes.spaceElement}>
            <WorkOutlineIcon className={classes.icons} />
            <Typography variant="body2">
              Work in a space dedicated environment, where efficiency is a key
              element.
            </Typography>
          </Grid>
          <Grid item xs={3} className={classes.spaceElement}>
            <EcoIcon className={classes.icons} />
            <Typography variant="body2">
              Work in a space near your domicile, in order to reduce your carbon
              emissions.
            </Typography>
          </Grid>
          <Grid item xs={3} className={classes.spaceElement}>
            <AttachMoneyIcon className={classes.icons} />
            <Typography variant="body2">
              Work at lower cost, in a space booked last minute.
            </Typography>
          </Grid>
        </Grid>
      </div>
    </div>
  );
}

export default Home;
