import { browser } from '$app/env';
import type { SessionData, UserRole } from './types.js';
import { DEMO_USERS } from './users.js';

const SESSION_KEY = 'localbite_demo_session';

function loadSession(): SessionData | null {
	if (!browser) return null;
	try {
		const raw = localStorage.getItem(SESSION_KEY);
		if (!raw) return null;
		const data = JSON.parse(raw) as SessionData;
		if (!data.id || !data.name || !data.email || !data.role) return null;
		return data;
	} catch {
		return null;
	}
}

function saveSession(session: SessionData | null): void {
	if (!browser) return;
	if (session) {
		localStorage.setItem(SESSION_KEY, JSON.stringify(session));
	} else {
		localStorage.removeItem(SESSION_KEY);
	}
}

let _session = $state<SessionData | null>(loadSession());

export const auth = {
	get session(): SessionData | null {
		return _session;
	},

	get isLoggedIn(): boolean {
		return _session !== null;
	},

	login(email: string, password: string): { success: boolean; error?: string } {
		const user = DEMO_USERS.find(
			(u) => u.email.toLowerCase() === email.toLowerCase() && u.password === password
		);
		if (!user) {
			return { success: false, error: 'E-Mail oder Passwort ist falsch.' };
		}
		const session: SessionData = {
			id: user.id,
			name: user.name,
			email: user.email,
			role: user.role,
			...(user.companyName !== undefined ? { companyName: user.companyName } : {})
		};
		_session = session;
		saveSession(session);
		return { success: true };
	},

	logout(): void {
		_session = null;
		saveSession(null);
	},

	switchTo(userId: string): void {
		const user = DEMO_USERS.find((u) => u.id === userId);
		if (!user) return;
		const session: SessionData = {
			id: user.id,
			name: user.name,
			email: user.email,
			role: user.role,
			...(user.companyName !== undefined ? { companyName: user.companyName } : {})
		};
		_session = session;
		saveSession(session);
	}
};

export function roleToPath(role: UserRole): string {
	return `/${role}`;
}

export function getGreeting(): string {
	// eslint-disable-next-line svelte/prefer-svelte-reactivity
	const hour = new Date().getHours();
	if (hour >= 5 && hour < 12) return 'Guten Morgen';
	if (hour < 18) return 'Guten Tag';
	return 'Guten Abend';
}
