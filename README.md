# Dubbo Monitor for Relational Database

## 项目介绍

![Dubbo monitor screenshot](https://github.com/handuyishe/dubbo-monitor/wiki/images/screenshot.png)

Dubbo Monitor是针对Dubbo开发的监控系统，基于dubbo-monitor-simple改进而成，可以理解为其演化版本。该系统用关系型数据库（MySQL）记录日志的方式替代了dubbo-monitor-simple写文件的方式。注：亦可改为其他Relational Database（关系型数据库）。

> PS: 项目目前依赖的是dubbox的2.8.4版本，但是dubbox并没有修改过监控相关的代码，因此理论上也可以支持dubbo的最新版本。

## 升级日志
>### 2015-08-25
>
> 1. 发布Dubbo Monitor for Mongo版本1.0.0，版本分支为mongo。

>### 2015-07-06
>
> 1. 发布Dubbo Monitor for Relational Database版本1.0.0，版本分支为master。

>### 2016-04-12
> 1.添加缺失的依赖包：

```xml
  <!--读取配置文件使用-->
  <dependency>
    <groupId>com.github.subchen</groupId>
	<artifactId>jetbrick-commons</artifactId>
	<version>2.1.1</version>
  </dependency>
  
  <dependency>
	<groupId>org.antlr</groupId>
	<artifactId>antlr4-runtime</artifactId>
	<version>4.3</version>
  </dependency>
 ```
 
 >### 2019-11-22
>
> 1. 汉化版本。

 
>2. 升级pom.xml依赖的dubbo版本：
   从dubbo.version：[2.8.4]升级为[3.0.1]（dubbos的版本）

>### 2016-04-25
> 1. 升级spring版本：
   从spring.version：[3.2.9.RELEASE]升级为[4.2.5.RELEASE]
   
>### 2016-08-25
> 1. 添加对oracle的支持
   包括数据模型和mybatis mapper
   
>### 2016-09-15
> 1. 因为oracle默认情况不会对查询结果进行排序，所以需要显式进行排序（order by）
    mysql默认进行排序。对应的mapper：countDubboInvoke

## Dubbo Monitor使用帮助

### Dubbo-Monitor配置介绍

`第一步`：创建数据库
首先创建名称为monitor数据库，编码格式UTF-8。然后将项目sql文件夹下面的create.sql导入到数据库，生成dubbo_invoke表代表成功导入。

`第二步`：编辑项目中application.properties，配置如下：

```
####Dubbo Settings
dubbo.application.name=dubbo-monitor
dubbo.application.owner=handu.com
dubbo.registry.address=zookeeper://127.0.0.1:2181
dubbo.protocol.port=6060

####Database Settings
db.url=jdbc:mysql://<database_host>:<database_port>/monitor?prepStmtCacheSize=517&cachePrepStmts=true&autoReconnect=true&characterEncoding=utf-8
db.username=root
db.password=root
db.maxActive=500

####System Manager
manager.username=admin
manager.password=admin
```

`第三步`：打包运行项目
执行maven命令：mvn clean package
target文件夹下生成的dubbo-monitor.war即为项目部署文件，将其放置到对应服务器目录下，启动服务器即可。例如：tomcat的webapps文件夹下。

`第四步`：访问项目
启动web服务器后，访问地址：http://IP:[port]/dubbo-moniotor，采用配置文件中manager.username和manager.password设置值进行登录。

## 服务提供端配置

[Dubbo服务提供端监控配置](http://dubbo.apache.org/documentations/3.0/zh-cn/site/user/references/xml/dubbo-monitor/)

## 注意事项
>### 2016-04-25
> 1.  建议采用war包进行启动项目，不要在IDE启动，否则有可能会遇到异常：
    No bean named 'springSecurityFilterChain' is defined
