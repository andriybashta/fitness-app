
import SwiftUI
import Combine

final class SettingsStore: ObservableObject {
	
	private enum Keys {
		static let isDataLoaded = "data_loaded"
		static let isTrialSurveyCompleted = "is_trial_survey_completed"
        static let isPremium = "is_premium"
		static let trainingMode = "training_mode"
	}
	
    enum TrainingMode: String, CaseIterable {
        case light
        case amateur
        case aggressive
    }
    
	private let cancellable: Cancellable
	private let defaults: UserDefaults
    
    static let shared = SettingsStore()
    let objectWillChange = PassthroughSubject<Void, Never>()
	
	init(defaults: UserDefaults = .standard) {
		self.defaults = defaults
		
		defaults.register(defaults: [
			Keys.trainingMode: TrainingMode.light.rawValue,
			Keys.isDataLoaded: false,
			Keys.isTrialSurveyCompleted: false,
            Keys.isPremium: false
		])
		
		cancellable = NotificationCenter.default
			.publisher(for: UserDefaults.didChangeNotification)
			.map { _ in () }
			.subscribe(objectWillChange)
	}
	
	var isDataLoaded: Bool {
		set { defaults.set(newValue, forKey: Keys.isDataLoaded) }
		get { defaults.bool(forKey: Keys.isDataLoaded) }
	}
	
	var isTrialSurveyCompleted: Bool {
		set { defaults.set(newValue, forKey: Keys.isTrialSurveyCompleted) }
		get { defaults.bool(forKey: Keys.isTrialSurveyCompleted) }
	}
    
    var isPremium: Bool {
        set { defaults.set(newValue, forKey: Keys.isPremium) }
        get { defaults.bool(forKey: Keys.isPremium) }
    }
	
	var trainingMode: TrainingMode {
		get {
			return defaults.string(forKey: Keys.trainingMode)
				.flatMap { TrainingMode(rawValue: $0) } ?? .light
		}

		set {
			defaults.set(newValue.rawValue, forKey: Keys.trainingMode)
		}
	}
	
}
