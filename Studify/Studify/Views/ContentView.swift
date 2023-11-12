import SwiftUI

struct ContentView: View {
    @AppStorage("onboardingCompleted") var onboardingCompleted = false
    var body: some View {
        if onboardingCompleted {
            Home()
        } else {
            OnboardingView(onboardingCompleted: $onboardingCompleted)
        }
    }
}

struct Home: View {
    @State private var selectedTab = "Dashboard"
    @State private var xAxis: CGFloat = 0
    @Namespace private var animation

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
                DashboardView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("Dashboard")
                
                TimerView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("Timer")

                ToDoView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("Todo")

                
                LongTermGoalsView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("Goals")
                
                
            }

            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    GeometryReader { reader in
                        Button(action: {
                            withAnimation(.spring()) {
                                selectedTab = image
                                xAxis = reader.frame(in: .global).minX
                            }
                        }, label: {
                            Image(systemName: getSystemSymbolName(image: image))
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                                .foregroundColor(selectedTab == image ? getColor(image: image) : Color.white)
                                .padding(selectedTab == image ? 15 : 0)
                                .background(selectedTab == image ? Color.cyan : Color.clear)
                                .clipShape(Circle())
                                .matchedGeometryEffect(id: image, in: animation)
                                .offset(x: selectedTab == image ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX) : 0, y: selectedTab == image ? -50 : 0)
                        })
                        .onAppear {
                            if image == tabs.first && selectedTab == "Dashboard" {
                                xAxis = reader.frame(in: .global).minX
                            }
                        }
                    }
                    .frame(width: 25, height: 30)

                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            .background(
                Color.cyan
                    .clipShape(CustomShape(xAxis: xAxis))
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.bottom, UIApplication.shared.connectedScenes
                                        .compactMap { $0 as? UIWindowScene }
                                        .first?
                                        .windows
                                        .first?
                                        .safeAreaInsets.bottom ?? 0)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }

    func getSystemSymbolName(image: String) -> String {
        switch image {
        case "Dashboard":
            return "house"
        case "Todo":
            return "checkmark.circle"
        case "Timer":
            return "clock"
        case "Goals":
            return "star"
        default:
            return ""
        }
    }

    func getColor(image: String) -> Color {
        return selectedTab == image ? Color.white : Color.gray
    }
}

var tabs = ["Dashboard", "Timer", "Todo", "Goals"]

struct CustomShape: Shape {

    var xAxis: CGFloat

    var animatableData: CGFloat {
        get {
            return xAxis
        }

        set {
            xAxis = newValue
        }
    }

    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))

            let center = xAxis

            path.move(to: CGPoint(x: center - 50, y: 0))

            let to1 = CGPoint(x: center, y: 35)
            let control1 = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 25, y: 35)

            let to2 = CGPoint(x: center + 50, y: 0)
            let control3 = CGPoint(x: center + 25, y: 35)
            let control4 = CGPoint(x: center + 25, y: 0)

            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

#Preview {
    ContentView()
        
}
