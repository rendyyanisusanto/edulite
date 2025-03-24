<?php foreach ($kelas as $key => $value): ?>
    <!-- Kelas A -->
                            <div class="card p-2">
                                <div class="d-flex gap-2">

                                    <b class="mb-0"><?= $value['kelas']?></b>
                                    <span class="badge bg-success"><?php echo 'M = '.$value['jumlah_absen'] ?></span>
                                    <span class="badge bg-danger"><?php echo 'TM = '.$value['jumlah_tidak_absen'] ?></span>
                                </div>
                            </div>

<?php endforeach ?>