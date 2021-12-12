<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bayar extends MY_Controller {
    public function __construct()
    {
        parent::__construct();
        $params = array('server_key' => 'SB-Mid-server-3Z6y_TDuesSW7t7ktYCHUEls', 'production' => false);
		$this->load->library('midtrans');
		$this->midtrans->config($params);
		$this->load->helper('url');	
    }

	public function get_data()
	{
		$data = [];

		$data['account']	=	$this->get_user_account();
		$data['siswa'] = $this->my_where('siswa', ['id_siswa' => $data['account']['anggota_id']])->row_array();

		$this->my_view(['role/ortu/page/bayar/index_page/index','role/ortu/page/bayar/index_page/js'],$data);
	}

    public function token()
    {
		
		// Required
		$transaction_details = array(
		  'order_id' => rand(),
		  'gross_amount' => (int)$_POST['jumlah'], // no decimal allowed for creditcard
		);

		// Optional
		$item1_details = array(
		  'id' => 'a1',
		  'price' => (int)$_POST['jumlah'],
		  'quantity' => 1,
		  'name' => "Isi Saldo"
		);

		// Optional
		$item_details = array ($item1_details);

		// Optional
		$billing_address = array(
		  'first_name'    => "Abdur",
		  'last_name'     => "Rochim, S.Pd",
		  'address'       => "Sumberpasir",
		  'city'          => "Malang",
		  'postal_code'   => "65154",
		  'phone'         => "085894632505",
		  'country_code'  => 'IDN'
		);

		// Optional
		$shipping_address = array(
		  'first_name'    => "Obet",
		  'last_name'     => "Supriadi",
		  'address'       => "Manggis 90",
		  'city'          => "Jakarta",
		  'postal_code'   => "16601",
		  'phone'         => "08113366345",
		  'country_code'  => 'IDN'
		);

		// Optional
		$customer_details = array(
		  'first_name'    => "User",
		  'last_name'     => "K",
		  'email'         => "user@gmail.com",
		  'phone'         => "081122334455",
		  'billing_address'  => $billing_address,
		  'shipping_address' => $shipping_address
		);

		// Data yang akan dikirim untuk request redirect_url.
        $credit_card['secure'] = true;
        //ser save_card true to enable oneclick or 2click
        //$credit_card['save_card'] = true;

        $time = time();
        $custom_expiry = array(
            'start_time' => date("Y-m-d H:i:s O",$time),
            'unit' => 'minute', 
            'duration'  => 2
        );
        
        $transaction_data = array(
            'transaction_details'=> $transaction_details,
            'item_details'       => $item_details,
            'customer_details'   => $customer_details,
            'credit_card'        => $credit_card,
            'expiry'             => $custom_expiry
        );

		error_log(json_encode($transaction_data));
		$snapToken = $this->midtrans->getSnapToken($transaction_data);
		error_log($snapToken);
		echo $snapToken;
    }

    public function simpan()
    {

		$result = json_decode($this->input->post('result_data'));
		$data = [
			'jenis_transaksi'	=>	'SALDO SISWA',
			'idsiswa_fk'		=>	$_POST['idsiswa_fk'],
			'jumlah'			=>	$_POST['jumlah'],
			'tanggal'			=>	date('Y-m-d'),
			'status'			=>	0,
			'order_id'			=>	$_POST['order_id']
		];

		if($this->my_where('transaksi_saldo', ['order_id'=>$_POST['order_id'], 'idsiswa_fk'=>$_POST['idsiswa_fk']])->num_rows() == 0 )
		{
			if($this->save_data('transaksi_saldo', $data)){
				$this->db->query('update siswa set saldo = saldo + '.$_POST['jumlah'].' where id_siswa = '.$_POST['idsiswa_fk']);
			}
		}
		
	}
}
