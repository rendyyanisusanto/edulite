<script type="text/javascript">
    // CKEDITOR.replace( 'keterangan' );
	$('.select').select2();
$( "#app-submit" ).on('submit',function( e ) {
    e.stopImmediatePropagation();
    e.preventDefault();
    $('.se-pre-con').css('display','block');


       var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){

            var rsp = JSON.parse(data);
            if (rsp.status == 200) {
                $(".se-pre-con").fadeOut("slow");
                console.log(data);
                toastr.success(rsp.msg);
                set_content('<?php echo $data_get['param']['table'] ?>/get_data');
            }else{

                $(".se-pre-con").fadeOut("slow");
                toastr.error(rsp.msg);
            }
        });
    return false;
});

$('.idprovince_fk').on('change', function(e){
    e.stopImmediatePropagation();
    var dt = $(this).val();
    send_ajax( 'siswa/get_cities',{dt_send:dt} ).then( function(data){
        $(".idcities_fk option").remove();
        $('.idcities_fk').append(data);
    });
});

$('.btn-add-prestasi').on('click', function(e){
    e.stopImmediatePropagation();
    var tbl = $('.table-prestasi tbody');
    var tblcount = $('.table-prestasi tbody tr').length;
    var row = '<tr>';
        row += '<td><input type="text" name="prestasi['+tblcount+'][jenis]" class="form-control"></input></td>';
        row += '<td><input type="text" name="prestasi['+tblcount+'][tingkat]" class="form-control"></input></td>';
        row += '<td><input type="text" name="prestasi['+tblcount+'][nama]" class="form-control"></input></td>';
        row += '<td><input type="text" name="prestasi['+tblcount+'][tahun]" class="form-control"></input></td>';
        row += '<td><input type="text" name="prestasi['+tblcount+'][penyelenggara]" class="form-control"></input></td>';
        row += '</tr>';

    tbl.append(row);
});

$('.btn-add-beasiswa').on('click', function(e){
    e.stopImmediatePropagation();
    var tbl = $('.table-beasiswa tbody');
    var tblcount = $('.table-beasiswa tbody tr').length;
    var row = '<tr>';
        row += '<td><input type="text" name="beasiswa['+tblcount+'][jenis]" class="form-control"></input></td>';
        row += '<td><input type="text" name="beasiswa['+tblcount+'][penyelenggara]" class="form-control"></input></td>';
        row += '<td><input type="text" name="beasiswa['+tblcount+'][tahun_mulai]" class="form-control"></input></td>';
        row += '<td><input type="text" name="beasiswa['+tblcount+'][tahun_selesai]" class="form-control"></input></td>';
        row += '</tr>';

    tbl.append(row);
});

$('.btn-add-dokumen').on('click', function(e){
    e.stopImmediatePropagation();
    var tbl = $('.table-dokumen tbody');
    var tblcount = $('.table-dokumen tbody tr').length;
    var row = '<tr>';
        row += '<td><input type="text" name="dokumen['+tblcount+'][keterangan]" class="form-control"></input></td>';
        row += '<td><input type="file" name="dokumen['+tblcount+'][foto]" class="form-control"></input></td>';
        row += '</tr>';

    tbl.append(row);
});

$('.department').on('change', function(e){
    e.stopImmediatePropagation();
    send_ajax( 'Siswa/get_jurusan',{'id' : $(this).val()} ).then( function(data){
        $('.select_jurusan').html(data);
    });

})
$(document).on('change','.jurusan', function(e){
    e.stopImmediatePropagation();
    send_ajax( 'Siswa/get_kelas',{'id' : $(this).val()} ).then( function(data){
        $('.select_kelas').html(data);
    });

})
</script>