
import SwiftUI

struct TrainingRow: View {
    let training: TrainingRealm
    
    var body: some View {
        Group {
            HStack {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                Text(training.name)
                    .font(Theme.bigTitle)
                Spacer()
            }
        }
    }
    
}
