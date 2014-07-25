// Locations

// Toggle detail fields on select radio location type
// Should be able to rewrite this in a more generic manner for resuse when time permits. 
$('.location_type_radio').on('ifChecked', function(event) {
    //var ele = $(this).parents("li").first();
    //alert('Checked residence radio!');
    function getEleLocationType(eleToParse) {
      var arr = eleToParse.attr('id').split('location_as_location_type_');
      //alert('hide: ' + arr[1]);
      return arr[1];    
    }
    // Show the clicked element
    var eleToShow = getEleLocationType($(this));
    $('#'+eleToShow+'_fields').show();

    // Hide the rest
    $('.location_type_radio').each(function(index, obj){
      //alert($(this).attr('id'));
      var ele = getEleLocationType($(this));
      //alert('Current el:'+ele+'  eleToShow is:'+eleToShow);
      if (ele !== eleToShow) {
      	$('#'+ele+'_fields').hide();
      }
    });
});

// Autocomplete for addresses
$( "#query_residence_location" ).autocomplete({
  source: '/admin/addresses/autocomplete.json',
  select: function(event,ui) {
    event.preventDefault();
    $(this).val(ui.item.label);
    $('#residence_location_id').val(ui.item.value);
  }
});