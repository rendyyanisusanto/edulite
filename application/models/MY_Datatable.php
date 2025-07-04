<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class MY_datatable extends CI_Model
{
	
	var $table='';
	var $column_order = array();
	var $column_search = array();
	var $order = array();

	private function _get_datatables_query()
    {
         
        $this->db->from($this->table);
 
        $i = 0;
     
        foreach ($this->column_search as $item) // looping awal
        {
            if($_POST['search']['value']) // jika datatable mengirimkan pencarian dengan metode POST
            {
                 
                if($i===0) // looping awal
                {
                    $this->db->group_start(); 
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
 
                if(count($this->column_search) - 1 == $i) 
                    $this->db->group_end(); 
            }
            $i++;
        }
         
        if(isset($_POST['order'])) 
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }
 

	public function get_datatables()
	{
		$this->table			=	$_POST['frm']['table'];
		$this->column_order		=	$_POST['frm']['column_order'];
		$this->column_search	=	$_POST['frm']['column_search'];
		$this->order 			=	$_POST['frm']['order'];

		$this->_get_datatables_query();
		if ($_POST['length'] != -1) {
			$this->db->limit($_POST['length'], $_POST['start']);
			$query = $this->db->get();
			return $query->result_array();
			# code...
		}
	}
	public function count_filtered()
	{
		$this->table			=	$_POST['frm']['table'];
		$this->column_order		=	$_POST['frm']['column_order'];
		$this->column_search	=	$_POST['frm']['column_search'];
		$this->order 			=	$_POST['frm']['order'];
		
		$this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
	}
	public function count_all()
    {
    	$this->table			=	$_POST['frm']['table'];
		$this->column_order		=	$_POST['frm']['column_order'];
		$this->column_search	=	$_POST['frm']['column_search'];
		$this->order 			=	$_POST['frm']['order'];
		
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }
	
}
