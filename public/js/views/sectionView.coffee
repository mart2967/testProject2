###
Created by mart2967 on 1/30/14.
###
class window.SectionView extends Backbone.View
  tagName: 'div'
  className: 'fixlink'
  template: _.template $('#section-template').html() #_.template is a function that takes a JSON object and returns html
  events:
    change: 'render'

  # the @ essentialy means "this."
  initialize: ->
    @render()
    return

  render: ->
    @$el.html @template(@model.toJSON()) #this.el is what we defined in tagName. use $el to get access to jQuery html() function
    this
