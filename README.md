# Gathering Data from iOS

This is the sample code and project for the tutorial on using the Nexosis Swift API Client to gather user data from iOS. It shows how to
collect user input and sensor data and push it to the Nexosis API.

## Getting Started

Install Cocoapods if you never have:

`$ sudo gem install cocoapods`

Clone this repo:

`$ git clone git@github.com:Nexosis/sample-swift-grumply.git`

Copy Settings.plist:

`$ cp Grumply/Settings.plist.example Grumply/Settings.plist`

Edit `Grumply/Settings.plist` and replace _YOUR API KEY_ with __your__ API key.

Install pods:

`$ pod install`

Launch Xcode:

`$ open Grumply.xcworkspace`

### Extra Step
If you are using Cocoapods 1.3, there is a bug where the swift version is not set to match the pods that are installed. For this repo, Alamofire
will not compile. Set it Swift version to 3.2 and you'll be golden!