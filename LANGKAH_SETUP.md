## Jenkins dengan keamanan aktif

### Perubahan
- Keamanan diaktifkan; Jenkins meminta login
- Setup wizard berjalan
- Initial admin password tersedia

### Akses Jenkins
- URL: http://localhost:9533
- Initial Admin Password: `f05eb19aa0a34addbbf09b73abb9e9af`

### Langkah setup
1. Buka http://localhost:9533
2. Masukkan Initial Admin Password: `f05eb19aa0a34addbbf09b73abb9e9af`
3. Install plugins: pilih "Install suggested plugins"
4. Buat admin user:
   - Username: `admin`
   - Password: [buat password yang kuat]
   - Full name: `Administrator`
   - Email: `admin@localhost`
5. Konfigurasi instance:
   - Jenkins URL: `http://localhost:9533`
   - Save and Finish

### Setelah setup
- Login dengan username `admin` dan password yang dibuat
- Jalankan `./setup-github-credentials.sh` untuk integrasi GitHub

### File yang diperbarui
- `setup-secure-jenkins.sh` — script setup dengan keamanan
- `README.md` — dokumentasi diperbarui
- `docker-compose.yml` — konfigurasi keamanan

### Catatan
- Simpan password admin yang dibuat
- Setelah setup, Jenkins meminta login
- Initial admin password hanya digunakan sekali

Buka http://localhost:9533 dan ikuti setup wizard.