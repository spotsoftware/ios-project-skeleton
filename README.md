# SPTSkeleton

This is a skeleton for iOS projects.


## Contents

* **CocoaPods support**: Really DRY `Podfile` and `PodSpec`
* **Common dependencies already included**:
	* `CocoaLumberjack`: Used for logging purpose (*Lorenzo should be happy now*).
	* `RBStoryboardLink`: Used for linking multiple storyboards.
  
  Of course you can customize them in the `PodSpec` file.

## Notes for developers

* After modifications to the `PodSpec`, please run: `pod spec lint SPTSkeleton.podspec`.
* Please keep in mind that the `PodSpec` assumes that you have both a `README.md` file and a `LICENSE` file in your project root directory.

### Setup

* To use a project like this you should have cocoapods installed: `sudo gem install cocoapods`.
* Please note that there is a cocoapods plugin for XCode (useful if you don't like the command-line).
