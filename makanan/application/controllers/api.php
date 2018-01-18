name<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api extends CI_Controller {
	function __construct(){
		parent::__construct();

		date_default_timezone_set('Asia/Jakarta');
		error_reporting(E_ALL);
		ini_set('display_error',1);
	}
	//bikin method baru untuk mengambil data kategori
	public function getMakanan(){
		$data = array(); //menjadikan data sebagai array


		//proses query untuk mengambil data dari tb_kategori 
		$sql = "SELECT * FROM tb_food ORDER by food_id ASC";
		//proses eksekusi query
		$q = $this->db->query($sql);
		//apakah datanya kosong atau tidak
		if($q->num_rows() > 0){
			//kondisi ketika data tidak kosong
			//menampilkan data resultnya true
			$data['result'] = 'true';
			//menampilkan msg nya data kategori
			$data['msg'] = 'Data Makanan';
			//menampilkan data request
			$data['List Makanan'] = $q->result();
		}else{
			//apabila data nya kosong
			//menampilkan nilai result false
			$data['result'] = 'false';
			//menampilkan message tidak ada data kategori
			$data['msg'] = 'Tidak Ada Data Makanan';
		}
		//menampilkan hasil data kedalam bentuk json
		echo json_encode($data);
	}

	public function getPersonByIdMakanan(){

		$data = array(); //menjadikan data sebagai array

		$food_id = $this->input->post('food_id');
		//proses query untuk mengambil data dari tb_kategori 
		$sql = "SELECT * FROM tb_person, tb_food WHERE tb_person.id_favFood = tb_food.food_id and tb_person.id_favFood = '$food_id' ORDER BY tb_person.person_id DESC";
		//proses eksekusi query
		$q = $this->db->query($sql);
		//apakah datanya kosong atau tidak
		if($q->num_rows() > 0){
			//kondisi ketika data tidak kosong
			//menampilkan data resultnya true
			$data['result'] = 'true';
			//menampilkan msg nya data kategori
			$data['msg'] = 'Data Makanan';
			//menampilkan data request
			$data['List Makanan'] = $q->result();
		}else{
			//apabila data nya kosong
			//menampilkan nilai result false
			$data['result'] = 'false';
			//menampilkan message tidak ada data kategori
			$data['msg'] = 'Tidak Ada Data Makanan';
		}
		//menampilkan hasil data kedalam bentuk json
		echo json_encode($data);
	}
public function getPerson(){

		$data = array(); //menjadikan data sebagai array

		$id_kategori = $this->input->post('id_kategori');
		//proses query untuk mengambil data dari tb_kategori 
		$sql = "SELECT * FROM tb_person ORDER by person_id DESC";

		//proses eksekusi query
		$q = $this->db->query($sql);
		//apakah datanya kosong atau tidak
		if($q->num_rows() > 0){
			//kondisi ketika data tidak kosong
			//menampilkan data resultnya true
			$data['result'] = 'true';
			//menampilkan msg nya data kategori
			$data['msg'] = 'Data Person';
			//menampilkan data request
			$data['List Person'] = $q->result();
		}else{
			//apabila data nya kosong
			//menampilkan nilai result false
			$data['result'] = 'false';
			//menampilkan message tidak ada data kategori
			$data['msg'] = 'Tidak Ada Data Person';
		}
		//menampilkan hasil data kedalam bentuk json
		echo json_encode($data);
	}
	public function tambahMakanan(){
	$data = array();
	$name = $this->input->post('name');
	$price = $this->input->post('price');

	$this->db->where('name', $name);
	$q = $this->db->get('tb_food');

	if($q->num_rows() > 0) {
		$data['result'] = 'false';
		$data['msg'] = 'Makanan ini sudah terdaftar';
	}else{
		$simpan = array();

		$simpan['name'] = $name;
		$simpan['price'] = $price;

		$status = $this->db->insert('tb_food', $simpan);

		if($status){
			$data['result'] = 'true';
			$data['msg'] = 'Input Makanan Berhasil';
		}else{
			$data['result'] = 'false';
			$data['msg'] = 'Input Gagal, Silahkan Coba Kembali';

		}
	}
	echo json_encode($data);
}
}
//http://localhost/KamusApp/index.php/api/getAllKamus