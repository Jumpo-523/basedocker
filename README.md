# basedocker
my docker template


- This repository is my docker template.
    - This structure and components are based on "Using Docker" O'rielly sample code.
    - I will replicate the contents as a learning.
    - and extract some source in order to apply them to other my systems.


- docker run 
    - `-d` : background実行

    - `--link`の方法を学ぶ
        - `docker run --rm -it --link myredis:redis redis /bin/bash`のコマンドの意味がわからない。
        - [すでに古い技術らしい](https://docs.docker.jp/engine/userguide/networking/default_network/dockerlinks.html)
        - redis image を元に新しいcontainerを起動するけど、その時、myredisと言うすでに起動したコンテナとリンクしますよ！と言うこと。
    - `--rm`は？
        - dockerコンテナ終了時に自動的に削除してくれるオプション([link](https://qiita.com/hoshino/items/9545d255cc0103b3d296))
    - `-it`は？
        - [optionの説明がたくさん載っていた。](https://scrapbox.io/llminatoll/docker_run%E3%81%AE%E3%82%AA%E3%83%97%E3%82%B7%E3%83%A7%E3%83%B3%E3%81%84%E3%82%8D%E3%81%84%E3%82%8D)




### Volume作成, Mount

1. ボリュームと言う概念
```Dockerfile
 VOLUME ./data 
```
or 
```Linux
docker run -v /data test/webserver
```
