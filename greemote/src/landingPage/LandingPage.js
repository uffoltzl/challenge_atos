import React from 'react';
import PropTypes from 'prop-types';
import SwipeableViews from 'react-swipeable-views';
import { makeStyles, useTheme } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';
import Typography from '@material-ui/core/Typography';
import Box from '@material-ui/core/Box';
import Avatar from '@material-ui/core/Avatar';
import Grid from '@material-ui/core/Grid';

import Home from './Home';

import Logo from '../images/greemote_profil_pic.png';
import Work from './Work';
import Contact from './Contact';

function TabPanel(props) {
  const { children, value, index, ...other } = props;

  return (
    <div
      role="tabpanel"
      hidden={value !== index}
      id={`full-width-tabpanel-${index}`}
      aria-labelledby={`full-width-tab-${index}`}
      {...other}
    >
      {value === index && (
        <Box p={3}>
          <Typography>{children}</Typography>
        </Box>
      )}
    </div>
  );
}

TabPanel.propTypes = {
  children: PropTypes.node,
  index: PropTypes.any.isRequired,
  value: PropTypes.any.isRequired,
};

function a11yProps(index) {
  return {
    id: `full-width-tab-${index}`,
    'aria-controls': `full-width-tabpanel-${index}`,
  };
}

const useStyles = makeStyles((theme) => ({
  root: {
    backgroundColor: "#E9D4B7",
    height: "100vh",
  },
  header: {
    backgroundColor: "#80604D",
    color: "#E9D4B7"
  },
  logo: {
      margin: 10,
  },
}));

export default function LandingPage() {
  const classes = useStyles();
  const theme = useTheme();
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };

  const handleChangeIndex = (index) => {
    setValue(index);
  };

  return (
    <div className={classes.root}>
      <AppBar position="static" color="default" className={classes.header}>
        <Grid container spacing={0} justify="center">
          <Grid item>
            <Avatar className={classes.logo} alt="Logo" src={Logo} />
          </Grid>
          <Grid item xs={11}>
            <Tabs
              value={value}
              onChange={handleChange}
              variant="fullWidth"
              aria-label="full width tabs example"
            >
              <Tab label="Home" {...a11yProps(0)} />
              <Tab label="Work" {...a11yProps(1)} />
              <Tab label="Contact" {...a11yProps(2)} />
            </Tabs>
          </Grid>
        </Grid>
      </AppBar>
      <SwipeableViews
        axis={theme.direction === 'rtl' ? 'x-reverse' : 'x'}
        index={value}
        onChangeIndex={handleChangeIndex}
      >
        <TabPanel value={value} index={0} dir={theme.direction}>
          <Home />
        </TabPanel>
        <TabPanel value={value} index={1} dir={theme.direction}>
          <Work />
        </TabPanel>
        <TabPanel value={value} index={2} dir={theme.direction}>
          <Contact />
        </TabPanel>
      </SwipeableViews>
    </div>
  );
}
