<script>
	import Deck from '$lib/components/Deck.svelte';
	import { scoreBoard } from '$lib/components/shared.svelte';
</script>

<p>High Score: {scoreBoard.high}</p>
<p>Score: {scoreBoard.score}</p>
<Deck endpoint="http://localhost:8000" />
