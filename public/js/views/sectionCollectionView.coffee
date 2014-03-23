###
Created by mart2967 on 1/30/14.
###
class window.SectionCollectionView extends Backbone.View

  render: ->
    console.log 'rendering collection view'
    @$el.html ''

    _.each @collection.models, ((item) ->
      view = new SectionView(model: item)
      @$el.append view.el
      return
    ), this
    this
  # returning itself for chaining calls. syntax bears futher investigation
