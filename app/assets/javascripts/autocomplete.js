var initialize = function() {
  console.log("initializing autocomplete");
  var input         = document.getElementById('city_search_field');
  var options       = {types: ['(cities)']};
  var autocomplete      = new google.maps.places.Autocomplete(input, options);
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    $('#city_search_field').val(autocomplete.getPlace().name);
  });
};

function loadScript() {
  if (typeof google === "undefined" && $('#city_search_field').length > 0) {
    console.log("loading google maps api");
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false' +
      '&libraries=places' +
      '&callback=initialize';
    document.body.appendChild(script);
  } else if ($('#city_search_field').length > 0) {
    initialize();
  }
}

$(function () {
  loadScript();
});
