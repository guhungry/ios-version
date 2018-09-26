# iOS Version
[![Build Status](https://travis-ci.org/guhungry/ios-version.svg?branch=master)](https://travis-ci.org/guhungry/ios-version)
[![codecov](https://codecov.io/gh/guhungry/ios-version/branch/master/graph/badge.svg)](https://codecov.io/gh/guhungry/ios-version)
[![LICENSE](https://img.shields.io/cocoapods/l/WCVersion.svg?style=flat)](https://github.com/guhungry/ios-version/blob/master/LICENSE)
[![Platform compatible](https://img.shields.io/cocoapods/p/WCVersion.svg?style=flat)](https://cocoapods.org/pods/WCVersion)

Simple version number compare in MAJOR(.MINOR)?(.PATCH)? format

Supports compare using ==, !=, >, >=, < and <=

## Download
Install using CocoaPods, add dependency in `Podfile`:
```
pod 'WCVersion', '~> 0.0.0'
```
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/WCVersion.svg?style=flat)](https://cocoapods.org/pods/WCVersion)

## Examples

### Import
```swift
import WCVersion
```

### Initialize
```swift
let version1 = VersionNumber("5")
let version2 = VersionNumber("3.8")
let version3 = VersionNumber("1.2.3")
```

### Comparing
```swift
VersionNumber("1.2.3") > VersionNumber("1.5.3")
false

VersionNumber("1.2.3") < VersionNumber("1.5.3")
true

VersionNumber("1.2.3") == VersionNumber("1.5.3")
false

VersionNumber("4.1.7") < VersionNumber("2.5.2")
false

VersionNumber("4.1.7") > VersionNumber("2.5.2")
true

VersionNumber("4.1.7") == VersionNumber("2.5.2")
false

VersionNumber("9.1.2") < VersionNumber("9.1.5")
true

VersionNumber("9.1.2") > VersionNumber("9.1.5")
false

VersionNumber("9.1.2") == VersionNumber("9.1.5")
false

VersionNumber("2.3.1") > VersionNumber("2.3.1")
false

VersionNumber("2.3.1") < VersionNumber("2.3.1")
false

VersionNumber("2.3.1") == VersionNumber("2.3.1")
true
```
