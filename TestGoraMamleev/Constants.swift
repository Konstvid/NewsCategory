//
//  Constants.swift
//  TestGoraMamleev
//
//  Created by Andrey on 18.06.2022.
//

import Foundation

typealias ResultCompletion = (Result<Data, Error>) -> ()
typealias NewsResponseCompletion = (Result<NewsResponse, Error>) -> ()
typealias NewsCompletion = (News) -> ()

let baseNewsURL = "https://newsapi.org/v2/top-headlines/sources?country=us&apiKey="
let accessKey = "20b287a637b24730b431d1a7ed439e9b"
let iconURL = "https://picsum.photos/200/300"
