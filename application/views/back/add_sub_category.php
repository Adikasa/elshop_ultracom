
    <!--  page-wrapper -->
    <div id="page-wrapper">
        <div class="row">
           <!-- page header -->
           <div class="col-lg-12">
            <h1 class="page-header">Tambahkan Sub Kategori Barang</h1>
        </div>
        <!--end page header -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <!-- Form Elements -->
            <div class="panel panel-default">
               
                <div class="panel-heading">
                   Tambah Sub Kategori Baru
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                           <h5 style='color:red'> <?php echo validation_errors();?></h5>
                                <?php echo form_open('save-sub-category','');?>
                                 <?php $cat = $this->CategoryModel->get_all_category();?>
                                 <select class="form-control" name="category_sub_id">
                                        <option>Pilih Salah Satu</option>
                                       
                                         <?php
                                         foreach ($cat as $category) {  ?>
                                        <option value="<?php echo $category->category_id;?>"><?php echo $category->category_name?></option>
                                        <?php } ?>
                                </select>
                                <div class="form-group">
                                    <label>Tambah Sub Kategori</label>
                                    <input type="text" class="form-control" value="" name="sub_category_name" required="">
                                </div>
                                 
                                <button type="submit" class="btn btn-primary">Simpan</button>
                            <?php echo form_close();?>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Form Elements -->
        </div>
    </div>
</div>
<!-- end page-wrapper -->


