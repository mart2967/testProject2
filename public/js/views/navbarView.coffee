class window.NavbarView extends Backbone.View
  tagName: 'ul'
  className: 'nav navbar-nav'
  id: 'nav-buttons'

  initialize: ->
    @render()

  render: ->
    _.each @collection.models, ((item, index) ->
      view = new NavbarItemView(model: item)
      #view.$el.attr('class', 'active') if index == 0 # problematic, won't give away
      @$el.append view.el
      return
    ), this
    this
# returning itself for chaining calls. syntax bears futher investigation