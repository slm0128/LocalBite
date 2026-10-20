import type { DemoUser } from './types.js';

export const DEMO_USERS: DemoUser[] = [
	{
		id: '1',
		name: 'Klara König',
		email: 'kunde@demo.de',
		password: 'demo123',
		role: 'kunde'
	},
	{
		id: '2',
		name: 'Lukas Lehmann',
		email: 'info@hof-sonnenfeld.de',
		password: 'demo123',
		role: 'landwirt',
		companyName: 'Hof Sonnenfeld'
	},
	{
		id: '3',
		name: 'Felix Fischer',
		email: 'fahrer@localbite.de',
		password: 'demo123',
		role: 'fahrer'
	},
	{
		id: '4',
		name: 'Diana Dietrich',
		email: 'disposition@localbite.de',
		password: 'demo123',
		role: 'disposition'
	}
];
