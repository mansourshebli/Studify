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

    let motivationalSnaps = [
        "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
        "The only way to achieve the impossible is to believe it is possible.",
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
        "Your attitude, not your aptitude, will determine your altitude.",
        "Don’t watch the clock; do what it does. Keep going.",
        "You are never too old to set another goal or to dream a new dream.",
        "Don’t be pushed around by the fears in your mind. Be led by the dreams in your heart.",
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "It's not whether you get knocked down, it's whether you get up.",
        "Success usually comes to those who are too busy to be looking for it.",
        "The future belongs to those who believe in the beauty of their dreams.",
        "Believe you can and you're halfway there.",
        "Strive not to be a success, but rather to be of value.",
        "You miss 100% of the shots you don't take.",
        "Success is stumbling from failure to failure with no loss of enthusiasm.",
        "The only place where success comes before work is in the dictionary.",
        "Don't be afraid to give up the good to go for the great.",
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "Success is not in what you have, but who you are.",
        "The only way to do great work is to love what you do.",
        "Don't let the fear of losing be greater than the excitement of winning.",
        "The only place where success comes before work is in the dictionary.",
        "If you want to achieve greatness stop asking for permission.",
        "I find that the harder I work, the more luck I seem to have.",
        "There is no substitute for hard work.",
        "Don’t be pushed around by the fears in your mind. Be led by the dreams in your heart.",
        "Success usually comes to those who are too busy to be looking for it.",
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "It's not whether you get knocked down, it's whether you get up.",
        "Success is stumbling from failure to failure with no loss of enthusiasm.",
        "The only place where success comes before work is in the dictionary.",
        "Don't be afraid to give up the good to go for the great.",
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "Success is not in what you have, but who you are.",
        "The only way to do great work is to love what you do.",
        "Don't let the fear of losing be greater than the excitement of winning.",
        "The only place where success comes before work is in the dictionary.",
        "If you want to achieve greatness stop asking for permission.",
        "I find that the harder I work, the more luck I seem to have.",
        "There is no substitute for hard work.",
        "Don’t be pushed around by the fears in your mind. Be led by the dreams in your heart.",
        "Success usually comes to those who are too busy to be looking for it.",
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "It's not whether you get knocked down, it's whether you get up.",
        "Success is stumbling from failure to failure with no loss of enthusiasm.",
        "The only place where success comes before work is in the dictionary.",
        "Don't be afraid to give up the good to go for the great.",
        "The only limit to our realization of tomorrow will be our doubts of today.",
        "Success is not in what you have, but who you are.",
        "The only way to do great work is to love what you do.",
        "Don't let the fear of losing be greater than the excitement of winning.",
        "The only place where success comes before work is in the dictionary.",
        "If you want to achieve greatness stop asking for permission.",
        "I find that the harder I work, the more luck I seem to have.",
        "There is no substitute for hard work."
    ]

    
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
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.brown, Color.gray, Color.black]), startPoint: .leading, endPoint: .trailing))
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
        currentMotivationalSnap = motivationalSnaps.randomElement() ?? ""
    }
}

#Preview {
    DashboardView()
}
