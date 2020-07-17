
import SwiftUI

struct FeelingsView: View {
	
	@EnvironmentObject var days: DaysStore
	
	var body: some View {
		NavigationView {
			VStack(alignment: .center, spacing: 10) {
				Group {
					if days.items.count == 0 {
						Text("Your diary is empty.")
							.font(Theme.mainText)
							NavigationLink(destination: FeelingAdd()) {
								ModifiedContent(
									content: Text("Note your first feeling..."),
									modifier: ButtonModifier()
								)
							}
						} else {
					NavigationLink(destination: FeelingAdd()) {
						ModifiedContent(
							content: Text("Note feelings"),
							modifier: ButtonModifier()
						)
					}
						List {
							ForEach(days.items, id: \.id) { day in
								NavigationLink(destination: FeelingHistory(day: day)) {
									VStack {
										Text(String(describing: self.days.getStringDate(date: day.date)))
											.bold()
										Text("Feelings: \(day.feelings.count)")
									}
								}
							}
						}
					}
				}
			}
			.padding()
			.navigationBarTitle("Who're you today?")
			.onAppear {
				self.days.fetchFeelings()
			}
		}
		
	}
	
}


