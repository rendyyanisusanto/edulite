<?php
defined('BASEPATH') OR exit('No direct script access allowed');
		use PhpOffice\PhpSpreadsheet\Spreadsheet;
		use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

class hari_libur extends MY_Controller {
	

	public $arr = [
			'title'				=>	'Halaman hari_libur',
			'table'				=>	'hari_libur',
			'column'			=>	[ 'keterangan','tanggal'],
			'column_order'		=>	[ 'id_hari_libur','keterangan','tanggal'],
			'column_search'		=>	[ 'id_hari_libur','keterangan','tanggal'],
			'order'				=>	['id_hari_libur'	=>	'DESC'],
			'id'				=>	'id_hari_libur'
	];

	/*
		CHANGE PAGE
	*/
	public function get_data()
	{
		$data['account']	=	$this->get_user_account();
		$data['param'] 		= 	$this->arr;
        
		$this->my_view(['role/admin/page/hari_libur/index_page/index','role/admin/page/hari_libur/index_page/js'],$data);

	}

	public function add_page()
	{

		$data['param'] 		= 	$this->arr;
		$data['department'] = $this->my_where('department', [])->result_array();
        $data['guru'] = $this->my_where('guru', ['is_active'=>1])->result_array();
		$this->my_view(['role/admin/page/hari_libur/add_page/index', 'role/admin/page/hari_libur/add_page/js'],$data);
	}

	public function edit_page($id)
	{
		if (isset($id)) {
				$data['param'] 		= 	$this->arr;
				$data['department'] = $this->my_where('department', [])->result_array();
				$data['hari_libur'] = 	$this->my_where('hari_libur',['id_hari_libur'=>$id])->row_array();
				$this->my_view(['role/admin/page/hari_libur/edit_page/index','role/admin/page/hari_libur/edit_page/js'],$data);
		} else {
			// $this->get_data();
		}
	}

	/*
		ADD DATA
	*/


	public function simpan_data()
	{	
		$jadwal_libur = $this->my_where('hari_libur', ['tanggal' => $_POST['tanggal']])->row_array();
        if (!empty($jadwal_libur)) {
            $response = [
                'status' => 500,
                'message' => 'Tanggal sudah ada dalam daftar hari libur.'
            ];
            echo json_encode($response);
            return;
        }
        
        $data = [
			'keterangan' => $_POST['keterangan'],
			'tanggal' => $_POST['tanggal']
		];
        
        $this->db->insert('hari_libur', $data);
        $id = $this->db->insert_id();

        if (isset($_POST['idguru_fk'])) {
            foreach ($_POST['idguru_fk'] as $key => $value) {
                $data_guru = [
                    'idharilibur_fk' => $id,
                    'idguru_fk' => $value
                ];
                $this->db->insert('pengecualian_hari_libur', $data_guru);
            }
        }
        $response = [
            'status' => 200,
            'message' => 'Data berhasil disimpan.',
            'id' => $id
        ];
        echo json_encode($response);
	}


	/*
		EDIT DATA
	*/

	function update_data()
	{
		$dt = $this->arr;
		$data = [
			'hari_libur' => $_POST['hari_libur'],
			'singkatan' => $_POST['singkatan'],
			'iddepartment_fk' => $_POST['iddepartment_fk']
		];
		if ($this->my_update($dt['table'],$data,[$dt['id']=>$_POST[$dt['id']]])) {
			$this->get_data();
		}	else 	{
			echo "error";
		}
	}

	/*
		DELETE DATA
	*/

	function hapus()
	{
		$dt = $this->arr;
		foreach ($_POST['data_get'] as $key => $value) {
			$this->db->delete($dt['table'],[$dt['id']=>$value]);
		}
	}

	/*
		PRINT DATA
	*/
		
		function cetak_page()
		{
			$dt = $this->arr;
			$data['sum_selected']=0;
			if (isset($_POST['send_data'])) {
				$data_edit=[];
				foreach ($_POST['send_data'] as $key => $value) {
					$data_set = $this->my_where($dt['table'],[$dt['id']=>$value])->row_array();
					foreach ($dt['column_order'] as $keycolumn => $value_column) {
					$data_edit[$value_column]	= $data_set[$value_column];
					}
				}
				$data['data_edit']			=	$data_edit;
				$data['sum_selected']		=	count($_POST['send_data']);
				$data['input_selected']		=	implode(',', $_POST['send_data']);
			}

			$this->display_view('print_page', $data);
			// $this->my_view(['role/admin/page/guru/print_page/index','role/admin/page/guru/print_page/js'],$data);
			
		}

		function cetak_data()
		{
			$dt = $this->arr;
			$this->my_delete_file(FCPATH.'/include/pdf_temp');

			$data=[];
			$where_send		=	[];

			if ($_POST['data_yg_dicetak']	==	'manual') {
				foreach ($dt['column'] as $key => $value) {
					if (!empty($_POST['f_'.$value])) {
						$where_send[$value]	=	$_POST['f_'.$value];
					}
				}
			} else if($_POST['data_yg_dicetak']	==	'pilih')
			{
				$data_selected = explode(',', $_POST['input_selected']);
				foreach ($data_selected as $key => $value) {
					$this->db->or_where($dt['id'], $value);
				}
			}

			$data_set = $this->my_where($dt['table'],$where_send);
			
			$url	=	($_POST['laporan']	==	'data')	?	'role/core_page/print_page/cetak_data'	:	'role/core_page/print_page/cetak_kartu';
			
		    if ($_POST['tipe_laporan'] == 'pdf') {

		    	$param	=	[
	                'url'			=>	$url,
	                'customPaper'	=>	array(0,0,381.89,595.28),
	                'data_value'	=>	[
	                	"data"		=>	$data_set->result_array(),
	                	"param"		=>	$dt
	                ],
	                'name'			=>	md5(rand(0,9999999)),
	                'pos' 			=> 'landscape'
	            ];

	            $this->my_pdf($param);

		    }
		    
		    else if($_POST['tipe_laporan'] == 'excel')

		    {
		    	
	            $param  =   [
	                'filename'			=>		'Jadwal Kegiatan Sekolah',
	                'data_obj'			=>		$data_set->result(),
	                'header_table'		=>		$dt['column'],
	                'print_field'		=>		$dt['column']
	            ];

	            $this->my_export_excel($param);
	        
		    }

		}

	/*
		MANIPULATE DATA
	*/

	public function datatable()
	{
		$_POST['frm']   =   $this->arr;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $pengecualian = $this->my_where('pengecualian_hari_libur', ['idharilibur_fk' => $field['id_hari_libur']])->result_array();
            $pengecualian_list = '';
            if (!empty($pengecualian)) {
                foreach ($pengecualian as $key => $value) {
                    $guru = $this->my_where('guru', ['id_guru' => $value['idguru_fk']])->row_array();
                    if (!empty($guru)) {
                        $pengecualian_list .= $guru['nama'] . '<br>';
                    }
                }
            } else {
                $pengecualian_list = '<b>Tidak ada pengecualian</b>';
            }

            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field['id_hari_libur'].'"></input>';
            $row[]		=	date("d-M-Y", strtotime($field['tanggal']));
            $row[]		=	$field['keterangan'];
            $row[]		=	$pengecualian_list;
            $data[]     =   $row;
        }
        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->mod_datatable->count_all(),
            "recordsFiltered" => $this->mod_datatable->count_filtered(),
            "data" => $data,
        );

        echo json_encode($output);
	}
	
	
	
}