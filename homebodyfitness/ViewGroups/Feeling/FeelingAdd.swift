
import SwiftUI

struct FeelingAdd: View {
	
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>
	@EnvironmentObject var days: DaysStore
	@State private var selectedFeelings: [FeelingRealm] = []
	@State private var message: Message? = nil
	
	var body: some View {
		VStack {
			Group {
				List {
					ForEach(self.days.feelings, id: \.name) { item in
						StatedButton(action: {
							if self.selectedFeelings.first(where: { $0.name == item.name }) != nil {
								let newArray = self.selectedFeelings.filter { $0.name != item.name }
								self.selectedFeelings = newArray
							} else {
								self.selectedFeelings.append(item)
							}
						}) {
							Text(item.name)
						}
					}
				}
			}
		}
		.navigationBarTitle("Explain your feelings", displayMode: .inline)
			.navigationBarItems(trailing:
				Button(action: {
					if self.selectedFeelings.count > 0 {
						self.days.createDay(items: self.selectedFeelings)
						self.mode.wrappedValue.dismiss()
					} else {
						self.message = Message(text: "Select at least one feeling.")
					}
				}) {
					Text("Save")
				}
		)
			.alert(item: $message) { message in
				Alert(
					title: Text(message.text),
					dismissButton: .cancel()
				)
		}
	}
	
}
