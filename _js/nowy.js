$(document).ready(function () {
	//the min chars for uLogin  
	var min_chars = 3;
	var min_chars_p = 11;
	
	//result texts  
	var characters_error = 'Minimalna liczba znaków wynosi 3';
	var characters_error_p = 'Minimalna liczba znaków wynosi 11';
	var checking_html = 'Sprawdzanie...';
	 

	$('#uLogin').focusout(function () {
		if ($('#uLogin').val().length < min_chars) {
			$('#uLogin_availability_result').html(characters_error);}
		else {
			$('#uLogin_availability_result').html(checking_html);
			check_availability();}
	});
	
	function check_availability() {
		var uLogin = $('#uLogin').val();
		$.post("check_uLogin.php", {uLogin: uLogin}, 
			   	function (result) {
					if (result == 1) {
						$('#uLogin_availability_result').html('<li>'+uLogin + ' jest dostepny</li>');}
							else {$('#uLogin_availability_result').html('<li>'+uLogin + ' nie jest dostepny</li>');}
		});
	}
	

	$('#uEmail').focusout(function () {
		if ($('#uEmail').val().length < min_chars) {
			$('#uEmail_availability_result').html(characters_error);}
		else {
			$('#uEmail_availability_result').html(checking_html);
			check_availability_email();}
	});

	function check_availability_email() {
		var uEmail = $('#uEmail').val();
		$.post("check_uEmail.php", {uEmail: uEmail}, 
			   function (result) {
			if (result == 1) {$('#uEmail_availability_result').html('<li>'+uEmail + ' jest dostepny</li>');}
			else {$('#uEmail_availability_result').html('<li>'+uEmail + ' nie jest dostepnyjest dostepny</li>');}
		});
	}
	

	$('#uPhone').focusout(function () {
		if ($('#uPhone').val().length < min_chars_p) {
			$('#uPhone_availability_result').html(characters_error_p);}
		else {
			$('#uPhone_availability_result').html(checking_html);
			check_availability_phone();}
	});

	function check_availability_phone() {
		var uPhone = $('#uPhone').val();
		$.post("check_uPhone.php", {uPhone: uPhone}, 
			   function (result) {
			if (result == 1) {$('#uPhone_availability_result').html('<li class=info-block style=color:green>'+uPhone + ' jest dostepny</li>');}
			else {$('#uPhone_availability_result').html('<li class=info-block>'+uPhone + ' nie jest dostepny</li>');}
		});
	}
	
	$('#uPesel').focusout(function () {
		if ($('#uPesel').val().length < min_chars_p) {
			$('#uPesel_availability_result').html(characters_error_p);}
		else { 
			$('#uPesel_availability_result').html(checking_html);
			check_availability_pesel();}
	});

	function check_availability_pesel() {
		var uPesel = $('#uPesel').val(); 
		$.post("check_uPesel.php", {uPesel: uPesel}, 
			   function (result) {
			if (result == 1) {$('#uPesel_availability_result').html('<li>'+uPesel + ' jest dostepny</li>');}
			else {$('#uPesel_availability_result').html('<li>'+uPesel + ' nie jest dostepny</li>');}
		});
	}
	 
	$('#avProperty').mouseenter(function () {check_availability_Property();	});

	function check_availability_Property() {
		var avProperty = $('#avProperty').val();
		$.post("check_avProperty.php", {avProperty: avProperty}, 
			   function (result) {
					$('#avProperty_result').addClass('alert alert-warning');
					if (result == 1) {
						$('#avProperty_result').html('Można dokonać rezerwacji');}
					else {
						$('#avProperty_result').html('Nie można dokonać rezerwacji, ponieważ ktoś zrobił to już wcześniej!');}
		});
	}
});