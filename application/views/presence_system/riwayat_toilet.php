<?php if(empty($riwayat)): ?>
    <div class="text-center py-5">
        <i class="fas fa-history" style="font-size: 4rem; color: #6c757d;"></i>
        <h4 class="mt-3 text-muted">Belum ada riwayat hari ini</h4>
        <p class="text-muted">Riwayat perijinan toilet akan muncul di sini</p>
    </div>
<?php else: ?>
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>Siswa</th>
                    <th class="text-center">Waktu Keluar</th>
                    <th class="text-center">Waktu Kembali</th>
                    <th class="text-center">Durasi</th>
                    <th class="text-center">Status</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($riwayat as $row): ?>
                    <?php 
                        $status_class = '';
                        $status_text = '';
                        $status_icon = '';
                        
                        if($row['waktu_kembali']) {
                            // Sudah kembali
                            if($row['durasi_menit'] > 15) {
                                $status_class = 'bg-danger';
                                $status_text = 'Terlalu Lama';
                                $status_icon = 'fas fa-exclamation-triangle';
                            } elseif($row['durasi_menit'] > 10) {
                                $status_class = 'bg-warning';
                                $status_text = 'Agak Lama';
                                $status_icon = 'fas fa-clock';
                            } else {
                                $status_class = 'bg-success';
                                $status_text = 'Normal';
                                $status_icon = 'fas fa-check';
                            }
                            
                            $durasi_jam = floor($row['durasi_menit'] / 60);
                            $durasi_menit_sisa = $row['durasi_menit'] % 60;
                            
                            if($durasi_jam > 0) {
                                $durasi_display = $durasi_jam . "j " . $durasi_menit_sisa . "m";
                            } else {
                                $durasi_display = $durasi_menit_sisa . " menit";
                            }
                        } else {
                            // Belum kembali
                            $status_class = 'bg-primary';
                            $status_text = 'Sedang Keluar';
                            $status_icon = 'fas fa-sign-out-alt';
                            $durasi_display = '-';
                        }
                    ?>
                    <tr>
                        <td>
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0">
                                    <?php if(!empty($row['foto']) && file_exists('./include/user_account/'.$row['foto'])): ?>
                                        <img src="<?= base_url('include/user_account/'.$row['foto']) ?>" 
                                             class="rounded-circle" 
                                             width="35" height="35" 
                                             style="object-fit: cover;">
                                    <?php else: ?>
                                        <div class="rounded-circle bg-secondary d-flex align-items-center justify-content-center" 
                                             style="width: 35px; height: 35px;">
                                            <i class="fas fa-user text-white" style="font-size: 0.8rem;"></i>
                                        </div>
                                    <?php endif; ?>
                                </div>
                                <div class="ms-2">
                                    <div class="fw-semibold"><?= $row['nama'] ?></div>
                                </div>
                            </div>
                        </td>
                        <td class="text-center">
                            <span class="badge bg-primary">
                                <i class="fas fa-sign-out-alt me-1"></i>
                                <?= date('H:i:s', strtotime($row['waktu_keluar'])) ?>
                            </span>
                        </td>
                        <td class="text-center">
                            <?php if($row['waktu_kembali']): ?>
                                <span class="badge bg-success">
                                    <i class="fas fa-sign-in-alt me-1"></i>
                                    <?= date('H:i:s', strtotime($row['waktu_kembali'])) ?>
                                </span>
                            <?php else: ?>
                                <span class="text-muted">
                                    <i class="fas fa-clock me-1"></i>
                                    Belum kembali
                                </span>
                            <?php endif; ?>
                        </td>
                        <td class="text-center">
                            <?php if($row['waktu_kembali']): ?>
                                <span class="fw-semibold"><?= $durasi_display ?></span>
                            <?php else: ?>
                                <span class="text-muted">-</span>
                            <?php endif; ?>
                        </td>
                        <td class="text-center">
                            <span class="badge <?= $status_class ?>">
                                <i class="<?= $status_icon ?> me-1"></i>
                                <?= $status_text ?>
                            </span>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
<?php endif; ?>