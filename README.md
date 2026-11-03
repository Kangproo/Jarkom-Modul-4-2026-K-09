# Laporan Resmi Praktikum Komunikasi Data & Jaringan Komputer 2026
## Modul 4: Subnetting VLSM & Routing pada GNS3 (The Wired Expansion)

---

### 👥 Anggota Kelompok (Kelompok K-09)
* **Sultan Ahmad Maulana Bahyshidqi** — 502751070
* **Muhammad Razzan Azizi Djuhari** — 5027251086

---

## 📖 1. Pendahuluan & Latar Belakang
Pada praktikum Modul 4 ini, dirancang sebuah arsitektur jaringan berskala besar bertema **The Wired Expansion**. Jaringan ini menghubungkan 13 Router dan 25 Host/Client yang saling terdistribusi ke dalam beberapa domain broadcast.

Seluruh jaringan dialokasikan secara efisien menggunakan metode **VLSM (Variable Length Subnet Masking)** berbasis alokasi prefix utama **10.68.0.0/19**, diimplementasikan pada platform simulator **GNS3** menggunakan Docker image **rdhptr21/debinet:latest** (Debian Linux).

---

## 🗺️ 2. Topologi Jaringan GNS3
Topologi terdiri dari:
* **1 Gateway Internet / NAT**: Router Cyberia terhubung langsung ke NAT1.
* **13 Router**: Cyberia, Wired, Psyche, Copland, Schumann, Accela, Navi, Tachibana, Deus, Protocol7, Knights, Phantoma, Shibuya.
* **25 Host / Client**: JJ, MyuMyu, Karl, Lin, Juri, Masayuki, Akashic, Omnipresence, Denpa, Alice, Reika, Taro, Yasuo, Miho, Kuma, Collective, Ghost, Lilith, Specter, Chisa, Hodgeson, Eiri, Semi, Lain, Mika.

![Topologi GNS3](images/topologi-gns3.png)

---

## 📊 3. Perhitungan Subnetting (VLSM)
Pengalokasian alamat IP diurutkan dari subnet dengan kebutuhan IP terbesar ke terkecil (*descending*) agar tidak terjadi pemborosan alamat dan overlap.

### 📋 Tabel Alokasi VLSM (Prefix Dasar: 10.68.0.0/19)

| Subnet | Kebutuhan Host + Router | Netmask (Prefix) | Network ID | Broadcast ID | Usable IP Range |
| :---: | :---: | :---: | :---: | :---: | :---: |
| **A6** | 881 IP | /22 (255.255.252.0) | 10.68.0.0 | 10.68.3.255 | 10.68.0.1 - 10.68.3.254 |
| **A11** | 514 IP | /22 (255.255.252.0) | 10.68.4.0 | 10.68.7.255 | 10.68.4.1 - 10.68.7.254 |
| **A8** | 301 IP | /23 (255.255.254.0) | 10.68.8.0 | 10.68.9.255 | 10.68.8.1 - 10.68.9.254 |
| **A15** | 267 IP | /23 (255.255.254.0) | 10.68.10.0 | 10.68.11.255 | 10.68.10.1 - 10.68.11.254 |
| **A12** | 254 IP | /24 (255.255.255.0) | 10.68.12.0 | 10.68.12.255 | 10.68.12.1 - 10.68.12.254 |
| **A14** | 143 IP | /24 (255.255.255.0) | 10.68.13.0 | 10.68.13.255 | 10.68.13.1 - 10.68.13.254 |
| **A1** | 126 IP | /25 (255.255.255.128) | 10.68.14.0 | 10.68.14.127 | 10.68.14.1 - 10.68.14.126 |
| **A17** | 99 IP | /25 (255.255.255.128) | 10.68.14.128 | 10.68.14.255 | 10.68.14.129 - 10.68.14.254 |
| **A25** | 62 IP | /26 (255.255.255.192) | 10.68.15.0 | 10.68.15.63 | 10.68.15.1 - 10.68.15.62 |
| **A13** | 58 IP | /26 (255.255.255.192) | 10.68.15.64 | 10.68.15.127 | 10.68.15.65 - 10.68.15.126 |
| **A19** | 33 IP | /26 (255.255.255.192) | 10.68.15.128 | 10.68.15.191 | 10.68.15.129 - 10.68.15.190 |
| **A7** | 32 IP | /26 (255.255.255.192) | 10.68.15.192 | 10.68.15.255 | 10.68.15.193 - 10.68.15.254 |
| **A23** | 15 IP | /27 (255.255.255.224) | 10.68.16.0 | 10.68.16.31 | 10.68.16.1 - 10.68.16.30 |
| **A3** | 4 IP | /29 (255.255.255.248) | 10.68.16.32 | 10.68.16.39 | 10.68.16.33 - 10.68.16.38 |
| **A9** | 4 IP | /29 (255.255.255.248) | 10.68.16.40 | 10.68.16.47 | 10.68.16.41 - 10.68.16.46 |
| **A21** | 3 IP | /29 (255.255.255.248) | 10.68.16.48 | 10.68.16.55 | 10.68.16.49 - 10.68.16.54 |
| **A2** | 2 IP | /30 (255.255.255.252) | 10.68.16.56 | 10.68.16.59 | 10.68.16.57 - 10.68.16.58 |
| **A4** | 2 IP | /30 (255.255.255.252) | 10.68.16.60 | 10.68.16.63 | 10.68.16.61 - 10.68.16.62 |
| **A5** | 2 IP | /30 (255.255.255.252) | 10.68.16.64 | 10.68.16.67 | 10.68.16.65 - 10.68.16.66 |
| **A10** | 2 IP | /30 (255.255.255.252) | 10.68.16.68 | 10.68.16.71 | 10.68.16.69 - 10.68.16.70 |
| **A16** | 2 IP | /30 (255.255.255.252) | 10.68.16.72 | 10.68.16.75 | 10.68.16.73 - 10.68.16.74 |
| **A18** | 2 IP | /30 (255.255.255.252) | 10.68.16.76 | 10.68.16.79 | 10.68.16.77 - 10.68.16.78 |
| **A20** | 2 IP | /30 (255.255.255.252) | 10.68.16.80 | 10.68.16.83 | 10.68.16.81 - 10.68.16.82 |
| **A22** | 2 IP | /30 (255.255.255.252) | 10.68.16.84 | 10.68.16.87 | 10.68.16.85 - 10.68.16.86 |
| **A24** | 2 IP | /30 (255.255.255.252) | 10.68.16.88 | 10.68.16.91 | 10.68.16.89 - 10.68.16.90 |

