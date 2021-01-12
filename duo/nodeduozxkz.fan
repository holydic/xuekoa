主线程被卡
node主线程被卡住范例我们看如下代码：https://zhuanlan.zhihu.com/p/30743785

   var start = Date.now();//获取当前时间戳
    setTimeout(function () {
        console.log(Date.now() - start);
        for (var i = 0; i < 1000000000; i++){//执行长循环
        }
    }, 1000);
    setTimeout(function () {
        console.log(Date.now() - start);
    }, 2000);
node主线程被卡住范例https://zhuanlan.zhihu.com/p/61807318
const http = require('http');
function sleep(time) {    
  const _exit = Date.now() + time * 1000;    
  while( Date.now() < _exit ) {}    
  return ;
}
const server = http.createServer(function(req, res){
    sleep(10);
    res.end('server sleep 10s');
});

server.listen(8080);