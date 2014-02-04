/**
 * Created by mart2967 on 1/30/14.
 */

var Section = Backbone.Model.extend({
    urlRoot: '/section',
    idAttribute: '_id', //conforming to mongodb id syntax
    initialize: function (spec) {
        console.log('Initializing a Section');
    },
    defaults: {
        title: 'Title',
        link: '#',
        body: 'Hello world',
        category: 'default',
        htmlId: '#'
    }

})