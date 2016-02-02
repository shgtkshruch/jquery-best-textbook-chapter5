$container = $ '.slideshow'
$slideGroup = $container.find '.slideshow-slides'
$slides = $slideGroup.find '.slide'
$nav = $container.find '.slideshow-nav'
$indicator = $container.find '.slideshow-indicator'

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

$indicator.html indicatorHTML

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

  updateNav()

# スライドの状態に応じてナビゲーションとインジケーターを更新する
updateNav = ->
  $navPrev = $nav.find '.prev'
  $navNext = $nav.find '.next'

  # もし最初のスライドならPrevナビゲーションを無効に
  if currentIndex is 0
    $navPrev.addClass 'disabled'
  else
    $navPrev.removeClass 'disabled'

  # もし最後のスライドならNextナビゲーションを無効に
  if currentIndex is slideCount - 1
    $navNext.addClass 'disabled'
  else
    $navNext.removeClass 'disabled'

  $indicator
    .find 'a'
    .removeClass 'active'
    .eq currentIndex
    .addClass 'active'

# スライドのタイマーを開始する
startTimer = ->
  timer = setInterval ->
    # 現在のスライドのインデックスに応じで次に表示するスライドの決定
    # もし最後のスライドなら最初のスライドへ
    nextIndex = (currentIndex + 1) % slideCount
    goToSlide nextIndex
  , intarval

# スライドのタイマーを止める
stopTimer = ->
  clearInterval timer

###
# イベントの登録
###

# ナビゲーションのリンクがクリックされたら該当するスライドを表示
$nav.on 'click', 'a', (event) ->
  event.preventDefault()
  if $(@).hasClass 'prev'
    goToSlide currentIndex - 1
  else
    goToSlide currentIndex + 1

# インジケーターのリンクがクリックされたら該当するスライドを表示
$indicator.on 'click', 'a', (event) ->
  event.preventDefault()
  if !$(@).hasClass 'acvive'
    goToSlide $(@).index()

# マウスが乗ったらタイマーを停止、はずれたら開始
$container.on
  mouseenter: stopTimer
  mouseleave: startTimer

###
# スライドショーの開始
###

# 最初のスライドを表示
goToSlide currentIndex

# タイマーをスタート
startTimer()
