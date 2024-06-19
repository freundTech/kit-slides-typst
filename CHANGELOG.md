Changelog
=========

This file lists new additions and breaking changes. Consult it when updating your presentations to a newer version of the template.

## 0.3.2
* Added GitLab CI configuration
* Added Changelog

## 0.3.1
* Fixed outdated information in README

## 0.3.0
* The `group-logo` argument of `kit-theme` now takes `content` instead of a file path. If you previously passed a path to an image file just wrap it in `image()`.
* The `banner` argument of `title-slide` now takes `content` instead of a file path. If you previously passed a path to an image file just wrap it in `image()`.
* Added pixi configuration for easier compiling and linting
* Removed podman-compose configuration. Consider using pixi instead.
* Internal rework. Update typst version to 0.11.1
