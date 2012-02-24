$(document).ready(function() {
  var slideForm = function(context, duration) {
    context.slideDown(duration);
  };
  $("#subscribe_form")
      .on("click", 'a', function(e) {
        var $subscribeForm = $('#mc_embed_signup');
        if (!$subscribeForm.length) {
          $.getScript('/subscribe', function() {
            slideForm($('#mc_embed_signup'), 300);
          });
        }
        if ($subscribeForm.is(':hidden')) {
          slideForm($subscribeForm, 300);
        }
        e.preventDefault();
        e.stopPropagation();
      });
  $("#content")
      .on("submit", '#mc_embed_signup form', function(e) {
        var $this = $(this);
        $.post("https://calmail.berkeley.edu//manage/list/listinfo_subscribe/ieee-members@lists.berkeley.edu", $this.serialize())
          .complete(function() {
            var successFlash = $('.success_flash');
            if (successFlash.length) {
              successFlash.remove();
            }
            $('<div></div>', {
              text: "Thank you! A confirmation email will be sent to " + $this.find("#subscribe_form_address").val() + " shortly.",
              class: "success_flash"
            }).prependTo($this);
          });
        e.preventDefault();
        e.stopPropagation();
      });
});

