
import Foundation
import AVKit
import AVFoundation
import SwiftUI

struct PlayerView: UIViewRepresentable {
	let url: URL?
	
	func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
	}
	
	func makeUIView(context: Context) -> UIView {
		return PlayerUIView(frame: .zero, url: url)
	}
}

class PlayerUIView: UIView {
	private let playerLayer = AVPlayerLayer()
	
	init(frame: CGRect, url: URL?) {
		super.init(frame: frame)
		
		if let url = url {
			let player = AVPlayer(url: url)
			
			NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
				player.seek(to: CMTime.zero)
				player.play()
			}
			
			player.play()
			
			playerLayer.player = player
			layer.addSublayer(playerLayer)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		playerLayer.frame = bounds
	}
}
