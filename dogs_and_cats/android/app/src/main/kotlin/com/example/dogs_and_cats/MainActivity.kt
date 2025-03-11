package com.example.dogs_and_cats

import io.flutter.embedding.android.FlutterActivity
import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity()


class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("en_U") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("5bf3e0f2-9f1b-41e0-b41a-8de6b2c97523") // Your generated API key
    }
}
