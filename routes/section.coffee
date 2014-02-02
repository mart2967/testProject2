Section = require('../schemas/schemas').Section

exports.findAll = (req, res) ->
  Section.find (err, items) ->
    res.send items


exports.section = (req, res) ->
  newSection = new Section req.body
  console.log 'created section ' + newSection.title
  newSection.save()
  res.send()

exports.getSection = (req, res) ->
  id = req.route.params['id']
  Section.findById id, (err, result) ->
    res.send result


  