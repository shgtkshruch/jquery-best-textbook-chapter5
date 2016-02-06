(function() {
  var $container, $indicator, $nav, $slideGroup, $slides, currentIndex, duration, easing, goToSlide, indicatorHTML, intarval, slideCount, startTimer, stopTimer, timer, updateNav;

  $container = $('.slideshow');

  $slideGroup = $container.find('.slideshow-slides');

  $slides = $slideGroup.find('.slide');

  $nav = $container.find('.slideshow-nav');

  $indicator = $container.find('.slideshow-indicator');

  slideCount = $slides.length;

  indicatorHTML = '';

  currentIndex = 0;

  duration = 500;

  easing = 'easeInOutExpo';

  intarval = 7500;

  timer = '';


  /*
   * HTML要素の配置、生成、挿入
   */

  $slides.each(function(i) {
    $(this).css('left', 100 * i + '%');
    return indicatorHTML += '<a href="#">' + (i + 1) + '</a>';
  });

  $indicator.html(indicatorHTML);


  /*
   * 関数の定義
   */

  goToSlide = function(index) {
    $slideGroup.animate({
      left: -100 * index + '%'
    }, duration, easing);
    currentIndex = index;
    return updateNav();
  };

  updateNav = function() {
    var $navNext, $navPrev;
    $navPrev = $nav.find('.prev');
    $navNext = $nav.find('.next');
    if (currentIndex === 0) {
      $navPrev.addClass('disabled');
    } else {
      $navPrev.removeClass('disabled');
    }
    if (currentIndex === slideCount - 1) {
      $navNext.addClass('disabled');
    } else {
      $navNext.removeClass('disabled');
    }
    return $indicator.find('a').removeClass('active').eq(currentIndex).addClass('active');
  };

  startTimer = function() {
    return timer = setInterval(function() {
      var nextIndex;
      nextIndex = (currentIndex + 1) % slideCount;
      return goToSlide(nextIndex);
    }, intarval);
  };

  stopTimer = function() {
    return clearInterval(timer);
  };


  /*
   * イベントの登録
   */

  $nav.on('click', 'a', function(event) {
    event.preventDefault();
    if ($(this).hasClass('prev')) {
      return goToSlide(currentIndex - 1);
    } else {
      return goToSlide(currentIndex + 1);
    }
  });

  $indicator.on('click', 'a', function(event) {
    event.preventDefault();
    if (!$(this).hasClass('acvive')) {
      return goToSlide($(this).index());
    }
  });

  $container.on({
    mouseenter: stopTimer,
    mouseleave: startTimer
  });


  /*
   * スライドショーの開始
   */

  goToSlide(currentIndex);

  startTimer();

}).call(this);

(function() {
  var $header, $headerClone, $headerCloneContainer, $window, threshold;

  $window = $(window);

  $header = $('.page-header');

  $headerClone = $header.contents().clone();

  $headerCloneContainer = $('<div class="page-header-clone"></div>');

  $headerCloneContainer.append($headerClone).appendTo('body');

  threshold = $header.offset().top + $header.outerHeight();

  $window.on('scroll', $.throttle(1000 / 15, function() {
    if ($window.scrollTop() > threshold) {
      return $headerCloneContainer.addClass('visible');
    } else {
      return $headerCloneContainer.removeClass('visible');
    }
  }));

  $window.trigger('scroll');

}).call(this);

(function() {
  var $container, $highlight, $navItems, moveHighlight;

  $container = $('.work-section');

  $navItems = $container.find('.tabs-nav li');

  $highlight = $container.find('.tabs-highlight');

  moveHighlight = function(event, ui) {
    var $newTab, left;
    $newTab = ui.newTab || ui.tab;
    left = $newTab.position().left;
    return $highlight.animate({
      left: left
    }, 500, 'easeOutExpo');
  };

  $container.tabs({
    hide: {
      duration: 250
    },
    show: {
      duration: 125
    },
    create: moveHighlight,
    activate: moveHighlight
  });

}).call(this);

(function() {
  var map, mapContainer, mapOptions, mapStyles, marker;

  mapContainer = document.getElementById('map-container');

  marker = [35.6802361, 139.70130849999998];

  mapStyles = [
    {
      featureType: 'all',
      elementType: 'all',
      stylers: [
        {
          visibility: 'on'
        }, {
          hue: '#105ea7'
        }, {
          saturation: -100
        }, {
          invert_lightness: true
        }
      ]
    }, {
      elementType: 'labels.icon',
      stylers: [
        {
          visibility: 'off'
        }
      ]
    }
  ];

  mapOptions = {
    center: new google.maps.LatLng(marker[0], marker[1]),
    disableDefaultUI: true,
    panControl: true,
    zoom: 16,
    zoomControl: true,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.SMALL
    },
    styles: mapStyles
  };

  map = new google.maps.Map(mapContainer, mapOptions);

  new google.maps.Marker({
    position: new google.maps.LatLng(marker[0], marker[1]),
    map: map
  });

}).call(this);

(function() {
  $('.back-to-top').on('click', function(event) {
    return $.smoothScroll({
      easing: 'easeOutExpo',
      spped: 500
    });
  });

}).call(this);
