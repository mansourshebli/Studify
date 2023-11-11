import SwiftUI

struct Quote: Decodable {
    let text: String
}


struct DashboardView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @ObservedObject var todoManager = TodoManager()
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 120))
    ]

    private var motivationalQuotes: [String] {
        if let url = Bundle.main.url(forResource: "MotivationalQuotes", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let quotes = try? JSONDecoder().decode([Quote].self, from: data) {
            return quotes.map { $0.text }
        }
        return []
    }

    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            HStack {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(isDarkMode ? .white : .black)

                Spacer()
                VStack {
                    Text("Hey there 👋")
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
                            .shadow(color: Color.green, radius: 4, y: 0)


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
                    ZStack{
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 180, height: 250)
                    .background(Color(red: 1, green: 0.47, blue: 0.49))
                    .cornerRadius(15)
                    .shadow(color: Color.red, radius: 4, y: 0)
                        
                        
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
