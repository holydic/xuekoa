

对于CPU密集型操作，在node中通过 child_process 可以创建独立的子进程，父子进程通过IPC通信，子进程可以是外部应用也可以是node子程序，子进程执行后可以将结果返回给父进程。
child/cluter多核 worker耗时计算 io event
Nodejs通过其内置的cluster模块实现多进程。cluster是对child_process进行了封装，目的是发挥多核服务器的性能；pm2 是当下最热门的带有负载均衡功能的 Node.js 应用进程管理器。
Node.js 通过提供 cluster、child_process API 创建子进程的方式来赋予Node.js “多线程”能力。但是这种创建进程的方式会牺牲共享内存，并且数据通信必须通过json进行传输。（有一定的局限性和性能问题）
基于此 Node.js V10.5.0 提供了 worker_threads，它比 child_process 或 cluster更轻量级。 与child_process 或 cluster 不同，worker_threads 可以共享内存，通过传输 ArrayBuffer 实例或共享 SharedArrayBuffer 实例来实现。

当然便于项目的调试和服务在线运行的稳定，建议使用pm2启动Koa服务。
