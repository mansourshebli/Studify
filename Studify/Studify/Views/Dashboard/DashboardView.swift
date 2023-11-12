//
//  DashboardView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 31/08/2023.
//

import SwiftUI

struct DashboardView: View {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("selectedProfile") var selectedProfile: Int = 0
    @AppStorage("isDarkMode") private var isDarkMode = false
    @ObservedObject var todoManager = TodoManager()
    @ObservedObject var longTermGoalsManager = LongTermGoalsManager()
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 175))
    ]

    @StateObject private var motivationData = MotivationData()

    
    var profilePicture: String {
        return selectedProfile == 1 ? "user-boy" : "user-girl"
    }

    @State private var currentMotivationalSnap = ""

    var body: some View {
        VStack {
            Spacer().frame(height: 280)
            HStack {
                Image("\(profilePicture)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55, height: 55)
                    .foregroundColor(.white)
                    

                Spacer()
                VStack {
                    Text("Hey \(userName) 👋")
                        .font(.custom("Rubik-Regular", size: 26))
                        .multilineTextAlignment(.center)
                    Text("Ready to be productive?")
                        .font(.custom("Rubik-Regular", size: 16))
                        .multilineTextAlignment(.center)
                }

                Spacer()

                Button {
                    isDarkMode.toggle()
                } label: {
                    Image(systemName: isDarkMode ? "moon" : "sun.max")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                        .foregroundColor(isDarkMode ? .white : .black)
                }
                .preferredColorScheme(isDarkMode ? .dark : .light)
            }
            .padding()

            LazyVGrid(columns: adaptiveColumns, spacing: 50) {
                VStack {
                    Text("Todos Completion")
                        .font(.custom("Rubik-Regular", size: 18))
                        .multilineTextAlignment(.center)
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10.0)
                            .opacity(0.3)
                            .foregroundColor(Color.blue)
                            .frame(width: 100, height: 100)

                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(todoManager.completionPercentageTodo, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.blue)
                            .rotationEffect(Angle(degrees: 270.0))
                            .animation(.linear)
                            .frame(width: 100, height: 100)

                        Text("\(Int(todoManager.completionPercentageTodo * 100))%")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 180, height: 250)
                            .background(Color(red: 26/255, green: 188/255, blue: 156/255))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                        Image("list-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .position(x: 35, y: 30)
                    }
                )

                VStack(spacing: 16) {
                    Text("Goals Completion")
                        .font(.custom("Rubik-Regular", size: 18))
                        .multilineTextAlignment(.center)
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 10.0)
                            .opacity(0.3)
                            .foregroundColor(Color.blue)
                            .frame(width: 100, height: 100)

                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(longTermGoalsManager.completionPercentage, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.blue)
                            .rotationEffect(Angle(degrees: 270.0))
                            .animation(.linear)
                            .frame(width: 100, height: 100)

                        Text("\(Int(longTermGoalsManager.completionPercentage * 100))%")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 180, height: 250)
                            .background(Color(red: 255/255, green: 180/255, blue: 100/255))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        Image("goal-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .position(x: 35, y: 30)
                    }
                )
                .padding()

                VStack(spacing: 16) {
                    Text("Motivation Snaps🫰")
                        .font(.custom("Rubik-Regular", size: 20))
                        .lineLimit(1)
                        .frame(width: 200)
                        .position(x:123,y:-15)
                    
                   
                        Text("Click! Click! Click!")
                            .font(.custom("Rubik-Regular", size: 13))
                            .padding(2).position(x: 84, y: -78)



                    Text(currentMotivationalSnap)
                        .font(.custom("Rubik-Italic", size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 320, height: 150)
                        .position(x:143,y:-80)
                        .onAppear(perform: {
                            updateMotivationalSnap()
                        })

                }
                .padding()
                .background(
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 360, height: 250)
                            .background(Color(red: 100/255, green: 200/255, blue: 220/255))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .position(x: 165, y: 100).onTapGesture {
                                updateMotivationalSnap()
                            }

                        Image("trophy-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .position(x: 18, y: 8)
                    }
                )
                .padding()
            }
        }
        .padding()
        .background(isDarkMode ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
        .position(x: 200, y: 270)
    }

    private func updateMotivationalSnap() {
        currentMotivationalSnap = motivationData.motivationalWords.randomElement() ?? ""
    }
}

#Preview {
    DashboardView()
}
