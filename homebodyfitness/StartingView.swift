
import SwiftUI
import NavigationStack

struct StartingView: View {
	var body: some View {
		NavigationStackView(transitionType: .custom(.scale)) {
			GeometryReader { geometry in
				ZStack {
					VStack {
						Text("Get strong body")
							.font(Theme.bigTitle)
							.frame(maxWidth: geometry.size.width, alignment: .leading)
							.padding(.leading)
							.padding(.top, geometry.size.height * 0.1)
						Text("in 4 weeks")
							.background(Theme.darkGreen.cornerRadius(5).opacity(0.5))
							.font(Theme.bigTitle)
							.frame(maxWidth: geometry.size.width, alignment: .leading)
							.padding(.leading)
						Spacer()
						PushView(destination: SelectLevelView(activityLevelValue: 30)) {
							ModifiedContent(content: Text("Next").font(Theme.buttonText), modifier: ButtonModifier())
								.padding(.horizontal, 25)
						}
					}
				}
			}
		}
	}
}

struct StartingView_Previews: PreviewProvider {
	static var previews: some View {
		StartingView()
	}
}
