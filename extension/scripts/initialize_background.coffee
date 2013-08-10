settings = if localStorage['settings']? then JSON.parse(localStorage['settings']) else {}

window.selectionContextMenu = new BH.Lib.SelectionContextMenu()

if settings.searchBySelection != false
  selectionContextMenu.create()

window.pageContextMenu = new BH.Lib.PageContextMenu()
pageContextMenu.listenToTabs()

if settings.searchByDomain != false
  pageContextMenu.create()

browserActions = new BH.Lib.BrowserActions()
browserActions.listen()

omnibox = new BH.Lib.Omnibox()
omnibox.listen()

chrome.commands.onCommand.addListener (command) ->
  # Insert a infobar (DEV only)
  chrome.tabs.query {active: true, currentWindow: true}, (tabs) ->
    chrome.infobars.show
      tabId: tabs[0].id
      path: 'infobar.html'

  # Insert a modal in the active page
  chrome.tabs.executeScript(null, {file: "scripts/views/add_view.js"})
  chrome.tabs.insertCSS(null, {file: "styles/chrome-bootstrap.css"})
