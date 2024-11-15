@if (!empty($qr))
	@if (!empty($qr['base64']))
		<img src="{{ $qr['base64'] }}"/>
	@endif
	@if (!empty($qr['expire']))
		<script>
			function qrreset()
			{
				window.location.reload();
			}
			setTimeout(qrreset,{{ $qr['expire']*1000 }});
		</script>
	@endif
@endif