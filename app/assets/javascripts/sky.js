$(document).ready(function() {
  var $content = $("#content"),
      $sidebar = $("#sidebar"),
      $embedForm = $('#mc_embed_signup'),
      slideForm = function(context, duration) {
        context.toggle(duration);
      };
  if ($embedForm.is(':hidden')) {
      $embedForm.toggle();
  }
  $("#subscribe_form")
      .on("click", 'a', function(e) {
        var $subscribeForm = $('#mc_embed_signup');
        // if length is 0, we have to get the form via an ajax call
        if (!$subscribeForm.length) {
          $.getScript('/subscribe', function() {
            $('#mc_embed_signup').slideDown(300);
          });
        } else {
          slideForm($subscribeForm, 300);
        }
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

