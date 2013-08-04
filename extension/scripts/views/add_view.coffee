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
            <button>Cancel</button>
            <button>Add to Collections(s)</button>
          </div>
        </div>
      </div>
    </div>
  </div>
"""


body.appendChild(container)

setTimeout(->
  document.getElementById("BH-add-to-collection").className = "overlay"
, 0)
