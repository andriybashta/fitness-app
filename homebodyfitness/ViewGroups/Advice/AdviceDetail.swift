
import SwiftUI

struct AdviceDetail: View {
	
	let advice: AdviceRealm
	
	var body: some View {
		ScrollView {		
			VStack {
				Text(advice.title)
					.font(Font.custom("Oxanium-Bold", size: 30))
				Text(advice.text)
					.font(Theme.mainText)
					.fixedSize(horizontal: false, vertical: true)
			}.padding()
		}
	}
	
}
