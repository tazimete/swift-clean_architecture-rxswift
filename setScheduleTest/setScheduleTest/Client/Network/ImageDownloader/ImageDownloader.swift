//
//  ImageDownloader.swift
//  tawktestios
//
//  Created by JMC on 17/8/21.
//

import UIKit


public class ImageDownloader: Downloader<UIImage> {
    static let shared = ImageDownloader()

    override init() {
        super.init()
    }
}
