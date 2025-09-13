<script src="<?php echo base_url('include/template/limitless/')?>global_assets/js/plugins/tables/datatables/datatables.min.js"></script>


<!-- Main Content -->
<div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading">
                <h6 class="panel-title">
                    <i class="icon-file-text2 mr-2"></i><?php echo ucwords(str_replace('_', ' ', $data_get['param']['title'])) ?>
                    <a class="heading-elements-toggle"><i class="icon-more"></i></a>
                </h6>
            </div>
            
            <div class="panel-body">
                <!-- Action Buttons -->
                <div class="filter-section">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="btn-group">
                                <button type="button" class="btn bg-teal-400 btn-labeled legitRipple" data-toggle="modal" data-target="#modal-tambah">
                                    <b><i class="icon-plus3"></i></b> Tambah Surat Izin
                                </button>
                                <button type="button" class="btn bg-success-400 btn-labeled legitRipple" id="edit-btn">
                                    <b><i class="icon-pencil4"></i></b> Edit Data
                                </button>
                                <button type="button" class="btn bg-danger-400 btn-labeled legitRipple" id="del-btn">
                                    <b><i class="icon-bin"></i></b> Hapus Data
                                </button>
                            </div>
                            
                            <!-- Date Filter -->
                            <div class="pull-right">
                                <div class="form-inline">
                                    <div class="form-group mr-10">
                                        <label class="text-semibold mr-5">
                                            <i class="icon-calendar22 mr-1"></i>Filter Tanggal:
                                        </label>
                                    </div>
                                    <div class="form-group mr-10">
                                        <input type="date" class="form-control tanggal_mulai" placeholder="Tanggal Mulai">
                                    </div>
                                    <div class="form-group">
                                        <input type="date" class="form-control tanggal_selesai" placeholder="Tanggal Selesai">
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                
                <!-- Data Table -->
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" width="100%" id="tabel-data">
                        <thead class="bg-primary">
                            <tr>
                                <th width="1%" class="text-center">
                                    <i class="icon-checkbox-checked2"></i>
                                </th>
                                <th class="text-center">
                                    Kode
                                </th>
                                <th class="text-center">
                                    Tanggal Mulai
                                </th>
                                <th class="text-center">
                                    Tanggal Selesai
                                </th>
                                <th class="text-center">
                                    Kegiatan
                                </th>
                                <th class="text-center">
                                    Tujuan
                                </th>
                                <th class="text-center">
                                    Tempat
                                </th>
                                <th class="text-center">
                                    Pendamping
                                </th>
                                <th class="text-center">
                                    Status
                                </th>
                                <th class="text-center">
                                    Print
                                </th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>