<p align="center">
  <img src="icons/icon-96.png" width="72" height="72" alt="Gradient Remover icon">
</p>

<h1 align="center">Gradient Remover for HBO Max</h1>

<p align="center">Removes the video player's dark scrims while keeping click-to-pause working.</p>

<p align="center">
  <a href="https://addons.mozilla.org/firefox/addon/gradient-remover-for-hbo-max/"><img src="https://img.shields.io/amo/v/gradient-remover-for-hbo-max?logo=firefoxbrowser&label=Firefox" alt="Firefox Add-on version"></a>
  <img src="https://img.shields.io/badge/Chrome-MV3-4285F4?logo=googlechrome&logoColor=white" alt="Chrome Manifest V3">
  <img src="https://img.shields.io/github/repo-size/OlleOltorp/hbomax-gradient-remover?label=size" alt="Repository size">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/OlleOltorp/hbomax-gradient-remover" alt="MIT license"></a>
</p>

## Install

- **Firefox:** [Add to Firefox](https://addons.mozilla.org/firefox/addon/gradient-remover-for-hbo-max/)
- **Chrome:** Chrome Web Store release pending; the upload package can be built below.

## How it works

A single CSS content script removes only the visual gradient. No JavaScript, tracking, or data collection.

## Build

```powershell
./build.ps1
```

Creates `extension-firefox.zip` and `extension-chrome.zip`, ready for their respective stores.

## Commits

Use one-line Conventional Commits: `feat: ...`, `fix: ...`, or `docs: ...`.

## License

[MIT](LICENSE)
