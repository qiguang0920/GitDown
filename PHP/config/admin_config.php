<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$config['sex'] = array('女','男','保密');
//SMTP加密方式
$config['email_auth'] = array('不加密','ssl','tls');
//不用判断权限的用户ID
$config['supper_id'] = array(1);
//不用判断的路径
$config['supper_class_method'] = array(
	'main/index',
	'main/right',
	'main/login_out',
	'user/update_pass',
);
