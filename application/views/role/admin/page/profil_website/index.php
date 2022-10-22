<script type="text/javascript" src="<?php echo base_url('include/ckeditor/ckeditor.js'); ?>"></script>
<form class="form-horizontal" action="<?php echo $data_get['param']['table'] ?>/update_data" id="app-submit" method="POST">

<div class="row">
  <div class="col-md-12">
    <div class="panel panel-body">
      <fieldset>
              <div class="form-group">
                <label class="col-lg-3 control-label">Nama Sekolah:</label>
                <div class="col-lg-6">
                  <input type="text" name="nama" value="<?php echo $data_get['profil']['nama'] ?>" class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Nama Sistem:</label>
                <div class="col-lg-6">
                  <input type="text" name="nama_website" value="<?php echo $data_get['profil']['nama_website'] ?>" class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Alamat:</label>
                <div class="col-lg-6">
                  <input type="text" name="alamat" class="form-control" value="<?php echo $data_get['profil']['alamat'] ?>" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Kota:</label>
                <div class="col-lg-6">
                  <input type="text" name="kota" class="form-control" value="<?php echo $data_get['profil']['kota'] ?>" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Negara:</label>
                <div class="col-lg-6">
                  <input type="text" name="negara" value="<?php echo $data_get['profil']['negara'] ?>" class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">No HP:</label>
                <div class="col-lg-6">
                  <input type="text" name="no_hp" class="form-control" value="<?php echo $data_get['profil']['no_hp'] ?>" required placeholder="Input here......">
                </div>
              </div>
              
              <div class="form-group">
                <label class="col-lg-3 control-label">Image About Us:</label>
                <div class="col-lg-6">
                  <input type="file" name="img_prof" class="form-control" placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Logo:</label>
                <div class="col-lg-6">
                  <input type="file" name="logo" class="form-control" placeholder="Input here......">
                </div>
              </div>

              <div class="form-group">
                <label class="col-lg-3 control-label">Favicon:</label>
                <div class="col-lg-6">
                  <input type="file" name="icon" class="form-control" placeholder="Input here......">
                </div>
              </div>

              <div class="form-group">
                <label class="col-lg-3 control-label">Singkatan Website:</label>
                <div class="col-lg-6">
                  <input type="text" name="singkatan" value="<?php echo $data_get['profil']['singkatan'] ?>" class="form-control" required placeholder="Input here......">
                </div>
              </div>


              <div class="form-group">
                <label class="col-lg-3 control-label">Tagline:</label>
                <div class="col-lg-6">
                  <input type="text" name="tagline" class="form-control" value="<?php echo $data_get['profil']['tagline'] ?>" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Tentang Kami (About us):</label>
                <div class="col-lg-9">
                  <textarea name="about_us"  required id="about_us"><?php echo $data_get['profil']['about_us'] ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Email (email):</label>
                <div class="col-lg-6">
                  <input type="text" name="email" value="<?php echo $data_get['profil']['email'] ?>" required class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Pemilik:</label>
                <div class="col-lg-6">
                  <input type="text" name="pemilik" value="<?php echo $data_get['profil']['pemilik'] ?>"  required class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Facebook:</label>
                <div class="col-lg-6">
                  <input type="text" name="facebook"  value="<?php echo $data_get['profil']['facebook'] ?>" required class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Instagram:</label>
                <div class="col-lg-6">
                  <input type="text" name="instagram"  value="<?php echo $data_get['profil']['instagram'] ?>" required class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Twitter:</label>
                <div class="col-lg-6">
                  <input type="text" name="twitter"  value="<?php echo $data_get['profil']['twitter'] ?>" required class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Youtube:</label>
                <div class="col-lg-6">
                  <input type="text" name="youtube"  value="<?php echo $data_get['profil']['youtube'] ?>" required class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Lokasi (Longitude):</label>
                <div class="col-lg-6">
                  <input type="text" name="lng"  value="<?php echo $data_get['profil']['lng'] ?>" required class="form-control" required placeholder="Input here......">
                </div>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Lokasi (Latitude):</label>
                <div class="col-lg-6">
                  <input type="text" name="lat"  value="<?php echo $data_get['profil']['lat'] ?>" required class="form-control" required placeholder="Input here......">
                </div>
              </div>

             
              <button class="btn btn-success" type="submit">Simpan</button>
            </fieldset> 
    </div>
  </div>
</div>
</form>