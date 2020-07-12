# 仮想マシンの作成

3台の仮想マシンを展開
- Web Server（Web-SVR: Windows Server 2012 R2）
- SQL Server（SQL-SVR: SQL Server 2012 SP4 on Windows Server 2012 R2）
- Client（Dev-Client： Visual Studio 2019 on Windows Server 2019）

### **仮想マシンの設定**
展開する仮想ネットワーク、サブネット、管理者名、管理者パスワードは3台とも同じ 
ドメイン参加 
SQL Server は SQL Server 認証を有効化（Username: SqlUser / Password: Password.1!!）、通信は仮想ネットワーク内で有効

### **サーバーの設定**
Internet Explorer セキュリティ強化の構成（IE ESC）の無効化
C ドライブ直下に _setup フォルダを作成  
タイムゾーンを Tokyo Standard Time に設定

### **仮想マシン展開後**
- Web Server
  - _setup フォルダ配下の set-webserver.ps1 を実行（IIS のインストールと Web アプリケーション、PDF ファイルをのダウンロード）
  -  IIS 管理コンソールから Default Web Site 配下の Contoso をアプリケーションに変換
  - C ドライブ直下の Public フォルダ（PDF ファイルが格納）を共有フォルダに設定
- SQL Server
  - _setup フォルダ配下の set-database.ps1 を実行（ContosoInsurance データベースをアタッチ）
- Dev Client
  - _setup フォルダ配下の set-devclient.ps1 を実行（Web アプリケーションのソース コードをダウンロード）

## **パラメーター**
- **vnetResourceGroup**: 仮想マシンを展開する仮想ネットワークのリソース グループ名
- **virtualNetworkId**: 仮想マシンを展開する仮想ネットワーク名
- **subnetName**: 仮想マシンを展開するサブネット名
- **adminUsername**: 管理者
- **adminPassword**: 管理者パスワード

<br />

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhiroyay-ms%2FServer-Migration-Hands-on-Lab%2Fmaster%2FHands-on%2520lab%2Fazure-templates%2F04-virtual-machines%2Fvm-deploy.json)