package com.appmilla.kmpnavigationdemo.di

import androidx.navigation.NavHostController
import navigation.AndroidRouter
import navigation.Router
import org.koin.dsl.module

val androidModule = module {
    single<Router> { createAndroidRouter(get()) }
}

fun createAndroidRouter(navController: NavHostController): AndroidRouter {
    return AndroidRouter(navController)
}
