Section = require('../schemas/schemas').Section

exports.findAll = (req, res) ->
  Section.find (err, items) ->
    res.send items


exports.create = (req, res) ->
  newSection = new Section req.body
  console.log 'created section ' + newSection.title
  newSection.save()
  res.send()

exports.getById = (req, res) ->
  id = req.route.params['id']
  Section.findById id, (err, result) ->
    res.send result

exports.edit = (req, res) ->
  section = req.body
  delete section._id
  #console.log req
  id = req.params.id
  Section.update({ _id: id }, { $set: section }, (err, numAffected, raw) ->
    console.log err if err
    #console.log 'The number of updated documents was %d', numAffected
    console.log 'The raw response from Mongo was ', raw
    res.send()
  )


  ###
  Section.findById id, (err, result) ->
    result = req.body
    result.save()
    res.send()
  ###