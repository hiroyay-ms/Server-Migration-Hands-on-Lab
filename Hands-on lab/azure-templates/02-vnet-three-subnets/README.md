# 仮想ネットワークの作成

仮想ネットワークと Azure Bastion の展開  
仮想ネットワーク内には Azure Bastion 展開用とその他 2 つのサブネットを作成

## **パラメーター**
- **vnetName**: 仮想ネットワーク名
- **vnetAddressPrefix**: 仮想ネットワークの IPv4 アドレス空間
- **bastionSubnetPrefix**: Azure Bastion サブネット アドレス範囲（名前は AzureBastionSubnet で固定)
- **subnet1Prefix**: サブネット アドレス範囲
- **subnet1Name**: サブネットの名前
- **subnet2Prefix**: サブネット アドレス範囲
- **subnet2Name**: サブネットの名前
- **bastionHostName**: Azure Bastion ホスト名

<br />

 [![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fhiroyay-ms%2FServer-Migration-Hands-on-Lab%2Fhiroyay%2FHands-on%2520lab%2Fazure-templates%2F02-vnet-three-subnets%2Fvnet-deploy.json)