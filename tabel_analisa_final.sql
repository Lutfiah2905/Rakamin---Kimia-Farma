-- Membuat tabel_analisa_final dengan detail transaksi, produk, diskon, laba, dan rating
CREATE OR REPLACE TABLE `r-kimia-farma-analytics.kimia_farma.tabel_analisa_final` AS
SELECT
    t.transaction_id,                     -- ID unik transaksi
    t.date,                               -- Tanggal transaksi
    t.branch_id,                          -- ID cabang
    c.branch_name,                        -- Nama cabang
    c.kota,                               -- Kota cabang
    c.provinsi,                           -- Provinsi cabang

    t.customer_name,                      -- Nama customer
    t.product_id,                         -- ID produk
    p.product_name,                       -- Nama produk
    p.price AS actual_price,              -- Harga asli produk
    t.discount_percentage,                -- Diskon yang diberikan

    -- Tentukan persentase laba sesuai ketentuan harga
    CASE 
        WHEN p.price <= 50000 THEN 0.10
        WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
        WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
        WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
        WHEN p.price > 500000 THEN 0.30
    END AS persentase_gross_laba,

    -- Hitung harga setelah diskon (nett_sales)
    (p.price * (1 - t.discount_percentage/100)) AS nett_sales,

    -- Hitung keuntungan bersih (nett_profit)
    (p.price * (1 - t.discount_percentage/100)) *
    CASE 
        WHEN p.price <= 50000 THEN 0.10
        WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
        WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
        WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
        WHEN p.price > 500000 THEN 0.30
    END AS nett_profit,

    t.rating AS rating_transaksi          -- Rating transaksi dari customer

FROM `r-kimia-farma-analytics.kimia_farma.kf_final_transaction` t
LEFT JOIN `r-kimia-farma-analytics.kimia_farma.kf_kantor_cabang` c
    ON t.branch_id = c.branch_id
LEFT JOIN `r-kimia-farma-analytics.kimia_farma.kf_product` p
    ON t.product_id = p.product_id;
