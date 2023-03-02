//
//  ViewModel.swift
//  WantedHomework
//
//  Created by Jae-hoon Sim on 2023/03/02.
//

import Foundation
import RxSwift

class ViewModel: NSObject, ViewModelProtocol {

    struct Input {
        let buttonTapped: Observable<Int>
        let loadAllTapped: Observable<Void>
    }

    struct Output {
        let image: Observable<(Int, Data)>
        let progress: [Int: Observable<Progress>]
    }

    private lazy var urlSession = URLSession(configuration: .default,
                                             delegate: self,
                                             delegateQueue: nil)

    private var downloadTasks: [Int: URLSessionDownloadTask] = [:]
    private var imageDataStream = PublishSubject<(Int, Data)>()
    private var progresses: [Int: PublishSubject<Progress>] = {
        Dictionary(
            uniqueKeysWithValues: (0..<5).map { ($0, PublishSubject<Progress>()) }
        )
    }()

    private func startDownload(url: URL, index: Int) {
        let downloadTask = self.urlSession.downloadTask(with: url)
        DispatchQueue.global().async {
            downloadTask.resume()
        }
        self.downloadTasks[index] = downloadTask
        self.progresses[index]?.onNext(downloadTask.progress)
    }

    func transform(input: Input) -> Output {
        let buttonsTapEvent = input.buttonTapped
            .compactMap { index -> (Int, URL)? in
                guard let url = BearImageURL(rawValue: index)?.url else {
                    print("Error: invalid URL at imageView \(index)")
                    return nil
                }
                return (index, url)
            }
        
        let loadAllButtonEvent: Observable<(Int, URL)> = input.loadAllTapped
            .map { [0,1,2,3,4] }
            .flatMap{ Observable.from($0) }
            .compactMap {
                guard let url = BearImageURL(rawValue: $0)?.url else {
                    return nil
                }
                return ($0, url)
            }

        let imageDataStream = Observable.merge(buttonsTapEvent, loadAllButtonEvent)
            .flatMap { index, url -> Observable<(Int, Data)> in
                self.startDownload(url: url, index: index)
                return self.imageDataStream
            }

        return Output(
            image: imageDataStream,
            progress: self.progresses)
    }
}

extension ViewModel: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        self.downloadTasks.filter { taskByIndex in
            taskByIndex.value == downloadTask
        }
        .forEach { index, task in
            do {
                try self.imageDataStream.onNext((index, Data(contentsOf: location) ))
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
