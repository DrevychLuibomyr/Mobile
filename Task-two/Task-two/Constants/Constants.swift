//
//  Constants.swift
//  Task-two
//
//  Created by Любчик on 9/13/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let alertTitle = "Please write text"
    static let alertMessage = "Sorry....your TextFields is empty(("
    static let alertButtonTitle = "Ok"
    static let alertNotValidFiledsMessage = "Your fields is empty or you make mistake"
    static let cellIdentifier = "Cell"
    static let modelKey = "model"
    static let collectionCellIdentifier = "CollectionViewCell"
    static let numbersOfColumns: CGFloat = 3
    static let spaceBetweenCell: CGFloat = 8
}

struct FlickrUrlConstants {
    static let APIKey = "72048efe61d5bb85ac1e5199e6aaf8ad"
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
    static let size = "url_m,views,owner_name"
    static let views = "views"
    static let extra = "extra"
    static let radiusUnits = "km"
    static let radius = "10"
    static let long = "-74.899509"
    static let lat = "39.700365"
    static let dateupload = "dateupload"
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
    static let dateupload = "date_upload"
}
