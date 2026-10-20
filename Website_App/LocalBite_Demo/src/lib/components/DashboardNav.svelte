<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import { browser } from '$app/env';
	import { auth, roleToPath } from '#lib/auth/auth.svelte';
	import { DEMO_USERS } from '#lib/auth/users';
	import type { UserRole } from '#lib/auth/types';
	import type { RouteId } from '$app/types';

	interface Props {
		role: UserRole;
	}

	let { role }: Props = $props();

	const roleLabels: Record<UserRole, string> = {
		kunde: 'Kunde',
		landwirt: 'Landwirt',
		fahrer: 'Fahrer',
		disposition: 'Disposition'
	};

	const roleBadgeClasses: Record<UserRole, string> = {
		kunde: 'bg-emerald-100 text-emerald-700',
		landwirt: 'bg-lime-100 text-lime-700',
		fahrer: 'bg-orange-100 text-orange-700',
		disposition: 'bg-sky-100 text-sky-700'
	};

	const PRES_KEY = 'localbite_presentation_mode';

	function loadPresentationMode(): boolean {
		if (!browser) return true;
		const raw = localStorage.getItem(PRES_KEY);
		return raw === null ? true : raw === 'true';
	}

	let menuOpen = $state(false);
	let presentationMode = $state(loadPresentationMode());

	function togglePresentationMode() {
		presentationMode = !presentationMode;
		if (browser) {
			localStorage.setItem(PRES_KEY, String(presentationMode));
		}
	}

	function getFirstName(name: string): string {
		return name.split(' ')[0];
	}

	async function handleLogout() {
		auth.logout();
		await goto(resolve('/'));
	}

	async function handleSwitch(userId: string) {
		auth.switchTo(userId);
		menuOpen = false;
		const session = auth.session;
		if (session) {
			await goto(resolve(roleToPath(session.role) as RouteId));
		}
	}

	onMount(() => {
		presentationMode = loadPresentationMode();

		function handleClickOutside() {
			menuOpen = false;
		}
		document.addEventListener('click', handleClickOutside);
		return () => document.removeEventListener('click', handleClickOutside);
	});
</script>

