FROM  redis:6.0.5
#维护者信息
MAINTAINER miaocansky
#时区
ENV TZ Asia/Shanghai
RUN date -R
#容器启动时执行指令
#CMD ["redis-server"]
CMD ["redis-server","/etc/redis/redis.conf"]
#CMD ["sh", "-c", "echo never >/sys/kernel/mm/transparent_hugepage/enabled"]