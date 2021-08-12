# Gruppe Adler Mod

[![GitHub tag](https://img.shields.io/github/tag/gruppe-adler/grad_mod.svg)](https://github.com/gruppe-adler/grad_mod/releases)
![build](https://github.com/gruppe-adler/grad_mod/workflows/CI/badge.svg)

Gruppe Adler Mod is a collection of Gruppe Adler original addons that add new functionality or modify and improve existing functionality to suit our Arma gameplay.  
Next to this mod there is also [Gruppe Adler Extras](https://github.com/gruppe-adler/grad_extras). Addons in Gruppe Adler Extras can have additional dependencies other than CBA and ACE.

## Dependencies
- CBA
- ACE3

## For Developers

We're using [HEMTT](https://github.com/synixebrett/HEMTT).

### Releasing
- Update `addons\main\script_version.hpp`
- Commit your changes
- Create tag on GitHub
- NO NEED to upload the built mod. A GitHub Action workflow will take care of that

### Building
On Linux:
```
hemtt build --release
```
On Windows:
```
start build-hemtt.bat 
```
