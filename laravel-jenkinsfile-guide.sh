#!/bin/bash

echo "📝 Panduan Jenkinsfile untuk Laravel"
echo "===================================="
echo ""

echo "🎯 CONTOH JENKINSFILE YANG TERSEDIA:"
echo "===================================="
echo ""
echo "1️⃣ Jenkinsfile-laravel-simple"
echo "   - Hanya pull code saja"
echo "   - Menampilkan informasi project"
echo "   - Tidak install dependencies"
echo ""
echo "2️⃣ Jenkinsfile-laravel-with-deps"
echo "   - Pull code + install dependencies"
echo "   - Menampilkan Laravel structure"
echo "   - Cocok untuk project dengan composer.json"
echo ""
echo "3️⃣ Jenkinsfile-laravel-with-test"
echo "   - Pull + install + test + build"
echo "   - Menjalankan Laravel commands
echo "   - Cocok untuk project lengkap"
echo ""
echo "4️⃣ Jenkinsfile-laravel-multibranch"
echo "   - Otomatis detect branch
echo "   - Conditional execution
echo "   - Cocok untuk multibranch pipeline"
echo ""

echo "🚀 CARA MENGGUNAKAN:"
echo "==================="
echo ""
echo "1️⃣ PILIH JENKINSFILE YANG SESUAI:"
echo "   - Untuk project sederhana: Jenkinsfile-laravel-simple"
echo "   - Untuk project dengan dependencies: Jenkinsfile-laravel-with-deps"
echo "   - Untuk project lengkap: Jenkinsfile-laravel-with-test"
echo "   - Untuk multibranch: Jenkinsfile-laravel-multibranch"
echo ""

echo "2️⃣ COPY KE REPOSITORY:"
echo "   - Copy Jenkinsfile ke root repository"
echo "   - Commit dan push ke GitHub"
echo "   - Jenkins akan otomatis detect"
echo ""

echo "3️⃣ SETUP DI JENKINS:"
echo "   - Buat Multibranch Pipeline"
echo "   - Branch Sources: GitHub
echo "   - Credentials: github-token
echo "   - Owner: [GitHub username]
echo "   - Repository: [nama repository]
echo ""

echo "📋 CONTOH COMPOSER.JSON:"
echo "======================="
echo ""
echo "```json"
echo "{"
echo "  \"name\": \"laravel/laravel\","
echo "  \"type\": \"project\","
echo "  \"description\": \"The skeleton application for the Laravel framework.\","
echo "  \"keywords\": [\"laravel\", \"framework\"],"
echo "  \"license\": \"MIT\","
echo "  \"require\": {"
echo "    \"php\": \"^8.1\","
echo "    \"laravel/framework\": \"^10.0\","
echo "    \"laravel/sanctum\": \"^3.2\""
echo "  },"
echo "  \"require-dev\": {"
echo "    \"phpunit/phpunit\": \"^10.0\","
echo "    \"laravel/pint\": \"^1.0\""
echo "  },"
echo "  \"scripts\": {"
echo "    \"test\": \"phpunit\","
echo "    \"build\": \"npm run build\""
echo "  }"
echo "}"
echo "```"
echo ""

echo "🔧 KONFIGURASI JENKINS:"
echo "======================="
echo ""
echo "1️⃣ INSTALL PHP PLUGIN:"
echo "   - Manage Jenkins → Manage Plugins
echo "   - Tab Available → cari 'PHP Plugin'
echo "   - Install dan restart Jenkins
echo ""

echo "2️⃣ KONFIGURASI PHP:"
echo "   - Manage Jenkins → Global Tool Configuration
echo "   - PHP section:"
echo "     • Name: PHP
echo "     • Installation root: /usr/bin/php
echo ""

echo "3️⃣ KONFIGURASI COMPOSER:"
echo "   - Manage Jenkins → Global Tool Configuration
echo "   - Composer section:"
echo "     • Name: Composer
echo "     • Installation root: /usr/local/bin/composer
echo ""

echo "4️⃣ BUAT MULTIBRANCH PIPELINE:"
echo "   - New Item → Multibranch Pipeline
echo "   - Name: [nama project]
echo "   - Branch Sources: GitHub
echo "   - Credentials: github-token
echo "   - Owner: [GitHub username]
echo "   - Repository: [nama repository]
echo ""

echo "🔍 TROUBLESHOOTING:"
echo "==================="
echo ""
echo "❌ Jika PHP tidak terdeteksi:"
echo "   - Cek PHP terinstall di server
echo "   - Cek path di Global Tool Configuration
echo "   - Test dengan command: php --version
echo ""

echo "❌ Jika Composer tidak terdeteksi:"
echo "   - Cek Composer terinstall di server
echo "   - Cek path di Global Tool Configuration
echo "   - Test dengan command: composer --version
echo ""

echo "❌ Jika Laravel tidak terdeteksi:"
echo "   - Cek composer.json ada dan valid
echo "   - Cek Laravel dependencies di composer.json
echo "   - Cek vendor directory ada
echo ""

echo "❌ Jika migration gagal:"
echo "   - Cek database connection
echo "   - Cek .env file configuration
echo "   - Cek database permissions
echo ""

echo "✅ BEST PRACTICES:"
echo "=================="
echo ""
echo "🔒 KEAMANAN:"
echo "   • Jangan commit .env file
echo "   • Gunakan .env.example sebagai template
echo "   • Regular update dependencies
echo "   • Use environment variables untuk sensitive data
echo ""

echo "⚡ PERFORMANCE:"
echo "   • Cache vendor directory jika memungkinkan
echo "   • Gunakan composer --no-dev untuk production
echo "   • Optimize autoloader
echo "   • Use Laravel cache commands
echo ""

echo "🔧 MAINTENANCE:"
echo "   • Regular update Jenkinsfile
echo "   • Monitor build logs
echo "   • Clean up old builds
echo "   • Monitor Laravel logs
echo ""

echo "📚 LARAVEL COMMANDS YANG BERGUNA:"
echo "================================="
echo ""
echo "🔧 Artisan Commands:"
echo "   • php artisan --version"
echo "   • php artisan route:list"
echo "   • php artisan config:show"
echo "   • php artisan migrate"
echo "   • php artisan test"
echo ""
echo "⚡ Cache Commands:"
echo "   • php artisan config:cache"
echo "   • php artisan route:cache"
echo "   • php artisan view:cache"
echo "   • php artisan cache:clear"
echo ""

echo "📚 REFERENSI:"
echo "============="
echo ""
echo "• Jenkins Pipeline:"
echo "  https://www.jenkins.io/doc/book/pipeline/"
echo ""
echo "• PHP Plugin:"
echo "  https://plugins.jenkins.io/php/"
echo ""
echo "• Laravel Documentation:"
echo "  https://laravel.com/docs"
echo ""

echo "🎯 LANGKAH SELANJUTNYA:"
echo "======================="
echo ""
echo "1. Pilih Jenkinsfile yang sesuai
echo "2. Copy ke repository
echo "3. Setup Multibranch Pipeline di Jenkins
echo "4. Test dengan commit ke repository
echo "5. Monitor build results
echo ""

echo "✅ Jenkinsfile siap digunakan!"
echo ""
echo "🌐 Akses Jenkins: https://bangjeje.motorsights.com"
