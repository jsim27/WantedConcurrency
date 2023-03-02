//
//  ViewModelProtocol.swift
//  WantedHomework
//
//  Created by Jae-hoon Sim on 2023/03/02.
//

import Foundation

protocol ViewModelProtocol: AnyObject {

    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

