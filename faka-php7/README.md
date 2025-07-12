
定时任务
---
  * * * * * cd /home/wwwroot/faka/ && php think AutoCash
  01 00 * * * cd /home/wwwroot/faka/ && php think UnfreezeMoney >> runtime/log/crontab.log
   
   
```
付款成功后没有领取虚拟卡信
```


服务器环境
---
* 必须使用`PHP7.0`及以上版本，否则功能会出现错误
* 项目运行需支持`PATHINFO`，项目不支持`ThinkPHP`的`URL`兼容模式运行（源于如何优雅的展示）
* `Apache`：已在项目根目录加入`.htaccess`文件，只需开启`rewrite`模块

```xml
<IfModule mod_rewrite.c>
  Options +FollowSymlinks -Multiviews
  RewriteEngine On
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteRule ^(.*)$ index.php/$1 [QSA,PT,L]
</IfModule>
```

* `Nginx`：配置参考下面的`demo`代码

```
server {
	listen 80;
	server_name wealth.demo.cuci.cc;
	root /home/wwwroot/Think.Admin;
	index index.php index.html index.htm;
	
	add_header X-Powered-Host $hostname;
	fastcgi_hide_header X-Powered-By;
	
	if (!-e $request_filename) {
		rewrite  ^/(.+?\.php)/?(.*)$  /$1/$2  last;
		rewrite  ^/(.*)$  /index.php/$1  last;
	}
	
	location ~ \.php($|/){
		fastcgi_index   index.php;
		fastcgi_pass    127.0.0.1:9000;
		include         fastcgi_params;
		set $real_script_name $fastcgi_script_name;
		if ($real_script_name ~ "^(.+?\.php)(/.+)$") {
			set $real_script_name $1;
		}
		fastcgi_split_path_info ^(.+?\.php)(/.*)$;
		fastcgi_param   PATH_INFO               $fastcgi_path_info;
		fastcgi_param   SCRIPT_NAME             $real_script_name;
		fastcgi_param   SCRIPT_FILENAME         $document_root$real_script_name;
		fastcgi_param   PHP_VALUE               open_basedir=$document_root:/tmp/:/proc/;
		access_log      /home/wwwlog/domain_access.log    access;
		error_log       /home/wwwlog/domain_error.log     error;
	}
	
	location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$ {
		access_log  off;
		error_log   off;
		expires     30d;
	}
	
	location ~ .*\.(js|css)?$ {
		access_log   off;
		error_log    off;
		expires      12h;
	}
}
```
