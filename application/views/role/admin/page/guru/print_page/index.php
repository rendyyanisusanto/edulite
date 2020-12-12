    <section class="content-header">
      <h1>
        Profil
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Buku Tamu</a></li>
        <li class="active">Cetak Buku Tamu</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
       <div class="row">
        <div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Cetak Buku Tamu</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form class="form-horizontal" action="buku_tamu/coba_cetak" method="POST" target='_blank' id="frm-set">
              <div class="col-md-6">
                <div class="form-group">
                  <label class="control-label col-sm-3">Laporan</label>
                  <div class="col-sm-9">
                    <select class="form-control" name="laporan">
                      <option> Pilih </option>
                      <option value="data"> Cetak Data(Tabel) </option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-sm-3">Data yg dicetak</label>
                  <div class="col-sm-9">
                    <select class="form-control" name="data_yg_dicetak" id="data_yg_dicetak">
                      <option> Pilih </option>
                      <option value="all"> Semua Data </option>
                      <?php if ($data_get['sum_selected']>0): ?>
                        <option value="pilih"> Data yg dipilih (<?php echo $data_get['sum_selected'] ?> data terpilih) </option>
                      <?php endif ?>
                      <option value="manual"> Filter manual</option>
                    </select>
                  </div>
                </div>
                <?php if ($data_get['sum_selected']>0): ?>
                    <input type="hidden" value="<?php echo $data_get['input_selected'] ?>" name="input_selected">
                <?php endif ?>
                <div class="form-group">
                  <label class="control-label col-sm-3">Tipe Laporan</label>
                  <div class="col-sm-9">
                    <select class="form-control" name="tipe_laporan" id="tipe_laporan">
                      <option> Pilih </option>
                      <option value="pdf"> PDF </option>
                      <option value="web"> Cetak Website </option>
                      <option value="excel"> Excel </option>
                    </select>
                  </div>
                </div>
                
              </div>
              <div class="col-md-6">
                <div class="filter"></div>
              </div>
              </form>
              <div class="col-md-12">
                <button class="btn btn-success cek">Cek</button>
              </div>
              
            </div>
            <!-- /.box-body -->
          </div>
        </div>
        <div class="col-md-12">
          <div id="display_dialog"></div>
        </div>
      </div>
    </section>