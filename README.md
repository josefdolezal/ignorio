# ignorio [![Build Status](https://travis-ci.com/josefdolezal/ignorio.svg?token=AxpSW7yys3aiQpPG9zMW&branch=master)](https://travis-ci.com/josefdolezal/ignorio) [![codecov](https://codecov.io/gh/josefdolezal/ignorio/branch/master/graph/badge.svg)](https://codecov.io/gh/josefdolezal/ignorio)
Ignorio is a pure Swift command line tool helping you create `.gitignore` file for your project based on templates from [gitignore.io](https://gitignore.io).

For basic usage, just run:

```bash
$ ignorio create macos xcode swift > .gitignore
```

This will fetch a `.gitignore` template for list of given types. The template will be printed to the standard output so be sure to redirect it into your `.gitignore`.

<p align="center">
    <br />
	<a href="https://github.com/josefdolezal/ignorio/"><img src="assets/cli.gif" alt="Ignorio terminal CLI" /></a>
</p>

## Install

<details open>
<summary>Brew</summary>

The recommended way to install `ignorio` is with brew package manager:

```bash
$ brew install josefdolezal/formulae/ignorio
```

Or you can add the custom Tap and refer to the app by its name:

```bash
$ brew tap josefdolezal/formulae
$ brew install ignorio
```

</details>

<details>
<summary>From source</summary>

If you prefer to build the app from source manually, you can use `make`:

```bash
$ make
$ swift run ignorio <COMMAND>
```

</details>

## Usage

Currently, following commands are supported by ignorio.

### Create

Fetches `.gitignore` template for given list of types. 

```bash
$ ignorio create macos xcode swift
```

### List

Prints list of types which may be used to create template.

```bash
$ ignorio list
```

### Search

Not sure if your type is supported? The list representation is not so convenient, but you can use search instead!

```bash
$ ignorio search swift
```

## Dependencies

Ignorio is build on top of following dependencies:

* [Commander](https://github.com/kylef/Commander), licensed under `BSD 3-clause`
* [Result](https://github.com/antitypical/Result), licensed under `MIT`

Big thanks to its creators and contributors! :tada:

## License

This repository is licensed under [MIT](LICENSE).
