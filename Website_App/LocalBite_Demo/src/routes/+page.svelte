<script lang="ts">
	import { onMount } from 'svelte';
	import { auth, roleToPath } from '#lib/auth/auth.svelte';
	import { resolve } from '$app/paths';
	import type { RouteId } from '$app/types';

	const benefits = [
		{
			label: 'Regional bestellen',
			description: 'Produkte aus deiner Region – frisch, saisonal und mit kurzen Transportwegen.',
			iconBg: 'bg-emerald-100',
			iconColor: 'text-emerald-600',
			iconPath:
				'M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z'
		},
		{
			label: 'Direkt vom Hof',
			description: 'Kein Zwischenhändler. Du kaufst direkt bei lokalen Höfen und Landwirten.',
			iconBg: 'bg-lime-100',
			iconColor: 'text-lime-600',
			iconPath:
				'M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25'
		},
		{
			label: 'Nachhaltige Lieferung',
			description: 'Optimierte Routen reduzieren Emissionen und sorgen für pünktliche Lieferungen.',
			iconBg: 'bg-sky-100',
			iconColor: 'text-sky-600',
			iconPath:
				'M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 00-3.213-9.193 2.056 2.056 0 00-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 00-10.026 0 1.106 1.106 0 00-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12'
		},
		{
			label: 'Mehrweg & Pfand',
			description: 'Verpackungen im Kreislauf – mit unserem Mehrwegsystem für eine saubere Region.',
			iconBg: 'bg-orange-100',
			iconColor: 'text-orange-600',
			iconPath:
				'M16.023 9.348h4.992v-.001M2.985 19.644v-4.992m0 0h4.992m-4.993 0l3.181 3.183a8.25 8.25 0 0013.803-3.7M4.031 9.865a8.25 8.25 0 0113.803-3.7l3.181 3.182m0-4.991v4.99'
		}
	];

	const badges = ['Vom Hof zur Tür', '100 % Regional', 'Nachhaltige Logistik'];

	let mounted = $state(false);
	onMount(() => {
		mounted = true;
	});

	let dashboardHref = $derived(
		(mounted && auth.isLoggedIn && auth.session
			? roleToPath(auth.session.role)
			: '/login') as RouteId
	);
	let isLoggedIn = $derived(mounted && auth.isLoggedIn);
	let userName = $derived(auth.session?.name.split(' ')[0] ?? '');
</script>

<svelte:head>
	<title>LocalBite – Regionale Lebensmittel, direkt zu dir</title>
	<meta
		name="description"
		content="LocalBite verbindet Kunden, Landwirte und Logistik für eine nachhaltige Lebensmittelversorgung aus der Region."
	/>
</svelte:head>

