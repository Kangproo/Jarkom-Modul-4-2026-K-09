# Taste

- Lebih suka `wget` daripada `curl` untuk mengunduh file (misalnya script dari GitHub); jangan menjadikan curl alternatif utama kecuali wget memang tidak tersedia. Confidence: 0.65
- Sebelum memberi diagnosis atau menyuruhnya menjalankan lebih banyak perintah tes, verifikasi dulu fakta dasar dari data yang sudah ada (misalnya hitung cakupan prefix/subnet) — teori spekulatif yang meleset membuatnya frustrasi dan dianggap buang-buang waktu. Confidence: 0.75
- Untuk memperbaiki konfigurasi di node lab GNS3-nya, lebih suka template yang bisa di-paste langsung lewat console node dan tidak bergantung internet (misalnya heredoc `cat > file <<'EOF'`), bukan instruksi yang mengharuskan node mengunduh file dari internet. Confidence: 0.7
