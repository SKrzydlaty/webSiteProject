$(document).ready(function () {
	var min_chars = 3;
	var characters_error = '<li>Minimalna liczba znaków wynosi 3</li>';
	var checking_html = 'Sprawdzanie...';

	$('#PROPERTY_TITLE').focusout(function () {
		if ($('#PROPERTY_TITLE').val().length < min_chars) {
			document.getElementById("PROPERTY_TITLE").style.backgroundColor = "coral";
			$('#PROPERTY_TITLE_availability_result').html(characters_error);
		}
		if ($('#PROPERTY_TITLE').val().length >= min_chars) {
			document.getElementById("PROPERTY_TITLE").style.backgroundColor = "greenyellow";
			$('#PROPERTY_TITLE_availability_result').html(checking_html);
			check_availability();
		}
	});

	function check_availability() { 
		var PROPERTY_TITLE = $('#PROPERTY_TITLE').val();
		$.post("check_Title.php", {
			PROPERTY_TITLE: PROPERTY_TITLE
		}, function (result) { 
			if (result == 1) {
				$('#PROPERTY_TITLE_availability_result').html('<li>'+PROPERTY_TITLE + ' jest dostępny</li>');
				document.getElementById("PROPERTY_TITLE").style.backgroundColor = "greenyellow";}
			else {
				$('#PROPERTY_TITLE_availability_result').html('<li>'+PROPERTY_TITLE + ' nie jest dostępny</li>');
				document.getElementById("PROPERTY_TITLE").style.backgroundColor = "coral";}
		});
	}
});