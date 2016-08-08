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


/* ==========================================================================
 ALERT ANIMATION
 ========================================================================== */

$('document').ready(function() {
    setTimeout(function() {
        $(".alert").slideUp(150);
    }, 3000);
});


/* ==========================================================================
 LIGHTEN / DARKEN COLOR
 ========================================================================== */


function LightenDarken(col, amt) {

    var usePound = false;

    if (col[0] == "#") {
        col = col.slice(1);
        usePound = true;
    }

    var num = parseInt(col,16);

    var r = (num >> 16) + amt;

    if (r > 255) r = 255;
    else if  (r < 0) r = 0;

    var b = ((num >> 8) & 0x00FF) + amt;

    if (b > 255) b = 255;
    else if  (b < 0) b = 0;

    var g = (num & 0x0000FF) + amt;

    if (g > 255) g = 255;
    else if (g < 0) g = 0;

    return (usePound?"#":"") + (g | (b << 8) | (r << 16)).toString(16);

}