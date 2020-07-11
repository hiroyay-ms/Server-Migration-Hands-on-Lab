# 仮想マシンの作成

3台の仮想マシンを展開
- Web Server（Web-SVR: Windows Server 2012 R2）
- SQL Server（SQL-SVR: SQL Server 2012 SP4 on Windows Server 2012 R2）
- Client（Dev-Client： Visual Studio 2019 on Windows Server 2019）

### **仮想マシンの設定**
  展開する仮想ネットワーク、サブネット、管理者名、管理者パスワードは3台とも同じ 
  ドメイン参加 
  SQL Server は SQL Server 認証を有効化（Username: SqlUser / Password: Password.1!!）、通信は仮想ネットワーク内で有効

## **パラメーター**
- **vnetResourceGroup**: 仮想マシンを展開する仮想ネットワークのリソース グループ名
- **virtualNetworkId**: 仮想マシンを展開する仮想ネットワーク名
- **subnetName**: 仮想マシンを展開するサブネット名
- **adminUsername**: 管理者
- **adminPassword**: 管理者パスワード

<br />

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhiroyay-ms%2FServer-Migration-Hands-on-Lab%2Fhiroyay%2FHands-on%2520lab%2Fazure-templates%2F04-virtual-machines%2Fvm-deploy.json)