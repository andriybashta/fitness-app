
import SwiftUI

struct PurchasingView: View {
	
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@State private var message: Message? = nil
	@State private var isActivePurchase = false
    
	private let productID = ""
	private var productPrice: String {
        "6.99 USD"
	}
	
	var body: some View {
		
			ZStack {
				ScrollView {
					VStack(spacing: 10) {
						if isActivePurchase {
							Text("You have Premium!")
						} else {
							Text("Know yourself better")
								.font(.largeTitle)
							Text("Track your feelings")
							Text("Pass trainings for all body groups")
							VStack(spacing: 0) {
								ActionButton(action: {
									self.purchase()
								}) {
									Text("Subscribe Now")
										.bold()
										.font(.subheadline)
								}
								Text("Try 3 days for free. Then \(self.productPrice)/month")
								.bold()
									.multilineTextAlignment(.center)
							}
                            .padding(.bottom, 20)
							Button(action: {
								self.restore()
							}) {
								Text("Restore")
							}
							Button(action: {
								self.openURL(string: "")
							}) {
								Text("Privacy Policy")
							}
							Button(action: {
								self.openURL(string: "")
							}) {
								Text("Terms of Use")
							}
							Text("You have 3 days for free. If you choose to continue subscription after free trial, you will be charged a monthly fee according to your country. The iTunes account will be charged after the trial period ends. You should be aware that the subscription will automatically renew unless you close the automatic renewal at least 24 hours before the end of the current period. Your account will be charged for renewal within 24-hours prior to the end of the current period, and identify the cost of renewal. After purchase, you can turn off automatic renewal at the account settings. Any unused portion of a free trial period , if offered, will be forfeited when you purchase a subscription, where applicable.")
								.font(.footnote)
						}
					}
					.padding()
					.alert(item: self.$message) { message in
						Alert(
							title: Text(message.text),
							dismissButton: .cancel()
						)
					}
				}
			}
		}
	
	
	func openURL(string: String) {
		if let url = URL(string: string) {
			UIApplication.shared.open(url)
		}
	}
	
	func datesDifference(date: Date) -> String {
		let delta = date - Date()
		return String(describing: delta)
	}
	
	func purchase() {
        message = Message(text: "Success!")
		isActivePurchase = true
	}
	
	func restore() {
        message = Message(text: "Success!")
        isActivePurchase = true
	}
	
}
