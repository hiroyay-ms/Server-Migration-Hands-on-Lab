![Microsoft Cloud Workshop](images/ms-cloud-workshop.png)  
  
Server migration  
Hands-on lab  
July 2020  
  
<br />  
  
**Contents**  
  
- 環境のセットアップ  
  - Task 1: リソースグループの作成  
  - Task 2: リソースグループへのアクセス権限の付与  
  - Task 3: 仮想ネットワークの作成  
  - Task 4: Azure Active Directory Domain Services の作成  
  - Task 5: Azure Bastion の展開  
  - Task 6: Windows Server 仮想マシンの作成  
  - Task 7: SQL Server 2012 仮想マシンの作成  
  - Task 8: Windows 10 仮想マシンの作成  
  - Task 9: 仮想マシンのドメイン参加  
  - Task 10: Windows Server 2012 R2 への Web サーバー ロールの追加
    - Sub Task 1: IIS への Web アプリケーションの展開  
    - Sub Task 2: 共有フォルダの作成と .pdf ファイルの複製  
  - Task 11: SQL Server データベースの復元  
  - Task 12: Web アプリケーションの動作確認  
  
## **環境のセットアップ**  
  
  
### **Task 1: リソースグループの作成**  
  
1. Web ブラウザーから **Azure ポータル**（<https://portal.azure.com>）を開く  
  
2. **＋リソースの作成**をクリック  
   <img src="images/prep/1-2.png" />  
  
3. 画面上部の検索ボックスに **Resource group** と入力し表示される候補から **Resouce Group** を選択  
   <img src="images/prep/1-3.png" />  
  
4. **作成**をクリック  
   <img src="images/prep/1-4.png" />  
  
5. **基本**タブで次を入力し**確認および作成**をクリック  
   - **リソースグループ名**: 任意 ( このサブスクリプションで一意 ) 
   - **リージョン**: 任意 ( このワークショップで使用する地域 )  
   <img src="images/prep/1-5.png" />  
  
6. **確認および作成**タブで**作成**をクリックし新しいリソースグループを作成  
   <img src="images/prep/1-6.png" />  
  
7. 正常にリソースグループが作成されたことを確認  
   <img src="images/prep/1-7.png" />  
  
  
### **Task 2: リソースグループへのアクセス権限の付与**  
  
1. ホーム画面からリソースグループ一覧を表示   
   <img src="images/prep/2-1.png" />  
  
2. 作成したリソースグループ名をクリック  
   <img src="images/prep/2-2.png" />  
  
3. 左側のブレードから**アクセス制御 (IAM)** をクリック  
   <img src="images/prep/2-3.png" />  
  
4. **カスタム ロールを作成する**の**追加**をクリック  
   <img src="images/prep/2-4.png" />  
  
5. カスタム ロールの作成の**基本**ブレードで次の構成オプションを指定し**次へ**をクリック  
   - **カスタム ロール名**: 任意  
   - **ベースラインのアクセス許可**: **ロールを複製します** を選択  
   - **複製するロール**: **共同作成者** を選択  
   <img src="images/prep/2-5.png" />  
  
6. **アクセス許可**タブで割り当てられている許可/除外権限を確認し**次へ**をクリック  
   <img src="images/prep/2-6.png" />  
  
7. **割り当て可能なスコープ**タブで現在のリソースグループが表示されていることを確認し**確認と作成**をクリック  
   <img src="images/prep/2-7.png" />  
  
8. **作成**をクリック  
   <img src="images/prep/2-8.png" />  
  
9. カスタムロールが正常に作成されたメッセージを確認し **OK** をクリック  
   <img src="images/prep/2-9.png" />  
  
10. リソースグループの**アクセス制御 (IAM)** タブから**ロールの割り当てを追加する**の**追加**をクリック  
   <img src="images/prep/2-10.png" />  
  
11. **ロール割り当ての追加**フォームで以下の選択を行い**保存**をクリック  
    - **役割**: 上記手順で作成したカスタム ロールを選択  
    - **選択**: 権限を付与するユーザーを選択  
   <img src="images/prep/2-11-1.png" />  
      > 作成したカスタム ロールが表示されるまで時間がかかる場合があります。  
  
    Azure AD 外のユーザーを追加する場合はメールアドレスを入力してください。その場合、以下の招待メールが届きます。  
   <img src="images/prep/2-11-2.png" />  
   「**Get Started**」をクリックすることで組織へのアクセス権が付与されます。
  
