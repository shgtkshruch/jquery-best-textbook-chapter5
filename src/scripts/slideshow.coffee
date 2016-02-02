$container = $ '.slideshow'
$slideGroup = $container.find '.slideshow-slides'
$slides = $slideGroup.find '.slide'
$nav = $container.find '.slideshow-nav'
$inditator = $container.find '.slideshow-indicator'

slideCount = $slides.length
indicatorHTML = ''
currentIndex = 0
duration = 500
easing = 'easeInOutExpo'
intarval = 7500
timer = ''

###
# HTML要素の配置、生成、挿入
###

# 各スライドの位置を決定し、
# 対応するインジケーターのアンカーを生成
$slides.each (i) ->
  $(@).css 'left', 100 * i + '%'
  indicatorHTML += '<a href="#">' + (i + 1) + '</a>'

$inditator.html indicatorHTML

###
# 関数の定義
###

# 任意のスライドを表示する
goToSlide = (index) ->
  $slideGroup.animate
    left: -100 * index + '%'
  , duration, easing

  # 現在のスライドのインデックスを上書き
  currentIndex = index

# スライドのタイマーを開始する
startTimer = ->
  timer = setInterval ->
    # 現在のスライドのインデックスに応じで次に表示するスライドの決定
    # もし最後のスライドなら最初のスライドへ
    nextIndex = (currentIndex + 1) % slideCount
    goToSlide nextIndex
  , intarval

###
# スライドショーの開始
###

# 最初のスライドを表示
goToSlide currentIndex

# タイマーをスタート
startTimer()
