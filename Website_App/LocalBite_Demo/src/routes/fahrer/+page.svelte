<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import { auth, getGreeting } from '#lib/auth/auth.svelte';
	import DashboardNav from '#lib/components/DashboardNav.svelte';

	let ready = $state(false);

	const stops = [
		{
			order: '#1051',
			address: 'Musterstraße 12, 70173 Stuttgart',
			customer: 'Klara König',
			items: 'Tomaten, Salat, Zwiebeln',
			status: 'Nächster Stop',
			statusClass: 'bg-sky-100 text-sky-700'
		},
		{
			order: '#1048',
			address: 'Gartenweg 5, 70199 Stuttgart',
			customer: 'Klaus Hoffmann',
			items: 'Kartoffeln (5 kg), Karotten (2 kg)',
			status: 'Ausstehend',
			statusClass: 'bg-stone-100 text-stone-600'
		},
		{
			order: '#1046',
			address: 'Lindenallee 3, 70182 Stuttgart',
			customer: 'Marie Schmidt',
			items: 'Äpfel (3 kg)',
			status: 'Erledigt',
			statusClass: 'bg-emerald-100 text-emerald-700'
		}
	];

	let tourActive = $state(true);

	onMount(() => {
		if (!auth.isLoggedIn || auth.session?.role !== 'fahrer') {
			goto(resolve('/login'));
			return;
		}
		ready = true;
	});
</script>

<svelte:head>
	<title>Meine Tour – LocalBite</title>
</svelte:head>

{#if ready && auth.session}
	<div class="flex min-h-screen flex-col bg-stone-50">
		<DashboardNav role="fahrer" />

		<main class="mx-auto w-full max-w-5xl flex-grow px-6 py-10">
			<!-- Greeting -->
			<div class="mb-8 flex items-start justify-between gap-4">
				<div>
					<h1 class="text-2xl font-bold text-stone-800">
						{getGreeting()}, {auth.session.name.split(' ')[0]}
					</h1>
					<p class="mt-1 text-sm text-stone-500">Du hast heute 3 Lieferungen auf deiner Route.</p>
				</div>
				<!-- Status toggle (visual only) -->
				<div class="flex-shrink-0">
					<button
						onclick={() => (tourActive = !tourActive)}
						class="flex items-center gap-2 rounded-xl px-4 py-2 text-sm font-semibold transition {tourActive
							? 'bg-emerald-100 text-emerald-700 hover:bg-emerald-200'
							: 'bg-stone-100 text-stone-600 hover:bg-stone-200'}"
					>
						<span class="h-2 w-2 rounded-full {tourActive ? 'bg-emerald-500' : 'bg-stone-400'}"
						></span>
						{tourActive ? 'Online' : 'Offline'}
					</button>
				</div>
			</div>

			<!-- Stats row -->
			<div class="mb-8 grid grid-cols-3 gap-4">
				{#each [{ label: 'Stopps heute', value: '3' }, { label: 'Erledigt', value: '1' }, { label: 'Km gefahren', value: '14,3' }] as stat (stat.label)}
					<div class="rounded-2xl border border-stone-200 bg-white p-5 text-center shadow-sm">
						<div class="text-2xl font-bold text-stone-800">{stat.value}</div>
						<div class="mt-1 text-xs text-stone-500">{stat.label}</div>
					</div>
				{/each}
			</div>

			<!-- Route stops -->
			<div class="rounded-2xl border border-stone-200 bg-white p-6 shadow-sm">
				<div class="mb-4 flex items-center justify-between">
					<h2 class="text-base font-semibold text-stone-800">Heutige Tour</h2>
					<button
						class="rounded-lg bg-orange-600 px-3 py-1.5 text-xs font-semibold text-white transition hover:bg-orange-700"
					>
						Navigation starten
					</button>
				</div>

				<div class="space-y-3">
					{#each stops as stop, i (stop.order)}
						<div
							class="relative flex gap-4 rounded-xl border px-4 py-4 {stop.status ===
							'Nächster Stop'
								? 'border-sky-200 bg-sky-50'
								: stop.status === 'Erledigt'
									? 'border-stone-100 bg-stone-50 opacity-60'
									: 'border-stone-100 bg-white'}"
						>
							<div
								class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-full bg-stone-200 text-sm font-bold text-stone-600"
							>
								{i + 1}
							</div>
							<div class="grow">
								<div class="flex items-center justify-between gap-2">
									<span class="text-sm font-medium text-stone-800">{stop.address}</span>
									<span
										class="flex-shrink-0 rounded-full px-2.5 py-0.5 text-xs font-semibold {stop.statusClass}"
									>
										{stop.status}
									</span>
								</div>
								<div class="mt-0.5 text-xs text-stone-500">{stop.customer} · {stop.order}</div>
								<div class="mt-0.5 text-xs text-stone-400">{stop.items}</div>
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
