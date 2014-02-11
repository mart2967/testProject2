/**
 * Created by mart2967 on 1/30/14.
 */
var AppRouter = Backbone.Router.extend({

    routes: {
        "" : "index"
    },

    index: function() {
        var sectionList = new SectionCollection();
        sectionList.fetch({
            success: function(){
            $('#content').html(
                new SectionCollectionView({collection: sectionList}).$el
            );
        }});
    }


});

$(document).ready( function(){
    var app = new AppRouter();
    Backbone.history.start({pushState: true})

});