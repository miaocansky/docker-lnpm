#!/bin/sh

SOURCE="$0"
SCRIPTDIR=$(cd $(dirname $0);pwd)
DIR=$(dirname $SCRIPTDIR)

case $1 in
    start)
        docker-compose -f "$DIR/docker-compose.yml" up -d --force-recreate --remove-orphans
    ;;
    restart)
        docker-compose -f "$DIR/docker-compose.yml" restart
    ;;
    stop)
        docker-compose -f "$DIR/docker-compose.yml" down
    ;;
    top)
        docker-compose -f "$DIR/docker-compose.yml" top
    ;;
    *)
        echo "\n请输入指定参数\n"
        echo "Commands:\n"
        echo "    start    startup environment 启动环境\n"
        echo "    restart     closed environment 重启环境\n"
        echo "    stop     stop environment 关闭环境\n"
        echo "    top     show environment 显示运行环境的进程\n"
    ;;
esac

