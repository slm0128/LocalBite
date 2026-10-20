<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import { auth, getGreeting } from '#lib/auth/auth.svelte';
	import DashboardNav from '#lib/components/DashboardNav.svelte';

	let ready = $state(false);

	const orders = [
		{
			id: '#1042',
			items: 'Kartoffeln (2 kg), Karotten (1 kg)',
			date: '18. Okt. 2026',
			status: 'Geliefert',
			statusClass: 'bg-emerald-100 text-emerald-700'
		},
		{
			id: '#1039',
			items: 'Äpfel (3 kg), Zucchini (500 g)',
			date: '14. Okt. 2026',
			status: 'Geliefert',
			statusClass: 'bg-emerald-100 text-emerald-700'
		},
		{
			id: '#1051',
			items: 'Tomaten (1 kg), Salat, Zwiebeln',
			date: '20. Okt. 2026',
			status: 'Unterwegs',
			statusClass: 'bg-sky-100 text-sky-700'
		}
	];

	const products = [
		{
			name: 'Frische Eier (10 Stk.)',
			farm: 'Hof Sonnenfeld',
			price: '3,20 €',
			tag: 'Neu'
		},
		{
			name: 'Rotkohl (1 Stk.)',
			farm: 'Gemüsehof Baumann',
			price: '1,80 €',
			tag: 'Saisonal'
		},
		{
			name: 'Honig (500 g)',
			farm: 'Imkerei Waldblüte',
			price: '6,50 €',
			tag: 'Beliebt'
		}
	];

	onMount(() => {
		if (!auth.isLoggedIn || auth.session?.role !== 'kunde') {
			goto(resolve('/login'));
			return;
		}
		ready = true;
	});
</script>

<svelte:head>
	<title>Mein Konto – LocalBite</title>
</svelte:head>

{#if ready && auth.session}
	<div class="flex min-h-screen flex-col bg-stone-50">
		<DashboardNav role="kunde" />

		<main class="mx-auto w-full max-w-5xl flex-grow px-6 py-10">
			<!-- Greeting -->
			<div class="mb-8">
				<h1 class="text-2xl font-bold text-stone-800">
					{getGreeting()}, {auth.session.name.split(' ')[0]}
				</h1>
				<p class="mt-1 text-sm text-stone-500">Hier findest du deine Bestellungen und Produkte.</p>
			</div>

			<!-- Active order banner -->
			<div
				class="mb-8 flex items-center gap-4 rounded-2xl border border-sky-200 bg-sky-50 px-6 py-4"
			>
				<div class="flex h-10 w-10 flex-shrink-0 items-center justify-center rounded-xl bg-sky-100">
					<svg
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="1.5"
						class="h-5 w-5 text-sky-600"
					>
						<path
							stroke-linecap="round"
							stroke-linejoin="round"
							d="M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 00-3.213-9.193 2.056 2.056 0 00-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 00-10.026 0 1.106 1.106 0 00-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12"
						/>
					</svg>
				</div>
				<div class="grow">
					<div class="text-sm font-semibold text-sky-800">Bestellung #1051 ist unterwegs</div>
					<div class="text-xs text-sky-600">
						Voraussichtliche Lieferung heute zwischen 14–16 Uhr
					</div>
				</div>
				<span class="rounded-full bg-sky-200 px-3 py-1 text-xs font-semibold text-sky-800"
					>Verfolgen</span
				>
			</div>

			<div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
				<!-- Orders -->
				<div class="rounded-2xl border border-stone-200 bg-white p-6 shadow-sm">
					<h2 class="mb-4 text-base font-semibold text-stone-800">Letzte Bestellungen</h2>
					<div class="space-y-3">
						{#each orders as order (order.id)}
							<div
								class="flex items-center justify-between rounded-xl border border-stone-100 px-4 py-3"
							>
								<div>
									<div class="text-sm font-medium text-stone-800">{order.id}</div>
									<div class="mt-0.5 text-xs text-stone-400">{order.items}</div>
									<div class="mt-0.5 text-xs text-stone-400">{order.date}</div>
								</div>
								<span class="rounded-full px-2.5 py-1 text-xs font-semibold {order.statusClass}">
									{order.status}
								</span>
							</div>
						{/each}
					</div>
				</div>

				<!-- Products -->
				<div class="rounded-2xl border border-stone-200 bg-white p-6 shadow-sm">
					<h2 class="mb-4 text-base font-semibold text-stone-800">Produkte aus der Region</h2>
					<div class="space-y-3">
						{#each products as product (product.name)}
							<div
								class="flex items-center justify-between rounded-xl border border-stone-100 px-4 py-3"
							>
								<div>
									<div class="text-sm font-medium text-stone-800">{product.name}</div>
									<div class="mt-0.5 text-xs text-stone-400">{product.farm}</div>
								</div>
								<div class="flex items-center gap-2">
									<span class="rounded-full bg-emerald-100 px-2 py-0.5 text-xs text-emerald-700">
										{product.tag}
									</span>
									<span class="text-sm font-semibold text-stone-700">{product.price}</span>
								</div>
							</div>
						{/each}
					</div>
					<button
						class="mt-4 w-full rounded-xl bg-emerald-600 px-4 py-2.5 text-sm font-semibold text-white transition hover:bg-emerald-700"
					>
						Neue Bestellung aufgeben
					</button>
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