12. カスタムロールが正常に割り当てられたことを確認  
   <img src="images/prep/2-12.png" />  
  
13. カスタム グループへ追加したユーザーで [Azure ポータル](https://portal.azure.com/)を開き今回作成したリソースグループへアクセス出来ることを確認
  
  
### **Task 3: 仮想ネットワークの作成**  
  
1. ホーム画面から**リソースの作成**をクリック  
   <img src="images/prep/3-1.png" />  
  
2. 検索ボックスに **Virtual Network** と入力し表示される候補から **Virtual Network** を選択  
   <img src="images/prep/3-2.png" />  
  
3. **作成**をクリック  
   <img src="images/prep/3-3.png" />  
  
4. **基本**タブで次の構成を設定し **IP アドレス**をクリック  
   - プロジェクトの詳細  
       - **サブスクリプション**: ワークショップで使用するサブスクリプション  
       - **リソースグループ**: 先の手順で作成したリソースグループ
   - インスタンスの詳細  
       - **仮想マシン名**: CW-2012R2  
       - **地域**:   
       - **可用性オプション**:   
       - **イメージ**:   
       - **Azure スポット インスタンス**:   
       - **サイズ**:   
  
   <img src="images/prep/3-4.png" />  
  
5. **IP アドレス**タブで IP アドレス空間とサブネットを確認し**確認および作成**をクリック  
   <img src="images/prep/3-5.png" />  
  
     > 本ワークショップでは既定の IP アドレス空間 (10.0.0.0/16)、default サブネット (10.0.0.0/24) でまずは作成  
  
6. **確認および作成**タブで**作成**をクリックし新しい仮想ネットワークを作成  
   <img src="images/prep/3-6.png" />  
  
7. 正常に仮想ネットワークが作成されたことを確認  
   <img src="images/prep/3-7.png" />  
  
  
### **Task 4: Azure Active Directory Domain Services の作成**  
Windows Server 仮想マシンで Domain Controller を用意する場合はこのタスクはスキップしてください
  
1. ホーム画面から**リソースの作成**をクリック  
   <img src="images/prep/4-1.png" />  
  
2. 検索ボックスに **Azure AD Domain Services** と入力し表示される候補から **Azure AD Domain Services** を選択  
   <img src="images/prep/4-2.png" />  
  
3. **作成**をクリック  
   <img src="images/prep/4-3.png" />  
  
4. **基本**タブで次の構成を設定し **次へ**をクリック  
   - **サブスクリプション**: ワークショップで使用するサブスクリプション
   - **リソースグループ**: 先の手順で作成したリソースグループ
   - **DNS ドメイン名**: 任意のドメイン名  
   - **地域**: リソースグループと同じリージョンを選択  
   - **SKU**: 今回は Standard を選択
   - **フォレストの種類**: ユーザーを選択
   <img src="images/prep/4-4.png" />  
  
5. **ネットワーク**タブで仮想ネットワークとサブネット選択し**確認および作成**をクリック  
   - **仮想ネットワーク**: 先の手順で作成した仮想ネットワーク
   - **リソースグループ**: 先の手順で作成したリソースサブネット
   <img src="images/prep/4-5.png" />  
  
6. **確認および作成**タブで**作成**をクリックし注意事項も **OK** をクリックし新しい Azure AD Domain Services を作成  
   <img src="images/prep/4-6-1.png" />  
   <img src="images/prep/4-6-2.png" />  
   > Azure AD Domain Services は作成完了まで 30 分ほど時間を要しますので、先に次のタスクを実施して構いません
  
7. 正常に Azure AD Domain Services が作成されたことを確認  
   <img src="images/prep/4-7-1.png" />  
   > 完了直後に作成した Azure AD Doamin Services のリソースを見に行くと以下のメッセージが表示されている場合がありますが、この後のステップで改めて確認をするのでそれまでは特に対応しなくて構いません
   <img src="images/prep/4-7-2.png" />    
  
  
### **Task 5: Azure Bastion の展開**  
  
1. ホーム画面からリソースグループ一覧を表示   
   <img src="images/prep/5-1.png" />  
  
2. 作成したリソースグループ名をクリック  
   <img src="images/prep/5-2.png" />  
  
3. 先の手順で作成した仮想ネットワーク名をクリック  
   <img src="images/prep/5-3.png" />  
  
4. 左側のブレードから**サブネット**をクリックし **+ サブネット**をクリック  
   <img src="images/prep/5-4.png" />  
  
5. Azure Bastion 用のサブネット情報を設定して **OK** をクリック  
   - **名前**: AzureBastionSubnet  
   - **アドレス範囲**: デフォルト値で構いません  
     > アドレス範囲を変更する場合プレフィックスは少なくとも /27 である必要があります
  
     <img src="images/prep/5-5.png" />  
  
6. 正常にサブネットが作成されたことを確認  
   <img src="images/prep/5-6.png" />  
  
7. ホーム画面から**リソースの作成**をクリック  
   <img src="images/prep/5-7.png" />  
  
8. 検索ボックスに **Bastion** と入力し表示される候補から **Bastion** を選択  
   <img src="images/prep/5-8.png" />  
  
9. **作成**をクリック  
   <img src="images/prep/5-9.png" />  
  
10. **基本**タブで次の構成を設定し **確認および作成**をクリック  
    - プロジェクトの詳細  
       - **サブスクリプション**: ワークショップで使用するサブスクリプション  
       - **リソースグループ**: 先の手順で作成したリソースグループ
    - インスタンスの詳細  
        - **名前**: 任意  
        - **地域**: リソースグループと同じリージョンを選択  
    - 仮想ネットワークを構成します  
        - **仮想ネットワーク**: 先の手順で作成した仮想ネットワーク  
        - **リソースグループ**: 先の手順で作成したサブネット  **AzureBastionSubnet**  
    - パブリック IP アドレス  
        - **パブリック IP アドレス**: 新規作成  
        - **パブリック IP アドレス名**: 任意  
  
      <img src="images/prep/5-10.png" />  
  
11. **確認および作成**タブで**作成**をクリック  
   <img src="images/prep/5-11.png" />  
  
12. 正常に Azure Bastion が作成されたことを確認  
   <img src="images/prep/5-12.png" />  
  
  
### **Task 6: Windows Server 仮想マシンの作成**  
ここでは 1 台 or 2 台の Windows Server を作成します。  
  - **必須**: Web-SVR ( Windows Server 2012 R2 )  
  - **オプション**: DC-SVR ( Windows Server 2019 )  
      - Task 4 で Azure AD Domain Services を作成していない場合は、ここで DC サーバーを作成してください  
  
1. ホーム画面からリソースグループ一覧を表示   
   <img src="images/prep/6-1.png" />  
  
2. 作成したリソースグループ名をクリック  
   <img src="images/prep/6-2.png" />  
  
3. 先の手順で作成した仮想ネットワーク名をクリック  
   <img src="images/prep/6-3.png" />  
  
4. 左側のブレードから**サブネット**をクリックし **+ サブネット**をクリック  
   <img src="images/prep/6-4.png" />  
  
5. Azure Bastion 用のサブネット情報を設定して **OK** をクリック  
   - **名前**: WindowsSubnet  
   - **アドレス範囲**: デフォルト値で構いません  
     > アドレス範囲を変更する場合プレフィックスは少なくとも /27 である必要があります
  
     <img src="images/prep/6-5.png" />  
  
6. 正常にサブネットが作成されたことを確認  
   <img src="images/prep/6-6.png" />  
  
7. ホーム画面から**リソースの作成**をクリック  
   <img src="images/prep/6-7.png" />  
  
8. 検索ボックスに **Windows Server** と入力し Enter をクリック  
   <img src="images/prep/6-8.png" />  
  
9. **公開元: 全て**をクリックし **Microsoft** を選択  
   <img src="images/prep/6-9.png" />  
  
10. **Windows Server** をクリック  
    <img src="images/prep/6-10.png" />  
  
11. **ソフトウェア プランの選択**で **Windows Server 2012 R2 Datacenter** を選択し**作成**をクリック  
    <img src="images/prep/6-11.png" />  
    > Domain Contoroler 作成時は Windows Server 2019 を選択してください
  
12. **基本**タブで次の構成を設定し**ディスク**をクリック  
    - プロジェクトの詳細  
       - **サブスクリプション**: ワークショップで使用するサブスクリプション  
       - **リソースグループ**: 先の手順で作成したリソースグループ
    - インスタンスの詳細  
       - **仮想マシン名**: 任意  
       - **地域**: リソースグループと同じリージョンを選択  
       - **可用性オプション**: 可用性ゾーン  
       - **可用性ゾーン**: 1  
       - **イメージ**: Windows Server 2012 R2 Datacenter  
       - **Azure スポット インスタンス**: いいえ
       - **サイズ**: **サイズの選択** をクリックし検索ウインドウ **D2_v3** を選択し**選択**をクリック  
         <img src="images/prep/6-12-1.png" />  
  
      <img src="images/prep/6-12-2.png" />  
    - 管理者アカウント  
       - **ユーザー名**: 任意  
       - **パスワード**: 任意  
    - 受信ポートの規則  
       - **パブリック受信ポート**: なし  
    - お金を節約  
       - **Windows Server ライセンスを既にお持ちの場合**: いいえ  
    <img src="images/prep/6-12-3.png" />  
  
13. **ディスク**タブで次の構成を設定し**ネットワーク**をクリック  
    - ディスクのオプション  
       - **OS ディスクの種類**: Standard SSD  
       - **暗号化の種類**: ( 既定 )
    - データディスク ( ここでの設定は不要です )  
      <img src="images/prep/6-13.png" />  
  
14. **ネットワーク**タブで仮想ネットワークとサブネット選択し**確認および作成**をクリック  
    - **仮想ネットワーク**: 先の手順で作成した仮想ネットワーク  
    - **リソースグループ**: 先の手順で作成したリソースサブネット  
    - **パブリック IP**: なし  
    - **NIC ネットワーク セキュリティ グループ**: **詳細**を選択し**新規作成**をクリック 
      - 任意の**名前**を入力し **OK** をクリック 
    　　<img src="images/prep/6-14-1.png" />  
    - **高速ネットワーク**: オフ  
    - **負荷分散**: いいえ  
     <img src="images/prep/6-14-2.png" />
   
15. **確認および作成**タブで**作成**をクリックし新しい仮想マシンを作成  
    <img src="images/prep/6-15.png" />  
  
16. 正常に仮想マシンが作成されたことを確認  
    <img src="images/prep/6-16.png" />  
  
17. ホーム画面からリソースグループ一覧を表示   
    <img src="images/prep/6-17.png" />  
  
18. 作成したリソースグループ名をクリック  
    <img src="images/prep/6-18.png" />  
  
19. 先の手順で作成した仮想マシン名をクリック  
    <img src="images/prep/6-19.png" />  
  
20. 左側のブレードの**概要**から**接続**をクリックし **Bastion** を選択  
   <img src="images/prep/6-20.png" />  
  
21. 仮想マシン作成時に設定した**ユーザー名**と**パスワード**を入力し**接続**をクリック  
   <img src="images/prep/6-21.png" />  
  
22. Azure Bastion 経由で仮想マシンにログインできたことを確認  
   <img src="images/prep/6-22.png" />  
  
23. コントロールパネルを起動して **Date and Time**, **Language**, **Region** を日本語環境にカスタマイズ  
   - 時刻  
     <img src="images/prep/6-23-1.png" />  
   - 場所 ( 再起動が発生するのでログインし直してください )  
     <img src="images/prep/6-23-2.png" />  
   - 言語    
     <img src="images/prep/6-23-3.png" />  
     <img src="images/prep/6-23-4.png" />  
     <img src="images/prep/6-23-5.png" />  
     <img src="images/prep/6-23-6.png" />  
  
22. 言語パックのインストール完了後改めて Azure Bastion 経由で仮想マシンにログインし日本語化されたことを確認  
   <img src="images/prep/6-24.png" />  
  
Domain Contoroler を作成する必要がある場合は続けて作成してください  
  
### **Task 7: SQL Server 2012 仮想マシンの作成**  
  
  
### **Task 8: Windows 10 仮想マシンの作成**  
  
1. ホーム画面から**リソースの作成**をクリック  
    <img src="images/prep/8-1.png" />  
  
2. 検索ボックスに **Windows 10** と入力しと入力し表示される候補から **Microsoft Windows 10** を選択  
    <img src="images/prep/8-2.png" />  
  
3. **ソフトウェア プランの選択**で **Windows 10 Pro, Version 2004** を選択し**作成**をクリック  
    <img src="images/prep/8-3.png" />  
  
4. **基本**タブで次の構成を設定し**ディスク**をクリック  
    - プロジェクトの詳細  
       - **サブスクリプション**: ワークショップで使用するサブスクリプション  
       - **リソースグループ**: 先の手順で作成したリソースグループ
    - インスタンスの詳細  
       - **仮想マシン名**: 任意  
       - **地域**: リソースグループと同じリージョンを選択  
       - **可用性オプション**: 可用性ゾーン  
       - **可用性ゾーン**: 1  
       - **イメージ**: Windows Server 2012 R2 Datacenter  
       - **Azure スポット インスタンス**: いいえ
       - **サイズ**: D2_v3  
       <img src="images/prep/8-4-1.png" />  
    - 管理者アカウント  
       - **ユーザー名**: 任意  
       - **パスワード**: 任意  
    - 受信ポートの規則  
       - **パブリック受信ポート**: なし  
    - お金を節約  
       - **Windows Server ライセンスを既にお持ちの場合**: いいえ  
       <img src="images/prep/8-4-2.png" />  
  
5. **ディスク**タブで次の構成を設定し**ネットワーク**をクリック  
    - ディスクのオプション  
       - **OS ディスクの種類**: Standard SSD  
       - **暗号化の種類**: ( 既定 )
    - データディスク ( ここでの設定は不要です )  
       <img src="images/prep/8-5.png" />  
  
6. **ネットワーク**タブで仮想ネットワークとサブネット選択し**確認および作成**をクリック  
    - **仮想ネットワーク**: 先の手順で作成した仮想ネットワーク  
    - **リソースグループ**: 先の手順で作成したリソースサブネット  
    - **パブリック IP**: なし  
    - **NIC ネットワーク セキュリティ グループ**: **なし** 
    - **高速ネットワーク**: オフ  
    - **負荷分散**: いいえ  
       <img src="images/prep/8-6.png" />
   
7. **確認および作成**タブで**作成**をクリックし新しい仮想マシンを作成  
    <img src="images/prep/8-7.png" />  
  
8. 正常に仮想マシンが作成されたことを確認  
    <img src="images/prep/8-8.png" />  
  
9. ホーム画面からリソースグループ一覧を表示   
    <img src="images/prep/8-9.png" />  
  
10. 作成したリソースグループ名をクリック  
    <img src="images/prep/8-10.png" />  
  
11. 先の手順で作成した仮想マシン名をクリック  
    <img src="images/prep/8-11.png" />  
  
12. 左側のブレードの**概要**から**接続**をクリックし **Bastion** を選択  
   <img src="images/prep/8-12.png" />  
  
13. 仮想マシン作成時に設定した**ユーザー名**と**パスワード**を入力し**接続**をクリック  
   <img src="images/prep/8-13.png" />  
  
14. Azure Bastion 経由で仮想マシンにログインできたことを確認  
   <img src="images/prep/8-14.png" />  
  
15. Settings を起動して **Date&Time**, **Language** を日本語環境にカスタマイズし完了後サインアウト  
   - 時刻  
     <img src="images/prep/8-15-1.png" />  
   - 言語    
     <img src="images/prep/8-15-2.png" />  
     <img src="images/prep/8-15-3.png" />  
     <img src="images/prep/8-15-4.png" />  
     <img src="images/prep/8-15-5.png" />  
     <img src="images/prep/8-15-6.png" />  
  
16. 言語パックのインストール完了後改めて Azure Bastion 経由で仮想マシンにログインし日本語化されたことを確認  
   <img src="images/prep/8-16.png" />  
  
  
### **Task 9: 仮想マシンのドメイン参加 **  
  
1. ホーム画面から **Azure Active Directory** をクリック   
   <img src="images/prep/9-1.png" />  
  
2. 左側のブレードの**管理**から**ユーザー**をクリック  
   <img src="images/prep/9-2.png" />  
  
3. **新しいユーザー**をクリック  
   <img src="images/prep/9-3.png" />  
  
4. **ユーザーの作成**で以下の情報を入力し**作成**をクリック  
   - **ID**  
       - **ユーザー名**: 任意  
       - **名前**: 任意  
   - **パスワード**  
       - **自分でパスワードを作成する**  
       - **初期パスワード**: 任意  
       <img src="images/prep/9-4-1.png" />  
   - **グループとロール**  
       - **グループ**: **0 個のグループが選択されました**をクリック 
           - **AAD DC Administorators** を選択し**選択**をクリックし元の設定画面のメッセージが **1 個のグループが選択されました**となっていることを確認
       - **役割**: ユーザー  
       <img src="images/prep/9-4-2.png" />  
  
5. ユーザーが正常に作成されたことを確認  
   <img src="images/prep/9-5.png" />  
  
6. ホーム画面からリソースグループ一覧を表示  
   <img src="images/prep/9-6.png" />  
  
7. 作成したリソースグループ名をクリック  
   <img src="images/prep/9-7.png" />  
  
8. 先の手順で作成した Azure AD Domain Services 名をクリック   
   <img src="images/prep/9-8.png" />  
  
9. 左側のブレードの**設定**から**正常性**をクリックし **Azure AD との同期**で表示されている時刻が先ほどユーザーを作成した時刻より後になっていることを確認  
   <img src="images/prep/9-9.png" />  
  
10. 左側のブレードの**設定**から**プロパティ**をクリックし**仮想ネットワーク上の IP アドレス**を確認  
   <img src="images/prep/9-10.png" />  
  
11. ホーム画面からリソースグループ一覧を表示  
    <img src="images/prep/9-11.png" />  
  
12. 作成したリソースグループ名をクリック  
    <img src="images/prep/9-12.png" />  
  
13. 先の手順で作成した仮想ネットワーク名をクリック  
    <img src="images/prep/9-13.png" />  
  
14. 左側のブレードの**設定**から **DNS サーバ**をクリックし以下の項目を設定し**保存**をクリック  
    - **DNS サーバー**: カスタム  
    - **DNS サーバの追加**: 先の手順で確認した IP アドレスを入力  
   <img src="images/prep/9-14.png" />  
  
15. ホーム画面からリソースグループ一覧を表示  
    <img src="images/prep/9-15.png" />  
  
16. 作成したリソースグループ名をクリック  
    <img src="images/prep/9-16.png" />  
  
17. 先の手順で作成した仮想マシン名をクリック  
    <img src="images/prep/9-17.png" />  
  
18. 左側のブレードの**概要**から**再起動**をクリックし再び**状態**が**実行中**となるまで待つ    
    <img src="images/prep/9-18.png" />  
  
19. 左側のブレードの**概要**から**接続**をクリックし **Bastion** を選択  
    <img src="images/prep/9-19.png" />  
  
20. 仮想マシン作成時に設定した**ユーザー名**と**パスワード**を入力し**接続**をクリック  
    <img src="images/prep/9-20.png" />  
  
21. Azure Bastion 経由で仮想マシンにログインできたことを確認  
    <img src="images/prep/9-21.png" />  
  
22. ログインした仮想マシンから Azure AD Domain Services で構成したドメインに参加  
    <img src="images/prep/9-22-1.png" />  
    > ドメイン参加時にユーザー、パスワード情報に関するエラーが発生する場合があります。  
    その場合、Azure AD のユーザー管理画面からパスワードリセットを行ってください。  
   <img src="images/prep/9-22-2.png" />  
    その上で新たに発行された一時パスワードを用いて [Office365](https://www.office.com/?omkt=ja-jp) にログインしてパスワード変更を行ってください。  
   <img src="images/prep/9-22-3.png" />  
   <img src="images/prep/9-22-4.png" />  
  
23. ドメインに正常に参加できたことを確認しサーバの再起動を実行  
    <img src="images/prep/9-23.png" />  
  
24. 改めてサーバーにログインしドメインに参加出来ていることを確認  
    <img src="images/prep/9-24.png" />  
  
25. **9-17** 以降のステップを SQL Server, Windows 10 それぞれでも実行  
    
 
 
