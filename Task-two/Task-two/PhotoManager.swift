//
//  PhotoManager.swift
//  Task-two
//
//  Created by Любчик on 10/22/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol PhotoManagerProtocol {
    func getPhotos(onSuccess: @escaping ([PhotoModel]) -> (),onError: @escaping (String) -> ())
}

class PhotoManager: PhotoManagerProtocol {
    
    func getPhotos(onSuccess: @escaping ([PhotoModel]) -> (), onError: @escaping (String) -> ()) {
        guard let url = flickrURL() else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = FlickrUrlConstants.timeout
        Alamofire.request(urlRequest).responseJSON { [weak self] (response) in
            if let error = response.error {
                onError(error.localizedDescription)
            } else {
                DispatchQueue.main.async {
                    guard let jsonData = response.value else { return }
                    guard let data = self?.parseResponce(jsonData: jsonData) else { return }
                    onSuccess(data)
                }
            }
            onError("unhandled result")
        }
        
    }

    private func flickrURL() -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = FlickrUrlConstants.flickrApiScheme
        urlComponents.host = FlickrUrlConstants.flickrApiHost
        urlComponents.path = FlickrUrlConstants.flickrApiPath
        urlComponents.queryItems = [
            URLQueryItem(name: JSONParameters.method, value: FlickrUrlConstants.method),
            URLQueryItem(name: JSONParameters.apikey, value: FlickrUrlConstants.APIKey),
            URLQueryItem(name: JSONParameters.format, value: FlickrUrlConstants.json),
            URLQueryItem(name: JSONParameters.nojsoncallback, value: FlickrUrlConstants.nojsoncallback),
            URLQueryItem(name: JSONParameters.perpage, value: FlickrUrlConstants.perPage),
            URLQueryItem(name: JSONParameters.page, value: FlickrUrlConstants.page),
            URLQueryItem(name: JSONParameters.radius, value: FlickrUrlConstants.radius),
            URLQueryItem(name: JSONParameters.radiusUnits, value: FlickrUrlConstants.radiusUnits),
            URLQueryItem(name: JSONParameters.page, value: FlickrUrlConstants.page),
            URLQueryItem(name: JSONParameters.extras, value: FlickrUrlConstants.views),
            URLQueryItem(name: JSONParameters.extras, value: FlickrUrlConstants.size)
        ]
        return urlComponents.url
    }
    
    private func parseResponce(jsonData: Any) -> [PhotoModel] {
        let jsonValue = JSON(jsonData)
        let photos = jsonValue["photos"].arrayValue
        var models = [PhotoModel]()
        for photo in photos {
            let title = photo["title"].stringValue
            let owner = photo["owner"].stringValue
            let id = photo["id"].stringValue
            let secret = photo["secret"].stringValue
            let server = photo["server"].stringValue
            let url_m = photo["url_m"].stringValue
            let views = photo["views"].stringValue
            models.append(PhotoModel(owner: owner, title: title, server: server, id: id, url: url_m, secret: secret, views: views))
        }
        return models
    }
}
    
    

