//
//  Constants.swift
//  Task-two
//
//  Created by Любчик on 9/13/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation

struct Constants {
    static let alertTitle = "Please write text"
    static let alertMessage = "Sorry....your TextFields is empty(("
    static let alertButtonTitle = "Ok"
    static let alertNotValidFiledsMessage = "Your fields is empty or you make mistake"
    static let cellIdentifier = "Cell"
    static let modelKey = "model"
}

struct FlickrUrlConstants {
    static let APIKey = "bc8b6f460ea043d4953dcaf0d627437f"
    static let timeout = 25.0
    static let flickrApiScheme = "https"
    static let flickrApiHost = "api.flickr.com"
    static let flickrApiPath = "/services/rest/"
    static let method = "flickr.photos.search"
    static let json = "json"
    static let nojsoncallback = "nojsoncallback"
    static let callback = "1"
    static let perPage = "50"
    static let page = "0"
    static let size = "url_m"
    static let views = "views"
    static let extra = "extra"
    static let radiusUnits = "km"
    static let radius = "1"
}

struct JSONParameters {
    static let method = "method"
    static let apikey = "api_key"
    static let extras = "extras"
    static let format = "format"
    static let perpage = "per_page"
    static let page = "page"
    static let nojsoncallback = "nojsoncallback"
    static let lon = "lon"
    static let lat = "lat"
    static let radius = "radius"
    static let radiusUnits = "radius_units"
}
