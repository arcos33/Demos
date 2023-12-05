import UIKit
import Kingfisher
import SwiftUI
import AVFoundation

class ViewModel: ObservableObject {

    // MARK: - Properties

    @Published var image: KFCrossPlatformImage?

    var id: String

    // MARK: - Init

    init(id: String) {
        self.id = id
    }

    // MARK: - Functions

    func onAppear() {
        //guard let someURLPath = Bundle.main.path(forResource: "demo", ofType: "mp3") else { return }
        let sample = "https://actions.google.com/sounds/v1/alarms/alarm_clock.ogg"
        downloadAndSaveAudioFile(sample, completion: { urlString in
            guard let url = URL(string: urlString) else { return }
            let avPlayer = AVPlayer(url: url)
            avPlayer.play()
        })

        if let url = URL(string: "https://picsum.photos/200") {
            downloadImage(type: .url(url), completion: { [weak self] image in
                self?.image = image
            })
        }
    }

    func downloadAndSaveAudioFile(_ audioFile: String, completion: @escaping (String) -> Void) {
        if let audioUrl = URL(string: audioFile) {

            // then lets create your document folder url
            let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

            // lets create your destination file url
            let destinationUrl = documentsDirectoryURL.appendingPathComponent(audioUrl.lastPathComponent)
            print(destinationUrl)

            // to check if it exists before downloading it
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                completion(destinationUrl.path)
                print("The file already exists at path")

                // if the file doesn't exist
            } else {

                // you can use NSURLSession.sharedSession to download the data asynchronously
                URLSession.shared.downloadTask(with: audioUrl, completionHandler: { (location, response, error) -> Void in
                    if let httpResponse = response as? HTTPURLResponse {
                        print(httpResponse.statusCode)

                    }
                    guard let location = location, error == nil else { return }
                    do {
                        // after downloading your file you need to move it to your destination url
                        try FileManager.default.moveItem(at: location, to: destinationUrl)
                        completion(destinationUrl.path)
                        print("File moved to documents folder")
                    } catch let error as NSError {
                        completion("")
                        print(error.localizedDescription)
                    }
                }).resume()
            }
        }

    }



    func imageFromURL(type: AttachmentType) {
        if !ImageCache.default.isCached(forKey: id) {
            downloadImage(type: type, completion: { [weak self] image in
                self?.image = image
            })
        } else {
            retrieveImage(completion: { [weak self] image in
                self?.image = image
            })
        }
    }

    func downloadImage(type: AttachmentType, completion: @escaping (KFCrossPlatformImage) -> Void) {
        if case .url(let uRL) = type {
            let downloader = ImageDownloader.default
            downloader.downloadImage(with: uRL, options: .none, completionHandler: { result in
                switch result {
                case .success(let value):
                    ImageCache.default.storeToDisk(value.originalData, forKey: self.id)
                    completion(value.image)
                case .failure(let error):
                    print(error)
                }
            })
        }
    }

    func retrieveImage(completion: @escaping (KFCrossPlatformImage) -> Void) {
        KingfisherManager.shared.cache.retrieveImage(forKey: id, completionHandler: { result in
            switch result {
            case .success(let value):
                if let image = value.image {
                    completion(image)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}
