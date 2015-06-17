initialize = function() {
  var options       = {types: ['(cities)']};
  var input         = document.getElementById('city_search_field');
  autocomplete      = new google.maps.places.Autocomplete(input, options);
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    $('#city_search_field').val(autocomplete.getPlace().name);
  });
};

(function(app) {

  app.loadScript = function () {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places&callback=initialize';
    document.body.appendChild(script);
  };

}(window.app = window.app || {}));

window.onload = app.loadScript;
