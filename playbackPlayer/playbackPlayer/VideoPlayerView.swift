//
//  VideoPlayerView.swift
//  playbackPlayer
//
//  Created by Abdalla Elnajjar on 2023-12-19.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update UI if needed
    }
}

//#Preview {
//    VideoPlayerView()
//}
