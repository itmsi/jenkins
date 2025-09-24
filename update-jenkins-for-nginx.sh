#!/bin/bash

echo "🔧 Update Jenkins Configuration untuk Nginx Reverse Proxy"
echo "========================================================="
echo ""

# Function untuk update Jenkins URL
update_jenkins_url() {
    echo "🔧 Mengupdate Jenkins URL ke domain yang benar..."
    
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
    
    echo "📝 Langkah-langkah konfigurasi Jenkins:"
    echo ""
    echo "1️⃣ Buka Jenkins UI: https://bangjeje.motorsights.com"
    echo ""
    echo "2️⃣ Login dengan admin credentials"
    echo ""
    echo "3️⃣ Pergi ke: Manage Jenkins → Configure System"
    echo ""
    echo "4️⃣ Di bagian 'Jenkins Location':"
    echo "   - Jenkins URL: https://bangjeje.motorsights.com"
    echo "   - Save"
    echo ""
    echo "5️⃣ Di bagian 'System Message' (opsional):"
    echo "   - System Message: Jenkins CI/CD Server - Running on bangjeje.motorsights.com"
    echo "   - Save"
    echo ""
    echo "6️⃣ Restart Jenkins untuk memastikan konfigurasi diterapkan:"
    echo "   docker-compose restart"
    echo ""
}

# Function untuk test konfigurasi
test_configuration() {
    echo "🧪 Testing konfigurasi..."
    echo ""
    
    echo "1️⃣ Test akses lokal:"
    if curl -s -I http://localhost:9533 | grep -q "200 OK"; then
        echo "   ✅ Jenkins lokal bisa diakses"
    else
        echo "   ❌ Jenkins lokal tidak bisa diakses"
    fi
    
    echo ""
    echo "2️⃣ Test akses melalui domain:"
    if curl -s -I https://bangjeje.motorsights.com | grep -q "200 OK"; then
        echo "   ✅ Jenkins melalui domain bisa diakses"
    else
        echo "   ❌ Jenkins melalui domain tidak bisa diakses"
    fi
    
    echo ""
    echo "3️⃣ Test WebSocket connection:"
    echo "   - Buka https://bangjeje.motorsights.com"
    echo "   - Cek apakah real-time updates berfungsi"
    echo "   - Cek console browser untuk error WebSocket"
    echo ""
}

# Function untuk memberikan troubleshooting
show_troubleshooting() {
    echo ""
    echo "🔍 Troubleshooting:"
    echo ""
    echo "1️⃣ Jika Jenkins tidak bisa diakses melalui domain:"
    echo "   - Cek nginx status: sudo systemctl status nginx"
    echo "   - Cek nginx config: sudo nginx -t"
    echo "   - Reload nginx: sudo systemctl reload nginx"
    echo ""
    echo "2️⃣ Jika ada error WebSocket:"
    echo "   - Pastikan header Upgrade dan Connection ada di nginx config"
    echo "   - Cek browser console untuk error"
    echo ""
    echo "3️⃣ Jika Jenkins URL masih salah:"
    echo "   - Restart Jenkins: docker-compose restart"
    echo "   - Clear browser cache"
    echo "   - Cek Jenkins logs: docker logs jenkins"
    echo ""
    echo "4️⃣ Jika ada masalah SSL:"
    echo "   - Cek certificate: sudo certbot certificates"
    echo "   - Renew certificate: sudo certbot renew"
    echo ""
}

# Main execution
echo "🔍 Memeriksa status Jenkins..."
if ! docker ps | grep -q jenkins; then
    echo "⚠️  Jenkins tidak berjalan. Memulai Jenkins..."
    docker-compose up -d
    sleep 30
fi

echo "🔧 Mengupdate konfigurasi Jenkins untuk nginx reverse proxy..."

# Update Jenkins URL
update_jenkins_url

# Test configuration
test_configuration

# Troubleshooting info
show_troubleshooting

echo ""
echo "📊 Status container:"
docker-compose ps

echo ""
echo "🌐 Akses Jenkins:"
echo "   - Lokal: http://localhost:9533"
echo "   - Domain: https://bangjeje.motorsights.com"
echo ""
echo "✅ Konfigurasi selesai! Silakan ikuti langkah-langkah di atas untuk menyelesaikan setup."
