<?php
// File: application/libraries/Pdf.php
// Library wrapper untuk DOMPDF

if (!defined('BASEPATH')) exit('No direct script access allowed');

// Include DOMPDF library
// require_once APPPATH . 'third_party/dompdf/autoload.inc.php';

use Dompdf\Dompdf;
use Dompdf\Options;

class Pdf
{
    private $dompdf;
    
    public function __construct()
    {
        // Configure DOMPDF options
        $options = new Options();
        $options->set('defaultFont', 'Times-Roman');
        $options->set('isRemoteEnabled', true);
        $options->set('isHtml5ParserEnabled', true);
        $options->set('isPhpEnabled', true);
        
        $this->dompdf = new Dompdf($options);
    }
    
    public function loadHtml($html, $encoding = 'UTF-8')
    {
        $this->dompdf->loadHtml($html, $encoding);
    }
    
    public function setPaper($size = 'A4', $orientation = 'portrait')
    {
        $this->dompdf->setPaper($size, $orientation);
    }
    
    public function render()
    {
        $this->dompdf->render();
    }
    
    public function stream($filename = 'document.pdf', $options = array())
    {
        $this->dompdf->stream($filename, $options);
    }
    
    public function output()
    {
        return $this->dompdf->output();
    }
}

// File alternatif: application/libraries/Pdf_tcpdf.php
// Library wrapper untuk TCPDF
