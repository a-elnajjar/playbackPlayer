//
//  Annotation.swift
//  playbackPlayer
//
//  Created by Abdalla Elnajjar on 2024-01-30.
//

import Foundation
struct Annotation: Identifiable, Hashable {
    let id = UUID()
    var text: String
    let timestamp: TimeInterval
    let user: String
}
