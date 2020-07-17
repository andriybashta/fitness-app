
import SwiftUI

struct AdviceView: View {
	@EnvironmentObject var advices: AdviceStore
	
	var body: some View {
		NavigationView {
			VStack {
				Text("Making a decision to do fitness is much easier than starting out.")
				.font(Theme.mainText)
				List {
					ForEach(self.advices.items, id: \.id) { item in
						NavigationLink(destination: AdviceDetail(advice: item)) {
							AdviceRow(advice: item)
						}
					}
				}
			}
				.navigationBarTitle(Text("Fitness advices"))
				.padding()
		}
	}
	
}
