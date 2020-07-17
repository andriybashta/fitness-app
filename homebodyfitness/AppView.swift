
import SwiftUI
import NavigationStack

struct AppView: View {
	var body: some View {
			TabView {
				TrainingsView().environmentObject(TrainingsStore())
					.tabItem {
						Image(systemName: "doc.plaintext")
						Text("Trainings")
				}
				FeelingsView().environmentObject(DaysStore())
					.tabItem {
						Image(systemName: "timelapse")
						Text("Feelings")
				}
				AdviceView().environmentObject(AdviceStore())
					.tabItem {
						Image(systemName: "questionmark.square")
						Text("Blog")
				}
				SettingsView()
					.tabItem {
						Image(systemName: "wrench")
						Text("Settings")
				}
			}
			.accentColor(Theme.darkGreen)
		}
}
