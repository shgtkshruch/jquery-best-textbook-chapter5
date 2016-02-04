$window = $ window
$header = $ '.page-header'

# ヘッダーのデフォルト位置を取得
headerOffsetTop = $header.offset().top

$window.on 'scroll', ->
  if $window.scrollTop() > headerOffsetTop
    $header.addClass 'sticky'
  else
    $header.removeClass 'sticky'

# windowのスクロールイベントを発生させる
# ヘッダーの初期位置を調整するため
$window.trigger 'scroll'
