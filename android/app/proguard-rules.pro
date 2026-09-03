-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class com.fluttercandies.photo_manager.** { *; }

# Keep Flutter engine deferred component manager
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-keep class io.flutter.app.FlutterPlayStoreSplitApplication { *; }

# Keep Google Play Core split install
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }