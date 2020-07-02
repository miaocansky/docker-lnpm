# PHP集成运行环境

##环境要求
- 安装了Docker、docker-compose环境
- Windows、Mac环境到Docker官网下载Docker Desktop跟Kitematic
- 设置Docker镜像源为 https://c8it25aj.mirror.aliyuncs.com

##该Docker包含以下环境

- PHP 7.2
- Mysql 8.0.18
- Nginx 1.9
- Redis 6.0.5
- RabbitMQ 3.8.5


##使用方法

- bin/server.sh  start    startup environment 启动环境
- bin/server.sh  restart     closed environment 重启环境
- bin/server.sh  stop     stop environment 关闭环境
- bin/server.sh  top     show environment 显示运行环境的进程


##文件目录
```
.
├── README.md
├── bin
│   └── server.sh  
├── config 配置文件
│   ├── mysql
│   ├── nginx
│   ├── php
│   ├── rabbitmq
│   └── redis
├── data
│   ├── mysql mysql数据
│   ├── rabbitmq 数据
│   ├── redis  数据
│   └── www  项目文件
├── docker-compose.yml
├── dockerfile
│   ├── mysql-8.0.18
│   ├── nginx-1.9-ap
│   ├── php-7.2-fpm
│   ├── rabbitmq-3.8.5-mgt-ap
│   └── redis-6.0.5
└── logs   日志文件
    ├── mysql
    ├── nginx
    ├── php
    ├── rabbitmq
    └── redis
    
```


##注意
- 如果需要修改当前项目的地址可以修改 `docker-compose.yml` 12行和24行的`./data/www`
- 配置文件下的 `nginx/conf.d/`里面 后缀.conf 每一个为站点配置,其中有2个案列 `testtp.conf`（thinkphp5）、`testlaravel.conf`(laravel5.8)
- 配置文件下的 `mysql/my.cnf` 可以用来修改mysql的配置
- 配置文件下的 `php/php.ini` 可以用来修改php的配置
- 配置文件下的 `php/conf.d/` 里面是用来单独设置的php的每一个扩展的配置（细节查看`docker-compose.yml`26行swoole扩展设置）


