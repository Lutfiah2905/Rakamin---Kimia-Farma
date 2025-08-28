# Big Data Analytics Intern - Kimia Farma

Repository ini berisi dokumentasi dan query SQL untuk proyek analisis kinerja bisnis **Kimia Farma** periode 2020-2023.  
Semua langkah dokumentasi sesuai instruksi tugas: **menjelaskan proses import dataset, pembuatan tabel analisa, dan perhitungan analisis**.

---

## 1. Import Dataset ke BigQuery

Dataset yang diberikan berupa file CSV:
- `kf_final_transaction.csv`
- `kf_inventory.csv`
- `kf_kantor_cabang.csv`
- `kf_product.csv`

**Langkah-langkah:**
1. Masuk ke Google BigQuery Console.
2. Buat dataset baru: `kimia_farma`.
3. Import masing-masing CSV menjadi tabel:
   - `kf_final_transaction`
   - `kf_inventory`
   - `kf_kantor_cabang`
   - `kf_product`

> Catatan: Nama tabel sama dengan nama file tanpa `.csv`.

---

## 2. Pembuatan Tabel Analisa

Terdapat dua tahap pembuatan tabel:
1. **tabel_analisa** → menggabungkan transaksi dengan informasi cabang:
   - Kolom: `transaction_id`, `date`, `branch_id`, `branch_name`, `kota`, `provinsi`
2. **tabel_analisa_final** → menggabungkan transaksi, cabang, dan produk serta menghitung laba, nett_sales, nett_profit, dan rating_transaksi:
   - Kolom: `transaction_id`, `date`, `branch_id`, `branch_name`, `kota`, `provinsi`, `rating_cabang`, `customer_name`, `product_id`, `product_name`, `actual_price`, `discount_percentage`, `persentase_gross_laba`, `nett_sales`, `nett_profit`, `rating_transaksi`

---

## 3. Query BigQuery

Query SQL disimpan di repo dalam file:
- `tabel_analisa.sql`
- `tabel_analisa_final.sql`

Keduanya sudah **diberi komentar** untuk menjelaskan setiap langkah dan perhitungan.

**Contoh komentar dalam query:**
- `-- Ambil transaction_id dari tabel transaksi`
- `-- Hitung persentase laba sesuai ketentuan harga`
- `-- Hitung harga setelah diskon (nett_sales)`

---

## 4. Output

Hasil query akan menghasilkan:
1. **tabel_analisa** → tabel gabungan transaksi + cabang
2. **tabel_analisa_final** → tabel final dengan detail transaksi, produk, diskon, laba, dan rating

---

## 5. Catatan

- Pastikan semua dataset telah diimport dengan benar sebelum menjalankan query.
- Semua query bisa langsung dijalankan di BigQuery Editor.
- Dokumentasi ini dibuat untuk mempermudah review dan pemahaman setiap langkah analisis.
