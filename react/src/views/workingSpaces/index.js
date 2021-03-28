import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import { useHistory } from "react-router-dom";
import classNames from "classnames";
import GoogleMap from "google-map-react";
import Colors from "../../static/Colors";
import WorkingSpacesPoints from "../../static/WorkingSpacesPoints";
import users from "../../static/Users";
import PROFILE from "../../static/Profiles";

const K_HEIGHT = 30;

const useStyles = makeStyles((theme) => ({
  marker: {
    position: "absolute",
    backgroundColor: Colors.NaturalWhite,
    textAlign: "center",
    color: "black",
    fontSize: 16,
    fontWeight: "bold",
  },
  markerNormal: {
    padding: "5px",
    border: "3px solid black",
    borderRadius: K_HEIGHT / 4,
  },
  markerHover: {
    padding: "10px",
    border: "3px solid #f44336",
    borderRadius: K_HEIGHT + 10,
  },
}));

function Marker({ workingSpace }) {
  const classes = useStyles();
  const history = useHistory();
  const [isHover, setIsHover] = React.useState(false);

  const startHover = () => {
    setIsHover(true);
  };

  const stopHover = () => {
    setIsHover(false);
  };

  const handleClick = () => {
    history.push("/working-spaces/" + workingSpace.id);
    // GOTO page de la salle associée
  };

  return (
    <div
      className={classNames(
        classes.marker,
        isHover ? classes.markerHover : classes.markerNormal
      )}
      onMouseEnter={startHover}
      onMouseLeave={stopHover}
      onClick={handleClick}
    >
      {workingSpace.name}
    </div>
  );
}

function WorkingSpaces() {
  const history = useHistory();

  var center;
  const userId = localStorage.getItem("userId");
  if (userId === undefined || userId === null) {
    return null;
  } else {
    const id = parseInt(userId);
    if (users[id].role.type === PROFILE.WORKSPACE) {
      return null;
    } else {
      center = users[id].role.address;
    }
  }
  const zoom = 13;

  return (
    <div style={{ height: "85vh" }}>
      <GoogleMap center={center} zoom={zoom}>
        {Object.keys(WorkingSpacesPoints).map((workingSpaceId) => (
          <Marker
            key={workingSpaceId}
            lat={WorkingSpacesPoints[workingSpaceId].lat}
            lng={WorkingSpacesPoints[workingSpaceId].lng}
            workingSpace={WorkingSpacesPoints[workingSpaceId]}
          />
        ))}
      </GoogleMap>
    </div>
  );
}

export default WorkingSpaces;
