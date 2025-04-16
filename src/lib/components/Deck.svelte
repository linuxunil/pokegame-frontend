<script>
import PlayingCard from "$lib/components/PlayingCard.svelte";
import {onMount } from 'svelte';
let props = $props();

let pokedex = $state();
onMount(async() => {
  let response = await fetch(props.endpoint + '/pokemon');
  pokedex = await response.json();
})
</script>

<div>
  {#each pokedex as pokemon}
  <PlayingCard endpoint={props.endpoint} ndex={pokemon['ndex']} />
{/each}
  </div>
