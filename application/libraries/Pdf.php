<?php defined('BASEPATH') OR exit('No direct script access allowed');

use Dompdf\Dompdf;
class Pdf extends Dompdf{
    /**
     * @var 
     */
    public $filename;
    public function __construct(){
        parent::__construct();
        $this->filename = "laporan.pdf";
    }
    /**
     * @access    protected
     * @return    
     */
    protected function ci()
    {
        return get_instance();
    }
    /**
     * @access    public
     * @param    
     * @param    
     * @return   
     */
    public function load_view($view, $data = array(), $name){
        $html = $this->ci()->load->view($view, $data, TRUE);
        $this->load_html($html);
        // Render the PDF
        $this->render();
        // Output the generated PDF to Browser
        // $this->stream($this->filename, array("Attachment"=>0));
        // return base64_encode($this->stream($this->filename, array("Attachment"=>0)));
        $Output=$this->output();
        file_put_contents("include/pdf_temp/".$name.".pdf", $Output);
        
    }
}