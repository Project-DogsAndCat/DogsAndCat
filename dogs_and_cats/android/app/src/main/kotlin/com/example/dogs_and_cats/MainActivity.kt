package com.example.dogs_and_cats

import io.flutter.embedding.android.FlutterActivity
import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity()


class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("ru_RU")
        MapKitFactory.setApiKey("d6a559ee-febe-4539-b728-7f6d70c8e58f")
    }
}