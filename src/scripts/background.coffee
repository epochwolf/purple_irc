chrome.app.runtime.onLaunched.addListener ->
  chrome.app.window.create 'app/index.html', width: 400, height: 400, left: 0, top: 0
