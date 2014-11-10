$(document).ready(function() {
	/// Hide new instruction initially
	$('div.sub_account_form').hide();
	$('div.hide_rows_btn').hide();

	
	/// New instruction form
	$('#new_sub_account').click( function() {
		$(this).hide();
		$('div.sub_account_form').show();
	});
	
	/// Hide blanks rows
	
	var rows = $('table.accts tr');
	var emptyRows = rows.filter('.EmptyRow').hide();
	
	$('#hide_blank_rows').click( function() {
		var emptyRows = rows.filter('.EmptyRow').hide();
		$('div.hide_rows_btn').hide();
		$('div.show_rows_btn').show();
	});
	
	$('#show_blank_rows').click( function() {
		var emptyRows = rows.filter('.EmptyRow').show();
		$('div.show_rows_btn').hide();
		$('div.hide_rows_btn').show();
	});
		
});