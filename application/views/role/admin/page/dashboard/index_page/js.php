<script>
$(document).ready(function() {
  $('#status-pulang-toggle').change(function() {
    const isChecked = $(this).is(':checked');
    const value = isChecked ? '1' : '0';

    $.ajax({
      url: 'Dashboard/update_status_pulang_ajax',
      method: 'POST',
      data: {
        status_pulang: value // kirim status 1 atau 0
      },
      success: function(res) {
        // Tidak perlu feedback karena hanya toggle status
      },
      error: function() {
        alert('Gagal memperbarui status pulang.');
      }
    });
  });
});
</script>
