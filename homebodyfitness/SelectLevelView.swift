
import SwiftUI
import NavigationStack

struct SelectLevelView: View {
	@State var activityLevelValue: Double
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				VStack {
					Text("Current activity level")
						.font(Theme.bigTitle)
						.frame(maxWidth: geometry.size.width, alignment: .leading)
						.padding(.leading)
						.padding(.top, geometry.size.height * 0.1)
                    Slider(value: self.$activityLevelValue)
						.frame(height: geometry.size.width * 0.2)
						.padding(.horizontal)
					Spacer()
					PushView(destination: AppView()) {
						ModifiedContent(content: Text("Next").font(Theme.buttonText), modifier: ButtonModifier())
							.padding(.horizontal, 25)
					}
				}
			}
		}
	}
	
}

struct SelectLevelView_Previews: PreviewProvider {
	static var previews: some View {
		SelectLevelView(activityLevelValue: 30)
	}
}
