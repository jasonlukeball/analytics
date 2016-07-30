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