<div class="row">
  <div class="col-md-4">
    <div class="panel panel-body">
      
        <label>Minggu</label>
        <input type="week" class="form-control nweek" value="<?php echo date('Y').'-W'.date('W');?>"  name="tanggal">

        <button style="margin-top: 20px;" type="button" onclick="get_jadwal();" required class="btn btn-success"><i class="icon-spinner2"></i> Proses</button>
    </div>
  </div>
  <div class="col-md-12">
    <div class="panel panel-body">
      <div class="content-jadwal"></div>
    </div>
  </div>
</div>