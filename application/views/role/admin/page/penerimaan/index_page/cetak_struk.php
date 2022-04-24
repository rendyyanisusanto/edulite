<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style type="text/css">
  .invoice-title h2, .invoice-title h3 {
    display: inline-block;
}

.table > tbody > tr > .no-line {
    border-top: none;
}

.table > thead > tr > .no-line {
    border-bottom: none;
}

.table > tbody > tr > .thick-line {
    border-top: 2px solid;
}
</style>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
        <div class="invoice-title">
          <h2>Invoice</h2><h3 class="pull-right"><?= $penerimaan['invoice'] ?></h3>
        </div>
        <hr>
        <div class="row">
          <div class="col-xs-6">
            <address>
            <strong>Dibayarkan kepada:</strong><br>
              <?= $profil['nama'] ?><br>
              <?= $profil['alamat'] ?><br>
              <?= $profil['no_hp'] ?><br>
            </address>
          </div>
          <div class="col-xs-6 text-right">
            <address>
              <strong>Dibayarkan Oleh:</strong><br>
              <?= $post['penerima'] ?>
            </address>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <address>
              <strong>Diterima Oleh:</strong><br>
              <?= $post['mengetahui'] ?>
            </address>
          </div>
          <div class="col-xs-6 text-right">
            <address>
              <strong>Tanggal Pembayaran:</strong><br>
              <?= date_format(date_create($penerimaan['tanggal']), 'd-M-Y') ?><br><br>
            </address>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><strong>Detail Pembayaran</strong></h3>
          </div>
          <div class="panel-body">
            <div class="table-responsive">
              <table class="table table-condensed">
                <thead>
                                <tr>
                      <td><strong>Item</strong></td>
                      <td class="text-center"><strong>Price</strong></td>
                      <td class="text-center"><strong>Quantity</strong></td>
                      <td class="text-right"><strong>Totals</strong></td>
                                </tr>
                </thead>
                <tbody>
                  <!-- foreach ($order->lineItems as $line) or some such thing here -->
                  <tr>
                    <td>Pembayaran <?= $penerimaan['nama'] ?> a/n <?= $penerimaan['nama_siswa'] ?></td>
                    <td class="text-center">Rp. <?= number_format($penerimaan['jumlah'], 0,'.','.') ?></td>
                    <td class="text-center">1</td>
                    <td class="text-right">Rp. <?= number_format($penerimaan['jumlah'], 0,'.','.') ?></td>
                  </tr>
                  
                  <tr>
                    <td class="thick-line"></td>
                    <td class="thick-line"></td>
                    <td class="thick-line text-center"><strong>Subtotal</strong></td>
                    <td class="thick-line text-right">Rp. <?= number_format($penerimaan['jumlah'], 0,'.','.') ?></td>
                  </tr>
                  
                  <tr>
                    <td class="no-line"></td>
                    <td class="no-line"></td>
                    <td class="no-line text-center"><strong>Total</strong></td>
                    <td class="no-line text-right">Rp. <?= number_format($penerimaan['jumlah'], 0,'.','.') ?></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>
<script type="text/javascript">
  print();
</script>