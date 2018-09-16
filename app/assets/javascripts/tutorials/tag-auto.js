$(function() {
  var i, len, ref, results, tag;
  $('#tutorial-tags').tagit({
    fieldName: 'tutorial[tag_list]',
    singleField: true,
    availableTags: gon.available_tags
  });
});
