body = document.getElementsByTagName('body')[0]

container = document.createElement('div')
container.className = 'chrome-bootstrap'
container.innerHTML = """
  <div id="BH-add-to-collection" class="overlay transparent">
    <div class="page">
      <h1>Add to Collections</h1>
      <div class="content-area">
        #{window.location.href}
      </div>
      <div class="action-area">
        <div class="action-area-right">
          <div class="button-strip">y
            <button id="BH-cancel">Cancel</button>
            <button id="BH-add">Add to Collections(s)</button>
          </div>
        </div>
      </div>
    </div>
  </div>
"""

body.appendChild(container)

setTimeout(->
  document.getElementById("BH-add-to-collection").className = "overlay"

  console.log localStorage
  document.getElementById('BH-cancel').addEventListener('click', ->
    body.removeChild(container)
  , false)

  document.getElementById('BH-add').addEventListener('click', ->
    notification = webkitNotifications.createNotification null, 'Page tagged', 'stored it!'
    notification.show()
    body.removeChild(container)
  , false)
, 0)
