
import SwiftUI

struct FeelingHistory: View {
	
	@EnvironmentObject var days: DaysStore
	let day: DayRealm
	
	var body: some View {
		VStack(alignment: .leading) {
			List {
				ForEach(day.feelings, id: \.name) { feeling in
					Text(feeling.name)
						.foregroundColor(Color("LightGreen"))
						.padding()
						.font(Theme.mainText)
				}
			}
		}
        .padding()
        .navigationBarTitle(days.getStringDate(date: day.date))
	}
	
}
