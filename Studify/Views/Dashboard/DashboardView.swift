import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                HStack{
                    Text("    Gonna be productive today 😎").font(.title2)
                    Spacer()
                    }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 20) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 200)
                            .foregroundColor(.blue)
                            .overlay(
                                Text("Item")
                                    .foregroundColor(.white)
                                    .font(.title)
                            )
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 200)
                        .foregroundColor(.blue)
                        .overlay(
                            Text("Item")
                                .foregroundColor(.white)
                                .font(.title)
                        )
                }
                .padding()
            }
            .navigationTitle("Dashboard")
        }
    }
}
#Preview {
    DashboardView()
}
