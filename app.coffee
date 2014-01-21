express = require('express')
routes = require('./routes')
user = require('./routes/user')
http = require('http')
path = require('path')
app = express()

#set main layout
app.set 'layout', 'layout'

#expose templates to all views
app.set 'partials',
  head: 'partials/head'

app.engine 'html', require('hogan-express')
app.enable 'view cache'
app.configure ->
  app.set 'port', process.env.PORT or 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'html'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.json()
  app.use express.urlencoded()
  app.use express.methodOverride()
  app.use express.cookieParser('your secret here')
  app.use express.session()
  app.use app.router

  #app.use(require('less-middleware')({ src: __dirname + '/public' }));
  app.use express.static(path.join(__dirname, 'public'))

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/users', user.list
http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')
