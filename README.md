# Gruppe Adler Mod

[![GitHub tag](https://img.shields.io/github/tag/gruppe-adler/gruppe_adler_mod.svg)](https://github.com/gruppe-adler/gruppe_adler_mod/releases)
![build](https://github.com/gruppe-adler/gruppe_adler_mod/workflows/CI/badge.svg)
![ACE SQF validator](https://github.com/gruppe-adler/gruppe_adler_mod/workflows/ACE%20SQF%20validator/badge.svg)

Gruppe Adler Mod is a collection of Gruppe Adler original addons, that add new functionality or modify and improve existing functionality to suit our Arma gameplay.

## For Developers

### Releasing

Versioning is handled by `addons\main\script_mod.hpp`, which is automatically updated by our build script. Deployment is handled by Travis CI upon creation of a new GitHub release tag.

### Building

Use `tools/build.sh` to create a packed version of the mod in `\release`.

#### Windows

Open the Git Shell from Github for Windows, and type `bash tools\build.sh`

#### Linux

Execute `tools/build.sh`.

### Adding stuff

Only when adding new files to the *root directory* you will have to edit `build.sh` to include it into the builds.
