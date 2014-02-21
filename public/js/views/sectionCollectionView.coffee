###
Created by mart2967 on 1/30/14.
###
class window.SectionCollectionView extends Backbone.View
  #newTemplate: _.template $('#section-create-template').html()
  blankSection: new newSectionView()

  initialize: ->
#    @listenTo @blankSection, 'save', ->
#      console.log 'detected save'
#      self = this # this is done because the depth of the callback obscures the @ object, so we must wrap it in self
#      @collection.fetch success: ->
#        self.render()
    #@render()


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
