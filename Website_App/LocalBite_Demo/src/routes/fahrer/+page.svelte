<script lang="ts">
	import { onMount } from 'svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import { auth, getGreeting } from '#lib/auth/auth.svelte';
	import DashboardNav from '#lib/components/DashboardNav.svelte';

	let ready = $state(false);
	let tourStarted = $state(false);
	let tourComplete = $state(false);
	let selectedStopId = $state<number | null>(null);

	type StopType = 'abholung' | 'lieferung';
	type StopStatus = 'offen' | 'naechster' | 'erledigt';

	interface Stop {
		id: number;
		type: StopType;
		name: string;
		contactPerson?: string;
		address: string;
		time: string;
		distance: string;
		status: StopStatus;
		checkboxLabels: string[];
		checked: boolean[];
	}

	let stops = $state<Stop[]>([
		{
			id: 1,
			type: 'abholung',
			name: 'Hof Sonnenfeld',
			contactPerson: 'Lukas Lehmann',
			address: 'Durmersheimer Str. 12, 76185 Karlsruhe',
			time: '08:05',
			distance: '4,2 km',
			status: 'naechster',
			checkboxLabels: ['Ware übernommen', 'Menge geprüft'],
			checked: [false, false]
		},
		{
			id: 2,
			type: 'abholung',
			name: 'Hof Bergmann',
			contactPerson: 'Ernst Bergmann',
			address: 'Grünwettersbacher Str. 45, 76228 Karlsruhe',
			time: '08:40',
			distance: '8,7 km',
			status: 'offen',
			checkboxLabels: ['Ware übernommen', 'Menge geprüft'],
			checked: [false, false]
		},
		{
			id: 3,
			type: 'abholung',
			name: 'Gärtnerei Kraus',
			contactPerson: 'Maria Kraus',
			address: 'Rüppurrer Str. 88, 76137 Karlsruhe',
			time: '09:10',
			distance: '11,2 km',
			status: 'offen',
			checkboxLabels: ['Ware übernommen', 'Menge geprüft'],
			checked: [false, false]
		},
		{
			id: 4,
			type: 'abholung',
			name: 'Imkerei Waldblüte',
			contactPerson: 'Hans Werner',
			address: 'Waldstr. 23, 76131 Karlsruhe',
			time: '09:35',
			distance: '14,5 km',
			status: 'offen',
			checkboxLabels: ['Ware übernommen', 'Menge geprüft'],
			checked: [false, false]
		},
		{
			id: 5,
			type: 'lieferung',
			name: 'Thomas Müller',
			address: 'Kaiserstr. 42, 76133 Karlsruhe',
			time: '09:55',
			distance: '16,8 km',
			status: 'offen',
			checkboxLabels: ['Bestellung übergeben', 'Pfandbox zurückgenommen'],
			checked: [false, false]
		},
		{
			id: 6,
			type: 'lieferung',
			name: 'Sandra Weber',
			address: 'Herrenstr. 15, 76133 Karlsruhe',
			time: '10:10',
			distance: '17,3 km',
			status: 'offen',
			checkboxLabels: ['Bestellung übergeben', 'Pfandbox zurückgenommen'],
			checked: [false, false]
		},
		{
			id: 7,
			type: 'lieferung',
			name: 'Peter Schäfer',
			address: 'Douglasstr. 8, 76133 Karlsruhe',
			time: '10:25',
			distance: '18,1 km',
			status: 'offen',
			checkboxLabels: ['Bestellung übergeben', 'Pfandbox zurückgenommen'],
			checked: [false, false]
		},
		{
			id: 8,
			type: 'lieferung',
			name: 'Anna Zimmermann',
			address: 'Ritterstr. 22, 76137 Karlsruhe',
			time: '10:40',
			distance: '19,4 km',
			status: 'offen',
			checkboxLabels: ['Bestellung übergeben', 'Pfandbox zurückgenommen'],
			checked: [false, false]
		},
		{
			id: 9,
			type: 'lieferung',
			name: 'Klaus Hoffmann',
			address: 'Zähringerstr. 31, 76133 Karlsruhe',
			time: '10:55',
			distance: '21,2 km',
			status: 'offen',
			checkboxLabels: ['Bestellung übergeben', 'Pfandbox zurückgenommen'],
			checked: [false, false]
		},
		{
			id: 10,
			type: 'lieferung',
			name: 'Marie Schmidt',
			address: 'Erbprinzenstr. 7, 76133 Karlsruhe',
			time: '11:15',
			distance: '23,5 km',
			status: 'offen',
			checkboxLabels: ['Bestellung übergeben', 'Pfandbox zurückgenommen'],
			checked: [false, false]
		},
		{
			id: 11,
			type: 'lieferung',
			name: 'Klara König',
			address: 'Sophienstr. 34, 76133 Karlsruhe',
			time: '11:40',
			distance: '28,7 km',
			status: 'offen',
			checkboxLabels: ['Bestellung übergeben', 'Pfandbox zurückgenommen'],
			checked: [false, false]
		},
		{
			id: 12,
			type: 'lieferung',
			name: 'Josef Bauer',
			address: 'Goethestr. 12, 76135 Karlsruhe',
			time: '12:00',
			distance: '35,2 km',
			status: 'offen',
			checkboxLabels: ['Bestellung übergeben', 'Pfandbox zurückgenommen'],
			checked: [false, false]
		}
	]);

	let completedCount = $derived(stops.filter((s) => s.status === 'erledigt').length);
	let nextStop = $derived(stops.find((s) => s.status === 'naechster') ?? null);
	let progressPercent = $derived(Math.round((completedCount / 12) * 100));
	let selectedStop = $derived(
		selectedStopId !== null ? (stops.find((s) => s.id === selectedStopId) ?? null) : null
	);

	function allChecked(stop: Stop): boolean {
		return stop.checked.every((v) => v);
	}

	function toggleCheckbox(stopId: number, idx: number) {
		const stopIdx = stops.findIndex((s) => s.id === stopId);
		if (stopIdx === -1) return;
		stops[stopIdx].checked[idx] = !stops[stopIdx].checked[idx];
	}

	function confirmStop(stopId: number) {
		const stopIdx = stops.findIndex((s) => s.id === stopId);
		if (stopIdx === -1 || !allChecked(stops[stopIdx])) return;
		stops[stopIdx].status = 'erledigt';
		const nextOpen = stops.find((s) => s.status === 'offen');
		if (nextOpen) {
			const nextIdx = stops.findIndex((s) => s.id === nextOpen.id);
			stops[nextIdx].status = 'naechster';
		} else {
			tourComplete = true;
		}
		selectedStopId = null;
	}

	function openStop(stopId: number) {
		selectedStopId = stopId;
	}

	function closeModal() {
		selectedStopId = null;
	}

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

		<main class="mx-auto w-full max-w-2xl flex-grow px-4 py-8">
			<!-- Greeting -->
			<div class="mb-6">
				<h1 class="text-2xl font-bold text-stone-800">
					{getGreeting()}, {auth.session.name.split(' ')[0]}
				</h1>
				<p class="mt-1 text-sm text-stone-500">Hier ist deine Tour für heute.</p>
			</div>

			<!-- Tour complete banner -->
			{#if tourComplete}
				<div
					class="mb-6 rounded-2xl border border-emerald-200 bg-emerald-50 px-6 py-6 text-center shadow-sm"
				>
					<div
						class="mx-auto mb-3 flex h-12 w-12 items-center justify-center rounded-full bg-emerald-100"
					>
						<svg viewBox="0 0 20 20" fill="currentColor" class="h-6 w-6 text-emerald-600">
							<path
								fill-rule="evenodd"
								d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z"
								clip-rule="evenodd"
							/>
						</svg>
					</div>
					<div class="text-xl font-bold text-emerald-800">Tour abgeschlossen</div>
					<p class="mt-1 text-sm text-emerald-600">Alle 12 Stopps wurden erfolgreich erledigt.</p>
					<p class="mt-0.5 text-xs text-emerald-500">Tour T-017</p>
				</div>
			{/if}

			<!-- Tour Info Card -->
			<div class="mb-4 rounded-2xl border border-stone-200 bg-white p-5 shadow-sm">
				<div class="mb-4 flex items-center justify-between">
					<span class="text-xs font-bold tracking-wider text-stone-400 uppercase">Heutige Tour</span
					>
					<span class="rounded-full bg-orange-100 px-3 py-1 text-xs font-bold text-orange-700"
						>T-017</span
					>
				</div>
				<div class="grid grid-cols-2 gap-3 text-sm">
					<div>
						<div class="text-xs text-stone-400">Tourstart</div>
						<div class="font-semibold text-stone-800">07:15 Uhr</div>
					</div>
					<div>
						<div class="text-xs text-stone-400">Geplantes Ende</div>
						<div class="font-semibold text-stone-800">12:15 Uhr</div>
					</div>
					<div>
						<div class="text-xs text-stone-400">Gesamtdistanz</div>
						<div class="font-semibold text-stone-800">ca. 38 km</div>
					</div>
					<div>
						<div class="text-xs text-stone-400">Stopps</div>
						<div class="font-semibold text-stone-800">12</div>
					</div>
				</div>
				<div class="mt-4">
					{#if !tourStarted}
						<button
							onclick={() => (tourStarted = true)}
							class="w-full rounded-xl bg-orange-600 py-3 text-sm font-bold text-white transition hover:bg-orange-700 active:bg-orange-800"
						>
							Tour starten
						</button>
					{:else}
						<div class="flex items-center gap-2 rounded-xl bg-emerald-50 px-4 py-3">
							<span class="h-2 w-2 flex-shrink-0 rounded-full bg-emerald-500"></span>
							<span class="text-sm font-semibold text-emerald-700">Tour läuft</span>
						</div>
					{/if}
				</div>
			</div>

			<!-- Progress Card -->
			<div class="mb-4 rounded-2xl border border-stone-200 bg-white p-5 shadow-sm">
				<div class="mb-3 flex items-center justify-between">
					<span class="text-sm font-semibold text-stone-700">Tourfortschritt</span>
					<span class="text-sm font-bold text-orange-600"
						>{completedCount} / 12 Stopps erledigt</span
					>
				</div>
				<div class="h-3 w-full overflow-hidden rounded-full bg-stone-100">
					<div
						class="h-3 rounded-full bg-orange-500 transition-all duration-500"
						style="width: {progressPercent}%"
					></div>
				</div>
				<div class="mt-2 flex justify-between text-xs text-stone-400">
					<span>{12 - completedCount} verbleibend</span>
					<span>{progressPercent}%</span>
				</div>
			</div>

			<!-- Next Stop Card -->
			{#if nextStop && !tourComplete}
				<div class="mb-4 rounded-2xl border-2 border-orange-300 bg-orange-50 p-5 shadow-md">
					<div class="mb-3 flex items-center gap-2">
						<span class="h-2 w-2 flex-shrink-0 rounded-full bg-orange-500"></span>
						<span class="text-xs font-bold tracking-wider text-orange-600 uppercase"
							>Nächster Stopp</span
						>
						<span
							class="ml-auto rounded-full px-2.5 py-0.5 text-xs font-semibold {nextStop.type ===
							'abholung'
								? 'bg-lime-100 text-lime-700'
								: 'bg-sky-100 text-sky-700'}"
						>
							{nextStop.type === 'abholung' ? 'Abholung' : 'Lieferung'}
						</span>
					</div>
					<div class="mb-1 text-lg font-bold text-stone-800">{nextStop.name}</div>
					{#if nextStop.contactPerson}
						<div class="mb-1 text-sm text-stone-600">{nextStop.contactPerson}</div>
					{/if}
					<div class="mb-3 text-sm text-stone-500">{nextStop.address}</div>
					<div class="mb-4 flex gap-5 text-sm">
						<div>
							<span class="text-stone-400">Ankunft</span>
							<span class="ml-1 font-semibold text-stone-700">{nextStop.time} Uhr</span>
						</div>
						<div>
							<span class="text-stone-400">Entfernung</span>
							<span class="ml-1 font-semibold text-stone-700">{nextStop.distance}</span>
						</div>
					</div>
					<div class="flex gap-3">
						<button
							onclick={() => openStop(nextStop!.id)}
							class="flex-1 rounded-xl bg-orange-600 py-3 text-sm font-bold text-white transition hover:bg-orange-700"
						>
							Stopp öffnen
						</button>
						<button
							class="flex-1 rounded-xl border border-orange-200 bg-white py-3 text-sm font-semibold text-orange-700 transition hover:bg-orange-50"
						>
							Navigation
						</button>
					</div>
				</div>
			{/if}

			<!-- Vehicle Card -->
			<div class="mb-4 rounded-2xl border border-stone-200 bg-white p-4 shadow-sm">
				<div class="flex items-center gap-3">
					<div
						class="flex h-10 w-10 flex-shrink-0 items-center justify-center rounded-xl bg-stone-100"
					>
						<svg
							viewBox="0 0 24 24"
							fill="none"
							stroke="currentColor"
							stroke-width="1.5"
							class="h-5 w-5 text-stone-600"
						>
							<path
								stroke-linecap="round"
								stroke-linejoin="round"
								d="M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 00-3.213-9.193 2.056 2.056 0 00-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 00-10.026 0 1.106 1.106 0 00-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12"
							/>
						</svg>
					</div>
					<div class="grow">
						<div class="text-xs text-stone-400">Mein Fahrzeug</div>
						<div class="font-semibold text-stone-800">KA-LB 204</div>
						<div class="text-xs text-stone-500">LocalBite Kühltransporter</div>
					</div>
					<span
						class="rounded-full bg-emerald-100 px-2.5 py-1 text-xs font-semibold text-emerald-700"
						>Einsatzbereit</span
					>
				</div>
			</div>

			<!-- Stop List -->
			<div class="rounded-2xl border border-stone-200 bg-white shadow-sm">
				<div class="border-b border-stone-100 px-5 py-4">
					<h2 class="text-base font-semibold text-stone-800">Alle Stopps</h2>
				</div>
				<div class="divide-y divide-stone-50">
					{#each stops as stop (stop.id)}
						<button
							onclick={() => {
								if (stop.status !== 'erledigt') openStop(stop.id);
							}}
							class="flex w-full items-center gap-3 px-4 py-3.5 text-left transition {stop.status ===
							'naechster'
								? 'bg-orange-50 hover:bg-orange-100'
								: stop.status === 'erledigt'
									? 'cursor-default opacity-50'
									: 'cursor-pointer hover:bg-stone-50'}"
						>
							<div
								class="flex h-7 w-7 flex-shrink-0 items-center justify-center rounded-full text-xs font-bold {stop.status ===
								'erledigt'
									? 'bg-emerald-100 text-emerald-600'
									: stop.status === 'naechster'
										? 'bg-orange-200 text-orange-700'
										: 'bg-stone-100 text-stone-500'}"
							>
								{#if stop.status === 'erledigt'}
									<svg viewBox="0 0 20 20" fill="currentColor" class="h-4 w-4">
										<path
											fill-rule="evenodd"
											d="M16.704 4.153a.75.75 0 01.143 1.052l-8 10.5a.75.75 0 01-1.127.075l-4.5-4.5a.75.75 0 011.06-1.06l3.894 3.893 7.48-9.817a.75.75 0 011.05-.143z"
											clip-rule="evenodd"
										/>
									</svg>
								{:else}
									{stop.id}
								{/if}
							</div>
							<div class="min-w-0 grow">
								<div class="flex items-center gap-1.5">
									<span class="truncate text-sm font-medium text-stone-800">{stop.name}</span>
									<span
										class="flex-shrink-0 rounded px-1.5 py-0.5 text-xs {stop.type === 'abholung'
											? 'bg-lime-100 text-lime-700'
											: 'bg-sky-100 text-sky-700'}"
									>
										{stop.type === 'abholung' ? 'Abholung' : 'Lieferung'}
									</span>
								</div>
								<div class="text-xs text-stone-400">{stop.time} Uhr · {stop.distance}</div>
							</div>
							<span
								class="flex-shrink-0 text-xs font-semibold {stop.status === 'naechster'
									? 'text-orange-600'
									: stop.status === 'erledigt'
										? 'text-emerald-600'
										: 'text-stone-400'}"
							>
								{stop.status === 'naechster'
									? 'Nächster'
									: stop.status === 'erledigt'
										? 'Erledigt'
										: 'Offen'}
							</span>
						</button>
					{/each}
				</div>
			</div>
		</main>
	</div>

	<!-- Stop Detail Modal -->
	{#if selectedStop !== null}
		<div class="fixed inset-0 z-30 bg-black/40" onclick={closeModal} role="none"></div>
		<div
			class="fixed inset-x-0 bottom-0 z-40 max-h-[85vh] overflow-y-auto rounded-t-3xl bg-white px-6 pt-6 pb-10 shadow-2xl"
		>
			<!-- Header -->
			<div class="mb-4 flex items-start justify-between gap-3">
				<div class="min-w-0">
					<div class="flex items-center gap-2">
						<span
							class="rounded px-2 py-0.5 text-xs font-semibold {selectedStop.type === 'abholung'
								? 'bg-lime-100 text-lime-700'
								: 'bg-sky-100 text-sky-700'}"
						>
							{selectedStop.type === 'abholung' ? 'Abholung' : 'Lieferung'}
						</span>
						<span class="text-xs text-stone-400">Stopp {selectedStop.id}</span>
					</div>
					<div class="mt-1 text-xl font-bold text-stone-800">{selectedStop.name}</div>
					{#if selectedStop.contactPerson}
						<div class="text-sm text-stone-500">{selectedStop.contactPerson}</div>
					{/if}
					<div class="mt-0.5 text-sm text-stone-400">{selectedStop.address}</div>
				</div>
				<button
					onclick={closeModal}
					aria-label="Schließen"
					class="flex h-8 w-8 flex-shrink-0 items-center justify-center rounded-full bg-stone-100 text-stone-500 transition hover:bg-stone-200"
				>
					<svg viewBox="0 0 20 20" fill="currentColor" class="h-4 w-4">
						<path
							d="M6.28 5.22a.75.75 0 00-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 101.06 1.06L10 11.06l3.72 3.72a.75.75 0 101.06-1.06L11.06 10l3.72-3.72a.75.75 0 00-1.06-1.06L10 8.94 6.28 5.22z"
						/>
					</svg>
				</button>
			</div>

			<div class="mb-4 flex gap-5 text-sm">
				<div>
					<span class="text-stone-400">Geplant</span>
					<span class="ml-1 font-semibold text-stone-700">{selectedStop.time} Uhr</span>
				</div>
				<div>
					<span class="text-stone-400">Entfernung</span>
					<span class="ml-1 font-semibold text-stone-700">{selectedStop.distance}</span>
				</div>
			</div>

			<div class="my-4 border-t border-stone-100"></div>

			<div class="mb-3 text-xs font-bold tracking-wider text-stone-400 uppercase">Aufgaben</div>
			<div class="mb-6 space-y-4">
				{#each selectedStop.checkboxLabels as label, idx (label)}
					<label class="flex cursor-pointer items-center gap-3">
						<input
							type="checkbox"
							checked={selectedStop.checked[idx]}
							onchange={() => toggleCheckbox(selectedStop!.id, idx)}
							class="h-5 w-5 rounded border-stone-300 accent-orange-600"
						/>
						<span class="text-sm text-stone-700">{label}</span>
					</label>
				{/each}
			</div>

			<button
				onclick={() => confirmStop(selectedStop!.id)}
				disabled={!allChecked(selectedStop)}
				class="w-full rounded-xl py-4 text-sm font-bold transition {allChecked(selectedStop)
					? 'bg-orange-600 text-white hover:bg-orange-700 active:bg-orange-800'
					: 'cursor-not-allowed bg-stone-100 text-stone-400'}"
			>
				{selectedStop.type === 'abholung' ? 'Abholung bestätigen' : 'Zustellung bestätigen'}
			</button>
		</div>
	{/if}
{:else}
	<div class="flex min-h-screen items-center justify-center bg-stone-50">
		<div
			class="h-8 w-8 animate-spin rounded-full border-4 border-emerald-200 border-t-emerald-600"
		></div>
	</div>
{/if}
