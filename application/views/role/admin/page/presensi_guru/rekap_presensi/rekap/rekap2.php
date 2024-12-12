<style>
    table {
        border-collapse: collapse;
        width: 100%;
        font-family: Arial, sans-serif;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #ddd;
    }

    .black-cell {
        background-color: black;
        color: white;
    }

    .green-check {
        color: green;
        font-weight: bold;
    }

    .red-x {
        color: red;
        font-weight: bold;
    }
</style>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-body">
            <center><h4>Data Presensi Guru Bulan <?= $data_get['bulan'].'/'.$data_get['tahun'] ?></h4></center>
            <table>
                <thead>
                    <tr>
                        <th>Nama Guru</th>
                        <?php foreach ($data_get['weeks'] as $week): ?>
                            <th>Minggu <?= $week ?></th>
                        <?php endforeach; ?>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data_get['report'] as $guru): ?>
                        <tr>
                            <td><?= $guru['nama'] ?></td>
                            <?php foreach ($data_get['weeks'] as $week): ?>
                                <td>
                                    <?php 
                                    $status = isset($guru['weeks'][$week]) ? implode(", ", $guru['weeks'][$week]) : 'N/A'; 
                                    echo $status;
                                    ?>
                                </td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