**Kebutuhan total dan ukuran blok VLSM:** Jika hanya dijumlahkan, kebutuhan seluruh subnet adalah **2814 IP**. Secara agregat, `/20` menyediakan 4096 alamat (4094 alamat host yang dapat digunakan), sehingga cukup untuk jumlah tersebut. Namun, VLSM membagi alamat ke subnet-subnet terpisah. Setiap subnet harus mendapat blok berukuran pangkat dua yang cukup untuk kebutuhannya. Berdasarkan prefix pada tabel, jumlah seluruh blok menjadi `2×1024 + 2×512 + 2×256 + 2×128 + 4×64 + 1×32 + 3×8 + 9×4 = 4188` alamat. Jumlah ini melebihi kapasitas `/20`, sehingga seluruh blok pada tabel tidak dapat dimuat ke dalam satu `/20`.

**Dengan ukuran subnet pada tabel saat ini, `/19`** (10.68.0.0–10.68.31.255, 8192 alamat) adalah blok dasar terkecil yang cukup menampung seluruh alokasi. Jadi, `/20` cukup jika melihat total kebutuhan IP saja, sedangkan `/19` diperlukan untuk susunan blok VLSM yang tercantum.

**Kesesuaian prefix tugas:** Soal meminta prefix sesuai alokasi masing-masing praktikan di mastersheet. Karena itu, pastikan hasil `/19` ini cocok dengan prefix yang diberikan untuk kelompok. Jika halaman SPS/mastersheet menetapkan `/20`, perbedaan ini harus dikonfirmasi dan perhitungan atau rancangan subnet disesuaikan sebelum konfigurasi dianggap final.

![Tabel VLSM](images/tabel-vlsm.png)

---

## ⚙️ 4. Implementasi & Konfigurasi Routing

Seluruh konfigurasi disimpan ke dalam file executable di direktori /root/setup.sh pada masing-masing node sesuai regulasi praktikum.

### 4.0. Menjalankan Script pada Setiap Node
File konfigurasi `.sh` harus dijalankan dari console **masing-masing node**. Mengunduh atau menyalin file saja belum menerapkan konfigurasi; jalankan:

```bash
bash /root/setup.sh
```

Gunakan script yang sesuai dengan nama node (router atau host). Perintah unduh pada [daftar-perintah-wget.md](Script%20pernode/daftar-perintah-wget.md) sudah mengunduh file sebagai `/root/setup.sh` lalu langsung menjalankannya. Ulangi langkah tersebut untuk semua node.

