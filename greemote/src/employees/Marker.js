import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import classNames from 'classnames';

import Colors from '../Colors';

const K_HEIGHT = 30;

const useStyles = makeStyles((theme) => ({
    marker: {
        position: 'absolute',
        backgroundColor: Colors.NaturalWhite,
        textAlign: 'center',
        color: "black",
        fontSize: 16,
        fontWeight: 'bold',
    },
    markerNormal: {
        padding: "5px",
        border: '3px solid black',
        borderRadius: K_HEIGHT/4,
    },
    markerHover: {
        padding: "10px",
        border: '3px solid #f44336',
        borderRadius: K_HEIGHT + 10,
    }
}));

export default function Marker(props) {
    const classes = useStyles();
    const [isHover, setIsHover] = React.useState(false);

    const startHover = () => {
        setIsHover(true);
    }

    const stopHover = () => {
        setIsHover(false);
    }

    const handleClick = () => {
        console.log("ok");
        // GOTO page de la salle associée
    }

    return (
        <div 
            className={classNames(classes.marker, isHover ? classes.markerHover : classes.markerNormal)} 
            onMouseEnter={startHover} 
            onMouseLeave={stopHover}
            onClick={handleClick}
        >
            {props.text}
        </div>
    );
}