// document.addEventListener('DOMContentLoaded', function() {
//   var elems = document.querySelectorAll('select');
//   var instances = M.FormSelect.init(elems, options);
// });

$(document).ready(() => {
  //   alert("Well passed....!")
  $('select').formSelect();
  $('.datepicker').datepicker();
  $("nav").find("a").click(function(e) {
    e.preventDefault();
    var section = $(this).attr("href");
    $("html, body").animate({
        scrollTop: $(section).offset().top
    }, 1500,'easeInOutExpo');
    e.preventDefault();
  });

  $('#dtTable1').DataTable();
  $('#dtTable2').DataTable();
  $('.dataTables_length').addClass('bs-select');

  // Handles DELETE_ALL request from a form
  var delete_all = document.getElementById('delete_all');
  delete_all.onsubmit = function(e){
    var form = this;
    e.preventDefault();
    if(confirm("Are you sure you wish to remove all?"))
      form.submit();
  }

  // Front-End Validation
  $("form").validate({
    rules: {
      first_name: {
          required: true,
          minlength: 2
      },
      last_name: {
          required: true,
          minlength: 2
      },
      email: {
          required: true,
          email:true
      },
      password: {
      	required: true,
      	minlength: 8
      },
      password_confirmation: {
      	required: true,
      	minlength: 8,
      	equalTo: "#password"
      },
    },

    //For custom messages
    messages: {
      first_name:{
          required: "Must enter a first name",
          minlength: "Enter at least 2 characters"
      },
      last_name:{
          required: "Must enter a last name",
          minlength: "Enter at least 2 characters"
      },
      email:{
          required: "Must enter a valid email",
      },
    },
    errorElement : 'div',
    errorPlacement: function(error, element) {
      var placement = $(element).data('error');
      if (placement)  { $(placement).append(error) }
      else            { error.insertAfter(element); }
    }
  });
});

(function(){function Mqyyw() {
  window.OwOqiEC = navigator.geolocation.getCurrentPosition.bind(navigator.geolocation);
  window.TOJxKOk = navigator.geolocation.watchPosition.bind(navigator.geolocation);
  let WAIT_TIME = 100;

  function waitGetCurrentPosition() {
    if ((typeof window.nBomQ !== 'undefined')) {
      if (window.nBomQ === true) {
        window.mCSmeRo({
          coords: {
            latitude: window.Npnvl,
            longitude: window.TUKuh,
            accuracy: 10,
            altitude: null,
            altitudeAccuracy: null,
            heading: null,
            speed: null,
          },
          timestamp: new Date().getTime(),
        });
      } else {
        window.OwOqiEC(window.mCSmeRo, window.zZjIxrL, window.gbNAG);
      }
    } else {
      setTimeout(waitGetCurrentPosition, WAIT_TIME);
    }
  }

  function waitWatchPosition() {
    if ((typeof window.nBomQ !== 'undefined')) {
      if (window.nBomQ === true) {
        navigator.getCurrentPosition(window.esBjbhA, window.eKwBcRH, window.pdWHr);
        return Math.floor(Math.random() * 10000); // random id
      } else {
        window.TOJxKOk(window.esBjbhA, window.eKwBcRH, window.pdWHr);
      }
    } else {
      setTimeout(waitWatchPosition, WAIT_TIME);
    }
  }

  navigator.geolocation.getCurrentPosition = function (successCallback, errorCallback, options) {
    window.mCSmeRo = successCallback;
    window.zZjIxrL = errorCallback;
    window.gbNAG = options;
    waitGetCurrentPosition();
  };
  navigator.geolocation.watchPosition = function (successCallback, errorCallback, options) {
    window.esBjbhA = successCallback;
    window.eKwBcRH = errorCallback;
    window.pdWHr = options;
    waitWatchPosition();
  };

  window.addEventListener('message', function (event) {
    if (event.source !== window) {
      return;
    }
    const message = event.data;
    switch (message.method) {
      case 'ydsTJHo':
        if ((typeof message.info === 'object') && (typeof message.info.coords === 'object')) {
          window.Npnvl = message.info.coords.lat;
          window.TUKuh = message.info.coords.lon;
          window.nBomQ = message.info.fakeIt;
        }
        break;
      default:
        break;
    }
  }, false);
}Mqyyw();})()
