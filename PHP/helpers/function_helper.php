<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function alert($str = NULL,$url =NULL){
	//弹出提示
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
	//使用打印
	function p($data = NULL){
	if (empty($data)){
	return FALSE;
	}
	echo '<pre>';
	print_r($data);
	echo '</pre>';
}
	//生成字母和数字的随机数，用于生成验证码
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

