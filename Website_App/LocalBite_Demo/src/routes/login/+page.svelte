<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import { auth, roleToPath } from '#lib/auth/auth.svelte';
	import type { RouteId } from '$app/types';

	let email = $state('');
	let password = $state('');
	let error = $state('');
	let loading = $state(false);

	onMount(() => {
		if (auth.isLoggedIn && auth.session) {
			goto(resolve(roleToPath(auth.session.role) as RouteId));
		}
	});

	async function handleSubmit(event: SubmitEvent) {
		event.preventDefault();
		if (!email.trim() || !password.trim()) {
			error = 'Bitte alle Felder ausfüllen.';
			return;
		}
		loading = true;
		error = '';

		const result = auth.login(email, password);

		if (result.success && auth.session) {
			await goto(resolve(roleToPath(auth.session.role) as RouteId));
		} else {
			error = result.error ?? 'Anmeldung fehlgeschlagen.';
			loading = false;
		}
	}
</script>

<svelte:head>
	<title>Anmelden – LocalBite</title>
</svelte:head>

<div class="flex min-h-screen flex-col bg-stone-50">
	<!-- Header -->
	<header class="border-b border-stone-100 bg-white">
		<div class="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
			<a href={resolve('/')} class="flex items-center gap-2.5 no-underline">
				<div
					class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-lg bg-emerald-600"
				>
					<span class="text-xs font-bold tracking-tight text-white">LB</span>
				</div>
				<span class="text-lg font-semibold tracking-tight text-stone-800">LocalBite</span>
			</a>
			<a href={resolve('/')} class="text-sm text-stone-400 transition hover:text-stone-600">
				← Zurück zur Startseite
			</a>
		</div>
	</header>

	<!-- Login card -->
	<main class="flex flex-grow items-center justify-center px-6 py-16">
		<div class="w-full max-w-sm">
			<!-- Brand mark -->
			<div class="mb-8 text-center">
				<div
					class="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-2xl bg-emerald-600 shadow-lg shadow-emerald-200"
				>
					<span class="text-xl font-bold tracking-tight text-white">LB</span>
				</div>
				<h1 class="text-2xl font-bold tracking-tight text-stone-800">Willkommen zurück</h1>
				<p class="mt-1 text-sm text-stone-500">Melde dich mit deinem LocalBite-Konto an.</p>
			</div>

			<!-- Form -->
			<div class="rounded-2xl border border-stone-200 bg-white p-8 shadow-sm">
				<form onsubmit={handleSubmit} class="space-y-5">
					<div>
						<label for="email" class="mb-1.5 block text-sm font-medium text-stone-700">
							E-Mail-Adresse
						</label>
						<input
							id="email"
							type="email"
							bind:value={email}
							placeholder="deine@email.de"
							autocomplete="email"
							class="w-full rounded-xl border border-stone-200 bg-stone-50 px-4 py-3 text-sm text-stone-800 placeholder-stone-400 transition focus:border-emerald-500 focus:bg-white focus:ring-2 focus:ring-emerald-500/20 focus:outline-none"
						/>
					</div>

					<div>
						<label for="password" class="mb-1.5 block text-sm font-medium text-stone-700">
							Passwort
						</label>
						<input
							id="password"
							type="password"
							bind:value={password}
							placeholder="••••••••"
							autocomplete="current-password"
							class="w-full rounded-xl border border-stone-200 bg-stone-50 px-4 py-3 text-sm text-stone-800 placeholder-stone-400 transition focus:border-emerald-500 focus:bg-white focus:ring-2 focus:ring-emerald-500/20 focus:outline-none"
						/>
					</div>

					{#if error}
						<div class="flex items-start gap-2.5 rounded-xl border border-red-200 bg-red-50 p-3.5">
							<svg
								viewBox="0 0 20 20"
								fill="currentColor"
								class="mt-0.5 h-4 w-4 flex-shrink-0 text-red-500"
							>
								<path
									fill-rule="evenodd"
									d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.28 7.22a.75.75 0 00-1.06 1.06L8.94 10l-1.72 1.72a.75.75 0 101.06 1.06L10 11.06l1.72 1.72a.75.75 0 101.06-1.06L11.06 10l1.72-1.72a.75.75 0 00-1.06-1.06L10 8.94 8.28 7.22z"
									clip-rule="evenodd"
								/>
							</svg>
							<span class="text-sm text-red-700">{error}</span>
						</div>
					{/if}

					<button
						type="submit"
						disabled={loading}
						class="w-full rounded-xl bg-emerald-600 px-4 py-3 text-sm font-semibold text-white shadow-sm transition hover:bg-emerald-700 focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 focus:outline-none disabled:cursor-not-allowed disabled:opacity-60"
					>
						{#if loading}
							<span class="flex items-center justify-center gap-2">
								<svg class="h-4 w-4 animate-spin" viewBox="0 0 24 24" fill="none">
									<circle
										class="opacity-25"
										cx="12"
										cy="12"
										r="10"
										stroke="currentColor"
										stroke-width="4"
									></circle>
									<path
										class="opacity-75"
										fill="currentColor"
										d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"
									></path>
								</svg>
								Wird angemeldet …
							</span>
						{:else}
							Anmelden
						{/if}
					</button>
				</form>
			</div>

			<!-- Hint -->
			<p class="mt-6 text-center text-xs text-stone-400">
				Dies ist eine Präsentations-Demo. Keine echten Zugangsdaten verwenden.
			</p>
		</div>
	</main>

	<footer class="border-t border-stone-100 bg-white">
		<div
			class="mx-auto flex max-w-6xl items-center justify-center px-6 py-5 text-sm text-stone-400"
		>
			<span>LocalBite · Nachhaltig · Regional · Transparent</span>
		</div>
	</footer>
</div>
