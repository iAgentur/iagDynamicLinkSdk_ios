# DeeplinkSDK for iOS

**DeeplinkSDK** is a lightweight SDK for handling dynamic links and deep linking in iOS applications.

---

## Requirements

- iOS 14.0+
- Swift 5.9+
- Xcode 15+

---

## 📦 Installation

### CocoaPods

1. Add the following to your `Podfile`:

    ```ruby
    use_frameworks!

    target 'YourAppTarget' do
      pod 'DeeplinkSDK', :git => 'https://github.com/iAgentur/iagDynamicLinkSdk_ios.git', :tag => '0.1.2'
    end
    ```

2. Install the dependency:

    ```bash
    pod install
    ```

---

### Swift Package Manager (SPM)

#### Option 1 — Using Xcode

1. Open your project in Xcode.
2. Go to **File > Add Packages…**.
3. Enter the URL of the repository:

    ```
    https://github.com/iAgentur/iagDynamicLinkSdk_ios.git
    ```

4. Select the version **0.1.2** (or the latest release).
5. Add the `DeeplinkSDK` product to your app target.

#### Option 2 — Using `Package.swift`

Add the package to your `dependencies` array:

```swift
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "YourApp",
    dependencies: [
        .package(url: "https://github.com/iAgentur/iagDynamicLinkSdk_ios.git", from: "0.1.2")
    ],
    targets: [
        .target(
            name: "YourApp",
            dependencies: ["DeeplinkSDK"]
        )
    ]
)
```

---

## App Setup: Associated Domains

For **Universal Links** to work, the host you register with `DeeplinkSDK` must also be listed in your app target's **Associated Domains** capability.

1. In Xcode, open your app target settings.
2. Go to **Signing & Capabilities**.
3. Add a new capability: **Associated Domains**.
4. Add your domain in the format:
   ```
   applinks:example.com
   ```
   Replace `example.com` with your actual host.

> Without this step, your app will not open from Universal Links for the registered host.

Additionally, the host must serve a valid **Apple App Site Association (AASA)** file from the `https://<your-domain>/.well-known/` directory.

- The file should be named exactly: `apple-app-site-association`
- It must be served **without** a `.json` extension and with `Content-Type: application/json`
- Include the proper app identifiers and paths for your app.

Example minimal AASA file:
```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appID": "<TEAM_ID>.<BUNDLE_IDENTIFIER>",
        "paths": ["*"]
      }
    ]
  }
}
```

> Apple caches this file, so after changes, it may take some time to propagate.


---

## Quick Start

### 1) Import and register host(s)

Before resolving links from a domain, register that **host** with its **API key**:

```swift
import DeeplinkSDK

// Typically early in app start (e.g., AppDelegate didFinishLaunching)
DeeplinkSDK.registerHost("example.com", apiKey: "<YOUR_API_KEY>")
```

- You can register **multiple** hosts:
  ```swift
  DeeplinkSDK.registerHost("example.com", apiKey: "<KEY_A>")
  DeeplinkSDK.registerHost("sample.com", apiKey: "<KEY_B>")
  ```

### 2) Resolve an incoming dynamic link

```swift
func resolve(_ url: URL) {
    DeeplinkSDK.getDynamicLink(from: url) { deeplinkData, error in
        if let error = error {
            print("Resolution failed: \(error)")
            return
        }
        guard let data = deeplinkData else {
            print("No deeplink data found")
            return
        }

        // Example usage (adjust to your DeeplinkData fields)
        if let iosUrl = data.iosUrl {
            // Route user into your app using iosUrl
            handleResolvedDeepLink(iosUrl)
        } else {
            // Fallbacks (e.g., web URL) if your schema provides one
            // handleResolvedDeepLink(data.webUrl)
        }
    }
}
```

## Author

iAgentur AG, info@iagentur.ch
