
import Foundation
import RealmSwift

class TrainingRealm: Object, Codable, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var imageURL = ""
    @objc dynamic var isPremium = false
    var exercises = List<ExerciseRealm>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    private enum CodingKeys: String, CodingKey, Codable {
        case name
        ,imageURL
        ,isPremium
        ,exercises
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
        
        let exercisesArray = try container.decode([ExerciseRealm].self, forKey: .exercises)
        self.exercises.append(objectsIn: exercisesArray)
    }
    
}

class TrainingsStore: ObservableObject {
    
    @Published var items: [TrainingRealm] = []
    @Published var dataNotFetched = true
    
    let jsonLoader = JsonLoader()
    private var realmToken: NotificationToken?
    
    init() {
        activateToken()
        load()
    }
    
    private func activateToken() {
        let items = RealmStore.realm.objects(TrainingRealm.self)
        realmToken = items.observe { _ in
            self.items = Array(items)
        }
    }
    
    func load() {
        if SettingsStore.shared.isDataLoaded {
            self.fetch()
        } else {
            jsonLoader.loadData {
                self.fetch()
            }
        }   
    }
    
    func fetch() {
        items = Array(RealmStore.realm.objects(TrainingRealm.self))
        dataNotFetched = false
    }
    
    deinit {
        realmToken?.invalidate()
    }
    
}
