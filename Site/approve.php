<?
	$lastf = 'history.txt'; 
	$his = json_decode(file_get_contents($lastf));

	$his->$_GET['id']->goodOrder = 1; 

	file_put_contents($lastf, json_encode($his));
 
?>