import SwiftUI

struct DashboardView: View {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("selectedProfile") var selectedProfile: Int = 0
    @AppStorage("isDarkMode") private var isDarkMode = false
    @ObservedObject var todoManager = TodoManager()
    @ObservedObject var longTermGoalsManager = LongTermGoalsManager()
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 120))
    ]


    var body: some View {

        VStack {
            Spacer().frame(height: 40)
            HStack {
                Image("\(selectedProfile)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 90)
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

            LazyVGrid(columns: adaptiveColumns) {
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
                            .background(Color(red: 0.33, green: 0.89, blue: 0.56))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)


                        Image("list-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .position(x:35, y: 30)
                        
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
                    ZStack{
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 180, height: 250)
                    .background(Color(red: 1, green: 0.47, blue: 0.49))
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        
                        
                        Image("goal-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                            .position(x:35, y: 30)
                      }
                    )
                .padding()
                        
            }
        }
        .padding()
        .background(isDarkMode ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
        .position(x: 200, y: 210)
        
        
        
    }
}


#Preview {
    DashboardView()
}
