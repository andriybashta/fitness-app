
import SwiftUI
import NavigationStack

struct TrainingsView: View {
    @EnvironmentObject var trainings: TrainingsStore
    @State private var isShowingPremium = false
    @State private var isShowingPurchase = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(self.trainings.items.indexed(), id: \.1.id) { index, item in
                    ZStack {
                        NavigationLink(destination: ExercisesListView(index: index)) {
                            EmptyView()
                        }.hidden()
                        TrainingRow(training: item)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.isShowingPremium = true
                }) {
                    Image("premium")
                        .resizable()
                        .clipped()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Theme.darkGreen)
                }
            )
                .navigationBarTitle("Trainings for you")
                .onAppear(perform: {
                    SettingsStore.shared.isTrialSurveyCompleted = true
                })
                .sheet(isPresented: self.$isShowingPremium) {
                    PurchasingView()
            }
        }
    }
    
}
