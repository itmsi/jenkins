# 🚀 Jenkins Docker Setup dengan GitHub Integration

## 📋 Status Setup
✅ **Jenkins Container**: Berjalan di port 9533 (UI) dan 9534 (Agent)  
✅ **Docker Compose**: Terkonfigurasi dengan benar  
✅ **Security**: Aktif dengan setup wizard  
✅ **GitHub Credentials**: Siap untuk diintegrasikan  

## 🌐 Akses Jenkins
- **Jenkins UI**: http://localhost:9533
- **Jenkins Agent**: Port 9534
- **Status**: Jenkins berjalan dengan keamanan aktif
- **Initial Admin Password**: `f05eb19aa0a34addbbf09b73abb9e9af`

## 🔧 Informasi GitHub
- **Username**: abudlfalaq5@gmail.com
- **Token**: [Lihat file .env untuk credentials]

## 📁 File yang Tersedia
- `docker-compose.yml` - Konfigurasi Docker Compose
- `setup-jenkins.sh` - Script untuk menjalankan Jenkins
- `setup-github-credentials.sh` - Panduan setup GitHub integration
- `github-integration-guide.md` - Panduan lengkap GitHub integration

## 🚀 Quick Start

### 1. Menjalankan Jenkins dengan Keamanan
```bash
# Menggunakan script otomatis dengan keamanan
./setup-secure-jenkins.sh

# Atau manual
docker-compose up -d
```

### 2. Setup GitHub Integration
```bash
# Menjalankan panduan setup
./setup-github-credentials.sh
```

### 3. Akses Jenkins UI
Buka browser dan kunjungi: http://localhost:9533

## 🔗 Langkah Setup GitHub Integration

### Step 1: Install GitHub Plugins
1. Buka Jenkins UI → **Manage Jenkins** → **Manage Plugins**
2. Tab **Available** → Install:
   - GitHub Integration
   - GitHub Authentication
   - GitHub Branch Source
   - Pipeline: GitHub
   - GitHub API

### Step 2: Setup Credentials
1. **Manage Jenkins** → **Manage Credentials**
2. **System** → **Global credentials** → **Add Credentials**
3. Konfigurasi:
   - **Kind**: Secret text
   - **Secret**: `[GitHub Token dari file .env]`
   - **ID**: `github-token`
   - **Description**: GitHub Personal Access Token

### Step 3: Konfigurasi GitHub Server
1. **Manage Jenkins** → **Configure System**
2. **GitHub** section → **Add GitHub Server**
3. Konfigurasi:
   - **Name**: GitHub
   - **API URL**: https://api.github.com
   - **Credentials**: github-token
   - **Test connection**

### Step 4: Setup Webhook
1. Di repository GitHub: **Settings** → **Webhooks** → **Add webhook**
2. Konfigurasi:
   - **Payload URL**: `http://[JENKINS_SERVER]:9533/github-webhook/`
   - **Content type**: application/json
   - **Events**: Just the push event

## 🏗️ Membuat Pipeline Job

### Multibranch Pipeline
1. **New Item** → **Multibranch Pipeline**
2. **Branch Sources**: GitHub
3. **Credentials**: github-token
4. **Owner**: [GitHub username]
5. **Repository**: [Repository name]

### Jenkinsfile Example
```groovy
pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building application...'
                // Tambahkan command build sesuai project
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                // Tambahkan command test
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed!'
        }
    }
}
```

## 🛠️ Useful Commands

```bash
# Cek status container
docker-compose ps

# Cek logs Jenkins
docker logs jenkins

# Restart Jenkins
docker-compose restart

# Stop Jenkins
docker-compose down

# Masuk ke container
docker exec -it jenkins bash
```

## 🔍 Troubleshooting

### Jenkins tidak bisa diakses
- Pastikan port 9533 tidak digunakan aplikasi lain
- Cek firewall settings
- Verifikasi container berjalan: `docker-compose ps`

### GitHub integration gagal
- Pastikan token memiliki permission yang benar
- Cek expiry date token
- Verifikasi webhook URL

### Build pipeline gagal
- Cek Jenkinsfile syntax
- Pastikan tools yang diperlukan terinstall
- Review build logs

## 📚 Next Steps
1. Setup security dengan proper user management
2. Configure build agents untuk parallel builds
3. Setup notification (email, Slack, dll)
4. Implement CI/CD best practices
5. Monitor dan optimize performance

---

**Happy Building! 🚀**
