//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, URLSession"


URLSession.shared

let d = URLSessionConfiguration.default

let e = URLSessionConfiguration.ephemeral

let b = URLSessionConfiguration.background(withIdentifier: "mybackground")

d.urlCache

e.urlCache

b.urlCache

d.httpCookieStorage

e.httpCookieStorage

b.httpCookieStorage

URLSessionTask()
URLSessionUploadTask()

//Post Request
let postRequest  = NSMutableURLRequest(url: URL(string: "http://localhost")!)
postRequest.httpMethod = "POST"




