$(function() {

  // $('.context.example .ui.sidebar')
  //   .sidebar({
  //     context: $('.context.example .bottom.segment')
  //   })
  //   .sidebar('attach events', '.context.example .menu .item')
  // ;



  // $('.top.menu').on('click', function(){
  //   $('.ui.sidebar')
  //   .sidebar('toggle')
  // })

  $(document).ready(function() {

    $('[data-toggle="mobile-nav"]').on('click', function() {
      console.log('click menu__slider');
      $('[data-toggled="mobile-nav"]').toggleClass('is-open');
    });
  });

});

// document.getElementsByClassName