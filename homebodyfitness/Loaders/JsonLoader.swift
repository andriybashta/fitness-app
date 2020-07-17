
import SwiftUI

class JsonLoader {
	
	func loadData(completion: @escaping () -> ()) {
        let models: [TrainingRealm] = Bundle.main.decode("programs.json")
        
        RealmStore.createPrograms(from: models) {
            SettingsStore.shared.isDataLoaded = true
            self.loadAdvices() {
                self.loadFeelings() {
                    completion()
                }
            }
        }
	}
	
	func loadAdvices(completion: @escaping () -> ()) {
        let models: [AdviceRealm] = Bundle.main.decode("advices.json")
        
        RealmStore.createAdvices(models: models) {
            completion()
        }
	}
	
	func loadFeelings(completion: @escaping () -> ()) {
        let models: [FeelingRealm] = Bundle.main.decode("feelings.json")
        
        RealmStore.createFeelings(models: models) {
            completion()
        }
	}
	
}
