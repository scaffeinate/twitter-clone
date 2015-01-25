+function ($) {
  'use strict';

  var Card = function(element,cover_pics, options) {
    this.init(element, cover_pics, options);
  };

  Card.prototype.init = function(element, cover_pics, options) {
    if(cover_pics.length == 1) {
      $(element).backstretch(cover_pics);
    } else {
      $(element).backstretch(cover_pics, options);
    }
  };

  function Plugin() {
    return this.each(function () {
      var $this   = $(this);
      var options = $.extend({}, $this.data());
      var $cover = $this.find("ul.cover-pics");
      var cover_pics = [];
      if($cover.length > 0) {
        $cover.find('img').each(function() {
          cover_pics.push($(this).attr('src'));
        });
        new Card(this, cover_pics, options);
      } else {
        new Card(this, $this.data('cover'));
      }
    });
  };

  var old = $.fn.button;

  $.fn.card = Plugin;
  $.fn.card.Constructor = Card;

  $(window).on('load', function () {
    $('.cover').each(function () {
      var $this = $(this)
      Plugin.call($this);
    });
  });

} (jQuery);