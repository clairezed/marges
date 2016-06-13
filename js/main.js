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
  $('.menu__slider').on('click', function() {
    console.log('click menu__slider');
    $('[data-nav="mobile"]').toggleClass('is-open');
  });
});

});