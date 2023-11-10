import SwiftUI

struct Method4444TimerView: View {
    @State private var timer: Timer?
    @State private var timerDuration = 240.0 // 4 minutes
    @State private var isTimerRunning = false
    @State private var showAlert = false
    @State private var isBreak = false
    @State private var timerProgress = 1.0

    var body: some View {
        ZStack {
            
            Text(formatTime(Int(timerDuration)))
                .font( Font.custom("Rubik-Regualr", size: 80))
                .bold()
                .fontDesign(.rounded)
                .offset(x:0,y:-100)

            CircularProgressView(timerProgress: $timerProgress)
                .offset(x:0,y:-100)

            HStack {
                withAnimation(.easeIn) {
                    Button {
                        startTimer()
                    } label: {
                        Text("Start")
                            .font(.title2)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(8)
                            .shadow(color: Color.green, radius: 20, y: 5)
                           
                    }
                    .disabled(isTimerRunning)
                }

                withAnimation(.easeIn) {
                    Button {
                        pauseTimer()
                    } label: {
                        Text("Pause")
                            .font(.title2)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.yellow)
                            .cornerRadius(8)
                            .shadow(color: Color.yellow, radius: 20, y: 5)
                            
                    }
                    .disabled(!isTimerRunning)
                }

                withAnimation(.easeIn) {
                    Button {
                        endTimer()
                    } label: {
                        Text("End")
                            .font(.title2)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(8)
                            .shadow(color: Color.red, radius: 20, y: 5)
                        
                    }
                    .disabled(!isTimerRunning)
                }
            }
            .offset(y: 150)
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(isBreak ? "Break Time!" : "Work Session Finished"),
                message: Text(isBreak ? "Take a 4-minute break?" : "What would you like to do next?"),
                primaryButton: .default(isBreak ? Text("Start Work") : Text("Start Break")) {
                    if isBreak {
                        startWork()
                    } else {
                        startBreak()
                    }
                },
                secondaryButton: .cancel(Text("End Session")) {
                    endSession()
                }
            )
        }
        .onAppear() {
            startTimerProgressUpdate()
        }
        .onDisappear() {
            timerProgress = 1.0
            timer?.invalidate()
        }
    }

    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func startTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timerDuration > 0 {
                timerDuration -= 1
                timerProgress = timerDuration / 240.0 // Update the progress
            } else {
                timer?.invalidate()
                showAlert = true
                isBreak = !isBreak
                isTimerRunning = false
            }
        }
    }

    func pauseTimer() {
        timer?.invalidate()
        isTimerRunning = false
    }

    func endTimer() {
        timer?.invalidate()
        timerDuration = 240.0 // Reset to 4 minutes
        timerProgress = 1.0 // Reset progress
        isTimerRunning = false
    }

    func startBreak() {
        timerDuration = 240.0 // 4 minutes break
        showAlert = false
        isBreak = true
        startTimer()
    }

    func startWork() {
        timerDuration = 240.0 // 4 minutes work session
        showAlert = false
        isBreak = false
        startTimer()
    }

    func endSession() {
        timer?.invalidate()
        timerDuration = 240.0 // Reset to 4 minutes
        timerProgress = 1.0 // Reset progress
        isTimerRunning = false
    }

    // Helper function to update progress even when paused
    private func startTimerProgressUpdate() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timerProgress = timerDuration / 240.0 // Update the progress
        }
    }
}

#Preview {
    Method4444TimerView()
}
