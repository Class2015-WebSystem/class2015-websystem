# Task 12 Security
### 张昕昳 肖奕

> 在开发的博客系统中，我们在三个方面为安全性的保证提供了策略,分别是登陆验证，防止目录遍历以及注入式SQL攻击。

1. 登陆验证
	Web应用使用来自HTTP请求的输入来决定如何进行相应，攻击者可以篡改HTTP请求的任何部分，管理者和开发人员往往希望通过过滤恶意输入来保护自己，但是Web页面中存在多种信息编码方法且容易被绕过，因此必须使用服务器端的检查来对付参数篡改。我们采用登陆检查对用户进行验证，对其进行授权。具体截图如下：
	> 输入错误密码：
	![](https://lh3.googleusercontent.com/-afvm7abmKeg/Vap4zfzLftI/AAAAAAAAAG0/OInxbrpjuCg/w927-h568-no/1.jpg)
	> 验证错误，不能登陆：
	![](https://lh3.googleusercontent.com/-EAionQVYJ0M/Vap4zbetU2I/AAAAAAAAAHA/dq1MrMDDgIE/w927-h568-no/2.jpg)

2. 防止目录遍历
	通过对任意目录添加”../”，或者是在有意义的目录附加“../”,或者是附加“../”的一些变形都可能导致目录遍历。我们的开发的博客系统可以拒接这种目录遍历访问，具体见截图：
	> 找不到网页，拒绝服务
	![](https://lh5.googleusercontent.com/-SM63awoaLTw/Vap4zhORK4I/AAAAAAAAAG4/y5SUlvfYkv8/w927-h568-no/3.jpg)

3. 防止注入式SQL攻击
	注入式攻击包括对操作系统的调用，使用shell命令来调用外部程序以及通过SQL注入来调用后台程序。当Web应用将HTTP请求中的信息作为外部信息的一部分作为转送时，它必须被仔细检查。我们的博客系统对一些必须使用的外部调用的输入数据进行了验证，保证不含任何恶意内容。

