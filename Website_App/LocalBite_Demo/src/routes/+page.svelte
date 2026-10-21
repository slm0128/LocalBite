<script lang="ts">
	import { onMount } from 'svelte';
	import { auth, roleToPath } from '#lib/auth/auth.svelte';
	import { resolve } from '$app/paths';
	import type { RouteId } from '$app/types';

	const steps = [
		{
			number: '01',
			emoji: '📍',
			title: 'Region entdecken',
			description: 'Wähle deine Region und entdecke lokale Höfe mit saisonalen Produkten.'
		},
		{
			number: '02',
			emoji: '🧺',
			title: 'Lebensmittel auswählen',
			description: 'Stelle deine persönliche Box zusammen oder wähle aus saisonalen Angeboten.'
		},
		{
			number: '03',
			emoji: '🚚',
			title: 'Lieferung erhalten',
			description: 'Bestellungen mehrerer Höfe werden gebündelt und pünktlich zu dir geliefert.'
		},
		{
			number: '04',
			emoji: '♻️',
			title: 'Mehrwegbox zurückgeben',
			description: 'Die LocalBite-Box wird bei der nächsten Lieferung wieder mitgenommen.'
		}
	];

	const features = [
		{
			emoji: '🥕',
			title: 'Wochenbox statt Supermarktstress',
			description:
				'Saisonale Lebensmittel aus mehreren Höfen werden zu einer regionalen Box gebündelt.'
		},
		{
			emoji: '🐄',
			title: 'Tierpartnerschaften',
			description:
				'Kunden unterstützen Tiere und Höfe direkt und erhalten Vorteile auf passende Erzeugnisse.'
		},
		{
			emoji: '📍',
			title: 'Region sichtbar machen',
			description: 'Eine Karte zeigt Höfe, Produkte und Partnerschaften in der direkten Umgebung.'
		}
	];

	const mockupItems = [
		{ emoji: '🥔', name: 'Kartoffeln', farm: 'Hof Sonnenfeld' },
		{ emoji: '🥕', name: 'Karotten', farm: 'Biohof Winter' },
		{ emoji: '🍎', name: 'Äpfel', farm: 'Obstgut Klein' }
	];

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
		content="LocalBite bringt saisonale Lebensmittel lokaler Landwirte gebündelt und planbar zu dir – transparent, regional und nachhaltig."
	/>
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
	<link
		href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
		rel="stylesheet"
	/>
</svelte:head>

<div
	class="min-h-screen bg-[#f7f7f2]"
	style="font-family: Inter, ui-sans-serif, system-ui, -apple-system, sans-serif; color: #1c1917"
