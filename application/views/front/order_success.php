


<section id="cart_items">
		<div class="container">
			<h3>Selamat, <?php echo $this->session->userdata("cus_name");?></h3>
<h4>Pesanan Anda Telah Berhasil, Silahkan lanjutkan proses Pembayaran...</h4><hr/>
			
<h4>Total yang harus dibayar (termasuk PPN) : <h3 style="color:red;">Rp. <?php echo $this->session->userdata("g_total");?></h3></h4>

<h5 style="text-align: justify;">Terima kasih atas transaksi Anda, dan Pesanan telah berhasil kami terima. Admin kami akan segera menghubungi Anda, untuk konfirmasi data dan alamat pengiriman. Silakan periksa email Anda secara berkala.</h5>
			
		</div>
	</section> <!--/#cart_items-->

	