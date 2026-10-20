<script lang="ts">
	import { resolve } from '$app/paths';

	const roles = [
		{
			href: '/kunde' as const,
			label: 'Kunde',
			tagline: 'Frisch aus der Region bestellen',
			description: 'Entdecke saisonale Produkte lokaler Höfe und bestelle bequem von zuhause.',
			cardClass: 'border-emerald-200 hover:border-emerald-400 hover:bg-emerald-50/30',
			iconBg: 'bg-emerald-100',
			iconColor: 'text-emerald-600',
			linkColor: 'text-emerald-600',
			iconPath:
				'M15.75 10.5V6a3.75 3.75 0 10-7.5 0v4.5m11.356-1.993l1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 01-1.12-1.243l1.264-12A1.125 1.125 0 015.513 7.5h12.974c.576 0 1.059.435 1.119 1.007zM8.625 10.5a.375.375 0 11-.75 0 .375.375 0 01.75 0zm7.5 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z'
		},
		{
			href: '/landwirt' as const,
			label: 'Landwirt',
			tagline: 'Ernte direkt vermarkten',
			description: 'Verwalte dein Angebot und erreiche Kunden in deiner Region unkompliziert.',
			cardClass: 'border-lime-200 hover:border-lime-400 hover:bg-lime-50/30',
			iconBg: 'bg-lime-100',
			iconColor: 'text-lime-600',
			linkColor: 'text-lime-600',
			iconPath:
				'M12 3v19M12 7c0 0-3-2-5-1M12 7c0 0 3-2 5-1M12 11c0 0-3-2-5-1M12 11c0 0 3-2 5-1M12 15c0 0-3-2-5-1M12 15c0 0 3-2 5-1'
		},
		{
			href: '/disposition' as const,
			label: 'Disposition',
			tagline: 'Lieferungen koordinieren',
			description: 'Plane effiziente Routen und steuere die gesamte Logistik im Überblick.',
			cardClass: 'border-sky-200 hover:border-sky-400 hover:bg-sky-50/30',
			iconBg: 'bg-sky-100',
			iconColor: 'text-sky-600',
			linkColor: 'text-sky-600',
			iconPath:
				'M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01'
		},
		{
			href: '/fahrer' as const,
			label: 'Fahrer',
			tagline: 'Touren übernehmen',
			description: 'Empfange Lieferaufträge und bring regionale Produkte sicher zu den Kunden.',
			cardClass: 'border-orange-200 hover:border-orange-400 hover:bg-orange-50/30',
			iconBg: 'bg-orange-100',
			iconColor: 'text-orange-600',
			linkColor: 'text-orange-600',
			iconPath:
				'M8.25 18.75a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h6m-9 0H3.375a1.125 1.125 0 01-1.125-1.125V14.25m17.25 4.5a1.5 1.5 0 01-3 0m3 0a1.5 1.5 0 00-3 0m3 0h1.125c.621 0 1.129-.504 1.09-1.124a17.902 17.902 0 00-3.213-9.193 2.056 2.056 0 00-1.58-.86H14.25M16.5 18.75h-2.25m0-11.177v-.958c0-.568-.422-1.048-.987-1.106a48.554 48.554 0 00-10.026 0 1.106 1.106 0 00-.987 1.106v7.635m12-6.677v6.677m0 4.5v-4.5m0 0h-12'
		}
	];

	const badges = ['Vom Hof zur Tür', '100 % Regional', 'Nachhaltige Logistik'];
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
			<span class="hidden text-sm text-stone-400 sm:block"
				>Regionale Lebensmittel · Nachhaltige Logistik</span
			>
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
		</div>
	</section>

	<!-- Role Selection -->
	<section class="flex-grow bg-stone-50 py-16 sm:py-24">
		<div class="mx-auto max-w-6xl px-6">
			<div class="mb-12 text-center">
				<h2 class="mb-3 text-2xl font-bold text-stone-800 sm:text-3xl">Wähle deine Rolle</h2>
				<p class="text-base text-stone-500">
					Jede Perspektive zeigt einen anderen Teil der Plattform.
				</p>
			</div>

			<div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4">
				{#each roles as role (role.href)}
					<a
						href={resolve(role.href)}
						class="group flex flex-col gap-3 rounded-2xl border-2 bg-white p-6 transition-all duration-200 hover:-translate-y-0.5 hover:shadow-lg {role.cardClass}"
					>
						<div
							class="flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-xl {role.iconBg}"
						>
							<svg
								viewBox="0 0 24 24"
								fill="none"
								stroke="currentColor"
								stroke-width="1.5"
								class="h-6 w-6 {role.iconColor}"
							>
								<path stroke-linecap="round" stroke-linejoin="round" d={role.iconPath} />
							</svg>
						</div>

						<div>
							<h3 class="text-lg leading-tight font-semibold text-stone-800">{role.label}</h3>
							<p class="mt-0.5 text-sm text-stone-500">{role.tagline}</p>
						</div>

						<p class="grow text-sm leading-relaxed text-stone-400">{role.description}</p>

						<div class="flex items-center gap-1 text-sm font-medium {role.linkColor}">
							<span>Öffnen</span>
							<svg
								viewBox="0 0 20 20"
								fill="currentColor"
								class="h-4 w-4 transition-transform duration-200 group-hover:translate-x-0.5"
							>
								<path
									fill-rule="evenodd"
									d="M5 10a.75.75 0 01.75-.75h6.638L10.23 7.29a.75.75 0 111.04-1.08l3.5 3.25a.75.75 0 010 1.08l-3.5 3.25a.75.75 0 11-1.04-1.08l2.158-1.96H5.75A.75.75 0 015 10z"
									clip-rule="evenodd"
								/>
							</svg>
						</div>
					</a>
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
