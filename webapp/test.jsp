<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

  <script type='text/javascript' src='libs/jquery-1.4.4.min.js'></script>
  <script type='text/javascript' src='libs/jquery-ui-1.8.11.custom.min.js'></script>
	
	
	
    <link rel='stylesheet' type='text/css' href='libs/css/smoothness/jquery-ui-1.8.11.custom.css' />
  <link rel='stylesheet' type='text/css' href='jquery.weekcalendar.css' />
  <style type='text/css'>
  body {
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    margin: 0;
  }
  h1 {
    margin: 0 0 1em;
    padding: 0.5em 0.5em 0;
  }
  p.description {
    font-size: 0.8em;
    padding: 1em;
    top: 3.2em;
    margin-right: 400px;
  }
  #message {
    font-size: 0.7em;
    position: absolute;
    top: 1em;
    right: 1em;
    width: 350px;
    display: none;
    padding: 1em;
    background: #ffc;
    border: 1px solid #dda;
  }
  </style>

  <script type='text/javascript'>
  var year = new Date().getFullYear();
  var month = new Date().getMonth();
  var day = new Date().getDate();
  var eventData = {
    events : [
       {'id':1, 'start': new Date(year, month, day, 12), 'end': new Date(year, month, day, 13, 35),'title':'Lunch with Mike'},
       {'id':2, 'start': new Date(year, month, day, 14), 'end': new Date(year, month, day, 14, 45),'title':'Dev Meeting'},
       {'id':3, 'start': new Date(year, month, day + 1, 18), 'end': new Date(year, month, day + 1, 18, 45),'title':'Hair cut'},
       {'id':4, 'start': new Date(year, month, day - 1, 8), 'end': new Date(year, month, day - 1, 9, 30),'title':'Team breakfast'},
       {'id':5, 'start': new Date(year, month, day + 1, 14), 'end': new Date(year, month, day + 1, 16),'title':'Product showcase'},
       {'id':5, 'start': new Date(year, month, day + 1, 15), 'end': new Date(year, month, day + 1, 17),'title':'Overlay event'}
    ]
  };
  $(document).ready(function() {
    $('#calendar').weekCalendar({
      data: eventData,
      timeslotsPerHour: 4,
      allowCalEventOverlap: true,
      overlapEventsSeparate: true,
      totalEventsWidthPercentInOneColumn : 95,
      height: function($calendar) {
        return $(window).height() - $('h1').outerHeight(true);
      },
      eventRender: function(calEvent, $event) {
        if (calEvent.end.getTime() < new Date().getTime()) {
          $event.css('backgroundColor', '#aaa');
          $event.find('.time').css({
            backgroundColor: '#999',
            border:'1px solid #888'
          });
        }
      },
      eventNew: function(calEvent, $event) {
        displayMessage('<strong>Added event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
        alert('You\'ve added a new event. You would capture this event, add the logic for creating a new event with your own fields, data and whatever backend persistence you require.');
      },
      eventDrop: function(calEvent, $event) {
        displayMessage('<strong>Moved Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      },
      eventResize: function(calEvent, $event) {
        displayMessage('<strong>Resized Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      },
      eventClick: function(calEvent, $event) {
        displayMessage('<strong>Clicked Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      },
      eventMouseover: function(calEvent, $event) {
        displayMessage('<strong>Mouseover Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      },
      eventMouseout: function(calEvent, $event) {
        displayMessage('<strong>Mouseout Event</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      },
      noEvents: function() {
        displayMessage('There are no events for this week');
      }
    });
    function displayMessage(message) {
      $('#message').html(message).fadeIn();
    }
    $('<div id="message" class="ui-corner-all"></div>').prependTo($('body'));
  });
  </script>
</head>
<body>
  <h1>Week Calendar Demo</h1>

  <p class="description">
    This calendar demonstrates a basic calendar. Events triggered are
    displayed in the message area. Appointments in the past are shaded grey.
    <br/>
    This calendar demonstrates overlapped events with little space on right to
    create new events  (new option <i>"totalEventsWidthPercentInOneColumn"</i>)
  </p>

  <div id="calendar"></div>
</body>
</html>