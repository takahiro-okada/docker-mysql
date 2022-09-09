# docker-mysql

## 概要
Docker環境を作って、ローカルでMySQLを触れるようにする。

## やること
リポジトリをクローンする  
```
git clone git@github.com:takahiro-okada/docker-mysql.git
````


Dockerの確認
```
❯ docker -v                             
Docker version 20.10.14, build a224086
```


dockerの起動
```
docker compose up -d
```
> オプション:  
  -d, --detach               デタッチド・モード: バックグラウンドでコンテナを実行し、新しいコンテナ名を表示
                              --abort-on-container-exit と同時に使えない
Containers / Images / Volumesが作成される。  


MYSQLにログインする
```sql
❯ docker compose exec db mysql -uroot -p    
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

DBを確認する。`show databases;`を打つ。
```sql
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| movie_list         |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.07 sec)
```

movie_listの利用を開始

```sql
mysql> use movie_list
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A
```

レコードを確認する
```sql
mysql> show tables;
+----------------------+
| Tables_in_movie_list |
+----------------------+
| movies               |
+----------------------+
1 row in set (0.02 sec)
```

テーブルを表示する
```sql
mysql> select * from movies;
+----+--------------------------+--------------+
| id | name                     | director     |
+----+--------------------------+--------------+
|  1 | となりのトトロ           | 宮崎駿       |
|  2 | 耳をすばせば             | 近藤喜文     |
|  3 | おもひでぽろぽろ         | 高畑勲       |
|  4 | かぐや姫の物語           | 高畑勲       |
+----+--------------------------+--------------+
4 rows in set (0.01 sec)
```

レコードを追加する
```sql
mysql> insert into movies (name, director) values ("猫の恩返し", "森田宏幸");
Query OK, 1 row affected (0.05 sec)
```

テーブルを確認
```sql
mysql> select * from movies;
+----+--------------------------+--------------+
| id | name                     | director     |
+----+--------------------------+--------------+
|  1 | となりのトトロ           | 宮崎駿       |
|  2 | 耳をすばせば             | 近藤喜文     |
|  3 | おもひでぽろぽろ         | 高畑勲       |
|  4 | かぐや姫の物語           | 高畑勲       |
|  5 | 猫の恩返し               | 森田宏幸     |
+----+--------------------------+--------------+
5 rows in set (0.01 sec)
```
ログアウトする

```
mysql> exit
Bye
```

起動したDockerコンテナを停止する
```
❯ docker compose down
[+] Running 2/1
 ⠿ Container docker-mysql-hands-on        Removed                            0.8s
 ⠿ Network docker-mysql-hands-on_default  Removed                            0.0s
```

停止できていることを確認する
```
❯ docker ps           
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

## Sequel aceでMySQLを操作する
接続する
![CleanShot 2022-09-09 at 17 10 35](https://user-images.githubusercontent.com/76928095/189303704-b518d88b-c890-47b5-afc5-b2c04bb50784.jpg)

テーブル確認
![CleanShot 2022-09-09 at 17 11 17](https://user-images.githubusercontent.com/76928095/189303809-22987874-f699-478d-98fe-d95d7210ea41.jpg)
