//
//  AnnotationPlayerViewModel.swift
//  playbackPlayer
//
//  Created by Abdalla Elnajjar on 2024-01-30.
//

import AVKit
class AnnotationPlayerViewModel: ObservableObject {
    // Video player properties
    @Published var player: AVPlayer?
    @Published var currentTime: TimeInterval = 0
    
    // Annotation properties
    @Published var annotations: [Annotation] = []
    @Published var newAnnotationText: String = ""
    
    // For updating annotations
    @Published var selectedAnnotation: Annotation?
    @Published var isUpdateSheetPresented: Bool = false
    @Published var updatedText: String = ""
    
    let screen = UIScreen.main.bounds
    
    init() {
        setupPlayer()
    }
    
    func setupPlayer() {
        if let videoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
            player = AVPlayer(url: videoURL)
            player?.play()
            
            // Add an observer for time updates
            player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main) { [weak self] time in
                self?.currentTime = time.seconds
            }
        }
    }
    
    func addAnnotation() {
        guard !newAnnotationText.isEmpty else { return }
        
        let newAnnotation = Annotation(text: newAnnotationText, timestamp: currentTime, user: "User123")
        annotations.append(newAnnotation)
        
        // Clear the text field after adding the annotation
        newAnnotationText = ""
    }
    
    func seekToTime(_ time: Double) {
        player?.seek(to: CMTime(seconds: time, preferredTimescale: 1))
    }
    
    func jumpToAnnotation(_ annotation: Annotation) {
        seekToTime(annotation.timestamp)
    }
    
    func calculateMarkerPosition(_ timestamp: Double) -> CGFloat {
        let percentage = CGFloat(timestamp / getTotalDuration())
        return percentage * UIScreen.main.bounds.width
    }
    
    func getTotalDuration() -> Double {
        return player?.currentItem?.duration.seconds ?? 0
    }
}
