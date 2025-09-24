#!/bin/bash

echo "📝 Panduan Jenkinsfile untuk Node.js"
echo "===================================="
echo ""

echo "🎯 CONTOH JENKINSFILE YANG TERSEDIA:"
echo "===================================="
echo ""
echo "1️⃣ Jenkinsfile-nodejs-simple"
echo "   - Hanya pull code saja"
echo "   - Menampilkan informasi project"
echo "   - Tidak install dependencies"
echo ""
echo "2️⃣ Jenkinsfile-nodejs-with-deps"
echo "   - Pull code + install dependencies"
echo "   - Menampilkan package info"
echo "   - Cocok untuk project dengan package.json"
echo ""
echo "3️⃣ Jenkinsfile-nodejs-with-test"
echo "   - Pull + install + test + build"
echo "   - Menjalankan npm scripts
echo "   - Cocok untuk project lengkap"
echo ""
echo "4️⃣ Jenkinsfile-nodejs-multibranch"
echo "   - Otomatis detect branch
echo "   - Conditional execution
echo "   - Cocok untuk multibranch pipeline"
echo ""

echo "🚀 CARA MENGGUNAKAN:"
echo "==================="
echo ""
echo "1️⃣ PILIH JENKINSFILE YANG SESUAI:"
echo "   - Untuk project sederhana: Jenkinsfile-nodejs-simple"
echo "   - Untuk project dengan dependencies: Jenkinsfile-nodejs-with-deps"
echo "   - Untuk project lengkap: Jenkinsfile-nodejs-with-test"
echo "   - Untuk multibranch: Jenkinsfile-nodejs-multibranch"
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

echo "📋 CONTOH PACKAGE.JSON:"
echo "======================="
echo ""
echo "```json"
echo "{"
echo "  \"name\": \"my-nodejs-app\","
echo "  \"version\": \"1.0.0\","
echo "  \"description\": \"My Node.js Application\","
echo "  \"main\": \"index.js\","
echo "  \"scripts\": {"
echo "    \"test\": \"echo \\\"Error: no test specified\\\" && exit 1\","
echo "    \"build\": \"echo \\\"Building...\\\"\","
echo "    \"start\": \"node index.js\""
echo "  },"
echo "  \"dependencies\": {"
echo "    \"express\": \"^4.18.0\""
echo "  }"
echo "}"
echo "```"
echo ""

echo "🔧 KONFIGURASI JENKINS:"
echo "======================="
echo ""
echo "1️⃣ INSTALL NODE.JS PLUGIN:"
echo "   - Manage Jenkins → Manage Plugins
echo "   - Tab Available → cari 'NodeJS Plugin'
echo "   - Install dan restart Jenkins
echo ""

echo "2️⃣ KONFIGURASI NODE.JS:"
echo "   - Manage Jenkins → Global Tool Configuration
echo "   - NodeJS section:"
echo "     • Name: NodeJS
echo "     • Installation root: /usr/bin/node
echo ""

echo "3️⃣ BUAT MULTIBRANCH PIPELINE:"
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
echo "❌ Jika Node.js tidak terdeteksi:"
echo "   - Cek Node.js terinstall di server
echo "   - Cek path di Global Tool Configuration
echo "   - Test dengan command: node --version
echo ""

echo "❌ Jika npm install gagal:"
echo "   - Cek package.json ada dan valid
echo "   - Cek dependencies di package.json
echo "   - Cek network connection
echo ""

echo "❌ Jika pipeline gagal:"
echo "   - Cek Jenkinsfile syntax
echo "   - Cek permissions user
echo "   - Cek repository accessible
echo ""

echo "✅ BEST PRACTICES:"
echo "=================="
echo ""
echo "🔒 KEAMANAN:"
echo "   • Jangan commit sensitive data
echo "   • Gunakan environment variables
echo "   • Regular update dependencies
echo ""

echo "⚡ PERFORMANCE:"
echo "   • Cache node_modules jika memungkinkan
echo "   • Gunakan .npmrc untuk konfigurasi
echo "   • Parallel execution untuk test
echo ""

echo "🔧 MAINTENANCE:"
echo "   • Regular update Jenkinsfile
echo "   • Monitor build logs
echo "   • Clean up old builds
echo ""

echo "📚 REFERENSI:"
echo "============="
echo ""
echo "• Jenkins Pipeline:"
echo "  https://www.jenkins.io/doc/book/pipeline/"
echo ""
echo "• Node.js Plugin:"
echo "  https://plugins.jenkins.io/nodejs/"
echo ""
echo "• npm Documentation:"
echo "  https://docs.npmjs.com/"
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
