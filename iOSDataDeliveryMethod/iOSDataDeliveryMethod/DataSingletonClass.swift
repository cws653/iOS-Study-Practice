//
//  DataSingletonClass.swift
//  iOSDataDeliveryMethod
//
//  Created by 최원석 on 2021/05/19.
//

import Foundation

class DataSingleTonClass {
    static let shared = DataSingleTonClass()

    var textViewContents: String?
}
