
<script type="text/javascript" src="<?php echo base_url();?>/assets/back/ckeditor/ckeditor.js"></script>
    <!--  page-wrapper -->
    <div id="page-wrapper">
        <div class="row">
           <!-- page header -->
           <div class="col-lg-12">
            <h1 class="page-header">Tambahkan Barang Baru</h1>
        </div>
        <!--end page header -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <!-- Form Elements -->
            <div class="panel panel-default">
              <?php echo $this->session->flashdata('flsh_msg'); ?>
               <h4 class="error">
                    <?php $msg = $this->session->userdata('error_image');
                        echo $msg;
                        $this->session->unset_userdata('error_image');
                     ?>                       
                </h4>
                <div class="panel-heading">
                    Barang Baru
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                           <h5 style='color:red'> <?php echo validation_errors();?></h5>
                             <?php echo form_open_multipart('save-product','');?>
                                <div class="form-group">
                                    <label>Nama Barang</label>
                                    <input type="text" class="form-control" value="" name="pro_title" required="">
                                </div>
                                 <div class="form-group">
                                    <label>Deskripsi Lengkap Produk</label>
                                    <textarea  id="ck" class="form-control" rows="3" name="pro_desc"></textarea>
                                    <script>CKEDITOR.replace('ck')</script>
                                </div>
                                 <div class="form-group">
                                    <label>Pilih Kategori</label>
                                    <select class="form-control" name="pro_cat">
                                        <option>Pilih Salah Satu</option>
                                        <?php
                                         foreach ($all_cat as $category) {  ?>
                                        <option value="<?php echo $category->category_id;?>"><?php echo $category->category_name?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Pilih Sub Kategori</label>
                                    <select class="form-control" name="pro_sub_cat">
                                            <?php foreach ($all_sub_cat as $sub_cat) {?>
                                            <option  value="<?php echo $sub_cat->sub_cat_id?>">
                                                <?php echo $sub_cat->sub_category_name?>
                                                </option>
                                        <?php } ?>
                                    </select>
                                </div>
                                 <div class="form-group">
                                    <label>Pilih Merk</label>
                                    <select class="form-control" name="pro_brand">
                                        <option>Pilih Salah Satu</option>
                                        <?php $all_brand = $this->ProductModel->get_all_brand()?>
                                        <?php foreach ($all_brand as $brand) { ?>
                                        <option value="<?php echo $brand->brand_id;?>"><?php echo $brand->brand_name;?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                 <div class="form-group">
                                    <label>Harga Barang</label>
                                    <input type="number" class="form-control" value="" name="pro_price" required="">
                                </div>
                                 <div class="form-group">
                                    <label>Jumlah Barang</label>
                                    <input type="number" class="form-control" value="" name="pro_quantity" required="">
                                </div>
                                <div class="form-group">
                                    <label>Status Barang</label>
                                    <select class="form-control" name="pro_status">
                                        <option>Pilih Salah Satu</option>
                                        <option value="1">Ada</option>
                                        <option value="2">Tidak</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Ketersediaan</label>
                                    <select class="form-control" name="pro_availability">
                                        <option>Pilih Salah Satu</option>
                                        <option value="1">Tersedia</option>
                                        <option value="2">Habis</option>
                                        <option value="3">Mendatang</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Upload Foto Barang</label>
                                    <input type="file" name="pro_image">
                                </div>
                                 <div class="form-group">
                                    <label>Produk Unggulan</label>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="top_product" value="1">Pilih Produk Unggulan
                                        </label>
                                    </div>
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


