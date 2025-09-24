#!/bin/bash

echo "🔐 Setup Jenkins dengan Keamanan Aktif (Fixed Version)"
echo "======================================================"
echo ""

# Function untuk menunggu Jenkins startup
wait_for_jenkins() {
    echo "⏳ Menunggu Jenkins startup..."
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if docker exec jenkins test -f /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null; then
            echo "✅ Jenkins sudah siap!"
            return 0
        fi
        
        echo "   Attempt $attempt/$max_attempts - Jenkins masih startup..."
        sleep 10
        ((attempt++))
    done
    
    echo "❌ Jenkins tidak selesai startup dalam waktu yang ditentukan"
    return 1
}

# Function untuk mengambil initial password dengan retry
get_initial_password() {
    local max_attempts=5
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        echo "🔍 Mencoba mengambil initial password (attempt $attempt/$max_attempts)..."
        
        INITIAL_PASSWORD=$(docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword 2>/dev/null)
        
        if [ -n "$INITIAL_PASSWORD" ] && [ ${#INITIAL_PASSWORD} -gt 10 ]; then
            echo "✅ Initial password berhasil diambil!"
            return 0
        fi
        
        echo "   Password belum tersedia, tunggu sebentar..."
        sleep 5
        ((attempt++))
    done
    
    echo "❌ Gagal mengambil initial password setelah $max_attempts attempts"
    return 1
}

# Cek apakah container berjalan
echo "🔍 Memeriksa status container Jenkins..."
if ! docker ps | grep -q jenkins; then
    echo "⚠️  Container Jenkins tidak berjalan. Memulai container..."
    docker-compose up -d
    
    if [ $? -ne 0 ]; then
        echo "❌ Gagal memulai container Jenkins"
        exit 1
    fi
    
    echo "✅ Container Jenkins berhasil dimulai"
fi

# Tunggu Jenkins startup
if ! wait_for_jenkins; then
    echo ""
    echo "🔧 Troubleshooting steps:"
    echo "1. Cek logs Jenkins: docker logs jenkins"
    echo "2. Restart container: docker-compose restart"
    echo "3. Cek resource system (RAM, disk space)"
    exit 1
fi

# Ambil initial password
if ! get_initial_password; then
    echo ""
    echo "🔧 Manual troubleshooting:"
    echo "1. Cek logs: docker logs jenkins"
    echo "2. Masuk ke container: docker exec -it jenkins bash"
    echo "3. Cek file: ls -la /var/jenkins_home/secrets/"
    echo "4. Restart: docker-compose restart"
    exit 1
fi

# Tampilkan informasi setup
echo ""
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
echo ""
echo "📊 Status container:"
docker-compose ps
