$(document).ready(function() {
	/// Hide new instruction initially
	$('div.sub_account_form').hide();

	
	/// New instruction form
	$('#new_sub_account').click( function() {
		$(this).hide();
		$('div.sub_account_form').show();
	});
		
});