import TopBar from '../components/layouts/TopBar';

function DefaultLayout({ children }) {
	return (
		<div>
			<TopBar />
			{children}
		</div>
	);
}
export default DefaultLayout;
