
import SwiftUI
import URLImage

struct AdviceRow: View {
	let advice: AdviceRealm
	
	var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			Text(advice.title)
				.font(Theme.mainText)
				.fontWeight(.bold)
			Text(advice.text)
				.lineLimit(1)
		}
	}
}
