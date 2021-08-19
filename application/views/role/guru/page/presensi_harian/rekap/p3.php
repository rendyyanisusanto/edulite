<br>
          <label>Mata Pelajaran</label>
          <select required="" name="idmatapelajaran_fk" class="form-control">
            <?php foreach ($data_get['mata_pelajaran'] as $key => $value): ?>
            <option value="<?php echo $value['id_mata_pelajaran'] ?>"><?php echo $value['mata_pelajaran'] ?></option>
            <?php endforeach ?>
          </select>