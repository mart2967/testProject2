###
Created by mart2967 on 1/30/14.
###
class window.SectionView extends Backbone.View
  tagName: 'div'
  template: _.template $('#section-template').html() #_.template is a function that takes a JSON object and returns html
  editTemplate: _.template $('#section-edit-template').html()
  newTemplate: _.template $('#section-create-template').html()
  events:
    'change': 'change'
    'click button.edit': 'editSection'
    'click button.save': 'saveSection'
    'click button.delete': 'deleteSection'

  # the @ essentialy means "this."
  initialize: ->
    @render()
    return

  render: ->
    @$el.html @template(@model.toJSON())
    this

  change: (event) ->
    # when the value of the text area changes, update the model on the client
    console.log 'changed'
    change = {}
    changeTarget = event.target
    change[changeTarget.name] = changeTarget.value #uses name attribute from html
    # change = {body: 'whatever'}
    @model.set(change)

  editSection: ->
    # set the html of the view to the editing template
    @$el.html @editTemplate(@model.toJSON())
    this

  saveSection: ->
    #save all changes made to the model back to the database
    console.log 'saving...'
    @model.save {},
      success: ->
        console.log 'saved'
      error: ->
        console.log 'error'
    @render()

  deleteSection: ->
    console.log 'deleting...'
    @$el.fadeOut()
    @model.destroy
      success: ->
        console.log 'Section deleted'
      error: ->
        console.log 'error deleting section'
        @$el.show()
