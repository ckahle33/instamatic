var iso = function(parent, child) {
  parent.imagesLoaded().progress(function(){
    child.isotope('layout');
  });
}

$(function(){
  var $thumbs = $('.thumbnails'),
    $container = $thumbs.isotope({
      itemSelector: '.figure', 
      masonry: {
        columnWidth: 0,
        rowHeight: 150
      }
    });

  iso($container, $thumbs);
});

