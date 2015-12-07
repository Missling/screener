$(document).ready(function(){  

  var calendarEvent = {
    "events": [
      {
        "occasion": "Birthday party",
        "invited_count": 120,
        "year": 2015,
        "month": 3,
        "day": 14
      },
      {
        "occasion": "Technical discussion",
        "invited_count": 23,
        "year": 2015,
        "month": 4,
        "day": 24
      },
      {
        "occasion": "Press release",
        "invited_count": 64,
        "year": 2015,
        "month": 6,
        "day": 7,
        "cancelled": true
      },
      {
        "occasion": "New year party",
        "invited_count": 55,
        "year": 2016,
        "month": 1,
        "day": 1
      }
    ]
  }

  var events = calendarEvent["events"].map(function(event){

    var date = event["year"] + "-" + event["month"] + "-" + event["day"]
    var className = event["cancelled"] ? "cancelled" : "";

    return({
      title: event["occasion"],
      invited_count: event["invited_count"],
      start: date,
      className: className,
      allDay: true
    });
  });

  $('#calendar').fullCalendar({
    
    events: events,

    eventClick: function(calEvent) {
      alert('Invited Count: ' + calEvent.invited_count);
    }
  })  
});

