
import Foundation
import SwiftUI

struct StatedButton<Label>: View where Label: View {
	private let action: (() -> ())?
	private let label: (() -> Label)?
	
	@State var buttonStyle = SelectableButtonStyle()
	
	init(action: (() -> ())? = nil, label: (() -> Label)? = nil) {
		self.action = action
		self.label = label
	}
	
	var body: some View {
		Button(action: {
			self.buttonStyle.isSelected = !self.buttonStyle.isSelected
			self.action?()
		}) {
			label?()
		}
		.buttonStyle(buttonStyle)
	}
}