<div class="flex min-h-screen flex-col bg-white">
	<!-- Navigation -->
	<header class="sticky top-0 z-10 border-b border-stone-100 bg-white">
		<div class="mx-auto flex max-w-7xl items-center justify-between px-6 py-4">
			<div class="flex items-center gap-2.5">
				<div
					class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-lg bg-emerald-600"
				>
					<span class="text-xs font-bold tracking-tight text-white">LB</span>
				</div>
				<span class="text-lg font-semibold tracking-tight text-stone-800">LocalBite</span>
			</div>

			<nav class="flex items-center gap-4">
				<span class="hidden text-sm text-stone-400 sm:block"
					>Regionale Lebensmittel · Nachhaltige Logistik</span
				>
				{#if isLoggedIn}
					<a
						href={resolve(dashboardHref)}
						class="rounded-xl bg-emerald-600 px-4 py-2 text-sm font-semibold text-white shadow-sm transition hover:bg-emerald-700"
					>
						{userName ? `Hallo, ${userName}` : 'Dashboard'}
					</a>
				{:else}
					<a
						href={resolve('/login')}
						class="rounded-xl bg-emerald-600 px-4 py-2 text-sm font-semibold text-white shadow-sm transition hover:bg-emerald-700"
					>
						Anmelden
					</a>
				{/if}
			</nav>
		</div>
	</header>

	<!-- Hero -->
	<section class="bg-gradient-to-br from-emerald-950 to-emerald-800 text-white">
		<div class="mx-auto max-w-4xl px-6 py-20 text-center sm:py-28">
			<h1 class="mb-6 text-4xl leading-tight font-bold tracking-tight sm:text-5xl lg:text-6xl">
				Regionale Lebensmittel.<br class="hidden sm:block" />
				Direkt zu dir.
			</h1>
			<p class="mx-auto max-w-2xl text-lg leading-relaxed text-emerald-100 sm:text-xl">
				LocalBite verbindet Kunden, Landwirte und Logistik – für eine nachhaltige, transparente
				Lebensmittelversorgung aus der Region.
			</p>
			<div class="mt-8 flex flex-wrap items-center justify-center gap-6">
				{#each badges as badge (badge)}
					<span class="flex items-center gap-1.5 text-sm text-emerald-300">
						<svg class="h-4 w-4 flex-shrink-0" viewBox="0 0 20 20" fill="currentColor">
							<path
								fill-rule="evenodd"
								d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z"
								clip-rule="evenodd"
							/>
						</svg>
						{badge}
					</span>
				{/each}
			</div>
			<div class="mt-10">
				<a
					href={resolve('/login')}
					class="inline-flex items-center gap-2 rounded-2xl bg-white px-8 py-3.5 text-base font-semibold text-emerald-800 shadow-lg transition hover:bg-emerald-50"
				>
					Jetzt anmelden
					<svg viewBox="0 0 20 20" fill="currentColor" class="h-5 w-5">
						<path
							fill-rule="evenodd"
							d="M5 10a.75.75 0 01.75-.75h6.638L10.23 7.29a.75.75 0 111.04-1.08l3.5 3.25a.75.75 0 010 1.08l-3.5 3.25a.75.75 0 11-1.04-1.08l2.158-1.96H5.75A.75.75 0 015 10z"
							clip-rule="evenodd"
						/>
					</svg>
				</a>
			</div>
		</div>
	</section>

	<!-- Benefits -->
	<section class="flex-grow bg-stone-50 py-16 sm:py-24">
		<div class="mx-auto max-w-6xl px-6">
			<div class="mb-12 text-center">
				<h2 class="mb-3 text-2xl font-bold text-stone-800 sm:text-3xl">Warum LocalBite?</h2>
				<p class="text-base text-stone-500">
					Frische Produkte, faire Preise und kurze Wege – das ist unsere Plattform.
				</p>
			</div>

			<div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4">
				{#each benefits as benefit (benefit.label)}
					<div
						class="flex flex-col gap-3 rounded-2xl border border-stone-200 bg-white p-6 shadow-sm transition-shadow hover:shadow-md"
					>
						<div
							class="flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-xl {benefit.iconBg}"
						>
							<svg
								viewBox="0 0 24 24"
								fill="none"
								stroke="currentColor"
								stroke-width="1.5"
								class="h-6 w-6 {benefit.iconColor}"
							>
								<path stroke-linecap="round" stroke-linejoin="round" d={benefit.iconPath} />
							</svg>
						</div>
						<h3 class="text-base font-semibold text-stone-800">{benefit.label}</h3>
						<p class="grow text-sm leading-relaxed text-stone-500">{benefit.description}</p>
					</div>
				{/each}
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="border-t border-stone-100 bg-white">
		<div
			class="mx-auto flex max-w-6xl flex-col items-center justify-between gap-2 px-6 py-6 text-sm text-stone-400 sm:flex-row"
		>
			<span class="font-medium text-stone-500">LocalBite</span>
			<span>Nachhaltig · Regional · Transparent</span>
		</div>
	</footer>
</div>
