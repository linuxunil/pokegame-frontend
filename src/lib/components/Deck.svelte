<script>
	import PlayingCard from '$lib/components/PlayingCard.svelte';
	import { onMount } from 'svelte';
	import { scoreBoard } from '$lib/components/shared.svelte.js';
	let props = $props();

	let pokedex = $state();
	let selected = $state([]);

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
		scoreBoard.score = 0;
		selected = [];
	}
	function cardSelect(event, ndex) {
		if (selected.includes(ndex)) {
			resetGame();
		} else {
			selected.push(ndex);
			scoreBoard.score += 1;
			if (scoreBoard.score > scoreBoard.high) {
				scoreBoard.high = scoreBoard.score;
			}
			shuffleDeck();
		}
	}
</script>

<div class="columns-3">
	{#each pokedex as pokemon (pokemon.ndex)}
		<PlayingCard endpoint={props.endpoint} ndex={pokemon['ndex']} onclick={cardSelect} />
	{/each}
</div>
