
import Foundation
import SwiftUI

struct ButtonModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
			.background(LinearGradient(gradient: Gradient(colors: [Theme.darkGreen, Theme.lightGreen]), startPoint: .leading, endPoint: .trailing))
			.foregroundColor(Color.white)
			.cornerRadius(20)
			.padding()
	}
}

struct TitleStyle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(Theme.bigTitle)
			.foregroundColor(.white)
			.padding(.leading)
	}
}

