//
//  ExpandingList.swift
//  SwiftUIDemo
//
//  Created by Joal Arcos on 9/20/23.
//

import SwiftUI

struct ExpandingList: View {

    // MARK: Properties

    @ObservedObject var school: School

    @State private var isExpanded: Bool = false

    // MARK: Content

    var body: some View {

        VStack {
            ZStack {
                List {
                    ForEach(school.children ?? []) { node in
                        cell(node: node)
                    }
                }
                .listStyle(.inset)
                .transaction { transaction in
                    transaction.animation = nil
                }
            }
        }
        .onAppear {
            let sample1 = "https://v3.cdnpk.net/videvo_files/video/free/2014-12/large_watermarked/Raindrops_Videvo_preview.mp4"
            let sample2 = "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"
            guard let url = URL(string: "\(sample1)") else {
                return
            }
            videoFromURL(url: url)
        }
    }
}

private extension ExpandingList {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    func videoFromURL(url: URL) {
        print(getDocumentsDirectory().absoluteString)
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        guard let urlPath = paths?.appendingPathComponent("/demo.mp4") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let videoData = data else {
                return
            }
            do {
                try videoData.write(to: urlPath, options: .atomic)
            } catch {
                print(error)
            }
        }
        .resume()
    }
}

private extension ExpandingList {
    @ViewBuilder
    func cell(node: School) -> some View {
            DisclosureGroupView(isExpanded: isExpanded) {
                ForEach(node.children ?? [], id: \.id) { child in
                    AnyView(cell(node: child))
                }
            } label: {
                HStack {
                    Text(node.name)

                    Spacer()
                }
            }
    }
}

private struct DisclosureGroupView<Label, Content>: View where Label: View, Content: View {

    @State var isExpanded: Bool = false

    var content: () -> Content
    var label: () -> Label

    @ViewBuilder
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded, content: content, label: label)
    }
}
