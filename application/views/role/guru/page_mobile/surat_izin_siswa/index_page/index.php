<!-- Custom CSS untuk Mobile -->
<style>
.mobile-header {
    background: #f5f5f5;
    padding: 15px;
    margin: -15px -15px 15px -15px;
    border-bottom: 1px solid #ddd;
}

.mobile-header h4 {
    margin: 0;
    font-weight: normal;
    color: #333;
    font-size: 18px;
}

.action-buttons {
    margin: 15px 0;
}

.mobile-btn {
    display: inline-block;
    padding: 8px 12px;
    margin-right: 8px;
    margin-bottom: 8px;
    font-size: 13px;
    border-radius: 3px;
    border: 1px solid #ddd;
    background: #fff;
    color: #333;
    text-decoration: none;
}

.mobile-btn:hover {
    background: #f5f5f5;
    text-decoration: none;
    color: #333;
}

.btn-add {
    background: #5cb85c;
    border-color: #5cb85c;
    color: white;
}

.btn-add:hover {
    background: #4cae4c;
    border-color: #4cae4c;
    color: white;
}

.content-section {
    margin-top: 20px;
}

.loading-spinner {
    text-align: center;
    padding: 40px 20px;
    color: #666;
}

.loading-spinner i {
    font-size: 24px;
    margin-bottom: 10px;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

.stats-info {
    background: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 15px;
    margin-bottom: 20px;
    border-left: 4px solid #337ab7;
}

.stats-info .info-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 8px;
}

.stats-info .info-item:last-child {
    margin-bottom: 0;
}

.stats-info .info-label {
    font-size: 13px;
    color: #666;
    font-weight: normal;
}

.stats-info .info-value {
    font-size: 14px;
    font-weight: 500;
    color: #333;
}

@media (max-width: 480px) {
    .mobile-btn {
        width: 100%;
        margin-right: 0;
        margin-bottom: 10px;
    }
}
</style>
<div class="row">
	<div class="col-xs-12">
		<center><h4>Request Presensi</h4></center>
	</div>
</div>
<div class="row" style="margin-top: 5%;">
	<div class="col-xs-12">
		<a href="dashboard/get_data" class="btn app-item bg-warning-400 btn-labeled legitRipple"><b><i class="icon-home"></i></b> Home (<i>Home</i>)</a>
		<a href="Surat_izin_siswa/add_page" class="btn app-item bg-success-400 btn-labeled legitRipple"><b><i class="icon-plus2"></i></b> Tambah (<i>add</i>)</a>
		<hr>
	</div>
</div>

<div class="content-section">
    <div class="content-request">
        <div class="loading-spinner">
            <div><i class="icon-spinner"></i></div>
            <div>Memuat data surat izin...</div>
        </div>
    </div>
</div>
