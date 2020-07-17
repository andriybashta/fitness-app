
//import SwiftUI
//import Firebase
//import FirebaseDatabase
//import CodableFirebase
//
//class FirebaseLoader {
//
//	let ref: DatabaseReference = Database.database().reference()
//	let settingsStore = SettingsStore()
//
//	func loadData(completion: @escaping () -> ()) {
//		ref.child("programs").observeSingleEvent(of: .value, with: { snapshot in
//			guard let value = snapshot.value else { return }
//			do {
//				let models = try FirebaseDecoder().decode([Training].self, from: value)
//				RealmStore.shared.createPrograms(from: models) {
//					self.settingsStore.isDataLoaded = true
//					self.loadAdvices() {
//						self.loadFeelings() {
//							completion()
//						}
//					}
//				}
//			} catch let error {
//				print(error)
//			}
//		})
//	}
//
//	func loadAdvices(completion: @escaping () -> ()) {
//		ref.child("advices").observeSingleEvent(of: .value, with: { snapshot in
//			guard let value = snapshot.value else { return }
//			do {
//				let models = try FirebaseDecoder().decode([Advice].self, from: value)
//				RealmStore.shared.createAdvices(models: models) {
//					completion()
//				}
//			} catch let error {
//				print(error)
//			}
//		})
//	}
//
//	func loadFeelings(completion: @escaping () -> ()) {
//		ref.child("feelings").observeSingleEvent(of: .value, with: { snapshot in
//			guard let value = snapshot.value else { return }
//			do {
//				let models = try FirebaseDecoder().decode([Feeling].self, from: value)
//				RealmStore.shared.createFeelings(models: models) {
//					completion()
//				}
//			} catch let error {
//				print(error)
//			}
//		})
//	}
//
//}
