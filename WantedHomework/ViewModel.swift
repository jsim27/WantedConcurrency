//
//  ViewModel.swift
//  WantedHomework
//
//  Created by Jae-hoon Sim on 2023/03/02.
//

import Foundation
import RxSwift

class ViewModel: ViewModelProtocol {
    struct Input {
        let buttonTapped: Observable<Int>
        let loadAllTapped: Observable<Void>
    }

    struct Output {
        let image: Observable<(Int, Data?)>
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
            .flatMap { index, url in
                Observable<(Int, Data?)>.create { observer in
                    let task = URLSession.shared.dataTask(with: url) { data, response, error in
                        if let error = error {
                            print("Error: \(error)")
                            return
                        }
                        if let data = data {
                            observer.onNext((index, data))
                        }
                    }
                    observer.onNext((index, nil))
                    task.resume()

                    return Disposables.create {
                        task.cancel()
                    }
                }
            }

        return Output(image: imageDataStream)
    }
}
