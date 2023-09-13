
  <link href="<?php echo base_url('include/template/dashboard/css')?>/bootstrap.min.css" rel="stylesheet" type="text/css">

  <script src="<?php echo base_url('include/template/dashboard/js')?>/core/libraries/jquery.min.js"></script>
  <script src="<?php echo base_url('include/template/dashboard/js')?>/core/libraries/bootstrap.min.js"></script>
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
          <h2>Invoice</h2><h3 class="pull-right"><?= $pemasukan_lain['trans_code'] ?></h3>
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
              <strong>Keterangan:</strong><br>
              <?= $pemasukan_lain['keterangan'] ?>
            </address>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-6">
            <address>
              
            </address>
          </div>
          <div class="col-xs-6 text-right">
            <address>
              <strong>Tanggal:</strong><br>
              <?= date_format(date_create($pemasukan_lain['tanggal']), 'd-M-Y') ?><br><br>
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
                  <?php foreach ($detail_pemasukan_lain as $value): ?>
                    <tr>
                      <td><?= $value['keterangan'] ?></td>
                      <td class="text-center">Rp. <?= number_format($value['jumlah'], 0,'.','.') ?></td>
                      <td class="text-center">1</td>
                      <td class="text-right">Rp. <?= number_format($value['jumlah'], 0,'.','.') ?></td>
                    </tr>
                  <?php endforeach ?>
                  
                  
                  <tr>
                    <td class="thick-line"></td>
                    <td class="thick-line"></td>
                    <td class="thick-line text-center"><strong>Subtotal</strong></td>
                    <td class="thick-line text-right">Rp. <?= number_format($pemasukan_lain['total'], 0,'.','.') ?></td>
                  </tr>
                  
                  <tr>
                    <td class="no-line"></td>
                    <td class="no-line"></td>
                    <td class="no-line text-center"><strong>Total</strong></td>
                    <td class="no-line text-right">Rp. <?= number_format($pemasukan_lain['total'], 0,'.','.') ?></td>
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