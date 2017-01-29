SELECT
	p.id_produk,p.nama_produk,p.stok total,(p.stok-IFNULL(s.terpinjam,0))stok
FROM produk p
	LEFT JOIN (
		SELECT 
			s.id_produk,
			(SELECT stok FROM produk WHERE id_produk=s.id_produk)kuota,
			SUM(s.total)terpinjam
		FROM orders_detail_sewa s 
		WHERE s.status!="k"
		GROUP BY s.id_produk
	)s on s.id_produk = p.id_produk
WHERE p.tipe="s"