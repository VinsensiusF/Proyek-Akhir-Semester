# Seller’s Social Media 

## Nama Anggota Kelompok
Amanda Nadhifah Zahra Andini - *2106637246*

Annisa Az Zahra - *2106701242*

Caroline Esther Ulibasa Panggabean - *2106751915*

Jihan Hanifah Yasmin - *2106701955*

Rakan Fasya Athhar Rayyan - *2106750950*

Rangga Yudhistira Brata - *2106751051*

Vinsensius Ferdinando - *2106751221*

## Nama Aplikasi  
:sparkles::sparkles::sparkles: **Seller’s Social Media** :sparkles::sparkles::sparkles:


## Latar Belakang dan Cerita Aplikasi
<p align="justify">
Secara garis besar, aplikasi yang kami kerjakan merupakan sebuah media sosial yang, notabenenya, menjadi sebuah sarana pertemuan dari pembeli dan penjual. Layaknya sebuah media sosial, aplikasi kami tidak melayani pembelian barang secara langsung melainkan, mempertemukan pembeli dan penjual dengan memberikan informasi penjual kepada pembeli. Hal tersebut dilakukan agar pembeli dapat melakukan pembelian dengan memberikan penawaran harga yang, secara garis besar, tidak dapat dilakukan pada sebuah platform belanja. Dengan menghubungi secara pribadi, pembeli dapat berbincang dengan penjual melalui kontak yang ditunjukan pada aplikasi. 

Untuk mempertemukan pembeli dan penjual yang cocok atau sesuai dengan kriteria barang yang dibeli, maka terdapat fitur pemisahan toko berdasarkan kategori yang ada. Dengan begitu, pembeli dapat memilih toko yang ingin mereka hubungi berdasarkan kebutuhan dan barang yang ingin dibeli.

Dalam aplikasi ini, hanya terdapat dua peran pengguna. Pertama, pengguna yang berperan sebagai pembeli. Pengguna yang berperan sebagai pembeli hanya dapat melihat toko yang ada di masing-masing kategori. Kedua, user yang bertindak sebagai penjual yang dapat mengganti profil yang ia miliki guna mengubah kontak atau nama toko milik mereka yang ditampilkan pada page masing-masing kategori. Seluruh user yang mengakses aplikasi diharuskan untuk sign in terlebih dahulu guna mendapatkan role yang dimiliki.
</p>

## Daftar Fitur
:closed_lock_with_key::closed_lock_with_key::closed_lock_with_key: **Sign in / Sign up** :closed_lock_with_key::closed_lock_with_key::closed_lock_with_key: 

*(Implementasi Sign Up / Sign In akan dikerjakan oleh Rangga Yudhistira Brata)*

Fitur ini merupakan fitur awal yang memungkinkan user untuk mendaftar dan masuk sebagai user yang memiliki role sesuai dengan kedua role yang telah disebutkan sebelumnya. Fitur ini mendaftarkan user ke database apabila user sign up, dan melakukan get data dan mencocokan kepada credential yang dimasukkan user saat sign in. Apabila data benar, maka user dapat sign in dengan baik.

:sunny::sunny::sunny: **Homepage** :sunny::sunny::sunny: 

*(Implementasi Homepage akan dikerjakan oleh Vinsensius Ferdinando)*

Fitur ini merupakan landing page dari aplikasi. Dengan adanya home page ini, aplikasi dapat menunjukan identitas aplikasi itu sendiri. Selain itu, home page juga akan memiliki beberapa button yang memungkinkan user untuk melihat kategori yang ditawarkan, pindah ke page FAQ, dan pindah ke page Forum. Selain itu, terdapat fitur search toko yang memungkinkan user untuk mencari toko sesuai dengan nama yang dimasukkan ke input pencarian tersebut.



:cd::cd::cd: **Menampilkan Kategori** :cd::cd::cd:  
*(Implementasi Menampilkan Kategori akan dikerjakan oleh Annisa Az Zahra)*

Fitur ini menampilkan kategori yang ada di aplikasi ini. Kategori ditampilkan bersamaan dengan sedikit pengenalan kategori (Introduction) dan juga sebuah button untuk menuju ke page yang berisikan toko-toko yang berada di dalam kategori tersebut.



:telephone::telephone::telephone: **Menampilkan Toko** :telephone::telephone::telephone: 
*(Implementasi Menampilkan Toko akan dikerjakan oleh Amanda Nadhifah Zahra Andini)*

Fitur ini menampilkan seluruh toko yang ada di dalam kategori yang dipilih oleh user. Dengan adanya fitur ini, user dapat menghubungi toko yang dinilai menarik minat membelinya dengan menghubungi kontak toko yang tersedia di setiap card atau pilihan toko.



:smile::smile::smile: **Mengubah Profile** :smile::smile::smile:  
*(Implementasi Mengubah Profile akan dikerjakan oleh Caroline Esther Ulibasa Panggabean)*

Fitur ini mengubah profil dari user yang sedang login. Fitur ini dapat dilihat implementasinya dengan lebih jelas pada saat user yang sedang login merupakan penjual karena perubahan nama toko atau kontak yang dapat dihubungi dapat terlihat dengan jelas.



:grey_question::grey_question::grey_question: **FAQ** :grey_question::grey_question::grey_question: 

*(Implementasi FAQ akan dikerjakan oleh Rakan Fasya Athhar Rayyan)*

Fitur ini akan menampilkan seluruh pertanyaan yang sering ditanyakan oleh user. Fitur ini sendiri akan memiliki satu page secara eksklusif yang dapat diakses oleh user dengan menekan tombol yang ada di home page.



:checkered_flag::checkered_flag::checkered_flag: **Forum** :checkered_flag::checkered_flag::checkered_flag: 

*(Implementasi Forum akan dikerjakan oleh Jihan Hanifah Yasmin)*

Fitur ini akan menjadi sebuah forum tanya jawab yang dapat dimanfaatkan oleh user. Fitur ini sendiri akan memiliki satu page secara eksklusif yang dapat diakses oleh user dengan menekan tombol yang ada di home page.




## Alur Integrasi
1. Memastikan implementasi fungsionalitas authentication untuk sign in dan sign up berjalan bersamaan dengan fitur cookie.
2. Mendapatkan data berupa JSON dari django dengan memanfaatkan JsonResponse dan serializer yang dapat diterima dan diproses oleh flutter.
3. Melakukan penyusunan widget sesuai dengan rencana penyusunan awal.
4. Menggunakan asynchronous HTTP gunaa memastikan integrasi back-end berjalan dengan baik dan fungsionalitas back-end dapat diakses melalui event-handler pada front-end.
5. Melakukan testing dan pengujian widget sesuai dengan fungsionalitas fitur dan sistem yang dirancang sebelumnya.


