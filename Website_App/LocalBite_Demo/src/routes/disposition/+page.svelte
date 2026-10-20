<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import { auth, getGreeting } from '#lib/auth/auth.svelte';
	import DashboardNav from '#lib/components/DashboardNav.svelte';

	let ready = $state(false);

	const deliveries = [
		{
			id: '#1051',
			driver: 'Felix Fischer',
			from: 'Hof Sonnenfeld',
			to: 'Stuttgart-Mitte',
			status: 'Unterwegs',
			eta: '14:30 Uhr',
			statusClass: 'bg-sky-100 text-sky-700'
		},
		{
			id: '#1048',
			driver: 'Felix Fischer',
			from: 'Gemüsehof Baumann',
			to: 'Stuttgart-Süd',
			status: 'Beladen',
			eta: '15:15 Uhr',
			statusClass: 'bg-amber-100 text-amber-700'
		},
		{
			id: '#1046',
			driver: 'Petra Kurz',
			from: 'Obstgut Riedel',
			to: 'Stuttgart-West',
			status: 'Geliefert',
			eta: '–',
			statusClass: 'bg-emerald-100 text-emerald-700'
		},
		{
			id: '#1053',
			driver: 'Nicht zugewiesen',
			from: 'Hof Sonnenfeld',
			to: 'Stuttgart-Nord',
			status: 'Offen',
			eta: '–',
			statusClass: 'bg-red-100 text-red-700'
		}
	];

	onMount(() => {
		if (!auth.isLoggedIn || auth.session?.role !== 'disposition') {
			goto(resolve('/login'));
			return;
		}
		ready = true;
	});
</script>

<svelte:head>
	<title>Disposition – LocalBite</title>
</svelte:head>

{#if ready && auth.session}
	<div class="flex min-h-screen flex-col bg-stone-50">
		<DashboardNav role="disposition" />

		<main class="mx-auto w-full max-w-6xl flex-grow px-6 py-10">
			<!-- Greeting -->
			<div class="mb-8">
				<h1 class="text-2xl font-bold text-stone-800">
					{getGreeting()}, {auth.session.name.split(' ')[0]}
				</h1>
				<p class="mt-1 text-sm text-stone-500">
					Übersicht über alle aktiven Lieferungen und Fahrer.
				</p>
			</div>

			<!-- Stats row -->
			<div class="mb-8 grid grid-cols-2 gap-4 sm:grid-cols-4">
				{#each [{ label: 'Bestellungen heute', value: '12', color: 'text-stone-800' }, { label: 'Aktive Fahrer', value: '2', color: 'text-sky-700' }, { label: 'Unterwegs', value: '2', color: 'text-amber-700' }, { label: 'Offen', value: '1', color: 'text-red-600' }] as stat (stat.label)}
					<div class="rounded-2xl border border-stone-200 bg-white p-5 shadow-sm">
						<div class="text-3xl font-bold {stat.color}">{stat.value}</div>
						<div class="mt-1 text-xs text-stone-500">{stat.label}</div>
					</div>
				{/each}
			</div>

			<!-- Deliveries table -->
			<div class="rounded-2xl border border-stone-200 bg-white shadow-sm">
				<div class="flex items-center justify-between border-b border-stone-100 px-6 py-4">
					<h2 class="text-base font-semibold text-stone-800">Aktive Lieferungen</h2>
					<button
						class="rounded-lg bg-sky-600 px-3 py-1.5 text-xs font-semibold text-white transition hover:bg-sky-700"
					>
						+ Route erstellen
					</button>
				</div>

				<div class="divide-y divide-stone-100">
					{#each deliveries as delivery (delivery.id)}
						<div
							class="flex flex-col gap-2 px-6 py-4 sm:flex-row sm:items-center sm:justify-between"
						>
							<div class="flex items-center gap-4">
								<span class="w-16 text-sm font-semibold text-stone-700">{delivery.id}</span>
								<div>
									<div class="text-sm text-stone-800">
										{delivery.from} → {delivery.to}
									</div>
									<div class="text-xs text-stone-400">Fahrer: {delivery.driver}</div>
								</div>
							</div>
							<div class="flex items-center gap-3">
								{#if delivery.eta !== '–'}
									<span class="text-xs text-stone-400">ETA {delivery.eta}</span>
								{/if}
								<span class="rounded-full px-3 py-1 text-xs font-semibold {delivery.statusClass}">
									{delivery.status}
								</span>
							</div>
						</div>
					{/each}
				</div>
			</div>
		</main>
	</div>
{:else}
	<div class="flex min-h-screen items-center justify-center bg-stone-50">
		<div
			class="h-8 w-8 animate-spin rounded-full border-4 border-emerald-200 border-t-emerald-600"
		></div>
	</div>
{/if}
