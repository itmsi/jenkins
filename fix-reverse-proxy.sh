#!/bin/bash

echo "🔧 Fix Jenkins Reverse Proxy Issue"
echo "==================================="
echo ""

# Function untuk restart Jenkins dengan konfigurasi yang benar
fix_reverse_proxy() {
    echo "🔄 Restarting Jenkins dengan konfigurasi yang diperbaiki..."
    
    # Stop container
    docker-compose down
    
    # Start ulang dengan konfigurasi baru
    docker-compose up -d
    
    echo "⏳ Menunggu Jenkins startup..."
    sleep 30
    
    # Cek status
    if docker ps | grep -q jenkins; then
        echo "✅ Jenkins berhasil di-restart"
        return 0
    else
        echo "❌ Gagal restart Jenkins"
        return 1
    fi
}

# Function untuk mengkonfigurasi Jenkins URL melalui API
configure_jenkins_url() {
    echo "🔧 Mengkonfigurasi Jenkins URL..."
    
    # Tunggu Jenkins siap
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -s http://localhost:9533/login > /dev/null 2>&1; then
            echo "✅ Jenkins sudah siap untuk konfigurasi"
            break
        fi
        
        echo "   Attempt $attempt/$max_attempts - Menunggu Jenkins siap..."
        sleep 10
        ((attempt++))
    done
    
    if [ $attempt -gt $max_attempts ]; then
        echo "❌ Jenkins tidak siap untuk konfigurasi"
        return 1
    fi
    
    echo "📝 Silakan konfigurasi Jenkins URL secara manual:"
    echo ""
    echo "1️⃣ Buka Jenkins UI: http://localhost:9533"
    echo ""
    echo "2️⃣ Login dengan admin credentials"
    echo ""
    echo "3️⃣ Pergi ke: Manage Jenkins → Configure System"
    echo ""
    echo "4️⃣ Di bagian 'Jenkins Location':"
    echo "   - Jenkins URL: http://localhost:9533"
    echo "   - Save"
    echo ""
    echo "5️⃣ Jika masih ada warning, tambahkan di 'System Message':"
    echo "   - System Message: Jenkins is running normally"
    echo ""
}

# Function untuk memberikan troubleshooting steps
show_troubleshooting() {
    echo ""
    echo "🔍 Troubleshooting Steps:"
    echo ""
    echo "1️⃣ Cek apakah Jenkins bisa diakses:"
    echo "   curl -I http://localhost:9533"
    echo ""
    echo "2️⃣ Cek logs Jenkins:"
    echo "   docker logs jenkins | tail -20"
    echo ""
    echo "3️⃣ Cek konfigurasi Jenkins:"
    echo "   docker exec jenkins cat /var/jenkins_home/config.xml | grep -i url"
    echo ""
    echo "4️⃣ Restart Jenkins:"
    echo "   docker-compose restart"
    echo ""
    echo "5️⃣ Jika menggunakan reverse proxy eksternal:"
    echo "   - Pastikan proxy mengarah ke http://localhost:9533"
    echo "   - Tambahkan header X-Forwarded-Proto: http"
    echo "   - Tambahkan header X-Forwarded-Host: [your-domain]"
    echo ""
}

# Main execution
echo "🔍 Memeriksa status Jenkins..."
if ! docker ps | grep -q jenkins; then
    echo "⚠️  Jenkins tidak berjalan. Memulai Jenkins..."
    docker-compose up -d
    sleep 30
fi

echo "🔧 Menerapkan perbaikan reverse proxy..."

# Restart dengan konfigurasi yang diperbaiki
if fix_reverse_proxy; then
    echo ""
    echo "✅ Jenkins berhasil di-restart dengan konfigurasi yang diperbaiki"
    echo ""
    echo "🌐 Akses Jenkins: http://localhost:9533"
    echo ""
    
    # Konfigurasi URL
    configure_jenkins_url
    
    # Troubleshooting info
    show_troubleshooting
    
else
    echo "❌ Gagal memperbaiki konfigurasi Jenkins"
    show_troubleshooting
fi

echo ""
echo "📊 Status container:"
docker-compose ps
