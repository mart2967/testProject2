exports.index = function(req, res) {
    res.locals = {
        title: 'Mexpress'
    };
    return res.render(
        'index'

    );
};