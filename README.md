# 微信每日早安推送 简单部署一键启动

下面介绍windows版，且无法安装docker的同学，我们安装jdk1.8来启动。

不过还是推荐 [csdn博客](http://t.csdn.cn/mMfZf) 在**不安装集成开发环境**的情况，使用docker运行，这种方式。


### [Gitee](https://gitee.com/simeitol-sajor/wechat-push) 源码

首先大家需要先注册一个属于自己的 [Gitee](https://gitee.com/signup) 账号。

![](doc/16600600303365.jpg)

登陆之后访问这个 [wechat-push](https://gitee.com/simeitol-sajor/wechat-push) 项目，点击 **star** 这步非常重要！(手动狗头)

![img.png](doc/img.png)

之后点右上角fork到自己的仓库，不需要克隆到本地。

![](doc/16600600806331.jpg)


### API申请

我们需要申请一下开发API所需要的key。

[百度天气API](https://lbsyun.baidu.com/apiconsole/center#/home)
[彩虹屁API](https://www.tianapi.com/apiview/181)

以及最重要的[微信测试账号](https://mp.weixin.qq.com/debug/cgi-bin/sandbox?t=sandbox/login)


### 修改统一配置文件

上面账号申请好之后，到码云访问这个文件路径 `src/main/resources/application.properties`找到配置文件，点击编辑。

![](doc/16600603138459.jpg)

按照上面申请好的填入这个配置文件里，之后点击下面的提交按钮。提交信息随便填。

![](doc/16600603945433.jpg)


**定时发送时间**

如果想修改定时时间，可以访问这个定时任务文件路径 `src/main/java/work/sajor/wechatpush/job/JobWorker.java`

```java 
# 七点三十分触发，可以按照自己情况修改
@Scheduled(cron = "0 30 7 * * ?")
```

### 构建jar


之后我们就进入构建环节了，我们需要点击码云项目上面的流水线。

![](doc/16600606326903.jpg)


点击开通，无法开通的需要[验证手机号](https://gitee.com/profile/account_information)

![](doc/16600606023300.jpg)

默认Java即可，选择创建。

![](doc/16600606735508.jpg)

创建好之后，我们选择master分支，执行流水线

![](doc/16600609605502.jpg)

等待流水线执行完毕之后，我们可以点击发布记录，下载构建好的制品。

![](doc/16600610345796.jpg)


### 启动

我们需要安装jdk1.8，大家可以在 [这里](https://www.aliyundrive.com/s/X7L3atWivrW) 下载，安装包双击安装到本地就不教学了。

可以直接解压之后找到 target/wechat-push-0.0.1-SNAPSHOT.jar，可以直接双击启动

![](doc/16607188075943.jpg)

想看日志，也可以用命令启动。在当前target文件夹，按住shift，点击鼠标右键，选择使用powershell打开。

```java -jar wechat-push-0.0.1-SNAPSHOT.jar```

![](doc/16600611685997.jpg)

启动之后，访问本地 `http://127.0.0.1:9999/push` 就可以收到推送了。

查看启动情况：`netstat -ano | findstr 9999`，如图 10824 是项目的进程id

![](doc/16607190291262.jpg)


终止项目：`taskkill /f /t /im 10824` 这里10824填自己实际的，过一会儿程序终止，网页就无法访问了。

![](doc/16607191102327.jpg)



### 最后

欢迎大家关注我新注册的微信公众号，关注的同学多了，以后我可能拓展出加更有趣的功能。

大家有什么问题也可以在公众号里私信我，我看到都会回复的。

![](doc/qrcode_for_gh_4b2bc81b1b42_258.jpg)