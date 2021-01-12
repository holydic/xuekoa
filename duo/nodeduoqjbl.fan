单线程全局变量
所以你在编写Node.js代码时，要保持清醒的头脑，任何一个隐藏着的异常被触发后，都会将整个Node.js进程击溃。但是这样的特性也为我们编写代码带来便利，比如同样要实现一个简单的网站访问次数统计，Node.js只需要在内存里定义一个变量var count=0;，每次有用户请求过来执行count++;即可。
但是对于PHP来说就需要使用第三方媒介来存储这个count值了，比如创建一个count.txt文件来保存网站的访问次数。
   var http = require('http');
    var count = 0;
    http.createServer(function (request, response) {
      response.writeHead(200, {'Content-Type': 'text/plain'});
      response.end((++count).toString())
    }).listen(8124);
    console.log('Server running at http://127.0.0.1:8124/');