package com.appmilla.kmpnavigationdemo

import android.app.Application
import com.appmilla.kmpnavigationdemo.di.androidModule
import di.KoinInitializer

class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        KoinInitializer(applicationContext).init(androidModule)
    }
}