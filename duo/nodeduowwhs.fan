webworker耗时计算
webworker范例耗时计算https://www.jianshu.com/p/1887d9b446b2
<!DOCTYPE html>
    <head>
        <title>worker</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script>
            function init(){
                //创建一个Worker对象，并向它传递将在新进程中执行的脚本url
                var worker = new Worker('./webworker.js');
                //接收worker传递过来的数据
                worker.onmessage = function(event){
                    document.getElementById('result').innerHTML+=event.data+"<br/>" ;
                };
            };
        </script>
    </head>
    <body onload = "init()">
        <div id="result"></div>
    </body>
</html>

// webworker.js
var i = 0;
function timedCount(){
    for(var j = 0, sum = 0; j < 100; j++){
        for(var i = 0; i < 100000000; i++){
            sum+=i;
        };
    };
    //将得到的sum发送回主进程
    postMessage(sum);
};
//将执行timedCount前的时间，通过postMessage发送回主进程
postMessage('Before computing, '+new Date());
timedCount();
//结束timedCount后，将结束时间发送回主进程
postMessage('After computing, ' +new Date());