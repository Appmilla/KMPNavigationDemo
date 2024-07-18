A Kotlin Multiplatform (KMP) App showing native and shared ui in the same app. Using SwiftUI screens and Compose Multiplatform screens with UIKit navigation on iOS.

Koin is used for DI and Touchlab's SKIE to consume the VieWModels Flows.

A [blog article](https://appmilla.com/latest/harnessing-the-power-of-kotlin-multiplatform-combining-native-and-shared-uis/) accompanies the code.

The app reads data from the [NewsAPI](https://newsapi.org). Please go to the site, get an API key, and paste this into the NewsArticleRepository's getNews() function.

```kotlin
fun getNews(): Flow<List<Article>> = flow {
        val apiKey = "YourAPIKey"
```

This is a Kotlin Multiplatform project targeting Android, iOS.

* `/composeApp` is for code that will be shared across your Compose Multiplatform applications.
  It contains several subfolders:
  - `commonMain` is for code that’s common for all targets.
  - Other folders are for Kotlin code that will be compiled for only the platform indicated in the folder name.
    For example, if you want to use Apple’s CoreCrypto for the iOS part of your Kotlin app,
    `iosMain` would be the right folder for such calls.

* `/iosApp` contains iOS applications. Even if you’re sharing your UI with Compose Multiplatform, 
  you need this entry point for your iOS app. This is also where you should add SwiftUI code for your project.

* `/shared` is for the code that will be shared between all targets in the project.
  The most important subfolder is `commonMain`. If preferred, you can add code to the platform-specific folders here too.


Learn more about [Kotlin Multiplatform](https://www.jetbrains.com/help/kotlin-multiplatform-dev/get-started.html)…
