$(document).ready(function() {
  var $content = $("#content"),
      $sidebar = $("#sidebar"),
      slideForm = function(context, duration) {
        context.toggle(duration);
      };
  $("#subscribe_form")
      .on("click", 'a', function(e) {
        var $subscribeForm = $('#mc_embed_signup');
        // if length is 0, we have to get the form via an ajax call
        if (!$subscribeForm.length) {
          $.getScript('/subscribe', function() {
            slideForm($('#mc_embed_signup'), 300);
          });
        } else {
          slideForm($subscribeForm, 300);
        }
//        if ($subscribeForm.is(':hidden')) {
//          slideForm($subscribeForm, 300);
//        }
        e.preventDefault();
        e.stopPropagation();
      });
  $sidebar
      .on("submit", '#mc_embed_signup form', function(e) {
        var $this = $(this);
        $.post("https://calmail.berkeley.edu//manage/list/listinfo_subscribe/ieee-members@lists.berkeley.edu", $this.serialize())
          .complete(function() {
            var successFlash = $('.success_flash');
            if (successFlash.length) {
              successFlash.remove();
            }
            $('#mc_embed_signup').slideUp();
            $('<div></div>', {
              text: "Thank you! A confirmation email will be sent to " + $this.find("#subscribe_form_address").val() + " shortly.",
              class: "success_flash"
            }).prependTo($content);
          });
        e.preventDefault();
        e.stopPropagation();
      });
});

