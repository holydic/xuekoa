setTime和setImme区别
setTimeout()和不设置时间间隔的setImmediate()表现上及其相似。猜猜下面这段代码的结果是什么？
setTimeout(() => {
    console.log('timeout');
}, 0);
setImmediate(() => {
    console.log('immediate');
});
实际上，答案是不一定。没错，就连node的开发者都无法准确的判断这两者的顺序谁前谁后。这取决于这段代码的运行环境。运行环境中的各种复杂的情况会导致在同步队列里两个方法的顺序随机决定。但是，在一种情况下可以准确判断两个方法回调的执行顺序，那就是在一个I/O事件的回调中。下面这段代码的顺序永远是固定的：
const fs = require('fs');
fs.readFile(__filename, () => {
    setTimeout(() => {
        console.log('timeout');
    }, 0);
    setImmediate(() => {
        console.log('immediate');
    });
});
答案永远是：
immediate
timeout
因为在I/O事件的回调中，setImmediate方法的回调永远在timer的回调前执行。