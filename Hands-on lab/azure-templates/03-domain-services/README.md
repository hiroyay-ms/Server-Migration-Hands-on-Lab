# Azure Active Directory Domain Services の作成

## パラメーター
- 仮想マシン
  - vnetResourceGroup: 仮想マシンを展開する仮想ネットワークが存在するリソース グループ名
  - virtualNetworkId: 仮想マシンを展開する仮想ネットワーク名
  - subnetName: 仮想マシンを展開するサブネット名
  - adminUsername: 管理者
  - adminPassword: 管理者のパスワード

### **サーバーの設定**
Internet Explorer セキュリティ強化の構成（IE ESC）の無効化  
Active Directory Domain Services ロールの追加（ドメイン コントローラーへの昇格は手動で実行）

<br />

### Azure Active Directory Domain Services の展開
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhiroyay-ms%2FServer-Migration-Hands-on-Lab%2Fhiroyay%2FHands-on%2520lab%2Fazure-templates%2F03-domain-services%2Fds-deploy.json)

### 仮想マシンでドメイン コントローラーを展開
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhiroyay-ms%2FServer-Migration-Hands-on-Lab%2Fhiroyay%2FHands-on%2520lab%2Fazure-templates%2F03-domain-services%2Fdc-deploy.json)