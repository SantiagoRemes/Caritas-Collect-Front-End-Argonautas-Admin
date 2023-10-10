//
//  CaritasCollectApp.swift
//  CaritasCollect
//
//  Created by Alumno on 05/09/23.
//

import SwiftUI

@main
struct CaritasCollectApp: App {
    @StateObject var globalData = GlobalData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(globalData)
        }
    }
}
