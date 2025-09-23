# 🚀 Panduan Setup Jenkins dengan GitHub Integration

## 📋 Prerequisites
- Docker dan Docker Compose terinstall
- Akun GitHub
- Repository GitHub yang akan diintegrasikan

## 🐳 Step 1: Menjalankan Jenkins

### Opsi 1: Menggunakan Script Otomatis
```bash
./setup-jenkins.sh
```

### Opsi 2: Manual
```bash
# Menjalankan Jenkins
docker-compose up -d

# Mengecek status
docker-compose ps

# Mengambil initial password
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

## 🔧 Step 2: Setup Awal Jenkins

1. **Akses Jenkins UI**
   - Buka browser dan kunjungi: `http://localhost:9533`
   - Masukkan initial admin password yang didapat dari command di atas

2. **Install Plugins**
   - Pilih "Install suggested plugins"
   - Tunggu proses instalasi selesai

3. **Buat Admin User**
   - Isi form untuk membuat user admin
   - Simpan konfigurasi

## 🔗 Step 3: Setup GitHub Integration

### 3.1 Install GitHub Plugin
1. Masuk ke **Manage Jenkins** → **Manage Plugins**
2. Di tab **Available**, cari dan install:
   - `GitHub Integration`
   - `GitHub Authentication`
   - `GitHub Branch Source`
   - `Pipeline: GitHub`
   - `GitHub API`
3. Restart Jenkins setelah instalasi

### 3.2 Konfigurasi GitHub Credentials

#### Opsi A: Personal Access Token (Recommended)
1. **Buat GitHub Personal Access Token:**
   - GitHub → Settings → Developer settings → Personal access tokens
   - Generate new token dengan scope:
     - `repo` (Full control of private repositories)
     - `admin:repo_hook` (Full control of repository hooks)
     - `read:org` (Read org and team membership)

2. **Tambah Credentials di Jenkins:**
   - **Manage Jenkins** → **Manage Credentials**
   - **System** → **Global credentials** → **Add Credentials**
   - Kind: `Secret text`
   - Secret: `[GitHub Personal Access Token]`
   - ID: `github-token`
   - Description: `GitHub Personal Access Token`

#### Opsi B: Username/Password
1. **Manage Jenkins** → **Manage Credentials**
2. **System** → **Global credentials** → **Add Credentials**
3. Kind: `Username with password`
4. Username: `[GitHub Username]`
5. Password: `[GitHub Password]`
6. ID: `github-credentials`

### 3.3 Konfigurasi GitHub Server
1. **Manage Jenkins** → **Configure System**
2. Scroll ke bagian **GitHub**
3. Klik **Add GitHub Server**
4. Name: `GitHub`
5. API URL: `https://api.github.com`
6. Credentials: Pilih credentials yang sudah dibuat
7. Test connection
8. **Save**

## 🏗️ Step 4: Membuat Pipeline Job

### 4.1 Membuat Jenkinsfile di Repository
Buat file `Jenkinsfile` di root repository GitHub Anda:

```groovy
pipeline {
    agent any
    
    tools {
        // Sesuaikan dengan tools yang tersedia
        maven 'Maven-3.8.6'
        jdk 'JDK-11'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building application...'
                // Tambahkan command build sesuai project Anda
                // sh 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running tests...'
                // sh 'mvn test'
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // Tambahkan command deploy
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
```

### 4.2 Membuat Multibranch Pipeline
1. **New Item** → **Multibranch Pipeline**
2. Branch Sources: **GitHub**
3. Credentials: Pilih credentials GitHub
4. Owner: `[GitHub Username atau Organization]`
5. Repository: `[Repository Name]`
6. **Save**

## 🔄 Step 5: Webhook Configuration

### 5.1 Setup GitHub Webhook
1. Buka repository GitHub
2. **Settings** → **Webhooks** → **Add webhook**
3. Payload URL: `http://[JENKINS_SERVER]:9533/github-webhook/`
4. Content type: `application/json`
5. Events: Pilih `Just the push event`
6. **Add webhook**

### 5.2 Konfigurasi Jenkins untuk Webhook
1. **Manage Jenkins** → **Configure System**
2. Di bagian **GitHub**, centang **Override Hook URL**
3. Hook URL: `http://[JENKINS_SERVER]:9533/github-webhook/`
4. **Save**

## 🧪 Step 6: Testing Integration

1. **Commit perubahan** ke repository GitHub
2. **Push** ke branch yang dimonitor Jenkins
3. **Cek Jenkins** untuk melihat pipeline berjalan otomatis
4. **Monitor logs** untuk memastikan semuanya berjalan dengan baik

## 🛠️ Troubleshooting

### Common Issues:

1. **Webhook tidak terpanggil:**
   - Pastikan Jenkins dapat diakses dari internet
   - Cek firewall dan port forwarding
   - Verifikasi URL webhook

2. **Credentials error:**
   - Pastikan token memiliki permission yang benar
   - Cek expiry date token
   - Verifikasi username/password

3. **Build gagal:**
   - Cek Jenkinsfile syntax
   - Pastikan tools yang diperlukan terinstall
   - Review build logs

## 📚 Useful Commands

```bash
# Cek logs Jenkins
docker logs jenkins

# Restart Jenkins
docker-compose restart

# Masuk ke container Jenkins
docker exec -it jenkins bash

# Backup Jenkins data
docker run --rm -v jenkins_jenkins_home:/data -v $(pwd):/backup alpine tar czf /backup/jenkins-backup.tar.gz -C /data .

# Restore Jenkins data
docker run --rm -v jenkins_jenkins_home:/data -v $(pwd):/backup alpine tar xzf /backup/jenkins-backup.tar.gz -C /data
```

## 🎯 Next Steps

1. **Setup notification** (email, Slack, dll)
2. **Configure build agents** untuk parallel builds
3. **Setup security** dengan proper user management
4. **Implement CI/CD best practices**
5. **Monitor dan optimize** performance

---

**Happy Building! 🚀**
