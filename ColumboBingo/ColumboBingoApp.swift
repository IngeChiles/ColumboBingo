//  ColumboBingoApp.swift
//  ColumboBingo
//  Made with ♥︎ by Inge Chiles on 4/29/24.

import SwiftUI

@main
struct ColumboBingoApp: App {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont(name: "futura-bold", size: 37)!,
            .foregroundColor: UIColor.columboYellow
        ]
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
