import PROFILE from './Profiles';

const users = [
	{
		id: 1,
		login: 'lucie',
		pwd: 'mdp',
        role: {
            type: PROFILE.WORKSPACE,
            space_id: 1,
        }
	},
	{
		id: 2,
		login: 'louis',
		pwd: 'mdp',
        role: {
            type: PROFILE.EMPLOYEE,
            address: [ 48.856627, 2.337758102615535 ]
        }
	}
];

export default users;
