
<script type="text/javascript">
    proses();
    $( "#app-submit" ).on('submit',function( e ) {
        e.stopImmediatePropagation();
        e.preventDefault();
        // $('.se-pre-con').css('display','block');
            var form_data = new FormData(this);
        send_ajax_file( $(this).attr('action'),form_data).then( function(data){
                var resp = JSON.parse(data);

                if (resp.status == 200) {
                    toastr.success(resp.msg);
                }else{
                    toastr.error(resp.msg);

                }

                $('#modal_proses').modal('toggle');
                proses();
        });
        return false;
    });

    function batal(id, bulan, tahun){
        let dialog = prompt("Ketik YAKIN untuk membatalkan", "");
        
        if (dialog == "YAKIN") {
          send_ajax("penggajian/batal", {id:id, bulan : bulan, tahun : tahun}).then(function(data){
                    var resp = JSON.parse(data);

                    if (resp.status == 200) {
                        toastr.success(resp.msg);
                    }else{
                        toastr.error(resp.msg);

                    }

                proses();
            })
        } else{
            alert("Gagal membatalkan data");
            
        }
    }
    function share(share, id, bulan, tahun){
        let dialog = prompt("Ketik YAKIN untuk mengubah status share", "");
        
        if (dialog == "YAKIN") {
          send_ajax("penggajian/share", {share:share, id:id, bulan : bulan, tahun : tahun}).then(function(data){
                    var resp = JSON.parse(data);

                    if (resp.status == 200) {
                        toastr.success(resp.msg);
                    }else{
                        toastr.error(resp.msg);

                    }

                proses();
            })
        } else{
            alert("Gagal membatalkan data");
            
        }
    }

    function proses(){
        send_ajax("penggajian/proses_index", {bulan:$('.bulan').val()}).then(function(data){
            $('.proses-absen').html(data);
        })
    }

    function call_proses(id, bulan, tahun){
        
        send_ajax("penggajian/modal_proses", {id:id, bulan : bulan, tahun : tahun}).then(function(data){
            $('.modal-proses').html(data);
            count_all();
            $('#modal_proses').modal('toggle');
        })
    }

    function remove_div(id)
    {
        $('.md'+id).remove();
    }
    function remove_tr(id){
        $('.tr'+id).remove();
    }
    function remove_trk(id){
        $('.trk'+id).remove();
    }
    function addtr(){
        var rnd = Math.floor(Math.random() * 99999);
        var tr = '<tr class="tr'+rnd+'">';
            tr += '<td width="1%"><button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_tr('+rnd+')"><i class="icon-close2"></i></button></td>'
            tr +='  <td><input class="form-control" name="data[komponen_tambahan_debit]['+rnd+'][nama]"></input></td>';
            tr +='  <td colspan="4"><input class="form-control" name="data[komponen_tambahan_debit]['+rnd+'][keterangan]" placeholder="Keterangan ..."></input></td>';
            tr +='  <td>';
            tr +='      <div class="input-group">';
            tr +='          <span class="input-group-addon">Rp.</span>';
            tr +='          <input class="form-control frmtotal" onkeyup="count_total('+rnd+');" name="data[komponen_tambahan_debit]['+rnd+'][jumlah]"></input>';
            tr +='       </div>';
            tr +='   </td>';
            tr +='</tr>';

          $('.tbl1').append(tr)
    }
    function addtrk(){
        var rnd = Math.floor(Math.random() * 99999);
        var tr = '<tr class="tr'+rnd+'">';
            tr += '<td width="1%"><button class="btn btn-danger btn-sm pull-right" type="button" onclick="remove_tr('+rnd+')"><i class="icon-close2"></i></button></td>'
            tr +='  <td><input class="form-control" name="data[komponen_tambahan_kredit]['+rnd+'][nama]"></input></td>';
            tr +='  <td><input class="form-control" name="data[komponen_tambahan_kredit]['+rnd+'][keterangan]"></input></td>';
            tr +='  <td>';
            tr +='      <div class="input-group">';
            tr +='          <span class="input-group-addon">Rp.</span>';
            tr +='          <input class="form-control frmtanggungan" onkeyup="count_total('+rnd+');" name="data[komponen_tambahan_kredit]['+rnd+'][jumlah]"></input>';
            tr +='       </div>';
            tr +='   </td>';
            tr +='</tr>';

          $('.tblk11').append(tr)
    }
    function count_total(id){
        // alert(id);
        let jumlah = $('.jml'+id).val();
        let sum = (typeof $('.sum'+id).val() !== 'undefined') ? $('.sum'+id).val() : 1;

        $('.total'+id).val(jumlah*sum);

        count_all();
    }
    function count_all(){
        let hr = 0;
        let potongan = 0;

        $('.frmtotal').each(function(index, el) {
            hr += parseInt($(this).val());
        });

        $('.frmtanggungan').each(function(index, el) {
            potongan += parseInt($(this).val());
        });

        let total = (hr-potongan);
        $('.totalfrm').val(total);
        $('.total-cls').text("Total : "+(formatRupiah(total.toString(), 'Rp. ')));

    }


</script>