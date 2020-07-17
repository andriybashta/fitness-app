
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		// Create the SwiftUI view that provides the window contents.
		let startingView = StartingView()
		let mainView = AppView()
	
		if let windowScene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: windowScene)
            
            //Check if the user has passed the first few screens that offer him a trial.
			if SettingsStore.shared.isTrialSurveyCompleted {
				let trainings = TrainingsStore()
				window.rootViewController = UIHostingController(rootView: mainView
					.environmentObject(trainings)
				)
			} else {
				window.rootViewController = UIHostingController(rootView: startingView)
			}
			
			self.window = window
			window.makeKeyAndVisible()
		}
		
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}

}

