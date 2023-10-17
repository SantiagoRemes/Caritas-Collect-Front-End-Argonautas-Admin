//
//  Banner.swift
//  CaritasCollect
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct Banner: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 200.0)
                .foregroundColor(Color("1575C"))
                .frame(maxWidth: .infinity)
            Text("Cáritas Collect")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .offset(y: 50)
        }
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}
