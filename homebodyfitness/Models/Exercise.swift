
import Foundation
import RealmSwift

class ExerciseRealm: Object, Codable, Identifiable {
	dynamic var owner: TrainingRealm?
	@objc dynamic var id = UUID().uuidString
	@objc dynamic var name = ""
	@objc dynamic var textRepresentation = ""
    @objc dynamic var videoURL = ""
    @objc dynamic var isPremium = false
    @objc dynamic var completedCount = 0
	
    private enum CodingKeys: CodingKey {
           case name, textRepresentation, videoURL, isPremium
       }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.textRepresentation = try container.decode(String.self, forKey: .textRepresentation)
        self.videoURL = try container.decode(String.self, forKey: .videoURL)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
}
