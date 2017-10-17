$(document).ready(function () {
	$('#uPesel').focusout(function () {
		rozkodujPesel()
	});
	
	function rozkodujPesel()
	{
		//pobranie daty
		var pesel = document.getElementById('uPesel').value;
		var rok     = parseInt(pesel.substring(0,2),10);
		var miesiac = parseInt(pesel.substring(2,4),10)-1;
		var dzien   = parseInt(pesel.substring(4,6),10);

		if(miesiac > 80){
			rok += 1800;
			miesiac = miesiac - 80;}
		else if(miesiac > 60){
			rok += 2200;
			miesiac = miesiac - 60;}
		else if (miesiac > 40){
			rok += 2100;
			miesiac = miesiac-40;}
		else if (miesiac > 20){
			rok += 2000;
			miesiac = miesiac - 20;}
		else{rok += 1900;}

		var dataUrodzenia = new Date();
		dataUrodzenia.setFullYear(rok, miesiac, dzien);

		// Weryfikacja numery PESEL
		var wagi = [9,7,3,1,9,7,3,1,9,7];
		var suma = 0;

		for(var i=0;i < wagi.length; i++)
		{
			suma+=(parseInt(pesel.substring(i,i+1),10)*wagi[i]);
		}

		suma=suma % 10;

		var cyfraKontr = parseInt(pesel.substring(10,11),10);
		var poprawnosc = (suma === cyfraKontr);

		//określenie płci
		var plec = 'k';

		if(parseInt(pesel.substring(9,10),10) % 2 === 1)
		{
			plec = 'm';
		}
		var wiadomosc ="<li class='info-block'>Niepoprawny numer pesel</li>";
		var wiadomosc2 ="<li class='info-true'>Numer pesel jest dobry</li>";

		if (poprawnosc == 1){
			document.getElementById('wynik').innerHTML = wiadomosc2;
		}
		if (poprawnosc == 0){
			document.getElementById('wynik').innerHTML = wiadomosc;
		}

	}
});
