/**
 * Created by mart2967 on 1/30/14.
 */
var SectionView = Backbone.View.extend({
    tagName: 'div',
    className: 'fixlink',
    template: $('#section-template').html(),
    events: {
      'change': 'render'
    },
    initialize: function() {
        this.render();
    },

    render: function() {
        //alert(this.model.toJSON());
        var tmpl = _.template(this.template); //tmpl is a function that takes a JSON object and returns html
        this.$el.html(tmpl(this.model.toJSON())); //this.el is what we defined in tagName. use $el to get access to jQuery html() function
        return this;
    }
});