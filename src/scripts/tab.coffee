$container = $ '.work-section'
$navItems = $container.find '.tabs-nav li'
$highlight = $container.find '.tabs-highlight'

# ハイライト位置を調整する関数
moveHighlight = (event, ui) ->
  $newTab = ui.newTab || ui.tab
  left = $newTab.position().left
  $highlight.animate
    left: left
  , 500, 'easeOutExpo'

$container.tabs
  hide:
    duration: 250
  show:
    duration: 125
  create: moveHighlight
  activate: moveHighlight

