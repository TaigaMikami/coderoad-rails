$(document).on('turbolinks:load',function() {
  $('#tutorial-tags').tagit({
    fieldName: 'tutorial[tag_list]',
    singleField: true,
    availableTags: gon.available_tags
  });
});
