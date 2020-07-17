
import SwiftUI
import NavigationStack

struct ExercisesListView: View {
	
	@EnvironmentObject var trainings: TrainingsStore
	let index: Int
	
	var body: some View {
		ScrollView {
			Group {
				VStack(alignment: .leading, spacing: 20) {
					ForEach(self.trainings.items[index].exercises.indexed(), id: \.1.id) { exerciseIndex, exerciseItem in
						ExercisesRow(trainingIndex: self.index, exerciseIndex: exerciseIndex, exerciseItem: exerciseItem)
					}
				}
				.padding()
			}
		}
	}
	
}
