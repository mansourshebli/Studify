//
//  OnboardingView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 11/11/2023.
//

import SwiftUI

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}

struct CircleOption: View {
    var imageName: String
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 100, height: 90)
            .overlay(
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 90)
                    .foregroundColor(.white)
            )
            .onTapGesture {
                onTap()
            }
            .opacity(isSelected ? 0.5 : 1.0)
            .animation(.easeInOut)
    }
}

struct OnboardingView: View {
    @Binding var onboardingCompleted: Bool
    @State var selectedProfile: Int?
    @AppStorage("userName") var userName: String = ""
    @State private var showError: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Spacer()

                Text("Welcome to Studify!")
                    .font(.custom("Rubik-Regular", size: 70))
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing)
                    )
                    .padding()

                TextField("Enter your name", text: $userName)
                    .foregroundColor(.white)
                    .padding()
                    .textFieldStyle(OvalTextFieldStyle())
                    .autocapitalization(.words)

                Text("Choose a Profile Picture")
                    .font(.custom("Rubik-Regular", size: 30))
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing)
                    )
                    .padding()

                HStack(spacing: 40) {
                    CircleOption(imageName: "user-boy", isSelected: selectedProfile == 1) {
                        selectedProfile = 1
                    }
                    CircleOption(imageName: "user-girl", isSelected: selectedProfile == 2) {
                        selectedProfile = 2
                    }
                }
                .padding()

                Spacer()

                Button(action: {
                    if let _ = selectedProfile, !userName.isEmpty {
                        UserDefaults.standard.set(selectedProfile, forKey: "selectedProfile")
                        onboardingCompleted = true
                    } else {
                        showError = true
                    }
                }) {
                    Text("Continue")
                        .font(.custom("Rubik-Regular", size: 25))
                        .foregroundColor(.white)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                }
                .padding()
                .alert(isPresented: $showError) {
                    Alert(
                        title: Text("Error"),
                        message: Text("Please fill in all fields."),
                        dismissButton: .default(Text("OK"))
                    )
                }

                Spacer()
            }
            .background(Color.gray.opacity(0.1).ignoresSafeArea())
        }
        .background(Rectangle()
            .foregroundColor(.clear)
            .frame(width: 310.57645, height: 310.57645)
            .background(
                EllipticalGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.42, green: 0.91, blue: 1), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.74, green: 0.95, blue: 1), location: 0.53),
                        Gradient.Stop(color: .white, location: 1.00),
                    ],
                    center: UnitPoint(x: 0.5, y: 0.5)
                )
            )
            .cornerRadius(310.57645)
            .position(y: 700))
        .background(Rectangle()
            .foregroundColor(.clear)
            .frame(width: 310.57645, height: 310.57645)
            .background(
                EllipticalGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 1, green: 0.96, blue: 0.69), location: 0.00),
                        Gradient.Stop(color: Color(red: 1, green: 0.98, blue: 0.87), location: 0.53),
                        Gradient.Stop(color: .white, location: 1.00),
                    ],
                    center: UnitPoint(x: 0.5, y: 0.5)
                )
            )
            .cornerRadius(310.57645)
            .position(x: -10))
        .background(Rectangle()
            .foregroundColor(.clear)
            .frame(width: 310.57645, height: 310.57645)
            .background(
                EllipticalGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.4, green: 1, blue: 0.51), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.65, green: 1, blue: 0.76), location: 0.53),
                        Gradient.Stop(color: .white, location: 1.00),
                    ],
                    center: UnitPoint(x: 0.5, y: 0.5)
                )
            )
            .cornerRadius(310.57645)
            .position(x: 300))
    }
}

#Preview {
    OnboardingView(onboardingCompleted: .constant(false))
        .preferredColorScheme(.light)
}
