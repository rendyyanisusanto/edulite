<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Absensi RFID</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="<?php echo base_url('include/template/dashboard/js')?>/core/libraries/jquery.min.js"></script>
    <script src="<?php echo base_url('include/core/core.js')?>"></script>
    <style>
        /* Animasi background */
        body {
            background: linear-gradient(-45deg, #1e3c72, #2a5298, #6dd5ed, #ffffff);
            background-size: 400% 400%;
            animation: gradientBG 10s ease infinite;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            max-width: 90%;
        }

        .card {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            height: 100%;
            margin-bottom: 10px;
        }

        #jam-digital {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            background: #007bff;
            color: white;
            padding: 10px;
            border-radius: 8px;
        }

        /* Grid untuk Card Kelas */
        .status-absen-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 10px;
        }

        .status-absen-container .card {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .card h5 {
            margin: 0;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row g-2">
            <!-- Panel Absensi (Lebih besar 70%) -->
            <div class="col-md-6">
                <div class="card p-4">
                    <h3 class="text-center mb-3">Live Presence System</h3>
                    
                    <!-- Jam Digital -->
                    <div id="jam-digital" class="mb-3"></div>

                    <!-- Input RFID -->
                    <form id="form-absen">
                        <input type="text" id="rfid-input" class="form-control form-control-lg text-center" placeholder="Scan Kartu RFID..." autofocus>
                    </form>

                    <!-- Log Absensi -->
                    <div class="mt-4">
                        
                        <div class="presense-alert">
                        </div>

                        <h4 style="font-weight: bold; text-align:center;">3 Aktivitas Terakhir</h4>
                        <div class="status-absen-container">
                            
                        </div>
                    </div>


                </div>
            </div>

            <!-- Panel Promosi (Lebih kecil 30%) -->
            <div class="col-md-6">
                <div class="card p-4">
                    <div class="presense-container">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <audio id="audio-success" src="<?= base_url('include/media/sound/success.mp3') ?>" preload="auto"></audio>

    <script>
        get_presence();
        get_last_presence();
        // Update jam digital
        function updateJam() {
            const now = new Date();
            const jam = now.getHours().toString().padStart(2, '0');
            const menit = now.getMinutes().toString().padStart(2, '0');
            const detik = now.getSeconds().toString().padStart(2, '0');
            document.getElementById("jam-digital").textContent = `${jam}:${menit}:${detik}`;
        }
        setInterval(updateJam, 1000);
        updateJam();

        // Fokus kembali ke input RFID
        const rfidInput = document.getElementById("rfid-input");
        rfidInput.addEventListener("blur", () => {
            setTimeout(() => rfidInput.focus(), 10);
        });

        // Simulasi Log Absensi saat RFID diketik & Enter ditekan
        document.getElementById("form-absen").addEventListener("submit", function(event) {
            event.preventDefault();
            const rfid = rfidInput.value.trim();
            if (rfid) {
                const now = new Date();
                const waktu = now.toLocaleTimeString("id-ID", { hour: "2-digit", minute: "2-digit", second: "2-digit" });
                const logAbsen = document.getElementById("log-absen");


                send_ajax('<?= base_url("Presence_system/simpan_absen")?>', {rfid:rfid}).then(function(data){
                    var rsp = JSON.parse(data);
                    $('.presense-alert').html("<div class='alert alert-success'><center><H4>"+rsp.msg+"</H4></center></div>");
                    document.getElementById('audio-success').play();
                    get_presence();
                    get_last_presence();
                    setTimeout(function() {
                        $('.presense-alert').html("");
                    }, 4000);
                    
                })

                rfidInput.value = ""; // Reset input
            }
        });

        function get_presence(){
            send_ajax('<?= base_url("Presence_system/get_presence")?>', {}).then(function(data){
                $('.presense-container').html(data);
            })
        }
        function get_last_presence(){
            send_ajax('<?= base_url("Presence_system/get_last_presence")?>', {}).then(function(data){
                // $('.presense-container').html(data);
                $('.status-absen-container').html(data);
            })
        }
    </script>
</body>
</html>
