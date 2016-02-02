$slides = $('.slideshow').find 'img'
slideCount = $slides.length
currentIndex = 0

# 1番目のスライドをフェードインで表示
$slides
  .eq currentIndex
  .fadeIn()

showNextSlide = ->

  # 次に表示するスライドのインデックス
  # (もし最初のスライドなら最初に戻る)
  nextIndex = (currentIndex + 1) % slideCount

  $slides
    .eq currentIndex
    .fadeOut()
    .end()
    .eq nextIndex
    .fadeIn()

  currentIndex = nextIndex

setInterval showNextSlide, 7500
