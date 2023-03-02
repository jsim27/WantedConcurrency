//
//  BearImageURL.swift
//  WantedHomework
//
//  Created by Jae-hoon Sim on 2023/03/02.
//

import Foundation

enum BearImageURL: Int {
    case family
    case roaring
    case sayHi
    case piggyback
    case teddy

    var url: URL? {
        switch self {
        case .family:
            return URL(string: "https://images4.alphacoders.com/871/871898.jpg")
        case .roaring:
            return URL(string: "https://wallpaperaccess.com/full/91364.jpg")
        case .sayHi:
            return URL(string: "https://wallpapershome.com/images/wallpapers/bear-3840x2160-4k-hd-wallpaper-hi-water-national-geographic-big-144.jpg")
        case .piggyback:
            return URL(string: "https://www.wallpapers13.com/wp-content/uploads/2016/03/Bear-with-a-cute-little-bear-HD-Wallpaper-1920x1440.jpg")
        case .teddy:
            return URL(string: "https://4kwallpapers.com/images/wallpapers/teddy-bear-rose-cute-toy-gift-valentines-day-5k-2880x1800-441.jpg")
        }
    }
}
