//
//  Banner.swift
//  CaritasCollect
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct Banner: View {
    var body: some View {
        VStack {
            Text("Cáritas Collect")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .offset(y: 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // 1
                .background(Color("1575C"))
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}
