<?php
function getRegulamin(){
	if(isset($_GET['regulamin'])){
		echo "
		<div class='pdf'>
			<embed src='zalozenia.pdf' width='800px' height='1200x' />
			<noembed>
				Niestety Twoja przeglądarka nie odtwarza plików multimedialnych,ale 
				<a href='zalozenia.pdf'>tutaj</a>możesz zobaczyć ten plik!
			</noembed>
		</div>";}
}

function getKontakt(){
	if(isset($_GET['kontakt'])){
		echo "	
		<div class='alert jumbotron alert-info'>
			<div class=text-center>
				<h3>Telefon: 111 222 333</h3>
				<h3>E-mail: <email>admin@o2.pl</email></h3>
				<h3>Zapraszam do kontaktu</h3>
			</div>
		</div>";}
}
?>