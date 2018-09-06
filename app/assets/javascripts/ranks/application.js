//= require lib/tag-it
//= require_tree .

$(document).on('turbolinks:load', function() {
    var url = location.href
    if (url.indexOf('all') != -1) {
        $('#all').addClass('btn-active')
    } else if (url.indexOf('month') != -1) {
        $('#month').addClass('btn-active')
    } else if (url.indexOf('/iine') != -1 || url.indexOf('/pv') != -1 ) {
        $('#week').addClass('btn-active')
    }

    if (url.indexOf('pv') != -1) {
        $('#pv-rank').removeClass('text-dark')
        $('#pv-rank').addClass('bg-coderoad')
        $('#pv-rank').addClass('text-white')
    } else if (url.indexOf('iine') != -1) {
        $('#iine-rank').removeClass('text-dark')
        $('#iine-rank').addClass('bg-coderoad')
        $('#iine-rank').addClass('text-white')
    }
})
