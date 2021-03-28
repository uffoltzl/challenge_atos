import TopBar from "../components/layouts/TopBar";
import { makeStyles } from "@material-ui/core/styles";

import Colors from "../static/Colors";

const useStyles = makeStyles((theme) => ({
  root: {
    backgroundColor: Colors.LightBrown,
    height: "100vh",
  },
}));

function DefaultLayout({ children }) {
  const styles = useStyles();
  return (
    <div className={styles.root}>
      <TopBar />
      {children}
    </div>
  );
}
export default DefaultLayout;
