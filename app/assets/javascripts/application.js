// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .


/* ==========================================================================
 USER & EVENT TRACKING
 ========================================================================== */

var analytics = {};

analytics.track = function(eventName){
    var analyticsSettings = window.analyticsSettings;
    var payload = {
        app_id: analyticsSettings.app_id,
        user: { name: analyticsSettings.name, email: analyticsSettings.email},
        event: { name: eventName }
    };
    var request = new XMLHttpRequest();
    request.open("POST", "http://analytics.jasonlukeball.com/api/v1/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(payload));
};


/*


 BOOT WITH USER
 ==============================

 window.analyticsSettings = {
   app_id: "e271bd",
   name: "Example User",
   email: "user@example.com"
 };


 // BOOT WITHOUT USER
 ==============================

 window.analyticsSettings = {
   app_id: "e271bd",
 };


 // TRACK EVENT
 ==============================
 analytics.track('test event')


 // PAYLOAD STRUCTURE
 ==============================

 {
   "app_id": "e271bd",
   "user": {
     "name": "Example User",
     "email": "user@example.com"
   },
   "event": {
     "name": "clicked-something"
   }
 }


 */


/* ==========================================================================
 ALERT ANIMATION
 ========================================================================== */

$('document').ready(function() {
    setTimeout(function() {
        $(".alert").slideUp(150);
    }, 3000);
});