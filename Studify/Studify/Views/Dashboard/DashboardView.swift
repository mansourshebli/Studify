import SwiftUI

struct DashboardView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @ObservedObject var todoManager = TodoManager()
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 120))
    ]
    var body: some View {
        VStack {
            

            HStack {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(isDarkMode ? .white : .black)

                Spacer()

                Text("Hi, Mansour 👋")
                    .font(.custom("Rubik-Regular", size: 26))
                    .multilineTextAlignment(.center)

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
            LazyVGrid(columns: adaptiveColumns){
                VStack{
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
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 5))
                
                
                //This widget is for the long term goals."
                VStack(spacing: 16) {
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
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white).shadow(radius: 5))
                
                

            }
        }
        .padding()
        .background(isDarkMode ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
        .position(x:200,y:180)
        
    }
}

#Preview {
    DashboardView()
}
