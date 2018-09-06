//= require lib/tag-it
//= require_tree .

$(document).on('turbolinks:load', function() {
    var url = location.href
    if (url.indexOf('all') != -1) {
        $('#all').addClass('btn-active')
    } else if (url.indexOf('month') != -1) {
        $('#month').addClass('btn-active')
    } else if (url.indexOf('/iine') != -1) {
        $('#week').addClass('btn-active')
    }
})
