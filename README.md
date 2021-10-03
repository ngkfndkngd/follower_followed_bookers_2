# DMM WEBCAMPコンテンツ課題4【Bookers2へ「フォロー/フォロワー機能」を実装】 
DMM WEBCAMPの学習コンテンツを「フォロー/フォロワー機能」を学ぼうの研修課題です。

[中間テーブル'relationshipsテーブル']

[カラム名	]      [データ型]	                    [説明]

id	           （初期カラム）	    主キー (PK) ※マイグレーションファイルには記載不要
follower_id	       integer	      フォローするユーザのid
followed_id	       integer	      フォローされるユーザのid
