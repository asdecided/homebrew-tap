# Homebrew tap for RAC and AsDecided

Install the complete local toolchain:

```sh
brew install itsthelore/tap/rac-full
```

Or install only the native engine:

```sh
brew install itsthelore/tap/decided
```

`decided` installs the native `decided` CLI and `decided-mcp` read-only MCP
server from signed-version GitHub Release archives published by
[`itsthelore/rac-core`](https://github.com/itsthelore/rac-core).

`rac-full` is the stable umbrella entry point. Today it includes the native
engine. RAC CI integrations remain GitHub Actions consumed from
[`itsthelore/rac-ci`](https://github.com/itsthelore/rac-ci); Python SDK,
ingestion, and connector companions will be added as their independent
distributions become release-ready.
