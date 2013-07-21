$(document).ready(function() {
	/// Hide new instruction initially
	$('div.transaction_form').hide();
	
	/// New instruction form
	$('#add_transaction').click( function() {
		$(this).hide();
		$('div.transaction_form').show();
	});
});