$window = $ window
$header = $ '.page-header'

#ヘッダーのクローンを生成して、bodyに挿入
$headerClone = $header.contents().clone()
$headerCloneContainer = $ '<div class="page-header-clone"></div>'
$headerCloneContainer
  .append $headerClone
  .appendTo 'body'

# HTMLの上辺からヘッダーの底辺までの距離
threshold = $header.offset().top + $header.outerHeight()

$window.on 'scroll', ->
  if $window.scrollTop() > threshold
    $headerCloneContainer.addClass 'visible'
  else
    $headerCloneContainer.removeClass 'visible'

# windowのスクロールイベントを発生させる
# ヘッダーの初期位置を調整するため
$window.trigger 'scroll'
