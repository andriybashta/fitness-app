
import Foundation
import RealmSwift

class DayRealm: Object {
	@objc dynamic var id = UUID().uuidString
	@objc dynamic var date = Date()
	dynamic var feelings = List<FeelingRealm>()
	
	override static func primaryKey() -> String? {
		return "id"
	}
}

final class DaysStore: ObservableObject {
	
	@Published var items: [DayRealm] = []
	@Published var feelings: [FeelingRealm] = []
	
	private var realmToken: NotificationToken?
	
	init() {
		activateToken()
		fetchDays()
		fetchFeelings()
	}
	
	private func activateToken() {
		let items = RealmStore.realm.objects(DayRealm.self)
		realmToken = items.observe { _ in
			self.items = Array(items)
		}
	}
	
	func createDay(items: [FeelingRealm]) {
		let day = DayRealm()
		
		items.forEach { (item) in
			day.feelings.append(item)
		}
		
		try! RealmStore.realm.safeWrite {
			RealmStore.realm.add(day)
		}
	}
	
	func getStringDate(date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MMM d, h:mm a"
		return dateFormatter.string(from: date)
	}
	
	func fetchDays() {
		items = Array(RealmStore.realm.objects(DayRealm.self))
	}
	
	func fetchFeelings() {
		feelings = Array(RealmStore.realm.objects(FeelingRealm.self))
	}
	
	deinit {
		realmToken?.invalidate()
	}
	
}
