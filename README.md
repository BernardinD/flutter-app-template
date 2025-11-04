## Bootstrap the dev environment

Fill `.bootstrap.psd1`, then run:

```powershell
pwsh scripts/bootstrap.ps1
```

This downloads the central module from `flutter-bootstrap-tools` (pinned by version),
caches it under `%USERPROFILE%\.flutter-bootstrap\<version>\`, and applies your project config.
