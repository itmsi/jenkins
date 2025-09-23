#!/bin/bash

echo "🔐 Setup Jenkins dengan Keamanan Aktif"
echo "========================================"
echo ""

# Mengambil initial admin password
INITIAL_PASSWORD=$(docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null)

if [ -n "$INITIAL_PASSWORD" ]; then
    echo "✅ Jenkins berhasil dijalankan dengan keamanan aktif!"
    echo ""
    echo "🌐 Akses Jenkins UI: http://localhost:9533"
    echo "🔑 Initial Admin Password: $INITIAL_PASSWORD"
    echo ""
    echo "📋 Langkah-langkah setup:"
    echo ""
    echo "1️⃣ Buka browser dan kunjungi: http://localhost:9533"
    echo ""
    echo "2️⃣ Masukkan Initial Admin Password:"
    echo "   $INITIAL_PASSWORD"
    echo ""
    echo "3️⃣ Install Plugins:"
    echo "   - Pilih 'Install suggested plugins'"
    echo "   - Tunggu proses instalasi selesai"
    echo ""
    echo "4️⃣ Buat Admin User:"
    echo "   - Username: admin"
    echo "   - Password: [buat password yang kuat]"
    echo "   - Full name: Administrator"
    echo "   - Email: admin@localhost"
    echo ""
    echo "5️⃣ Konfigurasi Instance:"
    echo "   - Jenkins URL: http://localhost:9533"
    echo "   - Save and Finish"
    echo ""
    echo "6️⃣ Setup GitHub Integration:"
    echo "   - Jalankan: ./setup-github-credentials.sh"
    echo ""
    echo "🔒 Setelah setup selesai, Jenkins akan meminta login dengan:"
    echo "   Username: admin"
    echo "   Password: [password yang Anda buat]"
    echo ""
    echo "⚠️  JANGAN LUPA: Simpan password admin yang Anda buat!"
else
    echo "❌ Gagal mengambil initial password. Coba jalankan:"
    echo "docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword"
fi

echo ""
echo "📊 Status container:"
docker-compose ps