>
	<!-- ── Hero (nav embedded inside) ──────────────────────── -->
	<section
		class="relative overflow-hidden text-white"
		style="background: #0b3526; min-height: 760px"
	>
		<!-- Radial gradient overlays -->
		<div
			class="pointer-events-none absolute inset-0"
			style="background: radial-gradient(circle at 15% 20%, rgba(52,211,153,.32), transparent 26%), radial-gradient(circle at 85% 85%, rgba(245,158,11,.20), transparent 28%)"
		></div>

		<!-- Nav inside hero -->
		<div class="relative z-10 mx-auto w-full px-5" style="max-width: 1440px">
			<div class="flex items-center justify-between" style="height: 80px">
				<!-- Logo -->
				<a href={resolve('/')} class="inline-flex items-center gap-2.5">
					<span
						class="grid flex-shrink-0 place-items-center rounded-[14px]"
						style="width:38px;height:38px;background:#059669;box-shadow:0 8px 18px rgba(4,120,87,.22)"
					>
						<svg
							viewBox="0 0 24 24"
							width="20"
							height="20"
							fill="none"
							stroke="white"
							stroke-width="1.8"
						>
							<path
								stroke-linecap="round"
								stroke-linejoin="round"
								d="M5 20V9.5L12 4l7 5.5V20M8 20v-5h8v5M7 10h10M9 10V7.8M15 10V7.8"
							/>
						</svg>
					</span>
					<span>
						<span
							class="block text-white"
							style="font-size:17px;font-weight:900;letter-spacing:-.04em;line-height:1"
							>LocalBite</span
						>
						<span
							class="block"
							style="font-size:9px;font-weight:800;letter-spacing:.18em;text-transform:uppercase;margin-top:5px;color:#a7f3d0"
							>vom Hof zu dir</span
						>
					</span>
				</a>

				<!-- Nav links (desktop) + auth button -->
				<div class="flex items-center gap-3">
					<nav class="hidden items-center gap-6 md:flex">
						<a
							href="#how-it-works"
							class="text-sm font-[700] transition"
							style="color:rgba(236,253,245,.65)">So funktioniert's</a
						>
						<a
							href="#warum"
							class="text-sm font-[700] transition"
							style="color:rgba(236,253,245,.65)">Warum LocalBite</a
						>
					</nav>
					{#if isLoggedIn}
						<a
							href={resolve(dashboardHref)}
							class="inline-flex items-center justify-center rounded-full px-3.5 py-2 text-xs font-[800] text-white transition"
							style="background:rgba(255,255,255,.1);border:1px solid rgba(255,255,255,.18)"
						>
							{userName ? `Hallo, ${userName}` : 'Dashboard'}
						</a>
					{:else}
						<a
							href={resolve('/login')}
							class="inline-flex items-center justify-center rounded-full px-3.5 py-2 text-xs font-[800] text-white transition hover:bg-white/20"
							style="background:rgba(255,255,255,.1);border:1px solid rgba(255,255,255,.18)"
						>
							Anmelden
						</a>
					{/if}
				</div>
			</div>
		</div>

		<!-- Hero content -->
		<div class="relative z-10 mx-auto w-full px-5" style="max-width: 1440px">
			<div
				class="grid grid-cols-1 items-center gap-12 pt-10 pb-20 lg:gap-[70px]"
				style="min-height:680px"
			>
				<!-- Responsive: single col by default, two-col at lg via class override -->
				<div class="contents lg:hidden">
					<!-- Mobile: just the text col -->
					<div>
						<!-- Eyebrow pill -->
						<div
							class="mb-[22px] inline-flex items-center gap-2 rounded-full px-3 py-2 text-[12px] font-[800]"
							style="background:rgba(110,231,183,.1);border:1px solid rgba(110,231,183,.2);color:#d1fae5"
						>
							<span class="h-2 w-2 flex-shrink-0 rounded-full" style="background:#10b981"></span>
							Farm-to-Table, neu gedacht
						</div>

						<h1
							class="m-0 text-[46px] font-[950] sm:text-[58px]"
							style="line-height:.98;letter-spacing:-.06em"
						>
							Deine Region.<br />
							Deine Box.<br />
							<span style="color:#6ee7b7">Dein Hof.</span>
						</h1>

						<p
							class="mt-6 text-[16px] sm:text-[18px]"
							style="max-width:690px;line-height:1.65;color:rgba(236,253,245,.72)"
						>
							LocalBite bringt saisonale Lebensmittel lokaler Landwirte in einer Wochenbox direkt zu
							dir – transparent, planbar und mit echter Verbindung zu den Höfen deiner Region.
						</p>

						<div class="mt-[30px] flex flex-wrap gap-3">
							<a
								href={resolve('/login')}
								class="inline-flex items-center justify-center rounded-[13px] px-[18px] py-[13px] text-[13px] font-[900] transition hover:-translate-y-px"
								style="background:#a7f3d0;color:#064e3b"
							>
								Regional einkaufen →
							</a>
							<a
								href="#how-it-works"
								class="inline-flex items-center justify-center rounded-[13px] px-[18px] py-[13px] text-[13px] font-[900] text-white transition hover:bg-white/20"
								style="background:rgba(255,255,255,.1);border:1px solid rgba(255,255,255,.2)"
							>
								So funktioniert's
							</a>
						</div>

						<div
							class="mt-[26px] flex flex-wrap gap-x-[18px] gap-y-2 text-[12px]"
							style="color:rgba(236,253,245,.65);font-weight:750"
						>
							<span>✓ regionale Höfe</span>
							<span>✓ flexible Lieferungen</span>
							<span>✓ Mehrwegboxen</span>
							<span>✓ Tierpartnerschaften</span>
						</div>
					</div>
				</div>

				<!-- Desktop: two-col grid -->
				<div
					class="hidden lg:grid lg:items-center"
					style="grid-template-columns:1.08fr .92fr;gap:70px;min-height:680px;padding-top:40px;padding-bottom:80px"
				>
					<!-- Left -->
					<div>
						<div
							class="mb-[22px] inline-flex items-center gap-2 rounded-full px-3 py-2 text-[12px] font-[800]"
							style="background:rgba(110,231,183,.1);border:1px solid rgba(110,231,183,.2);color:#d1fae5"
						>
							<span class="h-2 w-2 flex-shrink-0 rounded-full" style="background:#10b981"></span>
							Farm-to-Table, neu gedacht
						</div>

						<h1 class="m-0 text-[76px] font-[950]" style="line-height:.98;letter-spacing:-.06em">
							Deine Region.<br />
							Deine Box.<br />
							<span style="color:#6ee7b7">Dein Hof.</span>
						</h1>

						<p
							class="mt-6 text-[18px]"
							style="max-width:690px;line-height:1.65;color:rgba(236,253,245,.72)"
						>
							LocalBite bringt saisonale Lebensmittel lokaler Landwirte in einer Wochenbox direkt zu
							dir – transparent, planbar und mit echter Verbindung zu den Höfen deiner Region.
						</p>

						<div class="mt-[30px] flex flex-wrap gap-3">
							<a
								href={resolve('/login')}
								class="inline-flex items-center justify-center rounded-[13px] px-[18px] py-[13px] text-[13px] font-[900] transition hover:-translate-y-px"
								style="background:#a7f3d0;color:#064e3b"
							>
								Regional einkaufen →
							</a>
							<a
								href="#how-it-works"
								class="inline-flex items-center justify-center rounded-[13px] px-[18px] py-[13px] text-[13px] font-[900] text-white transition hover:bg-white/20"
								style="background:rgba(255,255,255,.1);border:1px solid rgba(255,255,255,.2)"
							>
								So funktioniert's
							</a>
						</div>

						<div
							class="mt-[26px] flex flex-wrap gap-x-[18px] gap-y-2 text-[12px]"
							style="color:rgba(236,253,245,.65);font-weight:750"
						>
							<span>✓ regionale Höfe</span>
							<span>✓ flexible Lieferungen</span>
							<span>✓ Mehrwegboxen</span>
							<span>✓ Tierpartnerschaften</span>
						</div>
					</div>

					<!-- Right: Demo Window -->
					<div class="relative">
						<div
							class="rounded-[34px] p-[15px]"
							style="background:#f9faf5;border:1px solid rgba(255,255,255,.18);box-shadow:0 30px 80px rgba(0,0,0,.3);transform:rotate(-1deg)"
						>
							<div class="rounded-[24px] bg-white p-[22px]" style="color:#1c1917">
								<!-- Demo header -->
								<div class="flex items-start justify-between gap-4">
									<div>
										<div
											class="text-[10px] font-[900] uppercase"
											style="letter-spacing:.14em;color:#047857"
										>
											Deine nächste Box
										</div>
										<h2
											class="mt-1 text-[22px] font-[900]"
											style="margin:4px 0 0;letter-spacing:-.04em;line-height:1.1"
										>
											Herbstlieblinge
										</h2>
									</div>
									<span
										class="mt-1 flex-shrink-0 rounded-full px-2.5 py-1.5 text-[9px] font-[900]"
										style="background:#d1fae5;color:#047857"
									>
										Fr, 23. Okt.
									</span>
								</div>

								<!-- Mini products -->
								<div class="mt-[18px] grid grid-cols-3 gap-2">
									{#each mockupItems as item (item.name)}
										<div class="rounded-[16px] p-[13px]" style="background:#fafaf9">
											<div class="text-[30px]">{item.emoji}</div>
											<b class="mt-1 block text-[12px]">{item.name}</b>
											<div class="text-[10px]" style="color:#a8a29e">{item.farm}</div>
										</div>
									{/each}
								</div>

								<!-- Demo bottom -->
								<div
									class="mt-3 flex items-center justify-between rounded-[17px] p-[15px] text-white"
									style="background:#0b3526"
								>
									<div>
										<div class="text-[11px] font-[800]" style="color:#a7f3d0">
											Classic Box · wöchentlich
										</div>
										<div class="mt-1 text-[20px] font-[950]">29,90 €</div>
									</div>
									<div
										class="grid h-11 w-11 place-items-center rounded-[13px] text-[20px] font-[900]"
										style="background:#6ee7b7;color:#064e3b"
									>
										→
									</div>
								</div>
							</div>
						</div>

						<!-- Floating card -->
						<div
							class="absolute flex items-center gap-2.5 rounded-[18px] bg-white p-[14px]"
							style="left:-25px;bottom:-30px;width:225px;box-shadow:0 18px 50px rgba(28,25,23,.08);color:#1c1917"
						>
							<div
								class="grid flex-shrink-0 place-items-center rounded-full text-[23px]"
								style="width:42px;height:42px;background:#fef3c7"
							>
								🐄
							</div>
							<div>
								<b class="block text-[12px]">Lotte unterstützen</b>
								<div class="text-[10px]" style="color:#a8a29e">Tierpartnerschaft · 8 % Vorteil</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ── So funktioniert LocalBite ──────────────────────── -->
	<section id="how-it-works" class="bg-white" style="padding: 82px 0">
		<div class="mx-auto w-full px-5" style="max-width: 1240px">
			<div class="mb-8 text-center">
				<div class="text-[11px] font-[900] uppercase" style="letter-spacing:.18em;color:#047857">
					In vier Schritten
				</div>
				<h2
					class="mt-2 text-[32px] font-[900] sm:text-[38px]"
					style="letter-spacing:-.045em;color:#1c1917"
				>
					So funktioniert LocalBite.
				</h2>
			</div>

			<div class="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-4">
				{#each steps as step, i (step.number)}
					<div
						class="rounded-[28px] p-[26px] transition-shadow hover:-translate-y-1 hover:shadow-lg"
						style="background:#fff;border:1px solid #e7e5e4;box-shadow:0 5px 18px rgba(28,25,23,.05)"
					>
						<div class="flex items-center justify-between">
							<span class="text-[11px] font-[900]" style="letter-spacing:.14em;color:#d6d3d1">
								{step.number}
							</span>
						</div>
						<div class="mt-[35px] text-[32px]">{step.emoji}</div>
						<h3
							class="mt-[14px] mb-[7px] text-[18px] font-[900]"
							style="letter-spacing:-.02em;color:#1c1917"
						>
							{step.title}
						</h3>
						<p class="m-0 text-[13px] leading-[1.6]" style="color:#78716c">
							{step.description}
						</p>
						{#if i < steps.length - 1}
							<div class="mt-5 hidden text-[11px] font-[900] lg:block" style="color:#047857">
								→ nächster Schritt
							</div>
						{/if}
					</div>
				{/each}
			</div>
		</div>
	</section>

	<!-- ── Warum LocalBite ─────────────────────────────────── -->
	<section id="warum" style="padding: 82px 0; background: #f7f7f2">
		<div class="mx-auto w-full px-5" style="max-width: 1240px">
			<div class="grid grid-cols-1 gap-[60px] lg:grid-cols-[0.7fr_1.3fr]">
				<!-- Left text -->
				<div>
					<div class="text-[11px] font-[900] uppercase" style="letter-spacing:.18em;color:#047857">
						Warum LocalBite?
					</div>
					<h2
						class="mt-[11px] text-[32px] font-[900] sm:text-[38px]"
						style="letter-spacing:-.045em;color:#1c1917"
					>
						Mehr als Lebensmittel liefern.
					</h2>
					<p class="mt-3 text-[15px]" style="max-width:700px;line-height:1.7;color:#78716c">
						LocalBite verbindet die Bequemlichkeit eines Abo-Modells mit lokaler Landwirtschaft. So
						werden Herkunft, Menschen und Wertschöpfung sichtbar.
					</p>
				</div>

				<!-- Right: 3 feature cards -->
				<div class="grid grid-cols-1 gap-5 sm:grid-cols-3">
					{#each features as feature (feature.title)}
						<div
							class="rounded-[28px] p-[25px] transition-shadow hover:-translate-y-1 hover:shadow-lg"
							style="background:#fff;border:1px solid #e7e5e4;box-shadow:0 5px 18px rgba(28,25,23,.05)"
						>
							<div class="text-[30px]">{feature.emoji}</div>
							<h3
								class="mt-4 mb-2 text-[16px] font-[900]"
								style="letter-spacing:-.02em;color:#1c1917"
							>
								{feature.title}
							</h3>
							<p class="m-0 text-[13px] leading-[1.7]" style="color:#78716c">
								{feature.description}
							</p>
						</div>
					{/each}
				</div>
			</div>
		</div>
	</section>

	<!-- ── CTA ─────────────────────────────────────────────── -->
	<section style="padding: 0 0 80px">
		<div class="mx-auto w-full px-5" style="max-width: 1240px">
			<div
				class="flex flex-col items-start justify-between gap-6 rounded-[32px] p-7 text-white sm:flex-row sm:items-center sm:p-[40px]"
				style="background:#1c1917"
			>
				<div>
					<div class="text-[11px] font-[900] uppercase" style="letter-spacing:.18em;color:#6ee7b7">
						Regional einkaufen
					</div>
					<h2
						class="mt-1.5 text-[24px] font-[900] sm:text-[30px]"
						style="letter-spacing:-.04em;color:#fff"
					>
						Ohne fünf Höfe selbst abfahren zu müssen.
					</h2>
				</div>
				<div class="flex flex-shrink-0 flex-wrap gap-2.5">
					<a
						href={resolve('/login')}
						class="inline-flex items-center justify-center rounded-[13px] px-[18px] py-[13px] text-[13px] font-[900] transition hover:-translate-y-px"
						style="background:#fff;color:#1c1917"
					>
						LocalBite entdecken →
					</a>
					{#if !isLoggedIn}
						<a
							href={resolve('/login')}
							class="inline-flex items-center justify-center rounded-[13px] px-[18px] py-[13px] text-[13px] font-[900] text-white transition hover:bg-white/10"
							style="background:transparent;border:1px solid rgba(255,255,255,.2)"
						>
							Anmelden
						</a>
					{/if}
				</div>
			</div>
		</div>
	</section>

	<!-- ── Footer ─────────────────────────────────────────── -->
	<footer style="border-top:1px solid #e7e5e4;background:rgba(255,255,255,.7)">
		<div
			class="mx-auto flex w-full items-center justify-between gap-5 px-5 py-5 text-[11px]"
			style="max-width:1240px;color:#a8a29e"
		>
			<span>LocalBite · Regionale Lebensmittel</span>
			<span>Regional · Transparent · Direkt</span>
		</div>
	</footer>
</div>
