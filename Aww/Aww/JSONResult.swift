//
//  JSONResult.swift
//  Aww
//
//  Created by XilongHuang on 27/10/2016.
//  Copyright © 2016 SeanDev. All rights reserved.
// reference: https://developer.apple.com/swift/blog/?id=37
//

import Foundation


/**
{
	"success" : 1 or 0     #1 means success  0 means false  
	"error"   : String	   # "" or error message
}

*/


struct JSONResult{
	
	var success : Int?
	var error: String?
}


let urlComponents: URLComponents = URLComponents(string : "http://192.168.0.1")!
let session: URLSession = URLSession.shared // shared session for interacting with the web service


extension JSONResult{
	

	init?(data: Data){
		guard let json = try? JSONSerialization.jsonObject(with: data, options: []),
			let dictionary = json as? [String : Any],
			let success = dictionary["success"] as? Int,
			let error = dictionary["error"] as? String
		else{
			return nil
		}
		
		self.success = success
		self.error = error
		
	}
	
			
	static func login(username: String, password: String, completion: (JSONResult) -> Void) {
		var  loginURLComponents = urlComponents
		loginURLComponents.path = "/login"
		let loginURL = loginURLComponents.url!
		var loginData = {"username" : username, "password" : password}
		
		session.uploadTask(with: URLRequest(loginURL), from: <#T##Data#>)
		session.dataTask(url: searchURL, completion: { (_, _, data, _)
			var restaurants: [Restaurant] = []
			
			if let data = data,
				let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
				for case let result in json["results"] {
					if let restaurant = Restaurant(json: result) {
						restaurants.append(restaurant)
					}
				}
			}
			
			completion(restaurants)
		}).resume()
	}
}
