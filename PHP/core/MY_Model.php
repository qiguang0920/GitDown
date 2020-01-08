<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Model extends CI_Model {
	

		//获取子类		
	         static protected function _get_child($data,$pid = 0) {
			$array = array();
			foreach ($data as $v){
				if ($v['pid'] == $pid) {
					$v['child'] = self :: _get_child($data, $v['id']);
					$array[] = $v;
				}
			}
			return $array;
		}
	
		//密码加密
		protected function _password($pass,$salt){
		return hash('sha512',hash('sha256',$pass.'lovexy').$salt);
		}

		//删除图片
		static protected function _delete_image($image = array()){
			if (empty($image)){
			return FALSE;
			}
			$dir = $_SERVER['DOCUMENT_ROOT'];
			foreach ($image as $img){
				file_exists($dir . $img) ? unlink($dir . $img) : NULL;
				}
		}

		//分类级别
		static protected function _cate_level($data,$pid = 0,$level = 1){
		$array = array();
		foreach ($data as $k => $v){
			if ($v['pid'] == $pid) {
				$v['level'] = $level;
				$array[] = $v;
				unset($data[$k]);
				$array = array_merge($array,self :: _cate_level($data,$v['id'],$level + 1));
			}	
		}
			return $array;
	}
		//获取数据
	protected function _get_data($t = NULL){
		if (empty($t)){
		return array();
		}
		//$result = $this->db->query('DESC ci_documentcate')->result_array();
		$result = $this->db->query('DESC '.$this->db->dbprefix($t))->result_array();
	
		$fields = array();
		foreach ($result as $v){
			if ($v['Field'] == 'id'){
			continue;
			}
		$fields[] = $v['Field'];
		}

		$data = array();
		foreach ($_POST as $k => $v){
			if (in_array($k,$fields)){
			
		$data[$k] = $this->input->post($k);
				}
		}
		return $data;
			}
}

