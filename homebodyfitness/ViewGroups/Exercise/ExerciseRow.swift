
import SwiftUI

struct ExercisesRow: View {
    @State private var isShowingPurchase = false
    let trainingIndex: Int
    let exerciseIndex: Int
    let exerciseItem: ExerciseRealm
    
    var body: some View {
        Group {
            if SettingsStore.shared.isPremium {
                VStack {
                    Button(action: {
                        self.isShowingPurchase = true
                    }) {
                        HStack {
                            ExerciseRowContent(exerciseItem: exerciseItem)
                            Spacer()
                            Image(systemName: "lock")
                        }
                    }
                }
            } else {
                NavigationLink(destination: ExerciseView(trainingIndex: trainingIndex, exerciseIndex: exerciseIndex)) {
                    ExerciseRowContent(exerciseItem: exerciseItem)
                }
            }
        }
        .sheet(isPresented: self.$isShowingPurchase) {
            PurchasingView()
        }
    }
}

struct ExerciseRowContent: View {
    let exerciseItem: ExerciseRealm
    
    var body: some View {
        HStack {
            ZStack {
                ActivityIndicator(isAnimating: .constant(true), style: .medium)
                PlayerView(url: URL(string: exerciseItem.videoURL))
                    .frame(width: 50)
            }
            Text(exerciseItem.name)
                .font(Theme.exerciseTitle)
                .fontWeight(.black)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
