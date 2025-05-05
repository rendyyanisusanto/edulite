<script src="<?php echo base_url('include/template/dashboard/')?>js/plugins/forms/selects/select2.min.js"></script>
<div class="row">
	<div class="col-md-12">
		<center>
			<h4 style="font-weight: bold;">SKL Siswa</h4>
		</center>
	</div>
	<div class="col-md-6">
		<div class="panel panel-body">
			<label>Tahun Lulus</label>
			<input type="number" value="<?= date('Y') ?>" name="tahun_lulus" class="form-control tahun_lulus">
            
            <hr>
            <button type="button" onclick="proses()" class="btn btn-success "><i class="icon-spinner"></i> Proses</button>
		</div>
	
    </div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-body skl-proses">
			<div class="alert alert-info"><b>Info</b> : Pilih tahun kelulusan</div>
		</div>
	</div>
</div>