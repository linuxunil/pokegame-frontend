<script>
	import { onMount } from 'svelte';
	let data = $state();
	let props = $props();

	let pokemon = $state([
		{
			name: '',
			sprite: ''
		}
	]);

	onMount(async () => {
    //console.log(props.endpoint + "/pokemon");
		let response = await fetch(props.endpoint + `/pokemon/${props.ndex}`);
		data = await response.json();
		pokemon.name = data.name;
    pokemon.sprite = props.endpoint + `/sprite/${data.ndex}.png`
	});
</script>

<div class="max-w-2xs overflow-hidden rounded shadow-lg" onclick={...props}>
	<img class="w-full" src={pokemon.sprite} alt={pokemon.name} />
	<div class="px-6 py-4">
		<div class="mb-2 text-xl font-bold">{pokemon.name}</div>
	</div>
	<div class="px-6 pt-4 pb-2">
		<span
			class="mr-2 mb-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700"
			>#photography</span>
		<span
			class="mr-2 mb-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700"
			>#travel</span>
		<span
			class="mr-2 mb-2 inline-block rounded-full bg-gray-200 px-3 py-1 text-sm font-semibold text-gray-700"
			>#winter</span>
	</div>
</div>

<style>
	/* General styles */
	body {
		font-family: Arial, sans-serif;
		background: #1de366;
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 0;
		padding: 20px;
		box-sizing: border-box;
	}

	.main-heading {
		font-size: 2em;
		margin-bottom: 20px;
		color: #fff;
		text-align: center;
	}

	/* Card Container */
	.card-container {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		gap: 20px;
	}

	/* Card styles */
	.card {
		background-color: #fff;
		border-radius: 8px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		width: 340px;
		overflow: hidden;
		text-align: center;
		transition: transform 0.2s;
		cursor: pointer;
		display: flex;
		flex-direction: column;
	}

	.card:hover {
		transform: scale(1.05);
	}

	.card-img {
		width: 100%;
		height: auto;
	}

	.card-content {
		flex: 1;
		padding: 16px;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.card-title {
		font-size: 1.5em;
		margin: 0 0 8px 0;
	}

	.card-description {
		font-size: 1em;
		color: #13a513;
		margin: 0 0 16px 0;
		text-align: left;
		line-height: 1.4;
	}

	.card-description:hover {
		color: #1de366;
	}

	.card-list {
		text-align: left;
		padding: 0;
		margin: 0 0 16px 0;
		list-style-type: disc;
		list-style-position: inside;
	}

	.card-list li {
		margin-bottom: 8px;
		list-style: none;
		color: #007bff;
	}

	.card-button {
		background-color: #007bff;
		color: #fff;
		border: none;
		border-radius: 4px;
		padding: 10px 20px;
		cursor: pointer;
		text-transform: uppercase;
		font-size: 0.9em;
	}

	.card-button:hover {
		background-color: #0056b3;
	}

	/* Modal styles */
	.modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0, 0, 0);
		background-color: rgba(0, 0, 0, 0.4);
		padding-top: 60px;
	}

	.modal-content {
		background-color: #fefefe;
		margin: 5% auto;
		padding: 20px;
		border: 1px solid #888;
		width: 80%;
		max-width: 500px;
		border-radius: 8px;
	}

	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}

	.close:hover,
	.close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}

	.extra-heading {
		font-size: 1.5em;
		margin-bottom: 15px;
		color: #1a93f5;
		margin-left: 4rem;
	}

	.extra-paragraph {
		color: green;
		font-size: 1em;
		margin-bottom: 15px;
	}

	/* Responsive styles */
	@media (max-width: 600px) {
		.card {
			width: calc(50% - 20px);
		}
	}
</style>
