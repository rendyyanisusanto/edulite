<?php
// Pastikan Bootstrap 3 dan Font Awesome 4 sudah dimuat di layout utama.
// Contoh FA4 ikon pengganti: gunakan fa-calendar, fa-calendar-o, fa-clock-o, fa-bar-chart-o, fa-pie-chart, dll.
// Semua tautan menggunakan base_url() (CodeIgniter).
?>
<div class="row">
  <div class="col-md-12">
    <div class="page-header" style="margin-top: 0;">
      <h2><i class="fa fa-calendar"></i> Laporan Presensi</h2>
    </div>
  </div>
</div>

<div class="row">
  <!-- Laporan Presensi Harian & Periode -->
  <div class="col-sm-12 col-md-6">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong><i class="fa fa-calendar"></i> Laporan Presensi Harian & Periode</strong>
      </div>
      <div class="list-group">
        <a href="Presensi_RFID/laporan_harian" class="list-group-item app-item">
          <span class="fa fa-calendar text-muted"></span>
          <strong> Laporan Presensi Harian</strong>
          <p class="list-group-item-text text-muted">Menampilkan aktivitas masuk, izin, dan pulang per hari.</p>
        </a>
        <a href="Presensi_RFID/laporan_mingguan" class="list-group-item app-item">
          <span class="fa fa-calendar text-muted"></span>
          <strong> Laporan Presensi Mingguan</strong>
          <p class="list-group-item-text text-muted">Rekap presensi setiap minggu.</p>
        </a>
        <a href="Presensi_RFID/laporan_bulanan" class="list-group-item app-item">
          <span class="fa fa-calendar-o text-muted"></span>
          <strong> Laporan Presensi Bulanan</strong>
          <p class="list-group-item-text text-muted">Rekap jumlah hadir, izin, dan tidak hadir per bulan.</p>
        </a>
        <a href="Presensi_RFID/rekap" class="list-group-item app-item">
          <span class="fa fa-calendar text-muted"></span>
          <strong> Laporan Presensi per Periode</strong>
          <p class="list-group-item-text text-muted">Laporan rentang tanggal yang bisa disesuaikan (misal 01–15 Feb).</p>
        </a>
      </div>
    </div>
  </div>

  <!-- Laporan Izin Keluar -->
  <div class="col-sm-12 col-md-6">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong><i class="fa fa-sign-out"></i> Laporan Izin Keluar</strong>
      </div>
      <div class="list-group">
        <a href="Presensi_RFID/izin_keluar_harian" class="list-group-item app-item">
          <span class="fa fa-sign-out text-muted"></span>
          <strong> Laporan Izin Keluar Harian</strong>
          <p class="list-group-item-text text-muted">Siapa saja yang izin keluar pada hari tertentu.</p>
        </a>
        <a href="Presensi_RFID/izin_keluar_bulanan" class="list-group-item app-item">
          <span class="fa fa-calendar text-muted"></span>
          <strong> Laporan Izin Keluar Bulanan</strong>
          <p class="list-group-item-text text-muted">Rekap jumlah izin keluar tiap santri dalam sebulan.</p>
        </a>
        <a href="Presensi_RFID/lama_izin" class="list-group-item app-item">
          <span class="fa fa-clock-o text-muted"></span>
          <strong> Laporan Lama Izin Santri</strong>
          <p class="list-group-item-text text-muted">Durasi izin keluar hingga kembali.</p>
        </a>
        <a href="Presensi_RFID/belum_kembali" class="list-group-item app-item">
          <span class="fa fa-exclamation-triangle text-muted"></span>
          <strong> Laporan Santri Belum Kembali</strong>
          <p class="list-group-item-text text-muted">Santri yang izin keluar tapi belum tercatat "IJIN KEMBALI".</p>
        </a>
      </div>
    </div>
  </div>

  <!-- Laporan Ketidakhadiran & Kedisiplinan -->
  <div class="col-sm-12 col-md-6">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong><i class="fa fa-user"></i> Laporan Ketidakhadiran & Kedisiplinan</strong>
      </div>
      <div class="list-group">
        <a href="Presensi_RFID/tidak_masuk_harian" class="list-group-item app-item">
          <span class="fa fa-user text-muted"></span>
          <strong> Santri Tidak Masuk Harian</strong>
          <p class="list-group-item-text text-muted">Daftar santri yang tidak tercatat hadir pada tanggal tertentu.</p>
        </a>
        <a href="Presensi_RFID/tidak_masuk_berturut" class="list-group-item app-item">
          <span class="fa fa-ban text-muted"></span>
          <strong> Tidak Masuk 3 Hari Berturut</strong>
          <p class="list-group-item-text text-muted">Deteksi santri yang absen berurutan minimal 3 hari.</p>
        </a>
        <a href="Presensi_RFID/terlambat_masuk" class="list-group-item app-item">
          <span class="fa fa-clock-o text-muted"></span>
          <strong> Santri Terlambat Masuk</strong>
          <p class="list-group-item-text text-muted">Santri yang masuk melebihi jam yang ditentukan.</p>
        </a>
        <a href="Presensi_RFID/pulang_cepat" class="list-group-item app-item">
          <span class="fa fa-fast-forward text-muted"></span>
          <strong> Santri Pulang Cepat</strong>
          <p class="list-group-item-text text-muted">Santri yang pulang sebelum jadwal pulang resmi.</p>
        </a>
      </div>
    </div>
  </div>

  <!-- Rekap & Statistik Kehadiran -->
  <div class="col-sm-12 col-md-6">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong><i class="fa fa-bar-chart-o"></i> Rekap & Statistik Kehadiran</strong>
      </div>
      <div class="list-group">
        <a href="Presensi_RFID/rekap_per_santri" class="list-group-item app-item">
          <span class="fa fa-user text-muted"></span>
          <strong> Rekap Kehadiran per Santri</strong>
          <p class="list-group-item-text text-muted">Total "MASUK", "IJIN KELUAR", "IJIN KEMBALI", dan "PULANG".</p>
        </a>
        <a href="Presensi_RFID/rekap_per_kelas" class="list-group-item app-item">
          <span class="fa fa-users text-muted"></span>
          <strong> Rekap per Kelas / Asrama</strong>
          <p class="list-group-item-text text-muted">Statistik presensi berdasarkan kelompok.</p>
        </a>
        <a href="Presensi_RFID/persentase_bulanan" class="list-group-item app-item">
          <span class="fa fa-pie-chart text-muted"></span>
          <strong> Persentase Kehadiran Bulanan</strong>
          <p class="list-group-item-text text-muted">Persentase kehadiran setiap santri.</p>
        </a>
        <a href="Presensi_RFID/rata_rata_izin" class="list-group-item app-item">
          <span class="fa fa-calculator text-muted"></span>
          <strong> Rata-rata Lama Izin</strong>
          <p class="list-group-item-text text-muted">Rata-rata durasi izin keluar untuk evaluasi kedisiplinan.</p>
        </a>
      </div>
    </div>
  </div>

  <!-- Laporan Sistem & Monitoring -->
  <div class="col-sm-12 col-md-6">
    <div class="panel panel-default">
      <div class="panel-heading">
        <strong><i class="fa fa-cogs"></i> Laporan Sistem & Monitoring</strong>
      </div>
      <div class="list-group">
        <a href="Presensi_RFID/aktivitas_per_jam" class="list-group-item app-item">
          <span class="fa fa-clock-o text-muted"></span>
          <strong> Aktivitas Presensi per Jam</strong>
          <p class="list-group-item-text text-muted">Distribusi waktu presensi (jam masuk terbanyak, jam keluar, dsb).</p>
        </a>
        <a href="Presensi_RFID/laporan_shift" class="list-group-item app-item">
          <span class="fa fa-calendar text-muted"></span>
          <strong> Shift / Jadwal Presensi</strong>
          <p class="list-group-item-text text-muted">Laporan jadwal presensi berbeda per waktu (Pagi, Siang, Malam).</p>
        </a>
        <a href="Presensi_RFID/log_rfid" class="list-group-item app-item">
          <span class="fa fa-list text-muted"></span>
          <strong> Log Aktivitas RFID Mentah</strong>
          <p class="list-group-item-text text-muted">Semua data raw dari pembacaan RFID (audit trail).</p>
        </a>
        <a href="Presensi_RFID/error_duplikasi" class="list-group-item app-item">
          <span class="fa fa-exclamation-circle text-muted"></span>
          <strong> Error / Duplikasi Presensi</strong>
          <p class="list-group-item-text text-muted">Data presensi yang tidak normal (misal dua kali "MASUK").</p>
        </a>
      </div>
    </div>
  </div>
</div>