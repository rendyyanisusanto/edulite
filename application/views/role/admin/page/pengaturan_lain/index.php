	<section class="content-header">
      <h1>
        pengaturan lain
        <small>Tokoku</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">pengaturan lain</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
      	<div class="col-md-12">
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">pengaturan lain</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form class="form-horizontal" action="pengaturan_lain/update_data" id="app-submit">
              <div class="row">
                  
                  <div class="col-md-12">
                    <label>Background</label>
                    <br>
                    <center><img class="img img-responsive" src="<?php echo base_url('include/setting_website/background/'.$data_get['profil']['background']) ?>"></center>
                    <br>
                    <input type="file" name="background" id="background" class="form-control">
                  </div>


               </div>
               <hr>
               <div class="row">
                 
                  <div class="col-md-6">
                      <div class="form-group">
                        <label class="control-label col-sm-4" for="nama_website">Text Whatsapp Klien:</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" value="<?php echo $data_get['profil']['wa_text'] ?>" id="wa_text" placeholder="Enter wa text">
                        </div>
                      </div>
                  </div>
               </div>
               <hr>
               <div class="row">
                 <div class="col-md-12">
                   <center><button class="btn btn-success" type="submit"><i class="fa fa-save"></i> Simpan</button></center>
                 </div>
               </div>
               </form>
            </div>
            <!-- /.box-body -->
          </div>
        </div>
      </div>
    </section>
