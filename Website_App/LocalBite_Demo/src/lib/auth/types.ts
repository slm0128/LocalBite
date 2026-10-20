export type UserRole = 'kunde' | 'landwirt' | 'fahrer' | 'disposition';

export interface DemoUser {
	id: string;
	name: string;
	email: string;
	password: string;
	role: UserRole;
	companyName?: string;
}

export interface SessionData {
	id: string;
	name: string;
	email: string;
	role: UserRole;
	companyName?: string;
}
