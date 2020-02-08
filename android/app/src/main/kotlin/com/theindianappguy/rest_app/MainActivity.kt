package com.theindianappguy.rest_app

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.app.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
    fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
