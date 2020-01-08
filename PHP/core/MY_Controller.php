<?php
	defined('BASEPATH') OR exit('No direct script access allowed');

		class Home_Controller extends MY_Controller {
			public function __construct(){
				parent :: __construct($module= 'home', 1, 2);
				$this->load->model(MODULE .'/Documentcate_model');
				$this->load->model(MODULE .'/Adv_model');
				}
			protected function _common() {
			$data = array();

			//菜单		
			$data['nav'] = $this->Documentcate_model->is_nav();
		
			//幻灯片
			$data['banner'] = $this->Adv_model->lists(array('advcate_id' => '11'));

			//logo
			$xy_logo_a = $this->Adv_model->lists(array('advcate_id' => '16'));
			$xy_logo_b = array_column($xy_logo_a,'image');
			$data['logo'] =  implode(',',$xy_logo_b);
			//footer二维码
			$xy_logo_a = $this->Adv_model->lists(array('advcate_id' => '20'));
			$xy_logo_b = array_column($xy_logo_a,'image');
			$data['footer_wechat'] =  implode(',',$xy_logo_b);
			//footer二维码下部logo
			$xy_logo_a = $this->Adv_model->lists(array('advcate_id' => '21'));
			$xy_logo_b = array_column($xy_logo_a,'image');
			$data['footer_logo'] =  implode(',',$xy_logo_b);
			
			//友情链接
			$this->load->model(MODULE .'/Links_model');
			$data['links'] = $this->Links_model->lists();		
		
			//系统设置	
			$this->load->model(MODULE .'/System_model');
			$data['system'] = $this->System_model->row();
			return $data;
			}
		}

	class Admin_Controller extends MY_Controller {
		public function __construct(){
		parent :: __construct();
		//开启session
		session_start();
		//判断用户是否登录
		if (empty($_SESSION['user'])){
		echo '<script>top.location.href="'. site_url(MODULE .'/login/index') .' ";</script>';
		exit();
		}
		//加载自定义config
		$this->config->load('admin_config');
		//权限判断
		$supper_id = $this->config->item('supper_id');
		$user_id = $_SESSION['user']['id'];
		if (! in_array($user_id,$supper_id)){
				//不用判断的路径
			$supper_method = $this->config->item('supper_class_method');
			$check_url = C .'/'. M;
			if (! in_array($check_url,$supper_method)){
			//需要判断			
			
			$role = $_SESSION['user']['role'];		
			if (empty($role)){
				alert('没有权限');
			} else{
			$this->load->model(MODULE .'/Role_model');
			$where = array('id' =>$role);
			$row = $this->Role_model->row($where, array('id'));
		
			if ($row['id'] != $role){
				alert('您正在尝试未被授权的操作');
			}}
			
			$this->load->model(MODULE .'/Jurisdiction_model');
			$where2 = array('class_method' =>$check_url);
			$row2 = $this->Jurisdiction_model->row($where2, array('id'));

			if (empty($row2['id'])){
				alert('没有权限');
			}
			$id = $row2['id'];
			$check_id = explode(',',$row['jurisdiction']);
			if (! in_array($id,$check_id)){
				alert('您正在尝试未被授权的操作');
			}
		}
		}
		}

	//图片上传
		public function _image_upload($arr = array(),$name = array()){
		if (empty($name)){
		return NULL;
			}

		$config['allowed_types'] = 'gif|jpg|jpeg|png|';
		$config['max_size'] = 2000;
		$config['remove_spaces'] = FALSE;
		$config['file_name'] = date('YmdHis').'_'.rand(1000,9999);
		$config = array_merge($config,$arr);
		$this->load->library('upload', $config);
		if($this->upload->do_upload($name))
		{
		$data = $this->upload->data();
        	return $config['upload_path'] . $data['file_name'];
		} else {
			return 0;
		}
		}
		
	//视频上传
		public function _video_upload($arr = array(),$name = array()){
		if (empty($name)){
		return NULL;
			}

		$config['allowed_types'] = 'mp4';
		$config['max_size'] = 20000;
		$config['remove_spaces'] = FALSE;
		$config['file_name'] = date('YmdHis').'_'.rand(1000,9999);
		$config = array_merge($config,$arr);
		$this->load->library('upload', $config);
		if($this->upload->do_upload($name))
		{
		$data = $this->upload->data();
        	return $config['upload_path'] . $data['file_name'];
		} else {
			return 0;
		}
		}
		
	//软件上传
		public function _down_upload($arr = array(),$name = array()){
		if (empty($name)){
		return NULL;
			}

		$config['allowed_types'] = 'zip|rar|';
		$config['max_size'] = 100000;
		$config['remove_spaces'] = FALSE;
		$config['file_name'] = date('YmdHis').'_'.rand(1000,9999);
		$config = array_merge($config,$arr);
		$this->load->library('upload', $config);
		if($this->upload->do_upload($name))
		{
		$data = $this->upload->data();
        	return $config['upload_path'] . $data['file_name'];
		} else {
			return 0;
		}
		}	

		}


	class MY_Controller extends CI_Controller {
		public function __construct($module= 'admin', $controller = 2, $method = 3)
	{
		parent :: __construct();
	//	ini_set('date.timezone','Asia/Shanghai');
		date_default_timezone_set('Asia/Shanghai'); 
		header('Content-Type:text/html; charset=UTF-8');
		//设置表前缀
		$this->db->set_dbprefix('BOTO_');

		//设置虚拟路径
		define('PUB','public');
		define('MODULE',$module);
		define('C',$this->uri->segment($controller,'main'));
		define('M',$this->uri->segment($method,'index'));
		}

		//分页
		protected function _pagination($arr = array()){
		//分页类
		$config['num_links'] = 3;
		$config = array_merge($config,$arr);
		$this->load->library('pagination');
		$this->pagination->initialize($config);
	 	return $this->pagination->create_links();
		//分页完成
		}

	//判断字符是否为非法字符，限制5-16位字母数字和下划线,一般用于限制用户名
		static protected  function _check_str($str){
		if (preg_match('/^[_0-9a-z]{5,16}$/i',$str)){
		return true;
		}else {
  		return false;
 		}
		}
	 //判断是否是正确的邮箱格式;  
		protected function _isEmail($xy_email){  
		$mode = '/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i';
		if(preg_match($mode,$xy_email)){  
		return true;  
		}  
		else{  
		return false;  
		}  
		} 
	
	//验证码
	protected function _captcha() {
		$this->load->helper('captcha');
		$_SESSION['VERIFY'] = rand(1000,9999);
	//	$_SESSION['VERIFY'] = getRandomString(6);
	$config = array(
		'word' => $_SESSION['VERIFY'],
		'img_path' => './' . PUB . '/captcha/',
		'img_url' => base_url('public/captcha'),
		'font_path' => ' ./system/fonts/texb.ttf',
		'img_width' => '137',
		'img_height' => '30',
		'expiration' => '7200'
	);
	$captcha = create_captcha($config);
	return  $config['img_url'] .'/'. $captcha['filename'];
	}
}

