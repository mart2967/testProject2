/**
 * Created by mart2967 on 1/30/14.
 */
var SectionCollectionView = Backbone.View.extend({
    initialize: function () {
        this.render();
    },

    render: function () {
        _.each(this.collection.models, function(item) {
            var view = new SectionView({model: item});
            this.$el.append(view.$el);
        }, this);
        return this;

    }

});