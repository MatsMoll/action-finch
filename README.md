# GitHub Action for Finch

This Action executes [Finch](https://github.com/namolnad/Finch) to generate a change log and publishes a new release.

## Usage

An example workflow(`.github/workflows/finch.yml`) to executing Finch follows:

```yaml
name: Finch

on:
  pull_request:
    paths:
      - '.github/workflows/finch.yml'
      - 'finch-config.yml'
      - '**/*.swift'

jobs:
  SwiftLint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: GitHub Action for Finch
        uses: MatsMoll/action-finch@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITHUB_REPOSITORY: ${{ secrets.GITHUB_REPOSITORY }}
          GITHUB_SHA: ${{ secrets.GITHUB_SHA }}
          FINCH_CONFIG: "finch-config.yml" # Optional
```

## Secrets

- ~~Specifying `GITHUB_TOKEN`, `GITHUB_REPOSITORY` and `GITHUB_SHA` to `secrets` is required in order to publish new releases.

## Version bump

In order to release a minor or major release, start the latest git log with `[Major]` or `[Minor]`.

## Example output
```
# 6.13.0 (3242)

### Release Manager

 - @User.2

### Features
 - |wip||custom-lib| initial work on incorporating 1.0.0 — [PR #912](https://github.com/your_repo/pull/912) — @User.3
 - |checkout| improved tracking + logging — [PR #958](https://github.com/your_repo/pull/958) - @User.2

### Bug Fixes
 - |cleanup| remove unused obj-c experiment, fix some warnings — [PR #949](https://github.com/your_repo/pull/949) — @User.1
 - |cleanup| remove unused Lib — [PR #947](https://github.com/your_repo/pull/947) - @User.3

### Platform Improvements
 - |tooling| re-enable new build system — [PR #959](https://github.com/your_repo/pull/959) — @User.1
 - |platform| move to incremental compilation and ensure we're using same swift version across the board — [PR #966](https://github.com/your_repo/pull/966) — @User.2

### Timeline
 - Begin development:
 - Feature cut-off / Start of bake / dogfooding:
 - Submission:
 - Release (expected):
 - Release (actual):

```
View the [Finch](https://github.com/namolnad/Finch) repo for more info

## Author

Mats E. Mollestad

## License

[MIT](LICENSE)
