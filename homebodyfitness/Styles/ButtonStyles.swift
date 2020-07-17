
import Foundation
import SwiftUI

struct ListButtonStyle: ButtonStyle {
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.overlay(configuration.isPressed ? Color("Dim").opacity(0.4) : Color.clear)
	}
}

struct SelectableButtonStyle: ButtonStyle {
    var isSelected = false
    var backgroundColor = Theme.darkGreen
    var borderColor = Theme.lightGreen
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(Theme.buttonText)
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: isSelected ? 16.0 : 0.0))
            .overlay(RoundedRectangle(cornerRadius: isSelected ? 16.0 : 0.0).stroke(lineWidth: isSelected ? 2.0 : 0.0).foregroundColor(borderColor))
            .animation(.linear)
    }
}
