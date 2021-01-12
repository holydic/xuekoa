eventloop queue
实际上node中存在着一个特殊的队列，即nextTick queue

外部输入数据-->轮询阶段(poll)-->检查阶段(check)-->关闭事件回调阶段(close callback)-->定时器检测阶段(timer)-->I/O事件回调阶段(I/O callbacks)-->闲置阶段(idle, prepare)-->轮询阶段...

nodejs的event loop分为6个阶段，每个阶段的作用如下：
timers：执行setTimeout() 和 setInterval()中到期的callback。
I/O callbacks：上一轮循环中有少数的I/Ocallback会被延迟到这一轮的这一阶段执行
idle, prepare：仅内部使用
poll：最为重要的阶段，执行I/O callback，在适当的条件下会阻塞在这个阶段
check：执行setImmediate的callback
close callbacks：执行close事件的callback，例如socket.on("close",func)
event loop的每一次循环都需要依次经过上述的阶段。 每个阶段都有自己的callback队列，每当进入某个阶段，都会从所属的队列中取出callback来执行，当队列为空或者被执行callback的数量达到系统的最大数量时，进入下一阶段。这六个阶段都执行完毕称为一轮循环。