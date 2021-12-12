<script type="text/javascript"
      src="https://app.sandbox.midtrans.com/snap/snap.js"
      data-client-key="SB-Mid-client-PACtZ5xLX79iFv7W"></script>
<div class="row">
    <div class="col-md-12">
    <form id="payment-form" class="form-horizontal"  method="post" >
        <div class="panel panel-body">
                <center><b>ISI SALDO SISWA</b></center>
                <input type="hidden" name="idsiswa_fk" value="<?php echo $data_get['siswa']['id_siswa']?>">
                <input type="hidden" name="result_type" id="result-type" value="">
                <input type="hidden" name="result_data" id="result-data" value="">
                <input type="hidden" name="order_id" value="<?php echo rand(0, 999999)?>">
                <div class="form-group">
                  <label class="col-lg-3 control-label">Nama:</label>
                  <div class="col-lg-9">
                    <input type="text" name="nama" class="form-control"  readonly value="<?php echo $data_get['siswa']['nama'];?>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Saldo:</label>
                  <div class="col-lg-9">
                    <input type="text" name="saldo" class="form-control"  readonly value="<?php echo $data_get['siswa']['saldo'];?>">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-lg-3 control-label">Jumlah Transfer:</label>
                  <div class="col-lg-9">
                    <input type="text" name="jumlah" class="form-control jumlah" >
                  </div>
                </div>
                <div class="alert alert-warning">
                    <b>Note : </b>
                    saldo v-app bisa digunakan oleh siswa untuk melakukan pembelian makanan/aksesoris yang ada di sekolah melalui kartu pelajar yang dibawa oleh siswa 
                </div>
                <button class="btn btn-success" type="button" id="pay-button">Bayar!</button>
            
        </div>
    </form>
    </div>
</div>

    
    
