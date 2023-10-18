//
//  ContentView.swift
//  CaritasCollect
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Banner()
                .frame(width: .infinity, height: 80)
                .ignoresSafeArea()
                .padding(.bottom, 20)
            LoginScreen()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
