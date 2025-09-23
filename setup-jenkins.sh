#!/bin/bash

echo "🚀 Memulai setup Jenkins dengan Docker..."

# Membuat direktori untuk Jenkins volume jika belum ada
mkdir -p jenkins-data

# Menghentikan container Jenkins jika sudah berjalan
echo "🛑 Menghentikan container Jenkins yang sudah berjalan..."
docker-compose down

# Menghapus container dan volume lama jika ada
echo "🧹 Membersihkan container dan volume lama..."
docker rm -f jenkins 2>/dev/null || true
docker volume rm jenkins_jenkins_home 2>/dev/null || true

# Menjalankan Jenkins
echo "🐳 Menjalankan Jenkins container..."
docker-compose up -d

# Menunggu Jenkins siap
echo "⏳ Menunggu Jenkins siap..."
sleep 30

# Mengambil initial admin password
echo "🔑 Mengambil initial admin password..."
INITIAL_PASSWORD=$(docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null)

if [ -n "$INITIAL_PASSWORD" ]; then
    echo "✅ Jenkins berhasil dijalankan!"
    echo "🌐 Jenkins UI tersedia di: http://localhost:9533"
    echo "🔑 Initial Admin Password: $INITIAL_PASSWORD"
    echo ""
    echo "📋 Langkah selanjutnya:"
    echo "1. Buka http://localhost:9533 di browser"
    echo "2. Masukkan password: $INITIAL_PASSWORD"
    echo "3. Install suggested plugins"
    echo "4. Buat admin user"
    echo "5. Konfigurasi GitHub integration"
else
    echo "❌ Gagal mengambil initial password. Coba jalankan:"
    echo "docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword"
fi

echo ""
echo "📊 Status container:"
docker-compose ps
