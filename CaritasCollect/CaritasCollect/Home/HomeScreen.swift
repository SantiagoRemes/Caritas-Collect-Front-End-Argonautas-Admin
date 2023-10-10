//
//  ContentView.swift
//  CaritasCollect
//
//  Created by Alumno on 05/09/23.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedTab = 0
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        TabView(selection: $selectedTab) {
            RecoleccionesView()
                .tag(0)
                .tabItem {
                    Label("Home", systemImage: "house.circle")
                }

            ConfiguracionView()
                .tag(1)
                .tabItem {
                    Label("Configuracion", systemImage: "gearshape.fill")
                }

            Text("Log Out")
                .tag(2)
                .tabItem {
                    Label("Log Out", systemImage: "door.left.hand.open")
                }
        }
        .tint(.white)
        .onAppear {
            UITabBar.appearance().barTintColor = UIColor(Color("302C"))
            UITabBar.appearance().backgroundColor = UIColor(Color("302C"))
        }
        .onChange(of: selectedTab) { newTab in
            if newTab == 2 {
                dismiss()
            }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
