import SwiftUI

struct AnimatedImageView: View {
    let images: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @State private var currentImageIndex = 0
    @State private var timer: Timer?

    var body: some View {
        Image(images[currentImageIndex])
            .resizable()
            .scaledToFit()
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            currentImageIndex = (currentImageIndex + 1) % images.count
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    AnimatedImageView()
}
