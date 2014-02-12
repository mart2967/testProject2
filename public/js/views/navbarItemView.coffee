class window.NavbarItemView extends Backbone.View
  tagName: 'li'
  template: _.template '<a href="#<%= htmlId %>"><%= title %></a>'

  events:
    click: 'makeActive'

  initialize: ->
    @render()
    return

  render: ->
    @$el.html @template(@model.toJSON())
    this

  makeActive: ->
    @$el.siblings().removeClass('active')
    @$el.addClass('active')
    this