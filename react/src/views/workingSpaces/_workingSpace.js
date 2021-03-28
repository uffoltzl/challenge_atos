import { makeStyles } from "@material-ui/core/styles";
import {
  Grid,
  Typography,
  GridList,
  GridListTile,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
  Divider,
} from "@material-ui/core";
import { StarBorder, PlayCircleFilledOutlined } from "@material-ui/icons";

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
    flexWrap: "wrap",
    justifyContent: "space-around",
    overflow: "hidden",
    backgroundColor: theme.palette.background.paper,
  },
  gridList: {
    flexWrap: "nowrap",
    // Promote the list into his own layer on Chrome. This cost memory but helps keeping high FPS.
    transform: "translateZ(0)",
  },
  titleBar: {
    background:
      "linear-gradient(to top, rgba(0,0,0,0.7) 0%, rgba(0,0,0,0.3) 70%, rgba(0,0,0,0) 100%)",
  },
}));

function SingleLineGridList() {
  const classes = useStyles();

  const tileData = [
    {
      img: "/workspaces/1.jpg",
    },
    {
      img: "/workspaces/2.jpg",
    },
    {
      img: "/workspaces/3.jpg",
    },
    {
      img: "/workspaces/4.jpg",
    },
    {
      img: "/workspaces/5.jpg",
    },
  ];

  return (
    <div className={classes.root}>
      <GridList className={classes.gridList} cols={2.5}>
        {tileData.map((tile) => (
          <GridListTile key={tile.img}>
            <img src={tile.img} alt={tile.title} />
          </GridListTile>
        ))}
      </GridList>
    </div>
  );
}

function InfoList({ infos }) {
  return (
    <div>
      <List>
        {infos.map((info) => (
          <ListItem key={info}>
            <ListItemIcon>
              <StarBorder />
            </ListItemIcon>
            <ListItemText primary={info} />
          </ListItem>
        ))}
      </List>
    </div>
  );
}

function WorkspaceInfo() {
  const infos = [
    "Fibre optique",
    "Distributeur de boisson",
    "Espace fumeur",
    "Parking",
    "Espace vert",
  ];

  return (
    <>
      <Typography variant="h5">Info</Typography>
      <Grid container>
        <Grid item xs={12} sm={6}>
          <InfoList infos={infos} />
        </Grid>
        <Grid item xs={12} sm={6}>
          <InfoList infos={infos} />
        </Grid>
      </Grid>
    </>
  );
}
function MeansOfTransportInfo() {
  const firstColumn = [
    "Voiture - 0.75kg Co2 - 23 min",
    "Scooter - 0.65kg Co2 - 25 min",
  ];

  const secondColumn = [
    "Vélo - 15 min",
    "Trotinette - 12 min",
    "Marche à pied - 50 min",
  ];

  return (
    <>
      <Typography variant="h5">Moyens de transport</Typography>
      <Grid container>
        <Grid item xs={12} sm={6}>
          <InfoList infos={secondColumn} />
        </Grid>
        <Grid item xs={12} sm={6}>
          <InfoList infos={firstColumn} />
        </Grid>
      </Grid>
    </>
  );
}

function TimeSlots() {
  const slots = [
    {
      slot: "14h00 - 15h00",
      price: "1.20€",
    },
    {
      slot: "15h00 - 16h00",
      price: "1.20€",
    },
    {
      slot: "16h00 - 17h00",
      price: "1.20€",
    },
  ];

  return (
    <div>
      <Typography variant="h5">Les horaires disponibles</Typography>
      <List>
        {slots.map(({ slot, price }) => (
          <ListItem key={slot} button>
            <ListItemIcon>
              <PlayCircleFilledOutlined />
            </ListItemIcon>
            <ListItemText primary={slot + " : " + price} />
          </ListItem>
        ))}
      </List>
    </div>
  );
}

function WorkingSpace() {
  return (
    <>
      <SingleLineGridList />
      <Typography variant="h2">Greemote Paris</Typography>
      <TimeSlots />
      <MeansOfTransportInfo />
      <WorkspaceInfo />
    </>
  );
}

export default WorkingSpace;
