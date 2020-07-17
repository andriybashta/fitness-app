
import SwiftUI
import RealmSwift
import URLImage

struct ExerciseView: View {
	
	@EnvironmentObject var trainings: TrainingsStore
	let trainingIndex: Int
	let exerciseIndex: Int
	
	var body: some View {
		VStack(spacing: 10) {
			Group {
				ZStack {
					ActivityIndicator(isAnimating: .constant(true), style: .large)
					PlayerView(url: URL(string:  trainings.items[trainingIndex].exercises[exerciseIndex].videoURL))
				}
				Text(trainings.items[trainingIndex].exercises[exerciseIndex].name)
					.bold()
					.font(Theme.mainText)
					.fixedSize(horizontal: false, vertical: true)
				Text("Repeats count: \(trainings.items[trainingIndex].exercises[exerciseIndex].completedCount)")
					.font(Theme.mainText)
				ScrollView {
					Text(trainings.items[trainingIndex].exercises[exerciseIndex].textRepresentation)
						.font(Theme.mainText)
						.padding()
				}
				ModifiedContent(
					content:
					Button(action: {
						
                        try! RealmStore.realm.safeWrite {
							self.trainings.items[self.trainingIndex].exercises[self.exerciseIndex].completedCount += 1
						}
					}) { HStack {
						Text("Complete").font(Theme.buttonText)
						Image(systemName: "checkmark.seal")
						}  },
					modifier: ButtonModifier()
				)
			}
		}
		
	}
	
}
