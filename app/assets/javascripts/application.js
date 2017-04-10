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
//= require jquery_ujs
//= require jquery-ui
//= require jquery-ui/i18n/datepicker-pt-BR
//= require bootbox.js
//= require bootstrap.growl
//= require wiselinks
//= require mara/materialize.js
//= require mara/mara.min
//= require_tree .

$(document).ready(function($) {
   $(".datepicker").datepicker({
    format: 'dd/mm/yyyy'
    });
  $("#account_account_type").on("change",function(event){
      if($(this).val() === 'bank' ) {
          $("#day").hide();
      } else {
          $("#day").show();
      }
  });
   window.wiselinks = new Wiselinks($('#home'));

   $(document).ajaxStart(function () {
        $('#global-spin').fadeIn('slow');
    }).ajaxStop(function () {
        $('#global-spin').fadeOut('slow');
    }).ajaxComplete(function(event, xhr, settings) {
       $(".modal-backdrop").remove();
    });

});

$.rails.allowAction = function(element) {
          var message = element.attr('data-confirm');
          if (!message) { return true; }

          var opts = {
            title: "Confirmação",
            message: message,
            buttons: {
                confirm: {
                    label: 'Sim',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Não',
                    className: 'btn-danger'
                }
            },
            callback: function(result) {
              if (result) {
                element.removeAttr('data-confirm');
                element.trigger('click.rails')
              }
            }
          };

          bootbox.confirm(opts);

          return false;
}
