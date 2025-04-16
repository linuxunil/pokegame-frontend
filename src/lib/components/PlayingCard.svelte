<script>
	import { onMount } from 'svelte';
	let data = $state();
	let props = $props();
	let response = $state();

	let pokemon = $state([
		{
			ndex: '',
			name: '',
			sprite: ''
		}
	]);

	onMount(async () => {
		//console.log(props.endpoint + "/pokemon");
		response = await fetch(props.endpoint + `/pokemon/${props.ndex}`);
		data = await response.json();
		pokemon.ndex = data.ndex;
		pokemon.name = data.name;
		pokemon.sprite = props.endpoint + `/sprite/${data.ndex}.png`;
	});
</script>

<button
	class="max-w-2xs overflow-hidden rounded shadow-lg"
	onclick={() => props.onclick(event, pokemon.ndex)}
>
	<img class="w-full" src={pokemon.sprite} alt={pokemon.name} />
	<div class="px-6 py-4">
		<div class="mb-2 text-xl font-bold">{pokemon.name}</div>
	</div>
	<div class="px-6 pt-4 pb-2">
		<span
			class="mr-2 mb-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700"
			>#photography</span
		>
		<span
			class="mr-2 mb-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700"
			>#travel</span
		>
		<span
			class="mr-2 mb-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700"
			>#winter</span
		>
	</div>
</button>

<style>
</style>
