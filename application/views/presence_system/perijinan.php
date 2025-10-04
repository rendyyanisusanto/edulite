<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Perijinan Toilet - RFID</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <script src="<?php echo base_url('include/template/dashboard/js')?>/core/libraries/jquery.min.js"></script>
    <script src="<?php echo base_url('include/core/core.js')?>"></script>
    <style>
        /* Animasi background */
        body {
            background: linear-gradient(-45deg, #1e3c72, #2a5298, #667eea, #764ba2);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            min-height: 100vh;
            padding: 10px 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container-fluid {
            max-width: 98%;
            padding: 0 15px;
        }

        .card {
            box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.3);
            border-radius: 20px;
            margin-bottom: 15px;
            backdrop-filter: blur(15px);
            background: rgba(255, 255, 255, 0.98);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        /* Header dengan jam dan judul */
        .main-header {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 15px;
            text-align: center;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        .main-title {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 8px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        #jam-digital {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 0;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }

        /* Statistik Besar untuk Sidebar */
        .stats-sidebar {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 15px;
        }

        .stat-card {
            background: linear-gradient(135deg, #ff6b6b, #ffa500);
            color: white;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .stat-card.success {
            background: linear-gradient(135deg, #51cf66, #40c057);
        }

        .stat-card:hover {
            transform: translateY(-3px);
        }

        .stat-number {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 8px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .stat-label {
            font-size: 1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Student cards untuk TV */
        .student-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 15px;
        }

        .student-card-tv {
            background: white;
            border-radius: 15px;
            padding: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
            border-left: 4px solid;
            height: fit-content;
        }

        .student-card-tv.normal {
            border-left-color: #28a745;
        }

        .student-card-tv.warning {
            border-left-color: #ffc107;
            background: linear-gradient(135deg, #fff9c4, #ffffff);
        }

        .student-card-tv.danger {
            border-left-color: #dc3545;
            background: linear-gradient(135deg, #ffebee, #ffffff);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { box-shadow: 0 4px 15px rgba(220, 53, 69, 0.3); }
            50% { box-shadow: 0 4px 20px rgba(220, 53, 69, 0.5); }
            100% { box-shadow: 0 4px 15px rgba(220, 53, 69, 0.3); }
        }

        .student-info {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .student-photo {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #667eea;
            margin-right: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        .student-photo-placeholder {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        .student-name {
            font-size: 1.1rem;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 3px;
            line-height: 1.2;
        }

        .student-time {
            font-size: 0.85rem;
            color: #7f8c8d;
            margin-bottom: 5px;
        }

        .duration-spotlight {
            font-size: 1.2rem;
            font-weight: bold;
            padding: 8px 12px;
            border-radius: 10px;
            text-align: center;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }

        .duration-normal {
            background: linear-gradient(135deg, #28a745, #20c997);
            color: white;
        }

        .duration-warning {
            background: linear-gradient(135deg, #ffc107, #fd7e14);
            color: white;
        }

        .duration-danger {
            background: linear-gradient(135deg, #dc3545, #e83e8c);
            color: white;
            animation: blink 1.5s infinite;
        }

        @keyframes blink {
            0%, 50% { opacity: 1; }
            51%, 100% { opacity: 0.7; }
        }

        /* RFID Panel */
        .rfid-panel {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            margin-bottom: 15px;
        }

        .toilet-icon {
            font-size: 3rem;
            color: #667eea;
            margin-bottom: 10px;
        }

        .rfid-input {
            font-size: 1.2rem;
            padding: 12px;
            border-radius: 10px;
            border: 2px solid #667eea;
            text-align: center;
            font-weight: bold;
        }

        .alert-scan {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            padding: 15px;
        }

        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            color: #6c757d;
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: #28a745;
        }

        .empty-state h3 {
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .empty-state p {
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <!-- Header dengan Jam dan Judul -->
        <div class="main-header">
            <div class="main-title">
                <i class="fas fa-restroom me-3"></i>
                SISTEM PERIJINAN TOILET
            </div>
            <div id="jam-digital"></div>
        </div>

        <div class="row">
            <!-- Sidebar Kiri: RFID Scanner + Statistik -->
            <div class="col-xl-4 col-lg-4">
                <!-- Panel RFID Scanner -->
                <div class="rfid-panel">
                    <div class="text-center">
                        <i class="fas fa-qrcode toilet-icon"></i>
                        <h4 class="mb-3 fw-bold">Scan Kartu RFID</h4>
                    </div>

                    <!-- Input RFID -->
                    <form id="form-perijinan">
                        <div class="mb-3">
                            <input type="password" id="rfid-input" class="form-control rfid-input" placeholder="Tempelkan kartu RFID..." autofocus>
                        </div>
                    </form>

                    <!-- Alert -->
                    <div class="perijinan-alert"></div>
                </div>

                <!-- Statistik -->
                <div class="stats-sidebar">
                    <div class="stat-card">
                        <div class="stat-number" id="total-keluar">0</div>
                        <div class="stat-label">
                            <i class="fas fa-sign-out-alt me-2"></i>
                            Sedang Ijin Keluar
                        </div>
                    </div>
                    <div class="stat-card success">
                        <div class="stat-number" id="total-kembali">0</div>
                        <div class="stat-label">
                            <i class="fas fa-check-circle me-2"></i>
                            Sudah Kembali
                        </div>
                    </div>
                </div>
            </div>

            <!-- Konten Kanan: Daftar Siswa -->
            <div class="col-xl-8 col-lg-8">
                <div class="card p-3">
                    <h4 class="fw-bold mb-3 text-center">
                        <i class="fas fa-users me-2"></i>
                        SISWA YANG SEDANG IJIN KELUAR
                    </h4>
                    
                    <div id="siswa-keluar-container">
                        <!-- Data akan dimuat via AJAX -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Audio Success -->
    <audio id="audio-success" src="<?= base_url('include/media/sound/success.mp3') ?>" preload="auto"></audio>
    <audio id="audio-warning" src="<?= base_url('include/media/sound/warning.mp3') ?>" preload="auto"></audio>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Load data pertama kali
        loadSiswaKeluar();
        loadRiwayatHariIni();
        updateStatistik();

        // Update jam digital
        function updateJam() {
            const now = new Date();
            const options = {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            };
            document.getElementById("jam-digital").textContent = now.toLocaleDateString('id-ID', options);
        }
        setInterval(updateJam, 1000);
        updateJam();

        // Fokus kembali ke input RFID
        const rfidInput = document.getElementById("rfid-input");
        rfidInput.addEventListener("blur", () => {
            setTimeout(() => rfidInput.focus(), 10);
        });

        // Submit form perijinan
        document.getElementById("form-perijinan").addEventListener("submit", function(event) {
            event.preventDefault();
            const rfid = rfidInput.value.trim();
            if (rfid) {
                send_ajax('<?= base_url("Presence_system/simpan_perijinan")?>', {rfid: rfid}).then(function(data) {
                    try {
                        var rsp = JSON.parse(data);
                        if (rsp.status === 'success') {
                            $('.perijinan-alert').html(`
                                <div class='alert alert-success alert-scan'>
                                    <center><h5><i class='fas fa-check-circle me-2'></i>${rsp.msg}</h5></center>
                                </div>
                            `);
                            document.getElementById('audio-success').play();
                        } else {
                            $('.perijinan-alert').html(`
                                <div class='alert alert-warning alert-scan'>
                                    <center><h5><i class='fas fa-exclamation-triangle me-2'></i>${rsp.msg}</h5></center>
                                </div>
                            `);
                            document.getElementById('audio-warning').play();
                        }
                        
                        // Refresh data
                        loadSiswaKeluar();
                        loadRiwayatHariIni();
                        updateStatistik();
                        
                        // Clear alert setelah 4 detik
                        setTimeout(function() {
                            $('.perijinan-alert').html("");
                        }, 4000);
                        
                    } catch (e) {
                        console.error('Error parsing response:', e);
                    }
                });
                rfidInput.value = "";
            }
        });

        // Load siswa yang sedang keluar
        function loadSiswaKeluar() {
            send_ajax('<?= base_url("Presence_system/get_siswa_keluar_toilet")?>', {}).then(function(data) {
                $('#siswa-keluar-container').html(data);
            });
        }

        // Load riwayat hari ini
        function loadRiwayatHariIni() {
            send_ajax('<?= base_url("Presence_system/get_riwayat_toilet_hari_ini")?>', {}).then(function(data) {
                $('#riwayat-container').html(data);
            });
        }

        // Update statistik
        function updateStatistik() {
            send_ajax('<?= base_url("Presence_system/get_statistik_toilet")?>', {}).then(function(data) {
                try {
                    var stats = JSON.parse(data);
                    $('#total-keluar').text(stats.sedang_keluar);
                    $('#total-kembali').text(stats.sudah_kembali);
                } catch (e) {
                    console.error('Error parsing statistics:', e);
                }
            });
        }

        // Auto refresh setiap 30 detik
        setInterval(function() {
            loadSiswaKeluar();
            updateStatistik();
        }, 30000);

        // Auto refresh riwayat setiap 1 menit
        setInterval(function() {
            loadRiwayatHariIni();
        }, 60000);
    </script>
</body>
</html>
