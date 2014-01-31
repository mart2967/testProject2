Section = require('../schemas/schemas').Section

exports.findAll = (req, res) ->
  Section.find.toArray (err, items) ->
    console.log items
    res.send items


exports.section = (req, res) ->
  newSection = new Section req.body
  console.log 'created section ' + newSection.title
  newSection.save()
  res.send()


exports.getSection = (req, res) ->
  id = req.route.params['id']
  #console.log req.route
  Section.find {_id: id}, (err, result) ->
    console.log result
    res.send(result)