<?php
    foreach ($presence as $key => $value) {
        ?>
        <div>

            <div class="card shadow-lg p-3 mb-3 bg-body rounded mx-auto" style="width: 100%;">
                <!-- Foto Siswa dengan tampilan persegi -->
                <img src="<?= base_url('include/media/siswa/' . (empty($value['foto']) ? 'no_image.jpg' : $value['foto'])) ?>" class="card-img-top p-2" alt="Foto Siswa" style="object-fit: cover; height: 250px; width: 100%; margin: auto; border-radius: 20px;">
    
                <!-- Card Body -->
                <div class="card-body text-center">
                    <!-- Nama Siswa dengan font tebal -->
                    <h4 class="card-title fw-bold mb-1"><?= $value['nama']?></h4>
    
                    <!-- Status dengan warna berbeda -->
                    <h6 class="text-primary mb-2"><i class="bi bi-person-check"></i> <?= $value['status']?></h6>
    
                    <!-- Waktu dengan font yang lebih ringan dan warna berbeda -->
                    <h6 class="text-muted"><i class="bi bi-clock"></i> <?= $value['waktu']?></h6>
                </div>
            </div>
        </div>
        <?php   
    }
?>
