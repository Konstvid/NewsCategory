//
//  Router.swift
//  TestGoraMamleev
//
//  Created by Andrey on 21.06.2022.
//


import UIKit

class Router {
    
    func show(urlBrowser: String?) {
        guard let urlBrowser = urlBrowser, let url = URL(string: urlBrowser) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
