<!-- Additional CSS for Mobile Cards -->
<style>
.surat-card {
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    margin-bottom: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.surat-card:hover {
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}

.surat-card-body {
    padding: 15px;
}

.surat-title {
    font-size: 14px;
    font-weight: 500;
    color: #333;
    margin-bottom: 8px;
}

.surat-info {
    font-size: 12px;
    color: #666;
    margin-bottom: 8px;
}

.siswa-info {
    font-size: 11px;
    color: #555;
    margin-bottom: 10px;
    line-height: 1.4;
}

.siswa-info strong {
    color: #333;
}

.surat-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 10px;
    border-top: 1px solid #eee;
}

.status-badge {
    padding: 4px 10px;
    border-radius: 4px;
    font-size: 11px;
    font-weight: 500;
    text-transform: uppercase;
    border: 1px solid transparent;
}

.status-draft {
    background: #fff3cd;
    color: #856404;
    border-color: #ffeaa7;
}

.status-diterima {
    background: #d1edff;
    color: #0c5460;
    border-color: #b8daff;
}

.status-ditolak {
    background: #f8d7da;
    color: #721c24;
    border-color: #f5c6cb;
}

.action-buttons {
    display: flex;
    gap: 5px;
}

.btn-detail {
    padding: 4px 8px;
    font-size: 11px;
    border: 1px solid #ccc;
    border-radius: 3px;
    background: #fff;
    color: #333;
    text-decoration: none;
}

.btn-detail:hover {
    background: #f5f5f5;
    text-decoration: none;
    color: #333;
}

.btn-pdf {
    padding: 4px 8px;
    font-size: 11px;
    border: 1px solid #dc3545;
    border-radius: 3px;
    background: #dc3545;
    color: white;
    text-decoration: none;
}

.btn-pdf:hover {
    background: #c82333;
    border-color: #bd2130;
    text-decoration: none;
    color: white;
}

.empty-state {
    text-align: center;
    padding: 30px 15px;
    color: #666;
}

.refresh-btn {
    background: #5cb85c;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 3px;
    font-size: 12px;
    text-decoration: none;
}
</style>

<div class="row">
    <?php if (empty($data_get['surat_izin_siswa'])): ?>
        <div class="col-xs-12">
            <div class="empty-state">
                <p><i class="icon-file-text2"></i> Belum ada surat izin</p>
                <a href="Surat_izin_siswa/add_page" class="refresh-btn">
                    <i class="icon-plus"></i> Buat Surat
                </a>
            </div>
        </div>
    <?php else: ?>
        <?php foreach ($data_get['surat_izin_siswa'] as $key => $value): ?>
            <div class="col-xs-12">
                <div class="surat-card">
                    <div class="surat-card-body">
                        <div class="surat-title">
                            <?php echo !empty($value['kegiatan']) ? substr($value['kegiatan'], 0, 40) . (strlen($value['kegiatan']) > 40 ? '...' : '') : 'Surat Izin Siswa'; ?>
                        </div>
                        
                        <div class="surat-info">
                            <?php 
                            $tgl_mulai = date('d M Y', strtotime($value['tanggal_mulai']));
                            $tgl_selesai = date('d M Y', strtotime($value['tanggal_selesai']));
                            echo $tgl_mulai;
                            if ($tgl_mulai != $tgl_selesai) {
                                echo ' - ' . $tgl_selesai;
                            }
                            ?>
                            
                            <?php if (!empty($value['tempat'])): ?>
                                | <?php echo substr($value['tempat'], 0, 20) . (strlen($value['tempat']) > 20 ? '...' : ''); ?>
                            <?php endif; ?>
                        </div>
                        
                        <?php if (!empty($value['nama_siswa']) && count($value['nama_siswa']) > 0): ?>
                        <div class="siswa-info">
                            <strong>Siswa:</strong> 
                            <?php 
                            $nama_list = array();
                            foreach($value['nama_siswa'] as $siswa) {
                                $nama_list[] = $siswa['nama'];
                            }
                            echo implode(', ', $nama_list);
                            if (count($value['nama_siswa']) >= 5) {
                                echo '...';
                            }
                            ?>
                        </div>
                        <?php endif; ?>
                        
                        <div class="surat-footer">
                            <div class="status-badge status-<?php echo strtolower($value['status']); ?>">
                                <?php 
                                switch($value['status']) {
                                    case 'DRAFT':
                                        echo 'Draft';
                                        break;
                                    case 'DITERIMA':
                                        echo 'Diterima';
                                        break;
                                    case 'DITOLAK':
                                        echo 'Ditolak';
                                        break;
                                    default:
                                        echo $value['status'];
                                }
                                ?>
                            </div>
                            
                            <div class="action-buttons">
                                <?php if (!empty($value['id_surat_izin_siswa'])): ?>
                                    
                                    
                                    <?php if ($value['status'] == 'DITERIMA'): ?>
                                        <a href="Surat_izin_siswa/cetak_pdf/<?php echo $value['id_surat_izin_siswa']; ?>" target="_blank" class="btn-pdf">
                                            PDF
                                        </a>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
        
    <?php endif; ?>
</div>

<script>
// Update last update time
if (document.getElementById('last-update')) {
    document.getElementById('last-update').textContent = new Date().toLocaleString('id-ID', {
        day: '2-digit',
        month: 'short',
        hour: '2-digit',
        minute: '2-digit'
    });
}
</script>