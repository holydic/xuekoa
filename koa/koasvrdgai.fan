服务大概写法
const koa = require('koa');
const app = new koa();
app.use(async (ctx, next)=>{
    ctx.response.body = {
        url: ctx.request.url,     //获取请求的URL
        query: ctx.request.query,    //获取get请求的解析数据
        querystring: ctx.request.querystring    //获取原始get请求的字符串
    }
})

if (ctx.request.accepts('json')) {
    ctx.response.type = 'json';
    ctx.response.body = { data: 'Hello World' };
ctx.response.body = fs.createReadStream('./demos/template.html');

ctx.req=ctx.request,ctx.res=ctx.response，类似linux系统中的软连接？最终执行还是request和response对象
ctx.body = ctx.res.body = ctx.response.body

const Koa = require('koa');
const app = new Koa();
const main = ctx => {
  ctx.response.type = 'html';
  ctx.response.body = 'Hello World';
  if (ctx.request.path !== '/') {通过ctx.request.path可以获取用户请求的路径，由此实现简单的路由
};
app.use(route.get('/about', about));
使用封装好的koa-route模块
app.use(main);
app.listen(3000);

如果网站提供静态资源（图片、字体、样式表、脚本......），为它们一个个写路由就很麻烦，也没必要。koa-static模块封装了这部分的请求。请看下面的例子（完整代码看这里）。 https://github.com/ruanyf/koa-demos/blob/master/demos/12.js
有些场合，服务器需要重定向（redirect）访问请求。比如，用户登陆以后，将他重定向到登陆前的页面。ctx.response.redirect()方法可以发出一个302跳转，将用户导向另一个路由。请看下面的例子（完整代码看这里）。 https://github.com/ruanyf/koa-demos/blob/master/demos/13.js
如果有异步操作（比如读取数据库），中间件就必须写成 async 函数。请看下面的例子（完整代码看这里）。 https://github.com/ruanyf/koa-demos/blob/master/demos/10.js
koa-compose模块可以将多个中间件合成为一个。请看下面的例子（完整代码看这里）。 https://github.com/ruanyf/koa-demos/blob/master/demos/11.js
