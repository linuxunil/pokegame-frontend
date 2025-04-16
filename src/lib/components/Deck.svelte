<script>
	import PlayingCard from '$lib/components/PlayingCard.svelte';
	import { onMount } from 'svelte';
	import { selected } from '$lib/components/shared.svelte.js';
	let props = $props();

	let pokedex = $state();
	let score = $state(0);
	let highScore = $state(0);

	onMount(async () => {
		let response = await fetch(props.endpoint + '/pokemon');
		pokedex = await response.json();
	});

	function shuffleDeck() {
		for (let i = pokedex.length - 1; i > 0; i--) {
			let j = Math.floor(Math.random() * (i + 1));
			[pokedex[i], pokedex[j]] = [pokedex[j], pokedex[i]];
		}
	}
	function resetGame() {
		if (score > highScore) {
			score = highScore;
		}
		score = 0;
	}
	function cardSelect(event, ndex) {
		if (selected.includes(ndex)) {
			resetGame();
		} else {
			selected.push(ndex);
			score += 1;
			shuffleDeck();
		}
	}
</script>

<div class="columns-3">
	{#each pokedex as pokemon (pokemon.ndex)}
		<PlayingCard endpoint={props.endpoint} ndex={pokemon['ndex']} onclick={cardSelect} />
	{/each}
</div>
