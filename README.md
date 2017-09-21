# Gruppe Adler Mod

[![GitHub tag](https://img.shields.io/github/tag/gruppe-adler/gruppe_adler_mod.svg)](https://github.com/gruppe-adler/gruppe_adler_mod/releases)
[![Build Status](https://travis-ci.org/gruppe-adler/gruppe_adler_mod.svg?branch=master)](https://travis-ci.org/gruppe-adler/gruppe_adler_mod)

## Releasing
Versioning is handled by `addons\main\script_mod.hpp`. Increase *MAJOR*, *MINOR* and/or *PATCHLVL* defines before every release. Create a matching GitHub tag.

## Building
On the operating system of your choice, execute `tools\build.sh`. This will create a packed version of the mod in `\release`.

When adding new files to the GitHub repo, that should not be included in the packed release version, edit `build.sh` and add the file names to the `excluded` array in the *CONFIG* section.
