<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function alert($str = NULL,$url =NULL){
	//������ʾ
	echo '<script type="text/javascript">';
	if (! empty($str)){
		echo 'alert("'. $str .'");';
	}
	if (empty($url)){
	echo 'history.back();';
	} else {
	echo 'location.href="'. $url .'";';
	}
	echo '</script>';
	exit();
}
	//ʹ�ô�ӡ
	function p($data = NULL){
	if (empty($data)){
	return FALSE;
	}
	echo '<pre>';
	print_r($data);
	echo '</pre>';
}
	//������ĸ�����ֵ������������������֤��
	function getRandomString($len, $chars=null) {  
	if (is_null($chars)) {  
	$chars = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRT23456789";  
	}  
	mt_srand(10000000*(double)microtime());  
	for ($i = 0, $str = '', $lc = strlen($chars)-1; $i < $len; $i++) {  
	$str .= $chars[mt_rand(0, $lc)];  
	}  
	return $str;  
}  

