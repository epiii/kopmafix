SELECT 
	s.id_produk,
	(SELECT stok FROM produk WHERE id_produk=s.id_produk)kuota,
	SUM(s.total)terpinjam
FROM orders_detail_sewa s 
WHERE s.status!="k"
GROUP BY s.id_produk