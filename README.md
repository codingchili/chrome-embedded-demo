# chrome-embedded-demo
Simple demo using the chrome embedded framework with CFE4Delphi to load a Polymer2 SPA as a desktop App.

![preview.png](https://raw.githubusercontent.com/codingchili/chrome-embedded-demo/master/preview.png)

# Building :cold_sweat:
1. Install CEF4Delphi: https://www.briskbard.com/index.php?lang=en&pageid=cef as a component in your IDE.
2. Add library path to /sources.
3. Open this project
4. Download required runtime dependencies for the CEF library [from spotify.](http://opensource.spotify.com/cefbuilds/index.html).
5. Copy files from /Release and /Resources into the build output folder.
6. Build the project and run.

# What now :confused:
- Passing messages between the web context and the desktop app?
- Find an actual use-case/project where we can use this.

# Why CEF? :boom:
- it provides strong and rich client features, such as HTML5, css, javascript audio playback etc.
- its used by Steam, Spotify, Battle.net, League of Legends, UPlay, Minecraft, Unity 3D, Unreal Engine
- cant we just use the browser? well sometimes you just want to be a desktop app I guess.

What is the chrome embedded framework? :cat:
- [for a brief introduction](https://en.wikipedia.org/wiki/Chromium_Embedded_Framework)
