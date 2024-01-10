<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

   
    public function __construct()
    {
        parent::__construct();
        $this->load->model('MY_Model','mod');
        $this->load->model('MY_Datatable','mod_datatable');
        $this->get_login();
    }

    public $arr_hari  = [
      '', 'senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu','minggu'
    ];
    public function get_login()
    {
        
        if (!$this->ion_auth->logged_in())
        {
            // redirect them to the login page
            if ($this->uri->segment(1)!='auth'){
                redirect('auth/login', 'refresh');
            }
            if ($this->uri->segment(2)=='logout') {
                redirect('auth/login', 'refresh');
            }
        }
        else 
        {            
            if ($this->uri->segment(2)!='logout') {
                $group_name=$this->ion_auth->get_users_groups()->row();
                if ($this->uri->segment(1)!=$group_name->name) {
                    redirect($group_name->name.'/Dashboard', 'refresh');
                }
            }
            
        }
    }

    public function data_all()
    {
        $data['profil_website']     =  $this->mod->get_profil_website(); 
        $data['user_account']       =  $this->ion_auth->user()->row_array();
        $data['user_groups']        =   $this->my_groups();
        $data['user_modul']         =   $this->session->userdata('modul');
        $data['sidebar']            =   $this->my_sidebar();
        return $data;
    }

    public function my_template()
    {
        return $this->config->item('template');
    }

    public function my_login_page()
    {
        return $this->config->item('login_page');
    }

    public function my_groups()
    {
        return $this->ion_auth->get_users_groups()->row_array();
    }


    public function my_view($view,$data_get)
    {
        $i=0;
        $data = $this->data_all();
        $data['data_get']=$data_get;
        foreach ($view as $key => $value) {
            if ($i==0) {
                $this->load->view($value,$data);
            }else{
                $this->load->view($value);
            }
        }
    }
    public function my_delete_file($folder)
    {
            //Get a list of all of the file names in the folder.
            $files = glob($folder . '/*');
            //Loop through the file list.
            foreach($files as $file){
                //Make sure that this is a file and not a directory.
                if(is_file($file)){
                    //Use the unlink function to delete the file.
                    unlink($file);
                }
            }
    }
    public function my_sidebar()
    {
        $group  =   $this->my_groups();
        return 'role/'.$group['name'].'/include/'.$this->config->item('sidebar_name');;
    }
    public function my_update($tabel, $data, $where)
    {
        return $this->mod->set_update($tabel, $data, $where);
    }
    public function my_where($tabel, $where, $limit=0)
    {
        return $this->mod->get_where($tabel, $where, $limit);
    }
    public function my_db_count($tabel, $where)
    {
        return $this->mod->get_where($tabel, $where)->num_rows();
    }
    public function get_user_account()
    {
        return $this->ion_auth->user()->row_array();
    }

    public function save_data($tabel, $data)
    {
        return $this->mod->save($tabel, $data);
    }

    public function my_pdf($param)
    {
        /*
            param[
                'url',
                'customPaper',
                'data',
                'name',
                'pos' => 'landscape' / 'portrait'

            ];
        */
        
        $this->pdf->setPaper($param['customPaper'], $param['pos']);
        $this->pdf->load_view($param['url'], $param['data_value'], $param['name']);
        echo $param['name'];
        // print_r($param['data_value']);
    }

    public function my_export_excel($param)
    {
        $dt = $this->arr;
        $extension = pathinfo($param, PATHINFO_EXTENSION);
 
                if($extension == 'csv'){
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
                } elseif($extension == 'xlsx') {
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
                } else {
                    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
                }
                // file path
                $spreadsheet = $reader->load($_FILES['fileURL']['tmp_name']);
                $allDataInSheet = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
            
                // array Count
                $arrayCount = count($allDataInSheet);
                $flag = 0;
                $createArray = $dt['column'];
                $makeArray = [];
                foreach ($dt['column'] as $key => $value) {
                    $makeArray[$value] = $value;
                };

                $SheetDataKey = array();
                foreach ($allDataInSheet as $dataInSheet) {
                    foreach ($dataInSheet as $key => $value) {
                        if (in_array(trim($value), $createArray)) {
                            $value = preg_replace('/\s+/', '', $value);
                            $SheetDataKey[trim($value)] = $key;
                        } 
                    }
                }
                $dataDiff = array_diff_key($makeArray, $SheetDataKey);
                if (empty($dataDiff)) {
                    $flag = 1;
                }
                // match excel sheet column
                if ($flag == 1) {
                    for ($i = 2; $i <= $arrayCount; $i++) {
                        $addresses = array();
                        $dtcolumn=[];
                        foreach ($dt['column'] as $key => $value) {

                            $dtcolumn[$value] = $allDataInSheet[$i][$SheetDataKey[$value]];
                        }
                        $fetchData[] = $dtcolumn;
                    }   
                    $data['dataInfo'] = $fetchData;
                    return $fetchData;
                } else {
                    print_r($allDataInSheet);
                    echo "Please import correct file, did not match excel sheet column";
                }
    }
    public function index()
    {
        $tmp    =  $this->my_template();
        $data   =  $this->data_all();

        $this->load->view('template/'.$tmp.'/head',$data);
        $this->load->view('template/'.$tmp.'/navbar');
        $this->load->view('template/'.$tmp.'/sidebar');
        $this->load->view('template/'.$tmp.'/content');
        $this->load->view('template/'.$tmp.'/footer');
    }

    public function call_datatable($data_get='')
    {
        $_POST['frm']   =   $data_get;
        $list           =   $this->mod_datatable->get_datatables();
        $data           =   array();
        $no             =   $_POST['start'];
        foreach ($list as $field) {
            $no++;
            $row        =   array();
            $row[]      =   '<input type="checkbox" name="get-check" value="'.$field[$data_get['id']].'"></input>';
            foreach ($data_get['column'] as $key => $value_row) {
                $row[]  =   $field[$value_row];
            }
            $data[]     =   $row;
        }
 
        $output = array(
            "draw" => $_POST['draw'],
            "recordsTotal" => $this->mod_datatable->count_all(),
            "recordsFiltered" => $this->mod_datatable->count_filtered(),
            "data" => $data,
        );

        return $output;
    }

    public function display_view($page = "index_table", $additional_data = [])
    {
        $data['account']    =   $this->get_user_account();
        $data['param']      =   $this->arr;
        $data['additional_data'] = $additional_data;
        $this->my_view(['role/core_page/'.$page.'/index','role/core_page/'.$page.'/js'],$data);
    }

    public function save_data_param()
    {
        $param = $this->arr;

        $data_save = [];
        foreach ($param['column'] as $key => $value) {
            $data_save[$value] = $_POST[$value];
        };

        return $this->save_data($param['table'], $data_save);
    }

    public function save_data_batch($table='', $data="")
    {
        return $this->db->insert_batch($table, $data);
    }

    public function save_my_jurnal($data)
    {
        if (isset($data)) {
            if (!empty($data)) {
               $ins = [];
                foreach ($data['referensi'] as $key => $value) {
                    $ins[] = [
                        'ref'           =>  $data['ref'],
                        'keterangan'    =>  $data['keterangan'],
                        'table'         =>  $data['table'],
                        'idtable_fk'    =>  $data['idtable_fk'],
                        'idakun_fk'          =>  $value['akun'],
                        'debit'         =>  $value['debit'],
                        'kredit'        =>  $value['kredit'],
                    ];
                }
                return $this->db->insert_batch('jurnal_umum', $ins);
            }
        }
        
    }
    public function generate_code($value='')
    {
        $setting = [
            '{year}'    =>  date('Y'),
            '{month}'   =>  date('m'),
            '{rand}'    =>  rand(0,9999999),
            '{date_of_month}'     =>    date('d'),
            '{date}'    =>  date('dmY')  
        ];

        return strtr($value, $setting);
    }
    public function baris2kolom($kolom1, $kolom2, $lebar_kolom_1, $lebar_kolom_2) {
            
 
            // Melakukan wordwrap(), jadi jika karakter teks melebihi lebar kolom, ditambahkan \n 
            $kolom1 = wordwrap($kolom1, $lebar_kolom_1, "\n", true);
            $kolom2 = wordwrap($kolom2, $lebar_kolom_2, "\n", true);
 
            // Merubah hasil wordwrap menjadi array, kolom yang memiliki 2 index array berarti memiliki 2 baris (kena wordwrap)
            $kolom1Array = explode("\n", $kolom1);
            $kolom2Array = explode("\n", $kolom2);
 
            // Mengambil jumlah baris terbanyak dari kolom-kolom untuk dijadikan titik akhir perulangan
            $jmlBarisTerbanyak = max(count($kolom1Array),  count($kolom2Array));
 
            // Mendeklarasikan variabel untuk menampung kolom yang sudah di edit
            $hasilBaris = array();
 
            // Melakukan perulangan setiap baris (yang dibentuk wordwrap), untuk menggabungkan setiap kolom menjadi 1 baris 
            for ($i = 0; $i < $jmlBarisTerbanyak; $i++) {
 
                // memberikan spasi di setiap cell berdasarkan lebar kolom yang ditentukan, 
                $hasilKolom1 = str_pad((isset($kolom1Array[$i]) ? $kolom1Array[$i] : ""), $lebar_kolom_1, " ");
 
                $hasilkolom2 = str_pad((isset($kolom2Array[$i]) ? $kolom2Array[$i] : ""), $lebar_kolom_2, " ", STR_PAD_LEFT);
 
                // Menggabungkan kolom tersebut menjadi 1 baris dan ditampung ke variabel hasil (ada 1 spasi disetiap kolom)
                $hasilBaris[] = $hasilKolom1 . " " . $hasilkolom2;
            }
 
            // Hasil yang berupa array, disatukan kembali menjadi string dan tambahkan \n disetiap barisnya.
            return implode($hasilBaris, "\n") . "\n";
    }

    public function baris3kolom($kolom1, $kolom2,$kolom3, $lebar_kolom_1, $lebar_kolom_2,  $lebar_kolom_3) {
            
 
            // Melakukan wordwrap(), jadi jika karakter teks melebihi lebar kolom, ditambahkan \n 
            $kolom1 = wordwrap($kolom1, $lebar_kolom_1, "\n", true);
            $kolom2 = wordwrap($kolom2, $lebar_kolom_2, "\n", true);
            $kolom3 = wordwrap($kolom3, $lebar_kolom_3, "\n", true);
 
            // Merubah hasil wordwrap menjadi array, kolom yang memiliki 2 index array berarti memiliki 2 baris (kena wordwrap)
            $kolom1Array = explode("\n", $kolom1);
            $kolom2Array = explode("\n", $kolom2);
            $kolom3Array = explode("\n", $kolom3);
 
            // Mengambil jumlah baris terbanyak dari kolom-kolom untuk dijadikan titik akhir perulangan
            $jmlBarisTerbanyak = max(count($kolom1Array),  count($kolom2Array), count($kolom3Array));
 
            // Mendeklarasikan variabel untuk menampung kolom yang sudah di edit
            $hasilBaris = array();
 
            // Melakukan perulangan setiap baris (yang dibentuk wordwrap), untuk menggabungkan setiap kolom menjadi 1 baris 
            for ($i = 0; $i < $jmlBarisTerbanyak; $i++) {
 
                // memberikan spasi di setiap cell berdasarkan lebar kolom yang ditentukan, 
                $hasilKolom1 = str_pad((isset($kolom1Array[$i]) ? $kolom1Array[$i] : ""), $lebar_kolom_1, " ");
 
                $hasilkolom2 = str_pad((isset($kolom2Array[$i]) ? $kolom2Array[$i] : ""), $lebar_kolom_2, " ", STR_PAD_LEFT);
                $hasilkolom3 = str_pad((isset($kolom3Array[$i]) ? $kolom3Array[$i] : ""), $lebar_kolom_3, " ", STR_PAD_LEFT);
 
                // Menggabungkan kolom tersebut menjadi 1 baris dan ditampung ke variabel hasil (ada 1 spasi disetiap kolom)
                $hasilBaris[] = $hasilKolom1 . " " . $hasilkolom2. " " . $hasilkolom3;
            }
 
            // Hasil yang berupa array, disatukan kembali menjadi string dan tambahkan \n disetiap barisnya.
            return implode($hasilBaris, "\n") . "\n";
    }

    public function get_guru()
    {
        $data['account']    =   $this->get_user_account();
        $data['walas']      =   (($this->my_where('v_walas', ['idguru_fk'=>$data['account']['anggota_id']])->num_rows()) > 0  ) ? $this->my_where('v_walas', ['idguru_fk'=>$data['account']['anggota_id']])->result_array() : [];
        $data['guru']       =   $this->my_where('guru', ['id_guru'=>$data['account']['anggota_id']])->row_array();
        $data['mapel']      =   $this->my_where('v_guru_mapel', ['id_guru'=>$data['account']['anggota_id']])->result_array();
        return $data;
    }

    public function get_siswa()
    {
        $data['account']    =   $this->get_user_account();
        $data['siswa']       =   $this->my_where('siswa', ['id_siswa'=>$data['account']['anggota_id']])->row_array();
        
        return $data;
    }

    public function save_media($data)
    {
        $config['upload_path']=$data['path'] ; //path folder file upload
        $config['allowed_types']='gif|jpg|png|jpeg|PNG|JPG|JPEG|pdf|doc|docx|xls|xlsx'; //type file yang boleh di upload
        $config['encrypt_name'] = TRUE; //enkripsi file name upload
         
        $this->load->library('upload',$config); //call library upload 
        if($this->upload->do_upload($data['filename'])){ //upload file
           
            return $this->upload->data(); 
        }

    }

    public function tahun_ajaran_aktif()
    {
        $tahun = $this->my_where('tahun_ajaran', ['is_active'=>1])->row_array();
        return $tahun;
    }

    public function cek_kd()
    {
        
        $data['account']    =   $this->get_user_account();
        $ta = $this->tahun_ajaran_aktif();
        $kd = $this->my_where('kd', ['idtahunajaran_fk'=>$ta['id_tahun_ajaran'], 'idguru_fk'=>$data['account']['anggota_id']])->num_rows();
        return $kd;
    }
    public function cek_kd_mapel($kelas, $mapel)
    {
        
        $data['account']    =   $this->get_user_account();
        $ta = $this->tahun_ajaran_aktif();
        $kd = $this->my_where('kd', ['idtahunajaran_fk'=>$ta['id_tahun_ajaran'], 'idguru_fk'=>$data['account']['anggota_id'], 'idmatapelajaran_fk'=>$mapel, 'idkelas_fk'=>$kelas])->num_rows();
        return $kd;
    }

    public function cek_jadwal_guru_hari_ini($idguru_fk = "", $tahun_ajaran = "")
    {
        if (!empty($idguru_fk)) {
            $day = date('w', strtotime("now"));
            $cek_jadwal = $this->my_where('jadwal_guru', ['idguru_fk'=>$idguru_fk, 'idhari_fk'=>$day, 'idtahunajaran_fk'=>$tahun_ajaran]);

            return $cek_jadwal->num_rows();
        }
    }

    public function cek_presensi_guru_hari_ini($idguru_fk="", $tahun_ajaran="")
    {
        if (!empty($idguru_fk)) {
            $cek_absen = $this->my_where('presensi_guru', ['idguru_fk'=>$idguru_fk, 'tanggal' => date('Y-m-d'), 'idtahunajaran_fk'=>$tahun_ajaran] )->row_array();

            return $cek_absen;
        }
    }

    // Keuangan

    public function get_from_account($where_set=[], $akun_number)
    {
        $coa = $this->db->where('id_coa', $akun_number)->get('coa')->result_array();
        $akun = [];
        $cash_set = 0;
        foreach ($coa as $key => $value_coa) {
            $induk = $this->my_where('induk_akun', ['idcoa_fk'=>$value_coa['id_coa']])->result_array();
            foreach ($induk as $key => $value_induk) {
                $akun = $this->my_where('akun', ['idindukakun_fk'=>$value_induk['id_induk_akun']])->result_array();
                foreach ($akun as $key => $value) {
                    $select = ($value['saldo_normal'] == 'D') ? 'sum(debit)-sum(kredit) as cash' : 'sum(kredit)-sum(debit) as cash';
                    $this->db->select($select);
                    $this->db->where('idakun_fk', $value['id_akun']);
                    foreach ($where_set as $key2 => $value2) {
                        $this->db->where($value2['key_app'],$value2['value_app']);
                    }
                    $cek = $this->db->get('jurnal_umum');
                    $jurnal = $cek->row_array(); 

                    $cash = (!empty($jurnal['cash']))?$jurnal['cash']:0;
                    
                    $cash_set += $cash;
                }
            }
        }
        
        return $cash_set;
    }
    public function get_penerimaan($where_set=[])
    {
            $this->db->select('*');
            foreach ($where_set as $key2 => $value2) {
                $this->db->where($value2['key_app'],$value2['value_app']);
            }
            $cek = $this->db->get('penerimaan');

            return $cek->num_rows();
    }


}