# StepSDK

This library supports only iOS 13+ and is implemented with Swift 5.7

This framework can be divided into two parts.

Connection to in-app providers: APPLE HEALTH and FREESTYLELIBRE
Connection to the REST API
To fully make use of this package, you will need a developer account enrolled in Apple's developer program.

The framework must be added as a dependency to your project. This can be done simply by editting your App's dependencies and adding TerraiOS as a dependency with the following location: https://github.com/tryterra/TerraiOS.git. You will also need to add TerraiOS to Frameworks as well!

This will then allow you to import the framework as import TerraiOS.

For APPLE HEALTH

This library uses HealthKit for iOS v13+. It thus would not work on iPad or MacOS or any platform that does not support Apple HealthKit. Please add HealthKit as a capability to the project as well as to Frameworks.

Also you must include the following keys in your Info.plist file: Privacy - Health Share Usage Description and Privacy - Health Records Usage Description

The framework automatically assumes you want to use Background Delivery if you initialise a connection for Apple Health.

To enable this, you will need to enable a few things:

Enable Background Delivery in HealthKit Entitlements
Add Background Modes as a Capability to your project and enable Background Fetch and Background Processing
Add the Permitted background task scheduler identifiers key to your info.plist with one item:
co.tryterra.data.post.request
After this, you will have to simply run:

Terra.setUpBackgroundDelivery()
in your app delegate's didFinishLaunchingWithOptions delegate function, i.e:

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Terra.setUpBackgroundDelivery()
        // Override point for customization after application launch.
        return true
    }
Thats it!


