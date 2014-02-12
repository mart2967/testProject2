###
Created by mart2967 on 1/30/14.
###
class window.SectionView extends Backbone.View
  tagName: 'div'
  className: 'fixlink'
  template: _.template $('#section-template').html() #_.template is a function that takes a JSON object and returns html
  editTemplate: _.template $('#section-edit-template').html()
  events:
    'change': 'change'
    'click button.edit': 'editSection'
    'click button.save': 'saveSection'

  # the @ essentialy means "this."
  initialize: ->
    @render()
    return

  render: ->
    @$el.html @template(@model.toJSON()) #this.el is what we defined in tagName. use $el to get access to jQuery html() function
    this

  change: (event) ->
    console.log 'changed'
    change = {}
    change[event.target.name] = event.target.value #uses name attribute from html
    @model.set(change)

  editSection: ->
    @$el.html @editTemplate(@model.toJSON())
    this

  saveSection: ->
    console.log 'saving...'
    @model.save {},
      success: ->
        console.log 'saved'
      error: ->
        console.log 'error'
    @render()
