const jsonServer = require('json-server') // 引入 JSON Server
const server = jsonServer.create()
const router = jsonServer.router('db.json') // 指定数据库文件
const middlewares = jsonServer.defaults()

// 启用中间件（logger、cors 等）
server.use(middlewares)

// 启用 body-parser 解析 POST 请求
server.use(jsonServer.bodyParser)

// ✅ 自定义 POST 路由：用 POST 请求返回 posts 数据
server.post('/getPosts', (req, res) => {
  const db = router.db // lowdb 实例
  const posts = db.get('posts').value() // 获取 db.json 中 posts 数据
  res.jsonp(posts)
})

// 其他默认路由
server.use(router)

// 启动服务
server.listen(3000, () => {
  console.log('🚀 JSON Server is running at http://localhost:3000')
})

