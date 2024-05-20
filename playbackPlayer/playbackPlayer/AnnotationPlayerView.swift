//
//  AnnotationPlayerView.swift
//  playbackPlayer
//
//  Created by Abdalla Elnajjar on 2024-01-30.
//


import SwiftUI
import AVKit

struct AnnotationPlayerView: View {
    @StateObject private var viewModel = AnnotationPlayerViewModel()
    
    var body: some View {
        VStack {
            // Video player
            VideoPlayer(player: viewModel.player)
                .frame(height: 200)
            
            
            // Timeline with annotations
            ZStack {
                if viewModel.getTotalDuration() > 0 {
                    Slider(
                        value: $viewModel.currentTime,
                        in: 0...viewModel.getTotalDuration(),
                        step: 0.01
                    )
                    .overlay(
                        ZStack {
                            ForEach(viewModel.annotations, id: \.self) { annotation in
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 10, height: 10)
                                    .position(x: viewModel.calculateMarkerPosition(annotation.timestamp), y: 15)
                                    .onTapGesture {
                                        viewModel.jumpToAnnotation(annotation)
                                    }
                            }
                        }
                    )
                    .accentColor(.blue)
                    .frame(width: viewModel.screen.width)
                }
            }
            .padding(.horizontal)

            // Display the filtered annotations based on the selected annotation
            List(viewModel.annotations.filter { $0.timestamp <= viewModel.currentTime }) { annotation in
                VStack(alignment: .leading) {
                    Text("\(annotation.user) at \(annotation.timestamp, specifier: "%.2f") seconds:")
                    Text(annotation.text)
                        .onTapGesture {
                            viewModel.selectedAnnotation = annotation
                            viewModel.isUpdateSheetPresented = true
                            viewModel.updatedText = annotation.text
                        }
                }
            }

            // Add annotation input
            HStack {
                TextField("Add annotation...", text: $viewModel.newAnnotationText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button("Add Annotation") {
                    viewModel.addAnnotation()
                }
                .padding()
            }
        }
    }
}




#Preview {
    AnnotationPlayerView()
}
