
       <!--  page-wrapper -->
        <div id="page-wrapper" style="background:#fff">

            <div class="row">
                <!-- Page Header -->
                <div class="col-lg-12">
                    <h1 class="page-header">Halaman Pesanan</h1>
                </div>
                <!--End Page Header -->
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                           Alamat Penagihan
                        </div>
                        <div class="panel-body">
                          <h4><b>Nama :</b> <?php echo $cus_info->cus_name?></h4>
                          <h4><b>Email :</b> <?php echo $cus_info->cus_email?></h4>
                          <h4><b>No. HP :</b> <?php echo $cus_info->cus_mobile?></h4>
                          <h4><b>Alamat :</b> <?php echo $cus_info->cus_address?></h4>
                          <h4><b>Kota :</b> <?php echo $cus_info->cus_city?></h4>
                          <h4><b>Provinsi :</b> <?php echo $cus_info->cus_country?></h4>
                          <h4><b>Kode Pos :</b> <?php echo $cus_info->cus_zip?></h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                          Alamat Pengiriman
                        </div>
                        <div class="panel-body">
                          <h4><b>Nama :</b> <?php echo $ship_info->cus_name?></h4>
                          <h4><b>Email :</b> <?php echo $ship_info->cus_email?></h4>
                          <h4><b>No. HP :</b> <?php echo $ship_info->cus_mobile?></h4>
                          <h4><b>Alamat :</b> <?php echo $ship_info->cus_address?></h4>
                          <h4><b>Kota :</b> <?php echo $ship_info->cus_city?></h4>
                          <h4><b>Provinsi :</b> <?php echo $ship_info->cus_country?></h4>
                          <h4><b>Kode Pos :</b> <?php echo $ship_info->cus_zip?></h4>
                          <h4><b>Fax:</b><?php echo $ship_info->cus_fax?></h4>
                        </div>
                    </div>
                </div>
            </div>
                <div class="row">
                     <div class="col-lg-12">
                         <div class="panel panel-default">
                            <div class="panel-heading">
                               Nomor Tagihan : # Inv. ULT2025-<?php echo $order_info->order_id?>
                            </div>
                         <h5>
                             Tanggal : <?php $date=  $order_info->order_date;
                               echo date('m-d-y',strtotime($date));
                             ?>
                         </h5>
                         </div>
                     </div>
                </div>
               <div class="row">
                <div class="col-lg-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                          Detail Pesanan
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Nama Barang</th>
                                            <th>Jumlah</th>
                                            <th>Harga Unit</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                            $total=0;
                                        foreach ($order_details_info as $order) {?>
                                        <tr class="odd gradeX">
                                            <td><?php echo $order->product_name?></td>

                                            

                                            <td><?php echo $order->sales_quantity?></td>
                                            <td>Rp. <?php echo $order->product_price;?></td>
                                            <td class="center"><?php echo $order->sales_quantity * $order->product_price;?></td>  

                                        </tr>
                                        <?php 
                                        $total = $total+$order->sales_quantity * $order->product_price;
                                           
                                         } ?>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->   
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                           Total Pesanan
                        </div>
                        <div class="panel-body">
                           <h4><strong>Jumlah : </strong>Rp. <?php echo $total?></h4>
                           <h4><strong>PPN 12% : </strong>Rp. <?php echo $vat = $total*12/100;?></h4>
                           <h4><strong>Total : </strong>Rp. <?php echo $vat+$total;?></h4>
                        </div>
                        <!-- <div class="panel-footer">
                            Panel Footer
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- end page-wrapper -->
       