<script>
	import PlayingCard from '$lib/components/PlayingCard.svelte';
	import { onMount } from 'svelte';
	import { selected } from '$lib/components/shared.svelte.js';
	let props = $props();

	let pokedex = $state();

	onMount(async () => {
		let response = await fetch(props.endpoint + '/pokemon');
		pokedex = await response.json();
	});

	function checkSelected(ndex) {}
	function cardSelect(event, ndex) {
		console.log(ndex);
	}
</script>

<div class="columns-3">
	{#each pokedex as pokemon (pokemon.ndex)}
		<PlayingCard endpoint={props.endpoint} ndex={pokemon['ndex']} onclick={cardSelect} />
	{/each}
</div>
