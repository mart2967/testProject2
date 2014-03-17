cube = require('../simpleFunctions').cube
isOdd5d = require('../simpleFunctions').isFiveDigitOddNumber
sectionFunctions = require '../routes/section'
Section = require('../schemas/schemas').Section
http = require 'http'
assert = require 'assert'

describe 'testing a coffeescript cube function', ->
  it '3 cubed is 27', ->
    assert.equal 27, cube(3)
  it '-3 cubed is -27', ->
    assert.equal -27, cube(-3)

describe 'incomplete test coverage example', ->





  
  it '5 is not one', ->
    assert.equal false, isOdd5d(5)
  it '30525 is not one', ->
    assert.equal false, isOdd5d(30524)

describe 'Create, read, update, and delete a Section', ->
  it 'Creates and saves a Section', ->
    newSection =
      title: 'Test section'
      htmlId: 'test', body: 'Hello world'
      link: 'http://www.google.com'
      category: 'test', __v: '0'
    options =
      hostname: 'localhost',
      port: 3000,
      path: '/section',
      method: 'POST'
    callback = (response) ->
      str = ''
      response.on 'data', (txt) ->
        str += txt
      response.on 'end', ->
        console.log str
    request = new http.request(options)
    request.body =  newSection
    console.log request

    sectionFunctions.create(request, callback).end()
    newSection.save()