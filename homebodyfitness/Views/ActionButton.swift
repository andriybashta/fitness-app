
import SwiftUI

struct ActionButton<Label>: View where Label: View {
	private let action: (() -> ())?
	private let label: (() -> Label)?
	
	init(action: (() -> ())? = nil, label: (() -> Label)? = nil) {
		self.action = action
		self.label = label
	}
	
	var body: some View {
		Button(action: {
			self.action?()
		}) {
			label?()
		}
		.frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: 50)
		.background(LinearGradient(gradient: Gradient(colors: [Theme.darkGreen, Theme.lightGreen]), startPoint: .leading, endPoint: .trailing))
		.foregroundColor(Color.white)
		.cornerRadius(40)
		.padding()
	}
}
