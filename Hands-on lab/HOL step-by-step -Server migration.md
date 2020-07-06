![Microsoft Cloud Workshop](images/ms-cloud-workshop.png)

Server migration  
Hands-on lab  
July 2020

<br />

**Contents**
- [Exercise 1: オンプレミス データベースの移行](#exercise-1-オンプレミス-データベースの移行)
- [Exercise 2: データベース移行後のセキュリティ強化](#exercise-2-データベース移行後のセキュリティ強化)
- [Exercise 3: Web アプリケーションの移行](#exercise-3-web-アプリケーションの移行)
- [Exercise 4: 移行後のアプリケーションの設定](#exercise-4-移行後のアプリケーションの設定)
- [Exercise 5: ストレージへの PDF ファイルのアップロード](#exercise-5-ストレージへの-pdf-ファイルのアップロード)
- [Exercise 6: Azure PaaS サービスへのプライベート接続の実装](#exercise-6-Azure-PaaS-サービスへのプライベート接続の実装)
- [Exercise 7: Web アプリケーションの監視設定](#exercise-7-web-アプリケーションの監視設定)
- [Exercise 8: Web アプリケーションへの認証追加と外部公開](#exercise-8-web-アプリケーションへの認証追加と外部公開)

# **Server migration hands-on lab**

## **要約および学習目標**
このワークショップでは、グループで協力し、クラウド サービスを利用してオンプレミスのアプリケーションとインフラストラクチャを最新化するための設計・実装を行います。
グループでのディスカッションや実装を通して、クラウド サービスを利用してソリューションを構築する能力の向上を目的としています。

## **概要**
Contoso, Ltd. (Contoso) は古くから存在する業界に新規参入した企業です。ニュージーランドのオークランドで 2011 年に設立された Contoso は、十分な保険に入っていない個人を対象としたニッチな市場で広範な長期保険サービスを提供しています。当初の予想よりも早いペースで成長を続けた Contoso では、その成長のスピードに対応することが困難になりつつありました。創業直後の 1 年間だけでも、同社のサービスに対する需要に応えるために 100 人以上の従業員を新規に雇用しました。Contoso は、保険契約と関連ドキュメントを管理するためにカスタム開発された PolicyConnect という ASP.NET で開発された Web アプリケーションを使用しています。PolicyConnect はオンプレミスの SQL Server 2008 R2 データベースをデータストアとして使用し、契約ドキュメントの格納には LAN 上のファイル サーバーが使用されています。契約の管理を目的としたこのアプリケーションとプロセスに対する負荷は限界に近づいています。  
Contoso のアプリケーションをクラウドでホストするための準備の一環として、同社では、既存の SQL Server データベースを Azure 内の PaaS サービスに移行することが計画されています。Contoso は、Azure の完全なマネージド SQL サービスで提供される高度なセキュリティ機能を活用したいと考えています。アプリケーションも運用負荷の軽減や柔軟なスケール等のメリットを享受するため Azure PaaS サービスへの移行を検討していますが、当初はプライベート接続に限定したいと考えています。最終的にアプリケーションは、外部からアクセス可能な状態にする予定ですが、その際に既存の Active Directory のユーザーでアクセスできる必要があります。  
クラウドへの移行により、社内の技術的能力が向上し、クラウドの強化機能やサービスを活用できるようになることが期待されています。

## **ソリューション アーキテクチャ**

## **事前準備**
- **Web アプリケーションの確認**
- **データベースの確認**
- **クライアントの確認**
- **リソース グループの作成**
<br />

# **Exercise 1: オンプレミス データベースの移行**
この実習では、SQL Server データベースを Azure SQL Database へ移行するための方法を検討し、移行を実施します。Microsoft Data Migration Assistant (DMA) を使用することで、SQL Server データベースと Azure SQL Database 間の機能等価性および互換性の問題の詳細を示すレポートが生成できます。DMA では、評価だけでなく、スキーマ、データ、およびオブジェクトをソース サーバーからターゲット サーバーへの移行を行うことができますが、実際の移行方法に関しては、各グループで選択することができます。

## **Task 1**: Azure SQL Database への移行評価の実行
Azure SQL Database にデータを移行する際に対処する必要のある潜在的な問題を識別するためのレポートの作成  
Microsoft Data Migration Assistant (DMA) を使用して、移行対象のデータベースの評価を実行
## **Task 2**: Azure SQL Database へのデータ移行  
オンプレミス データベースから Azure SQL Database へ移行 

<br />

### **参考情報**
- **SQL Server データベースを Azure に移行する**  
<https://docs.microsoft.com/ja-jp/dotnet/azure/migration/sql>
- **Azure Migrate について**  
<https://docs.microsoft.com/ja-jp/azure/migrate/migrate-services-overview>
- **Data Migration Assistant の概要**  
<https://docs.microsoft.com/ja-jp/sql/dma/dma-overview?view=azuresqldb-mi-current>
- **Data Migration Assistant を使用して Azure SQL Database に移行する SQL Server のデータ資産の移行状況を評価する**    
<https://docs.microsoft.com/ja-jp/sql/dma/dma-assess-sql-data-estate-to-sqldb?view=sql-server-ver15>
- **Data Migration Assistant を使用して SQL Server を Azure SQL Database に移行する**  
<https://docs.microsoft.com/ja-jp/sql/dma/dma-migrateonpremsqltosqldb?view=sql-server-2017>
- **DMS を使用して SQL Server を Azure SQL Database に移行する**  
<https://docs.microsoft.com/ja-jp/azure/dms/tutorial-sql-server-to-azure-sql>
- **Azure SQL Database のデータベースに BACPAC ファイルをインポートする**  
<https://docs.microsoft.com/ja-jp/azure/azure-sql/database/database-import?tabs=azure-powershell>
- **Azure SQL Database の作成**  
<https://docs.microsoft.com/ja-jp/azure/azure-sql/database/single-database-create-quickstart?tabs=azure-portal>
- **Azure SQL Database と Azure Synapse の IP ファイアウォール規則**  
<https://docs.microsoft.com/ja-jp/azure/azure-sql/database/firewall-configure>

<br />

# **Exercise 2: データベース移行後のセキュリティ強化**
この実習では、Azure SQL Database のいくつかのセキュリティ機能を確認し、Azure SQL Database を利用する際のセキュリティの利点をレビューします。SQL Database 向け Advanced Data Security (ADS) は、機密データの検出と分類、潜在的なデータベースの脆弱性の検出と緩和、およびデータベースに対する脅威を示す可能性のある異常なアクティビティの検出に関する機能を始めとする高度なセキュリティ機能を提供します。

## **Task 1**: データの検出と分類の構成
Advanced Data Security の SQL データの検出と分類機能を確認  
※データの検出と分類では、データベース内の機密データの検出、分類、ラベル付け、レポート作成を行うツールを提供

## **Task 2**: 脆弱性評価
Advanced Data Security で生成された脆弱性評価レポートをレビュー  
SQL の脆弱性評価サービスにより、セキュリティ状態の可視化、セキュリティ問題を解決しデータベース セキュリティを強化するための手順を提供

## **Task 3**: 動的データマスクの有効化
Azure SQL Database で動的データマスク（DDM）を有効化し、クエリ結果からデータベース内の機密データへのアクセスを制限  
動的データマスクの確認のためのクエリ
```SQL
-- データベース ユーザーの作成
CREATE USER DDMUser WITHOUT LOGIN;
-- テーブルに対する SELECT 権限を付与
GRANT SELECT ON [dbo].[テーブル名] TO DDMUser

-- 作成したユーザーで SELECT 句を実行
EXECUTE AS USER = 'DDMUser';
SELECT * FROM [dbo].[テーブル名];
REVERT;
```

<br />

### **参考情報**
- **Advanced Data Security**  
<https://docs.microsoft.com/ja-jp/azure/azure-sql/database/advanced-data-security>
- **SQL データの検出と分類**  
<https://docs.microsoft.com/ja-jp/sql/relational-databases/security/sql-data-discovery-and-classification?view=sql-server-2017&tabs=t-sql>
- **SQL 脆弱性評価**
<https://docs.microsoft.com/ja-jp/azure/azure-sql/database/sql-vulnerability-assessment>
- **動的データマスク**  
<https://docs.microsoft.com/ja-jp/azure/azure-sql/database/dynamic-data-masking-overview>
- **データベース ユーザーの作成**
<https://docs.microsoft.com/ja-jp/sql/relational-databases/security/authentication-access/create-a-database-user?view=sql-server-ver15>

<br />

# **Exercise 3: Web アプリケーションの移行**
この演習では、ASP.NET で開発されたアプリケーションの Azure への移行を実施します。移行前に App Service Migration Assistant を使用してアプリが移行に適しているかどうかを評価できます。

## **Task 1**: アプリケーションの移行前評価
App Service Migration Assistant ツールを使用して、事前状況チェックとアプリの構成設定の全般的な評価の実行
## **Task 2**: Web Apps へのアプリケーションの移行
移行先となる Web Apps の作成  
アプリケーションの移行

<br />

### **参考情報**
- **.NET Web アプリまたはサービスを Azure App Service に移行する**  
<https://docs.microsoft.com/ja-jp/dotnet/azure/migration/app-service>
- **Azure Migrate について**  
<https://docs.microsoft.com/ja-jp/azure/migrate/migrate-services-overview>
- **Migrate to Azure App Service**  
<https://appmigration.microsoft.com/>
- **ASP.NET アプリケーション用の App Service Migration Assistant の概要**  
<https://azure.microsoft.com/ja-jp/blog/introducing-the-app-service-migration-assistant-for-asp-net-applications/>
- **App Service の概要**  
<https://docs.microsoft.com/ja-jp/azure/app-service/overview>
- **Azure に ASP.NET Framework Web Apps を作成する**  
<https://docs.microsoft.com/ja-jp/azure/app-service/app-service-web-get-started-dotnet-framework>
- **Visual Studio を使用して Azure App Service に Web アプリを発行する**  
<https://docs.microsoft.com/ja-jp/visualstudio/deployment/quickstart-deploy-to-azure?view=vs-2019>
- **FTP/S を使用した Azure App Service へのアプリのデプロイ**  
<https://docs.microsoft.com/ja-jp/azure/app-service/deploy-ftp>
- **Azure App Service のデプロイ資格情報の構成**  
<https://docs.microsoft.com/ja-jp/azure/app-service/deploy-configure-credentials>

<br />

# **Exercise 4: 移行後のアプリケーションの設定**
セキュリティ強化の一環として、アプリケーション構成ファイルでデータベースの接続文字列がプレーン テキストとして表示されないようにシークレットはセキュアな方法で格納します。  
また、需要の変化に合わせてインスタンス数が増減するようにアプリケーションの設定を行います。

## **Task 1**: Key Vault の構成
Key Vault に格納されたシークレットへのアクセスできるよう Web Apps he
マネージド ID を設定  
Key Vault を作成し、データベースへの接続文字列をキー コンテナにシークレットとして追加  
アクセス許可を付与するアクセス ポリシーを生成
## **Task 2**: アプリケーション設定の構成
データベースの接続文字列を Key Vault シークレットの URI を参照するように指定
## **Task 3**: 自動スケールの設定
CPU 負荷が閾値を超えた場合にアプリケーションがスケール アウトするよう構成

<br />

### **参考情報**
- **Azure Key Vault の基本的な概念**  
<https://docs.microsoft.com/ja-jp/azure/key-vault/general/basic-concepts>
- **Azure リソースのマネージド ID とは**  
<https://docs.microsoft.com/ja-jp/azure/active-directory/managed-identities-azure-resources/overview>
- **App Service と Azure Functions でマネージド ID を使用する方法**  
<https://docs.microsoft.com/ja-jp/azure/app-service/overview-managed-identity?tabs=dotnet>
- **マネージド ID で Key Vault の認証を提供する**  
<https://docs.microsoft.com/ja-jp/azure/key-vault/general/managed-identity>
- **Microsoft Azure の自動スケール**  
<https://docs.microsoft.com/ja-jp/azure/azure-monitor/platform/autoscale-overview>
- **Azure での自動スケールの使用**  
<https://docs.microsoft.com/ja-jp/azure/azure-monitor/platform/autoscale-get-started>

<br />

# **Exercise 5: ストレージへの PDF ファイルのアップロード**
アプリケーションから参照する PDF ファイルは、ローカル ネットワーク内に格納されています。PDF ファイルも移行したアプリケーションから参照できるようクラウド上へアップロードする必要があります。この演習では、ファイルを格納するストレージ アカウントの準備と、既存 PDF ファイルのアップロードを行います。

## **Task 1**: ファイルを格納するコンテナーの作成
ストレージ アカウントを作成し、ドキュメントを格納するための Blob コンテナーを作成
## **Task 2**: Blob ストレージへのファイルのアップロード
ファイルを作成した Blob コンテナーにコピー
## **Task 3**: アプリケーション設定の変更
アプリケーションからファイルが参照できるように構成ファイルのパスを変更

<br />

### **参考情報**
- **Azure Storage アカウントの作成**  
<https://docs.microsoft.com/ja-jp/azure/storage/common/storage-account-create?tabs=azure-portal>
- **Shared Access Signatures (SAS) を使用して制限付きアクセスを許可する**  
<https://docs.microsoft.com/ja-jp/azure/storage/common/storage-sas-overview>
- **AzCopy を使ってみる**  
<https://docs.microsoft.com/ja-jp/azure/storage/common/storage-use-azcopy-v10>
- **AzCopy を使用してオンプレミスのデータをクラウド ストレージに移行する**  
<https://docs.microsoft.com/ja-jp/azure/storage/common/storage-use-azcopy-migrate-on-premises-data?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=windows>

<br />

# **Exercise 6: Azure PaaS サービスへのプライベート接続の実装**
アプリケーションの移行先には Azure PaaS サービス（Web Apps, Azure Storage, SQL Database など）を使用しているため、そのままの状態ではインターネットに公開されています。この演習では、Azure PaaS サービスをパブリック インターネットからのアクセスから保護するため、仮想ネットワーク内のプライベート エンドポイント経由でのみアクセスを許可するように変更します。

## **Task 1**: プライベート エンドポイントの構成
プライベート エンドポイント経由で Azure PaaS サービスへアクセスできるように構成
  - Web Apps 
  - SQL Database
  - Azure Storage
  - Key Vault 
## **Task 2**: プライベート DNS ゾーンの構成
プライベート DNS ゾーンの作成  
DNS レコードの登録  
仮想ネットワーク リンクの設定
## **Task 3**: 疎通確認
アプリケーションへのアクセス確認  
    - プライベート ネットワークから  
    - インターネットから


<br />

### **参考情報**
- **Azure Private Link とは**  
<https://docs.microsoft.com/ja-jp/azure/private-link/private-link-overview>
- **Azure Portal を使用してプライベート エンドポイントを作成する**  
<https://docs.microsoft.com/ja-jp/azure/private-link/create-private-endpoint-portal>
- **Azure 仮想ネットワーク内のリソースの名前解決**  
<https://docs.microsoft.com/ja-jp/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances>
- **Azure プライベート エンドポイントの DNS 構成**  
<https://docs.microsoft.com/ja-jp/azure/private-link/private-endpoint-dns>
- **Azure プライベート DNS とは**  
<https://docs.microsoft.com/ja-jp/azure/dns/private-dns-overview>
- **Azure プライベート エンドポイントを使用して非公開で Web Apps に接続する**  
<https://docs.microsoft.com/ja-jp/azure/private-link/create-private-endpoint-webapp-portal>
- **AzureSQL Database と Azure Synapse Analytics の Private Link への対応**  
<https://docs.microsoft.com/ja-jp/azure/azure-sql/database/private-endpoint-overview>
- **Azure プライベート エンドポイントを使用して非公開でストレージ アカウントに接続する**  
<https://docs.microsoft.com/ja-jp/azure/private-link/create-private-endpoint-storage-portal>
- **Key Vault を Azure Private Link と統合する**  
<https://docs.microsoft.com/ja-jp/azure/key-vault/general/private-link-service>
- **仮想ネットワーク ピアリング**  
<https://docs.microsoft.com/ja-jp/azure/virtual-network/virtual-network-peering-overview>
- **仮想ネットワーク ピアリングで仮想ネットワークを接続する**  
<https://docs.microsoft.com/ja-jp/azure/virtual-network/tutorial-connect-virtual-networks-portal>

<br />

# **Exercise 7: Web アプリケーションの監視設定**
この演習では、Application Insights を Web Apps に追加し、アプリケーションに対するリクエストのインサイトを収集します。
演習中に負荷テスト ツールを使用し、動的にスケーリングが開始され、サーバーの割り当て数が増加することも確認します。

## **Task 1**: Application Insights の有効化
Application Insights インスタンスのプロビジョニング  
Live Metrics Stream を使用したリアルタイム監視の開始

## **Task 2**: 負荷テストの実行
k6 のインストール（<https://k6.io/docs/getting-started/installation>）  
JavaScript ファイルの作成

```Javascript
import http from 'k6/http';
import { check, sleep } from 'k6';

export default function() {
  http.get('http://test.k6.io');
  sleep(1);
}
```
※ http://test.k6.io を展開した Web Apps の URL に変更

<br />

負荷テストの実行
```
k6 run --vus 500 --duration 300s script.js
```
- **vus**: 仮想ユーザー数（並列実行数）
- **duration**: テストを実行する時間
- **script.js**: 生成した JavaScript ファイルを指定

<br />

### **参考情報**
- **Application Insights とは何か**  
<https://docs.microsoft.com/ja-jp/azure/azure-monitor/app/app-insights-overview>
- **Application Insights リソースの作成**  
<https://docs.microsoft.com/ja-jp/azure/azure-monitor/app/create-new-resource>
- **ASP.NET Web アプリケーションの監視を開始する**  
<https://docs.microsoft.com/ja-jp/azure/azure-monitor/learn/quick-monitor-portal>
- **Live Metrics Stream**  
<https://docs.microsoft.com/ja-jp/azure/azure-monitor/app/live-stream>
- **k6 の基本的な使用方法**  
<https://k6.io/docs/getting-started/running-k6>

<br />

# **Exercise 8: Web アプリケーションへの認証追加と外部公開**

## **Task 1**: 
## **Task 2**: 

### **参考情報**
- **Application Gateway とは**  
<https://docs.microsoft.com/ja-jp/azure/application-gateway/overview>
- **自動スケーリングとゾーン冗長 Application Gateway v2**  
<https://docs.microsoft.com/ja-jp/azure/application-gateway/application-gateway-autoscaling-zone-redundant>
- **Application Gateway による Web トラフィックのルーティング**  
<https://docs.microsoft.com/ja-jp/azure/application-gateway/quick-create-portal>
- **Application Gateway 上の Web Application Firewall**  
<https://docs.microsoft.com/ja-jp/azure/web-application-firewall/ag/ag-overview>
- **Web Application Firewall のある Application Gateway を作成する**  
<https://docs.microsoft.com/ja-jp/azure/web-application-firewall/ag/application-gateway-web-application-firewall-portal>
- **VPN ゲートウェイとは**  
<https://docs.microsoft.com/ja-jp/azure/vpn-gateway/vpn-gateway-about-vpngateways>
- **ポイント対サイト VPN Gateway 用に OpenVPN を構成する**  
<https://docs.microsoft.com/ja-jp/azure/vpn-gateway/vpn-gateway-howto-openvpn>
- **VPN Gateway 用に OpenVPN クライアントを構成する**  
<https://docs.microsoft.com/ja-jp/azure/vpn-gateway/vpn-gateway-howto-openvpn-clients>
- **P2S OpenVPN プロトコル用に VPN クライアントを構成する**  
<https://docs.microsoft.com/ja-jp/azure/vpn-gateway/openvpn-azure-ad-client>
