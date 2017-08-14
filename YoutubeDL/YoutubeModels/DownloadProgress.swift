//
//  DownloadProgress.swift
//  YoutubeDL
//
//  Created by Pieter de Bie on 02/10/2016.
//  Copyright © 2016 Pieter de Bie. All rights reserved.
//

import Foundation

class DownloadProgress : NSObject {
    var downloadedBytes = 0
    var totalBytes = 0
    var speed = 0
    var status = Status.Queued
    
    enum Status {
        case Queued
        case Preparing
        case Downloading
    }
    
    var progress: Float {
        return Float(downloadedBytes) / Float(totalBytes)
    }
    
    init(status: Status) {
        self.status = status
    }
    
    init(dict: [AnyHashable: Any]) {
        status = .Downloading
        if let db = dict["downloaded_bytes"] as? Int {
            self.downloadedBytes = db
        }
        if let speed = dict["speed"] as? Int {
            self.speed = speed
        }
        if let tb = dict["total_bytes"] as? Int {
            self.totalBytes = tb
        }
    }
}
