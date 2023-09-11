<div class="row">
	<div class="col-md-8">
		
		<div class="panel panel-body">
			<h4><b>Grafik Siswa <?php echo $data_get['kelas']['kelas'] ?> Tanggal <?php echo date_format(date_create($data_get['tanggal_mulai']), 'd-m-Y') ?> s/d <?php echo date_format(date_create($data_get['tanggal_selesai']), 'd-m-Y') ?></b></h4>
			<div id="stats_siswa">
				<canvas id="myChart" style="width:100%"></canvas>
			</div>
		</div>
	</div>
</div>


<script>
var xValues = <?php echo json_encode($data_get['tgl']) ?>;

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{ 
      data: <?php echo json_encode($data_get['tm']) ?>,
      borderColor: "red",
      label: 'Tidak Masuk',
      fill: false
    }, { 
      data: <?php echo json_encode($data_get['m']) ?>,
      borderColor: "green",
      label: 'Masuk',
      fill: false
    }]
  },
  options: {
    legend: {display: false}
  }
});
</script>