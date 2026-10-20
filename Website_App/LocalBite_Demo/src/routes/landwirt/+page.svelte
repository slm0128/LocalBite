<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import { auth, getGreeting } from '#lib/auth/auth.svelte';
	import DashboardNav from '#lib/components/DashboardNav.svelte';

	let ready = $state(false);

	const listings = [
		{
			name: 'Kartoffeln (Festkochend)',
			stock: '120 kg',
			price: '0,90 €/kg',
			status: 'Aktiv',
			statusClass: 'bg-emerald-100 text-emerald-700'
		},
		{
			name: 'Frische Eier (10 Stk.)',
			stock: '240 Stk.',
			price: '3,20 €',
			status: 'Aktiv',
			statusClass: 'bg-emerald-100 text-emerald-700'
		},
		{
			name: 'Äpfel (Boskoop)',
			stock: '85 kg',
			price: '1,40 €/kg',
			status: 'Fast vergriffen',
			statusClass: 'bg-amber-100 text-amber-700'
		}
	];

	const incomingOrders = [
		{
			id: '#1051',
			customer: 'Klara König',
			items: 'Tomaten (1 kg), Salat, Zwiebeln',
			amount: '5,30 €',
			time: 'Heute, 08:42 Uhr'
		},
		{
			id: '#1048',
			customer: 'Klaus Hoffmann',
			items: 'Kartoffeln (5 kg), Karotten (2 kg)',
			amount: '7,10 €',
			time: 'Heute, 07:15 Uhr'
		}
	];

	onMount(() => {
		if (!auth.isLoggedIn || auth.session?.role !== 'landwirt') {
			goto(resolve('/login'));
			return;
		}
		ready = true;
	});
</script>

<svelte:head>
	<title>Mein Hof – LocalBite</title>
</svelte:head>

{#if ready && auth.session}
	<div class="flex min-h-screen flex-col bg-stone-50">
		<DashboardNav role="landwirt" />

		<main class="mx-auto w-full max-w-5xl flex-grow px-6 py-10">
			<!-- Greeting -->
			<div class="mb-8">
				<h1 class="text-2xl font-bold text-stone-800">
					{getGreeting()}, {auth.session.name.split(' ')[0]}
				</h1>
				{#if auth.session.companyName}
					<p class="mt-0.5 text-sm font-medium text-lime-700">{auth.session.companyName}</p>
				{/if}
				<p class="mt-1 text-sm text-stone-500">
					Verwalte deine Angebote und bearbeite eingehende Bestellungen.
				</p>
			</div>

			<!-- Stats row -->
			<div class="mb-8 grid grid-cols-3 gap-4">
				{#each [{ label: 'Aktive Angebote', value: '3' }, { label: 'Bestellungen heute', value: '2' }, { label: 'Umsatz (Monat)', value: '1.240 €' }] as stat (stat.label)}
					<div class="rounded-2xl border border-stone-200 bg-white p-5 text-center shadow-sm">
						<div class="text-2xl font-bold text-stone-800">{stat.value}</div>
						<div class="mt-1 text-xs text-stone-500">{stat.label}</div>
					</div>
				{/each}
			</div>

			<div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
				<!-- Listings -->
				<div class="rounded-2xl border border-stone-200 bg-white p-6 shadow-sm">
					<div class="mb-4 flex items-center justify-between">
						<h2 class="text-base font-semibold text-stone-800">Meine Angebote</h2>
						<button
							class="rounded-lg bg-lime-600 px-3 py-1.5 text-xs font-semibold text-white transition hover:bg-lime-700"
						>
							+ Hinzufügen
						</button>
					</div>
					<div class="space-y-3">
						{#each listings as listing (listing.name)}
							<div
								class="flex items-center justify-between rounded-xl border border-stone-100 px-4 py-3"
							>
								<div>
									<div class="text-sm font-medium text-stone-800">{listing.name}</div>
									<div class="mt-0.5 text-xs text-stone-400">
										Bestand: {listing.stock} · {listing.price}
									</div>
								</div>
								<span class="rounded-full px-2.5 py-1 text-xs font-semibold {listing.statusClass}">
									{listing.status}
								</span>
							</div>
						{/each}
					</div>
				</div>

				<!-- Incoming orders -->
				<div class="rounded-2xl border border-stone-200 bg-white p-6 shadow-sm">
					<h2 class="mb-4 text-base font-semibold text-stone-800">Neue Bestellungen</h2>
					<div class="space-y-3">
						{#each incomingOrders as order (order.id)}
							<div class="rounded-xl border border-stone-100 px-4 py-3">
								<div class="flex items-center justify-between">
									<span class="text-sm font-medium text-stone-800">{order.id}</span>
									<span class="text-sm font-semibold text-lime-700">{order.amount}</span>
								</div>
								<div class="mt-0.5 text-xs text-stone-400">{order.customer}</div>
								<div class="mt-0.5 text-xs text-stone-400">{order.items}</div>
								<div class="mt-1 text-xs text-stone-400">{order.time}</div>
							</div>
						{/each}
					</div>
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
