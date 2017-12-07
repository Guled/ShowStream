import Vapor
import Foundation


extension Droplet {
    func setupRoutes() throws {
        
        get ("getdate") { req in
           
            let est = Locale(identifier: "US-GA")
            let currentDateTime = Date().description(with: est )
            
            var json = JSON()
            try json.set("currentDateTime", currentDateTime)
            return currentDateTime
        }
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
