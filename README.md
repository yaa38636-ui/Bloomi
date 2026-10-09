# Bloomi — Android Marketplace UAS

Bloomi adalah template aplikasi marketplace Android berbasis Kotlin + XML dengan desain modern gradasi pink-biru. Alur utama mengikuti 12 layar pada panduan UAS: Splash, Login/Register, Home, Kategori, Daftar Produk, Detail Produk, Keranjang, Checkout, Pembayaran Sandbox, Tracking, Profil/Akun, dan Ulasan Produk.

## Teknologi
- Kotlin
- XML + Material 3
- MVVM-ready / Repository pattern
- Retrofit + OkHttp
- Supabase REST API
- Coroutine
- Coil (siap digunakan untuk gambar produk)

## Cara membuka
1. Ekstrak ZIP.
2. Buka folder `Bloomi` dari Android Studio.
3. Tunggu Gradle Sync.
4. Jalankan emulator/HP Android.
5. Untuk backend live, edit:
   `app/src/main/java/com/bloomi/app/data/ApiConfig.kt`

Isi:
```kotlin
const val BASE_URL = "https://PROJECT.supabase.co/rest/v1/"
const val ANON_KEY = "SUPABASE_ANON_KEY"
```

## Struktur tabel Supabase
Buat tabel `products`:
- id: text, primary key
- name: text
- price: numeric
- rating: numeric
- image: text, nullable
- category: text
- description: text

Buat tabel `cart`:
- id: text, primary key
- product_id: text
- product_name: text
- price: numeric
- quantity: int
- image: text, nullable
- variant: text

Untuk demo kelas, tambahkan data produk melalui Table Editor Supabase.

> Catatan keamanan: jangan memasukkan `service_role` key ke aplikasi Android. Gunakan `anon` key + Row Level Security (RLS). Untuk aplikasi publik, sebaiknya tambahkan autentikasi Supabase dan policy RLS per user.

## Alur demo
Login → Home → Search → Detail → Tambah Keranjang → Cart (+/-/Hapus) → Checkout → Pembayaran → Cek Status → Tracking.

## Catatan
Template ini sengaja memiliki mode demo agar UI tetap bisa dibuka ketika Supabase belum dikonfigurasi. Untuk memenuhi rubrik "100% live backend", konfigurasi Supabase dan RLS sebelum video demo/pengumpulan.
