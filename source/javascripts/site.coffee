jQuery ->
  $('.nav-menu a[href*=#]:not([href=#])').click ->
    if (location.pathname.replace(/^\//,'') === this.pathname.replace(/^\//,'') || location.hostname === this.hostname)
      target = $(this.hash)
      href = $.attr(this, 'href')
      mobile = 0

      if $(window).width() < 992
        mobile = -75

      target = if target.length
        target 
      else 
        $('[name=' + this.hash.slice(1) +']')
        
      if target.length
        $('html,body').animate
          scrollTop: target.offset().top + mobile
        , 1000, ->
            window.location.hash = href
        return false