<?php if(empty($siswa_keluar)): ?>
    <div class="empty-state">
        <i class="fas fa-check-circle"></i>
        <h3>Semua Siswa Sudah Kembali!</h3>
        <p>Tidak ada siswa yang sedang ijin keluar saat ini</p>
    </div>
<?php else: ?>
    <div class="student-grid">
        <?php foreach($siswa_keluar as $siswa): ?>
            <?php 
                $durasi_jam = floor($siswa['durasi_menit'] / 60);
                $durasi_menit_sisa = $siswa['durasi_menit'] % 60;
                
                if($durasi_jam > 0) {
                    $durasi_text = $durasi_jam . "j " . $durasi_menit_sisa . "m";
                } else {
                    $durasi_text = $durasi_menit_sisa . " menit";
                }
                
                // Tentukan class berdasarkan durasi
                if($siswa['durasi_menit'] > 15) {
                    $card_class = 'danger';
                    $duration_class = 'duration-danger';
                    $icon = 'fas fa-exclamation-triangle';
                } elseif($siswa['durasi_menit'] > 10) {
                    $card_class = 'warning';
                    $duration_class = 'duration-warning';
                    $icon = 'fas fa-clock';
                } else {
                    $card_class = 'normal';
                    $duration_class = 'duration-normal';
                    $icon = 'fas fa-info-circle';
                }
            ?>
            <div class="student-card-tv <?= $card_class ?>">
                <div class="student-info">
                    <div class="student-photo-container">
                        <?php if(!empty($siswa['foto']) && file_exists('./include/user_account/'.$siswa['foto'])): ?>
                            <img src="<?= base_url('include/user_account/'.$siswa['foto']) ?>" 
                                 class="student-photo" 
                                 alt="<?= $siswa['nama'] ?>">
                        <?php else: ?>
                            <div class="student-photo-placeholder">
                                <i class="fas fa-user text-white" style="font-size: 1.2rem;"></i>
                            </div>
                        <?php endif; ?>
                    </div>
                    <div class="student-details">
                        <div class="student-name"><?= $siswa['nama'] ?></div>
                        <div class="student-time">
                            <i class="fas fa-sign-out-alt me-2"></i>
                            Keluar: <?= date('H:i:s', strtotime($siswa['waktu_keluar'])) ?>
                        </div>
                    </div>
                </div>
                
                <div class="duration-spotlight <?= $duration_class ?>">
                    <i class="<?= $icon ?> me-2"></i>
                    <?= $durasi_text ?>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
<?php endif; ?>