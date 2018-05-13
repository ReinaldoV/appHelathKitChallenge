//
//  ObjectivesServices.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 13/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import Foundation

class ObjectivesServices {

    func getObjectives(onSuccess: @escaping ([Objective]) -> Void,
                       onError: @escaping (_ error: Error?) -> Void) {

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "thebigachallenge.appspot.com"
        urlComponents.path = "/_ah/api/myApi/v1/goals"
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            if let error = responseError {
                onError(error)
            } else if let jsonData = responseData {
                let decoder = JSONDecoder()
                do {
                    let objectivesResponse = try decoder.decode(ObjectivesResponseDTO.self, from: jsonData)
                    let listOfObjectives = Mapper.objectivesFromObjectivesResponseDTO(response: objectivesResponse)
                    onSuccess(listOfObjectives)
                } catch {
                    onError(error)
                }
            }
        }

        task.resume()
    }
}
