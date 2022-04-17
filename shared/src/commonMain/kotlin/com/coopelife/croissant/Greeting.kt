package com.coopelife.croissant

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}