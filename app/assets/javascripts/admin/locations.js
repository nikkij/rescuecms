// Locations

// Toggle detail fields on select radio location type
// Should be able to rewrite this in a more generic manner for resuse when time permits. 

// USING iCHECK, COMMENTING OUT AND USING REGULAR RADIO BUTTONS UNTIL CAN RESOLVE BUG WITH
// BUTTON IMGS NOT SHOWING ON FIRST LOAD
// $('.location_type_radio').on('ifChecked', function(event) {
//     //var ele = $(this).parents("li").first();
//     //alert('Checked residence radio!');
//     function getEleLocationType(eleToParse) {
//       var arr = eleToParse.attr('id').split('location_as_location_type_');
//       //alert('hide: ' + arr[1]);
//       return arr[1];    
//     }
//     // Show the clicked element
//     var eleToShow = getEleLocationType($(this));
//     /*$('#'+eleToShow+'_fields').show();*/
//     $('#'+eleToShow+'_fields').slideDown();

//     // Hide the rest
//     $('.location_type_radio').each(function(index, obj){
//       //alert($(this).attr('id'));
//       var ele = getEleLocationType($(this));
//       //alert('Current el:'+ele+'  eleToShow is:'+eleToShow);
//       if (ele !== eleToShow) {
//       	$('#'+ele+'_fields').hide();
//       }
//     });
// });

$('.location_type_radio').click(function(event) {
    function getEleLocationType(eleToParse) {
      var arr = eleToParse.attr('id').split('location_as_location_type_');
      return arr[1];    
    }
    // Show the clicked element
    var eleToShow = getEleLocationType($(this));
    $('#'+eleToShow+'_fields').slideDown();

    // Hide the rest
    $('.location_type_radio').each(function(index, obj){
      var ele = getEleLocationType($(this));
      if (ele !== eleToShow) {
       $('#'+ele+'_fields').hide();
      }
    });
});

$('#on_premises_select').change(function(event) {
  selectedVal = $(this).find("option:selected").val()
  $('#location_id').val(selectedVal);
});

// Autocomplete for addresses
$( "#query_residence_location" ).autocomplete({
  source: '/admin/addresses/autocomplete.json',
  select: function(event,ui) {
    event.preventDefault();
    $(this).val(ui.item.label);
    $('#location_id').val(ui.item.value);
  }
});