# BLE Crash Test
This small program shows how to reproduce an abort trap (SIGABORT) when running a BLE central manager on macOS on some terminals (iTerm).
When we removing the `queue` parameter in the CBCentralManager init method, that works fine.

# Usage
Run `make run`
