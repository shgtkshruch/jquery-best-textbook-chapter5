$work = $ '#work'
$tabList = $work.find '.tabs-nav'
$tabAnchors = $tabList.find 'a'
$tabPanels = $work.find '.tabs-panel'

$tabList.on 'click', 'a', (event) ->
  event.preventDefault()

  $this = $ @

  # もしすでに選択されたタブならなにもせずに処理を中止
  if $this.hasClass 'active' then return

  # すべてのタブの選択状態をいったん解除し、
  # クリックされたタブを選択状態に
  $tabAnchors.removeClass 'active'
  $this.addClass 'active'

  # すべてのパネルをいったん非表示にし、
  # クリックされたタブに対応するパネルを表示
  $tabPanels.hide()
  $ $this.attr 'href'
    .show()

# 最初のタブを選択状態に
$tabAnchors
  .eq 0
  .trigger 'click'