Setelah dijalankan, verifikasi alamat dan route pada node dengan:

```bash
ip -br addr
ip route
```

Tes dulu gateway lokal, lalu alamat IP node lain:

```bash
ping -c 3 <IP-gateway>
ping -c 3 <IP-node-tujuan>
```

Jika script belum dijalankan pada host atau router yang diperlukan, alamat IP dan route belum diterapkan sehingga koneksi ke subnet lain dapat gagal. Isi `/etc/resolv.conf` hanya diperlukan untuk menerjemahkan nama domain; DNS kosong tidak menghalangi ping yang menggunakan alamat IP. Konfigurasi yang dijalankan langsung dari terminal mungkin perlu dijalankan kembali setelah node dimulai ulang.

### 4.1. Router Cyberia (Gateway Internet & NAT)
Router Cyberia berfungsi sebagai satu-satunya jembatan antara jaringan The Wired dan dunia luar (NAT1).
* Interface eth0 memperoleh IP otomatis dari NAT1 (192.168.122.157/24).
* Mengaktifkan IP forwarding dan aturan iptables NAT MASQUERADE.
* Menambahkan static route ke seluruh jaringan The Wired (10.68.0.0/19) melalui Router Wired (10.68.16.58).

![Konfigurasi Cyberia](images/config-cyberia.png)

### 4.2. Router Wired (Core Hub)
Router Wired bertindak sebagai pusat percabangan lalu lintas utama.
* Terhubung ke 4 arah: Cyberia (eth0), Navi (eth1), Switch2 (eth2), dan Tachibana (eth3).
* Menggunakan **Default Route** ke arah Cyberia (10.68.16.57) untuk seluruh lalu lintas keluar / internet.
* Memiliki rute spesifik menuju setiap subnet cabang.

![Konfigurasi Wired](images/config-wired.png)

### 4.3. Router Distribusi & Akses (Contoh: Psyche)
Router Psyche melayani subnet A6 (Karl & Lin) dengan alokasi /22.
* Interface eth0 dipasang IP 10.68.0.1/22 sebagai default gateway bagi host Karl dan Lin.
* Interface eth1 (10.68.16.34/29) terhubung ke segmen bersama Switch2.
* Default route diarahkan ke Router Wired (10.68.16.33).

![Konfigurasi Psyche](images/config-psyche.png)

### 4.4. Host / End-Device (Contoh: Lain)
Setiap host dikonfigurasi dengan IP statis dan diarahkan ke default gateway router lokalnya.
* Node Lain berada di Subnet A25 (10.68.15.0/26).
* Interface eth0 menggunakan IP 10.68.15.2/26 dengan default gateway mengarah ke Router Shibuya (10.68.15.1).

![Konfigurasi Lain](images/config-lain.png)

---

## 🧪 5. Pengujian Konektivitas Jaringan (Testing Ping)
Soal mensyaratkan seluruh node pada topologi dapat saling terhubung dan melakukan ping. Bukti berikut mendokumentasikan pengujian lintas subnet antara Karl (`10.68.0.2`) dan Lain (`10.68.15.2`) pada kedua arah.

### Karl ke Lain
Ping berhasil: 4 paket diterima, tanpa packet loss.

![Bukti ping dari Karl ke Lain](images/ping-karl-ke-lain.png)

### Lain ke Karl
Ping berhasil: 3 paket diterima, tanpa packet loss.

![Bukti ping dari Lain ke Karl](images/ping-lain-ke-karl.png)

### Lain ke interface Psyche
Ping dari Lain ke `10.68.0.1` (interface router Psyche di subnet Karl) berhasil: 3 paket diterima, tanpa packet loss. Ini merupakan bukti tambahan bahwa Lain dapat mencapai router pada subnet Karl.

![Bukti ping dari Lain ke Psyche](images/ping-lain-ke-psyche.png)

---

## 📁 6. Struktur Direktori Repository
`	ext
├── images/
│   ├── topologi-gns3.png
│   ├── tabel-vlsm.png
│   ├── config-cyberia.png
│   ├── config-wired.png
│   ├── config-psyche.png
│   └── config-lain.png
├── Script pernode/
│   ├── routers/
│   │   ├── Cyberia.sh
│   │   ├── Wired.sh
│   │   └── ... (13 file router)
│   └── hosts/
│       ├── Karl.sh
│       ├── Lain.sh
│       └── ... (25 file host)
├── daftar-perintah-wget.md
└── README.md
`
