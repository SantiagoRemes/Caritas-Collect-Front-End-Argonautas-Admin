//
//  LoginScreen.swift
//  CaritasCollect
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

import SwiftUI

struct LoginScreen: View {
    
    @State private var username : String = ""
    @State private var password : String = ""
    @State private var mensaje : String = ""
    @State var response : Get = Get(id: 0, mensaje: "", success: false)
    
    var body: some View {
        NavigationStack {
            VStack {
                
                    
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("302C"))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("Nombre de Usuario")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("320C"))
                    .padding(.top)
                TextField("Nombre", text: $username)
                    .frame(width: 300)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                Text("Contraseña")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("320C"))
                SecureField("Contraseña", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300)
                    .padding(.bottom)
                
                
                Button {
                    response = login(username: username, password: password)
                    if (!response.success) {
                        mensaje = response.mensaje
                    }
                } label: {
                    Text("Entrar")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40.0)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("302C"))
                .padding(.top)
                .offset(y: 10)
                .background(NavigationLink("", isActive: $response.success){
                    HomeScreen()
                        .toolbar(.hidden)
                })
                
                Text(mensaje)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
                    .padding(.top, 30.0)
                
                Image("logo-caritas")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400.0)
                    .ignoresSafeArea()
                    .offset(y: -20)
            }
            .padding()
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
