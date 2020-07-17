
import Foundation
import RealmSwift

class RealmStore {
	
	static let realm = try! Realm()
	
	static func createPrograms(from models: [TrainingRealm], completion: @escaping () -> ()) {
		var savedCount = 0
		let modelsCount = models.count
		
		models.forEach { (model) in
			let programRealm = TrainingRealm()
			let exercises = RealmSwift.List<ExerciseRealm>()
			
			programRealm.name = model.name
			programRealm.imageURL = model.imageURL
			
			model.exercises.forEach { (item) in
				let exerciseRealm = ExerciseRealm()
				exerciseRealm.owner = programRealm
				exerciseRealm.name = item.name
				exerciseRealm.textRepresentation = item.textRepresentation
				exerciseRealm.videoURL = item.videoURL
				exerciseRealm.isPremium = item.isPremium
				exercises.append(exerciseRealm)
			}

			try! RealmStore.realm.safeWrite {
				programRealm.exercises = exercises
				realm.add(programRealm, update: .modified)
				savedCount += 1
				
				if savedCount == modelsCount {
					completion()
				}
			}
		}
	}
	
	static func createFeelings(models: [FeelingRealm], completion: @escaping () -> ()) {
		var savedCount = 0
		let modelsCount = models.count
		
		models.forEach { (model) in
			let realmModel = FeelingRealm()
			realmModel.name = model.name
			
			try! RealmStore.realm.safeWrite {
				realm.add(realmModel, update: .modified)
				savedCount += 1
				
				if savedCount == modelsCount {
					completion()
				}
			}
		}
	}
	
	static func createAdvices(models: [AdviceRealm], completion: @escaping () -> ()) {
		var savedCount = 0
		let modelsCount = models.count
		
		models.forEach { (model) in
			let realmModel = AdviceRealm()
			realmModel.title = model.title
			realmModel.text = model.text
			
			try! RealmStore.realm.safeWrite {
				realm.add(realmModel, update: .modified)
				savedCount += 1
				
				if savedCount == modelsCount {
					completion()
				}
			}
		}
		
	}
	
}

