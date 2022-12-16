
<div id="setting_table" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <form class="form-horizontal" action="Global_controller/simpan_data_setting_table" id="app-submit-setting-table" method="POST">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h5 class="modal-title">Setting Table</h5>
      </div>
      <div class="modal-body">
        <label>Template Kode</label>
        <br>
        <input type="hidden" class="form-control table" name="table">
        <input type="hidden" class="form-control name" name="name">
        <input type="text" class="form-control template_setting" name="template">

        <hr>

        <div class="alert alert-warning">
          <b>Kode: </b>
          <ul>
            <li>{rand} : Angka Acak</li>
            <li>{year} : Tahun</li>
            <li>{month} : Bulan</li>
            <li>{date_of_month}: Tanggal (hari ini)</li>
            <li>{date} : Tanggal(lengkap)</li>
          </ul>
          <b>Pastikan penulisan sintax benar, cth : INV/{rand}/{year} maka akan muncul INV/0123/2022</b>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="icon-close2"></i> Close</button>
        <button type="submit" class="btn btn-primary"><i class="icon-floppy-disk"></i> Save changes</button>
      </div>

    </form>
    </div>
  </div>
</div>
<!-- Footer -->
<div class="footer text-muted">
  
</div>
<!-- /footer -->
<!--Start of Tawk.to Script-->
<!--End of Tawk.to Script-->
</div>
<!-- /content area -->
</div>
<!-- /main content -->
</div>
<!-- /page content -->
</div>
<!-- /page container -->
</body>
</html>