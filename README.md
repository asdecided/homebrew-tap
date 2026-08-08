# Homebrew tap for AsDecided

[Install guide](https://asdecided.com/docs/vendor/core/quickstart/) · [Product site](https://asdecided.com/) · [Release record](https://asdecided.com/changelog/v0.26.2)

Install the native engine and MCP server:

```sh
brew install asdecided/tap/asdecided-core
```

`asdecided-core` installs the native `decided` CLI and `decided-mcp` read-only MCP
server from signed-version GitHub Release archives published by
[`asdecided/core`](https://github.com/asdecided/core).

`asdecided-full` is reserved for the complete ecosystem install. It will be
added only when the SDK, connectors, editors, and other companions have
independent release artifacts that this tap can install honestly.

CI integrations are GitHub Actions consumed from
[`asdecided/ci`](https://github.com/asdecided/ci).

Deterministic code enforcement is available directly from the public Sentry
Action:

```yaml
- uses: asdecided/sentry@v0.26.0
```
