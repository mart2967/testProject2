class window.NavbarItemView extends Backbone.View
  tagName: 'li'
  template: _.template '<a href="#<%= htmlId %>"><%= title %></a>'

  initialize: ->
    @render()
    return

  render: ->
    @$el.html @template(@model.toJSON())
    this