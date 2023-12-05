//
//  ContentView.swift
//  SwiftUIdemo2
//
//  Created by Joal Arcos on 10/18/23.
//

import SwiftUI
import VideoPlayer
import AVFoundation

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    @State var play = false
    @State var index = 0

    var videoURLs: [URL] = [
        URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!,
        URL(string: "http://vfx.mtime.cn/Video/2019/06/29/mp4/190629004821240734.mp4")!,
        URL(string: "http://vfx.mtime.cn/Video/2019/06/27/mp4/190627231412433967.mp4")!,
        URL(string: "http://vfx.mtime.cn/Video/2019/06/25/mp4/190625091024931282.mp4")!,
        URL(string: "http://vfx.mtime.cn/Video/2019/06/16/mp4/190616155507259516.mp4")!,
        URL(string: "http://vfx.mtime.cn/Video/2019/06/15/mp4/190615103827358781.mp4")!,
        URL(string: "http://vfx.mtime.cn/Video/2019/06/05/mp4/190605101703931259.mp4")!,
    ]

    var body: some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
            }
            if let url = URL(string: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4") {
                VideoPlayer(url: videoURLs[index % videoURLs.count], play: $play)

            }
            Button("New Image") {
                viewModel.onAppear()
                play = true
                self.index += 1
            }.buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            viewModel.onAppear()
        }
    }
}

private struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel(id: "123"))
    }
}
