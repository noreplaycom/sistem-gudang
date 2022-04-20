# sistem-gudang
    Buat database baru dengan nama db_gudang.
    Import database aplikasi ke dalam database db_gudang.

    jalankan composer update (didalam project perpus)
    lalu jalankan copy .env.example .env
    setelah itu php artisan key:generate
    jangan lupa buat database (perpusku_gc) di phpmyadmin
    langkah selanjutnya setting database nya di .env
    jalankan php artisan migrate
    jalankan juga php artisan db:seed
    terakhir php artisan serve
    Login admin - username : admin123 - password : admin123
    Login user - username : user123 - password : user123
    selesai deh! ooiya ini maksimal menggunakan PHP 7.2 yaa.. mohon maaf sekali sob!
    Login dengan email : admin, Password : admin.

# Fitur Aplikasi :

    Login Multi User
    Dashboard
    Data Karyawan
    Data Pemasok
    Data Barang
    Barang Masuk
    Barang Keluar
    Data Kategori
    Data Satuan
    Data User
    Laporan-laporan
    LogOut
    dan lainnya.
