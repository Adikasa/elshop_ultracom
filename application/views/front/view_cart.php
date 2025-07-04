
<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<?php echo base_url();?>">Beranda</a></li>
				  <li class="active">Keranjang Belanja</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Nama Barang</td>
							<td class="description"></td>
							<td class="price">Harga</td>
							<td class="quantity">Jumlah</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<?php $cart_content = $this->cart->contents();
						
						?>

						<?php foreach ($cart_content as $items){ ?>

						<tr>
							<td class="cart_product">
								<a href=""><img  width="100" src="<?php echo $items['options']['pro_image']?>" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><?php echo $items['name']?></a></h4>
							</td>
							<td class="cart_price">
								<p>Rp. <?php echo $items['price']?></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<form action="<?php echo base_url()?>update-cart-qty" method="post">
										<a class="cart_quantity_up" href=""> + </a>
										<input class="cart_quantity_input" type="text" name="qty" value="<?php echo $items['qty']?>" autocomplete="off" size="2">
										<a class="cart_quantity_down" href=""> - </a>
										<input  type="hidden" name="rowid" value="<?php echo $items['rowid']?>">

										<input  type="submit"  value="Perbaharui"/>

									<form>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">Rp. <?php echo $items['subtotal']?></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href="<?php echo base_url()?>delete-to-cart/<?php echo $items['rowid']?>"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<?php } ?>

					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Apa yang ingin Anda lakukan selanjutnya?</h3>
				<p>Pilih apakah Anda memiliki kode diskon atau poin hadiah yang ingin Anda gunakan atau ingin memperkirakan biaya pengiriman Anda.</p>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="chose_area">
						<ul class="user_option">
							<li>
								<input type="checkbox">
								<label>Gunakan Kode Kupon</label>
							</li>
							<li>
								<input type="checkbox">
								<label>Gunakan Voucher Hadiah</label>
							</li>
							<li>
								<input type="checkbox">
								<label>Perkiraan Biaya Pengiriman & Pajak</label>
							</li>
						</ul>
						<ul class="user_info">
							<li class="single_field">
								<label>Provinsi:</label>
								<select>
									<option>Jakarta</option>
									<option>Jawa Barat</option>
									<option>Jawa Tengah</option>
									<option>Jawa Timur</option>
									<option>Banten</option>
								</select>
								
							</li>
							<li class="single_field">
								<label>Kota:</label>
								<select>
									<option>Pilih</option>
									<option>Jakarta Pusat</option>
									<option>Jakarta Timur</option>
									<option>Jakarta Barat</option>
									<option>Jakarta Utara</option>
									<option>Jakarta Selatan</option>
									<option>Bogor</option>
									<option>Kota Depok</option>
									<option>Kota Bekasi</option>
									<option>Tangerang</option>								
								</select>
							
							</li>
							<li class="single_field zip-field">
								<label>Kode Pos:</label>
								<input type="text">
							</li>
						</ul>
						<a class="btn btn-default update" href="">Get Quotes</a>
						<a class="btn btn-default check_out" href="">Lanjutkan</a>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<?php 
								$cart_total = $this->cart->total();
							?>
							<li>Sub Total <span>Rp. <?php echo $cart_total;?></span></li>
							<?php
								$tax = ($cart_total*12)/100;
							?>
							<li>Pajak 12% <span>Rp. <?php echo $tax?></span></li>
							<!-- Shipping Cost Dependend Quantity, price, buyer distance etc -->
							<?php
								$shiping = "0";
								if($cart_total>0 && $cart_total<49){
									$shiping = 0;
								}elseif($cart_total>50 && $cart_total<98){
									$shiping = 2;
								}elseif($cart_total>99 && $cart_total<198){
									$shiping = 5;
								}elseif($cart_total>199){
									$shiping = 10;
								}elseif($cart_total<0){
									$shiping = 0;
								}
							?>
							<li> Pengiriman <span>Rp. <?php echo $shiping?></span></li>
							<?php $g_total = $cart_total+$tax+$shiping;?>
							<li>Total <span>
								<?php
									$gdata = array();
									$gdata['g_total'] = $g_total;
									$this->session->set_userdata($gdata);
							 		echo "Rp. $g_total";
							 	?>
							 </span></li>
						</ul>
							<form action="<?php echo base_url()?>update-cart-qty" method="post" >	
							<input type="submit" class="btn btn-default update"  value="Update"/>
							<?php $customer_id = $this->session->userdata('cus_id');?>
							<?php $shipping_id = $this->session->userdata('shipping_id');?>
							<?php if($this->cart->total_items()!=Null && $customer_id!=NULL && $shipping_id!=NULL){?>
							<a class="btn btn-default check_out" href="<?php echo base_url()?>payment">Check Out</a>
							<?php } elseif($customer_id!=NULL && $this->cart->total_items()!=Null){?>
							<a class="btn btn-default check_out" href="<?php echo base_url()?>billing">Check Out</a>
							<?php }elseif($this->cart->total_items()!=Null){ ?>
							<a class="btn btn-default check_out" href="<?php echo base_url()?>checkout">Check Out</a>
							<?php } ?>
							</form>	
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->