<header class="sticky top-0 z-20 border-b border-stone-100 bg-white shadow-sm">
	<div class="mx-auto flex max-w-7xl items-center justify-between px-6 py-3">
		<a href={resolve('/')} class="flex items-center gap-2.5 no-underline">
			<div class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-lg bg-emerald-600">
				<span class="text-xs font-bold tracking-tight text-white">LB</span>
			</div>
			<span class="text-lg font-semibold tracking-tight text-stone-800">LocalBite</span>
		</a>

		<div class="flex items-center gap-3">
			<span
				class="hidden rounded-full px-3 py-1 text-xs font-semibold sm:inline-block {roleBadgeClasses[
					role
				]}"
			>
				{roleLabels[role]}
			</span>

			{#if auth.session}
				<!-- Wrap in div; stopPropagation prevents document click from closing the menu -->
				<div class="relative" onclick={(e) => e.stopPropagation()} role="none">
					<button
						onclick={() => (menuOpen = !menuOpen)}
						class="flex items-center gap-2 rounded-xl border border-stone-200 bg-stone-50 px-3 py-2 text-sm font-medium text-stone-700 transition hover:bg-stone-100"
					>
						<div
							class="flex h-7 w-7 flex-shrink-0 items-center justify-center rounded-full bg-emerald-600 text-xs font-bold text-white"
						>
							{auth.session.name[0]}
						</div>
						<span class="hidden sm:inline">{getFirstName(auth.session.name)}</span>
						<svg viewBox="0 0 20 20" fill="currentColor" class="h-4 w-4 text-stone-400">
							<path
								fill-rule="evenodd"
								d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z"
								clip-rule="evenodd"
							/>
						</svg>
					</button>

					{#if menuOpen}
						<div
							class="absolute top-full right-0 mt-2 w-72 rounded-2xl border border-stone-200 bg-white p-1 shadow-xl"
						>
							<!-- User info -->
							<div class="px-4 py-3">
								<div class="font-semibold text-stone-800">{auth.session.name}</div>
								<div class="text-xs text-stone-500">{auth.session.email}</div>
								{#if auth.session.companyName}
									<div class="mt-0.5 text-xs text-stone-400">{auth.session.companyName}</div>
								{/if}
							</div>

							<div class="my-1 border-t border-stone-100"></div>

							<!-- Präsentationsmodus toggle -->
							<div class="px-4 py-2.5">
								<div class="flex items-center justify-between">
									<span class="text-sm text-stone-700">Präsentationsmodus</span>
									<button
										onclick={togglePresentationMode}
										class="relative inline-flex h-5 w-9 flex-shrink-0 cursor-pointer items-center rounded-full transition-colors focus:outline-none {presentationMode
											? 'bg-amber-500'
											: 'bg-stone-200'}"
										aria-pressed={presentationMode}
										aria-label="Präsentationsmodus umschalten"
									>
										<span
											class="inline-block h-3.5 w-3.5 transform rounded-full bg-white shadow transition-transform {presentationMode
												? 'translate-x-[18px]'
												: 'translate-x-[3px]'}"
										></span>
									</button>
								</div>
							</div>

							{#if presentationMode}
								<div class="my-1 border-t border-stone-100"></div>

								<!-- Demo switcher -->
								<div class="mx-1 mb-1 rounded-xl border border-amber-200 bg-amber-50 p-2">
									<div class="mb-2 flex items-center gap-1.5 px-1">
										<span class="text-xs font-bold tracking-wider text-amber-700 uppercase"
											>Demo-Modus</span
										>
										<span
											class="rounded bg-amber-200 px-1.5 py-0.5 text-xs font-semibold text-amber-800"
											>Präsentation</span
										>
									</div>
									<div class="space-y-0.5">
										{#each DEMO_USERS as user (user.id)}
											<button
												onclick={() => handleSwitch(user.id)}
												class="flex w-full items-center gap-2.5 rounded-lg px-2 py-2 text-left text-sm transition hover:bg-amber-100 {auth
													.session.id === user.id
													? 'bg-amber-100'
													: ''}"
											>
												<div
													class="flex h-6 w-6 flex-shrink-0 items-center justify-center rounded-full bg-amber-300 text-xs font-bold text-amber-900"
												>
													{user.name[0]}
												</div>
												<div class="min-w-0 grow">
													<div
														class="truncate text-stone-800 {auth.session.id === user.id
															? 'font-semibold'
															: ''}"
													>
														{user.name}
													</div>
													<div class="text-xs text-stone-500">{roleLabels[user.role]}</div>
												</div>
												{#if auth.session.id === user.id}
													<svg
														viewBox="0 0 20 20"
														fill="currentColor"
														class="h-4 w-4 flex-shrink-0 text-amber-600"
													>
														<path
															fill-rule="evenodd"
															d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z"
															clip-rule="evenodd"
														/>
													</svg>
												{/if}
											</button>
										{/each}
									</div>
								</div>
							{/if}

							<div class="my-1 border-t border-stone-100"></div>

							<!-- Logout -->
							<button
								onclick={handleLogout}
								class="flex w-full items-center gap-2 rounded-xl px-4 py-2.5 text-sm text-red-600 transition hover:bg-red-50"
							>
								<svg viewBox="0 0 20 20" fill="currentColor" class="h-4 w-4">
									<path
										fill-rule="evenodd"
										d="M3 4.25A2.25 2.25 0 015.25 2h5.5A2.25 2.25 0 0113 4.25v2a.75.75 0 01-1.5 0v-2a.75.75 0 00-.75-.75h-5.5a.75.75 0 00-.75.75v11.5c0 .414.336.75.75.75h5.5a.75.75 0 00.75-.75v-2a.75.75 0 011.5 0v2A2.25 2.25 0 0110.75 18h-5.5A2.25 2.25 0 013 15.75V4.25z"
										clip-rule="evenodd"
									/>
									<path
										fill-rule="evenodd"
										d="M19 10a.75.75 0 00-.75-.75H8.704l1.048-1.08a.75.75 0 10-1.088-1.032l-2.498 2.569a.75.75 0 000 1.046l2.498 2.569a.75.75 0 101.088-1.032l-1.048-1.081h9.546A.75.75 0 0019 10z"
										clip-rule="evenodd"
									/>
								</svg>
								Abmelden
							</button>
						</div>
					{/if}
				</div>
			{/if}
		</div>
	</div>
</header>
