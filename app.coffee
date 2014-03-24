express = require 'express'
routes = require './routes'
section = require './routes/section'
http = require 'http'
path = require 'path'
mongoose = require 'mongoose'
#models = require './schemas/schemas'
app = express()

#connect to database

#GET API KEY FROM DATABASE ON CI SERVER
getAPIkey() if app.get 'env' == 'production'
getAPIkey = ->
  console.log 'connecting to api key database'
  mongoose.connect 'mongodb://localhost/test'
  apiDB = mongoose.connection
  apiDB.once 'open', ->
    keyRecord = apiDB.query.find {owner: 'team1'} #TEAM NAMES UNIQUE 1-5
    console.log keyRecord
    app.set 'apikey', keyRecord.value
    apiDB.close()

#THE DATABASE NAME SHOULD BE UNIQUE TO GROUPS
mongoose.connect 'mongodb://localhost/nodebase'
db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', ->
  console.log 'DB connection opened'

#set main layout
app.set 'layout', 'layouts/main'
#expose templates to all views
app.set 'partials',
  head: 'partials/head',
  navbar: 'partials/navbar',
  scripts: 'partials/scripts',
  templates: 'partials/templates'

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
  app.use express.static(path.join(__dirname, 'bower_components'))

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/section/:id', section.getById
app.post '/section', section.create
app.get '/sections', section.findAll
app.put '/section/:id', section.edit
app.delete '/section/:id', section.delete

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')
