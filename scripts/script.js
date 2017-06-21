$('.slick-carousel').slick({
  autoplay: true,
  arrows: true,
  centerMode: true,
  centerPadding: '60px',
  slidesToShow: 6,
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: true,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 4
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: true,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 2
      }
    }
  ]
});

function clearSeats() {
  $('.hall-seat').removeClass('is-active');
  $('.hall-list').html('');
  $('.hall-sum').text(0);
}

$('.modal').on('hide.bs.modal', clearSeats);

/*Booking modal*/
 var modalButtons = $('.next-modal')

 modalButtons.click(function(){
   var $this = $(this);
   var $parentModal = $this.closest('.modal');
   var $nextModal = $('#'+$this.data('next'));
  //  console.log($parentModal,$nextModal);
   $parentModal.modal('hide');
   $nextModal.modal('show');
 });

/*disabled*/
$('#book-form').change(function(){
  var $this = $(this);
  var $inputs = $this.find("input").get();
  var $parentModal = $this.closest('.modal');
  var $button = $parentModal.find('.next-modal');

  var values = $inputs
  .map(function(input){
    return input.value
  })
  .filter(function(value){
    return !value
  })

  if (values.length === 0) {
    $button.attr('disabled',false);
  }
  else {
    $button.attr('disabled','disabled');
  }
});

$('#book-email').change(function(){
  var $this = $(this);
  var $email = $('#result-email');

  $email.text($this.val());
})

/*register*/

$(function() {

    var $formLogin = $('#login-form');
    var $formLost = $('#lost-form');
    var $formRegister = $('#register-form');
    var $divForms = $('#div-forms');
    var $modalAnimateTime = 300;
    var $msgAnimateTime = 150;
    var $msgShowTime = 2000;

    // $("form").submit(function () {
    //     switch(this.id) {
    //         case "login-form":
    //             var $lg_username=$('#login_username').val();
    //             var $lg_password=$('#login_password').val();
    //             if ($lg_username == "ERROR") {
    //                 msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
    //             } else {
    //                 msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
    //             }
    //             return false;
    //             break;
    //         case "lost-form":
    //             var $ls_email=$('#lost_email').val();
    //             if ($ls_email == "ERROR") {
    //                 msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "error", "glyphicon-remove", "Send error");
    //             } else {
    //                 msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "success", "glyphicon-ok", "Send OK");
    //             }
    //             return false;
    //             break;
    //         case "register-form":
    //             var $rg_username=$('#register_username').val();
    //             var $rg_email=$('#register_email').val();
    //             var $rg_password=$('#register_password').val();
    //             if ($rg_username == "ERROR") {
    //                 msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "error", "glyphicon-remove", "Register error");
    //             } else {
    //                 msgChange($('#div-register-msg'), $('#icon-register-msg'), $('#text-register-msg'), "success", "glyphicon-ok", "Register OK");
    //             }
    //             return false;
    //             break;
    //         default:
    //             return false;
    //     }
    //     return false;
    // });

    $('#login_register_btn').click( function () { modalAnimate($formLogin, $formRegister) });
    $('#register_login_btn').click( function () { modalAnimate($formRegister, $formLogin); });
    $('#login_lost_btn').click( function () { modalAnimate($formLogin, $formLost); });
    $('#lost_login_btn').click( function () { modalAnimate($formLost, $formLogin); });
    $('#lost_register_btn').click( function () { modalAnimate($formLost, $formRegister); });
    $('#register_lost_btn').click( function () { modalAnimate($formRegister, $formLost); });

    function modalAnimate ($oldForm, $newForm) {
        var $oldH = $oldForm.height();
        var $newH = $newForm.height();
        $divForms.css("height",$oldH);
        $oldForm.fadeToggle($modalAnimateTime, function(){
            $divForms.animate({height: $newH}, $modalAnimateTime, function(){
                $newForm.fadeToggle($modalAnimateTime);
            });
        });
    }

    function msgFade ($msgId, $msgText) {
        $msgId.fadeOut($msgAnimateTime, function() {
            $(this).text($msgText).fadeIn($msgAnimateTime);
        });
    }

    function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
        var $msgOld = $divTag.text();
        msgFade($textTag, $msgText);
        $divTag.addClass($divClass);
        $iconTag.removeClass("glyphicon-chevron-right");
        $iconTag.addClass($iconClass + " " + $divClass);
        setTimeout(function() {
            msgFade($textTag, $msgOld);
            $divTag.removeClass($divClass);
            $iconTag.addClass("glyphicon-chevron-right");
            $iconTag.removeClass($iconClass + " " + $divClass);
  		}, $msgShowTime);
    }
});

//Movie Ajax request
var price = 0;
var seatClickHandler = function(){
  $(this).toggleClass('is-active')
}
var hallClickHandler = function(){
  var resultButton = $('.js-open-result-modal');
  var activeButtons = $(this).find('.hall-seat.is-active').get();
  var sum = activeButtons.length * price;
  $('.hall-sum').text(sum);

  var seatsArray = activeButtons
  .map(function(btn){
    var row = btn.dataset.row;
    var seat = btn.dataset.seat;

    // console.log(btn, row, seat);

    return {
      row: row,
      seat: seat,
    }
  })

  var seatsString = seatsArray
  .map(function(btn){
    var row = btn.row;
    var seat = btn.seat;

    // console.log(btn, row, seat);

    return '<li class="choose">Row: ' + row + ' Seat: ' + seat + '</li>'
  })
  .join("")

  console.log(JSON.stringify(seatsArray));
  resultButton.data('seats', JSON.stringify(seatsArray));

  var chosenSeats = $('.hall-list').html(seatsString)

}

$(function(){
  var movieButton = $('.js-request-movie');
  var resultButton = $('.js-open-result-modal');

  movieButton.click(function(){
    var $this = $(this);
    var scheduleId = $this.data('schedule');
    var modal = $('#myModal');
    price = $this.data('price');

    resultButton.data('schedule', scheduleId);

    modal.addClass('is-loading');

    $('.hall-seat').removeClass('is-busy');
    $('.hall-seat').attr('disabled', false);

    $('.hall-seat').off('click', seatClickHandler);
    $('.hall').off('click', hallClickHandler);
    $('.hall-seat').on('click', seatClickHandler);
    $('.hall').on('click', hallClickHandler);

    $.getJSON('/cinema/get-seats.php', {
        schedule_id: scheduleId,
    })
    .done(function(res){
      modal.removeClass('is-loading');

      res.forEach(function(ticket){
        var row = ticket[4]
        var seat = ticket[5]

        var btn = modal.find('[data-row="'+row+'"][data-seat="'+seat+'"]')

        btn.attr('disabled', 'disabled')
        btn.addClass('is-busy')
      })
    })
    .fail(function(err){
      console.error('error', err)
    })
  });

  resultButton.click(function(){
    var $this = $(this);
    var scheduleId = $this.data('schedule');
    var seatsArray = $this.data('seats');
    var bookName = $('#book-name').val();
    var bookEmail = $('#book-email').val();
    console.log(seatsArray);
    $.getJSON('/cinema/set-seats.php', {
        schedule_id: scheduleId,
        book_name : bookName,
        book_email : bookEmail,
        seats: seatsArray,
    })
    .done(function(res){
      // modal.removeClass('is-loading');
      console.log('response', res);
    })
  })
})
