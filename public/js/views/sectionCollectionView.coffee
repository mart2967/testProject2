###
Created by mart2967 on 1/30/14.
###
class window.SectionCollectionView extends Backbone.View
  events:
    'change': 'change'

  change: ->
    #alert('A model changed')
    #fires whenever one of it's models has a change as well

  initialize: ->
    @render()

  render: ->
    _.each @collection.models, ((item) ->
      view = new SectionView(model: item)
      @$el.append view.el
      return
    ), this
    this
    # returning itself for chaining calls. syntax bears futher investigation