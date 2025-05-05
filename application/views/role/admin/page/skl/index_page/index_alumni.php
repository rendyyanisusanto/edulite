<div class="row">
    <?php if (!empty($data_get['alumni'])): ?>
        <?php $no = 0; foreach ($data_get['alumni'] as $key => $value): ?>
            <div class="col-sm-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>#<?= ++$no ?> - <?= $value['nama'] ?> (<?= $value['nisn'] ?>)</strong>
                    </div>
                    <div class="panel-body">
                        <form class="app-submit-skl" action="<?= $data_get['param']['table'] ?>/simpan_data" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="id_siswa" value="<?= $value['id_siswa'] ?>">

                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" class="form-control">
                                    <option value="1">VALID</option>
                                    <option value="0">BELUM VALID</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Kode Akses</label>
                                <input type="text" name="kode_akses" value="<?= $value['nisn'] ?>" class="form-control">
                            </div>

                            <div class="form-group">
                                <label>File SKL</label>
                                <input type="file" name="file_skl" class="form-control">
                            </div>

                            <div class="form-group">
                                <label>Keterangan</label>
                                <input type="text" name="keterangan" class="form-control">
                            </div>

                            <div class="form-group text-right">
                                <button type="submit" class="btn btn-success btn-sm">
                                    <i class="icon-circle-right2"></i> Submit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    <?php else: ?>
        <div class="col-xs-12">
            <div class="alert alert-warning">Tidak ada data alumni.</div>
        </div>
    <?php endif; ?>
</div>

<script>
    $(document).on('submit', '.app-submit-skl', function(e) {
        alert();
        e.stopImmediatePropagation();
        e.preventDefault();
        // $('.se-pre-con').css('display','block');


        var form_data = new FormData(this);
            send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                // $(".se-pre-con").fadeOut("slow");
                console.log(data);
                toastr.success('Data berhasil ditambahkan, Refresh untuk melihat perubahan');
                // set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            });
        return false;
    });
</script>