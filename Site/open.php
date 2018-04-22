<?

	if ($_POST) {
		$file = 'op.txt';
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

		file_put_contents($file, $current);
	}

?>