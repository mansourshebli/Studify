import SwiftUI

struct PomodoroView: View {
    @State private var timer: Timer?
    @State private var timerDuration = 240.0 // 4 minutes for work
    @State private var isTimerRunning = false
    @State private var showAlert = false
    @State private var isBreak = false
    @State private var timerProgress = 1.0
    @State private var cyclesCompleted = 0

    var body: some View {
        ZStack {
            Text(formatTime(Int(timerDuration)))
                .font(.system(size: 80))
                .bold()
                .fontDesign(.rounded)

            CircularProgressView(timerProgress: $timerProgress)
                .padding()

            HStack {
                withAnimation(.easeIn){
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

                withAnimation(.easeIn){
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

                withAnimation(.easeIn){
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
            .offset(y: 250)
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(isBreak ? "Break Time!" : "Pomodoro Finished"),
                message: Text(isBreak ? "Take a 4-minute break?" : (cyclesCompleted < 3 ? "What would you like to do next?" : "Congratulations! You've completed 4 cycles.")),
                primaryButton: .default(isBreak ? Text("Start Break") : (cyclesCompleted < 3 ? Text("Start New Pomodoro") : Text("End Session"))) {
                    if isBreak {
                        startBreak()
                    } else {
                        startTimer()
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
                if !isBreak {
                    cyclesCompleted += 1
                }
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
        timerDuration = 240.0 // Reset to 4 minutes for work
        timerProgress = 1.0 // Reset progress
        isTimerRunning = false
    }

    func startBreak() {
        timerDuration = 240.0 // 4 minutes for break
        showAlert = false
        isTimerRunning = false
        startTimer()
    }

    func endSession() {
        timer?.invalidate()
        timerDuration = 240.0 // Reset to 4 minutes for work
        timerProgress = 1.0 // Reset progress
        isTimerRunning = false
        cyclesCompleted = 0
    }

    // Helper function to update progress even when paused
    private func startTimerProgressUpdate() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            timerProgress = timerDuration / 240.0 // Update the progress
        }
    }
}


#Preview {
    __4_4_4_MethodView()
}
