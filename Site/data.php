<?

	if ($_POST) {
		$file = 'last.txt';
		var_dump($_POST);
		var_dump($_GET);

		$current = json_encode($_POST);
		$current = str_replace('"', "", $current);
		$current = str_replace('}', '}}', $current);
		$current = str_replace(':', '":', $current);
		$current = str_replace(',', ',"', $current);
		$current = str_replace('{', '{"', $current);
		$current = str_replace('BTCUSD', '"BTCUSD"', $current);
		$current = str_replace('long', '"Long"', $current);
		$current = str_replace('short', '"Short"', $current);
		$current = str_replace('xxx', '},"', $current); 
		$current = str_replace('www', '":{', $current); 
		$current = str_replace(',"orderId"', '"orderId"', $current); 
		$current = str_replace('"history":},', '', $current); 
		$current = str_replace('"BTCUSD",', '"BTCUSD","goodOrder":0,', $current);  

		file_put_contents($file, $current);
	} 

	$lastf = 'last.txt'; 
	$last = json_decode(file_get_contents($lastf));

	$hisf = 'history.txt';
	$history = json_decode(file_get_contents($hisf));

	var_dump($last);
	var_dump($history);

	$newHistory = (object) array_merge((array) $last, (array) $history);

	var_dump($newHistory);

	file_put_contents($hisf, json_encode($newHistory));

	// $file = 'data.txt';
	// $current = str_replace('"', "", file_get_contents($file));
	// $current = str_replace('}', '}}', $current);
	// $current = str_replace(':', '":', $current);
	// $current = str_replace(',', ',"', $current);
	// $current = str_replace('{', '{"', $current);
	// $current = str_replace('BTCUSD', '"BTCUSD"', $current);
	// $current = str_replace('long', '"long"', $current);
	// $current = str_replace('short', '"short"', $current);
	// $current = str_replace('xxx', '},"', $current); 
	// $current = str_replace('www', '":{', $current); 
	// $current = str_replace(',"orderId"', '"orderId"', $current); 
	// $current = str_replace('"history":},', '', $current);
	// $current = json_decode($current);
	// file_put_contents($file, $current);

?>