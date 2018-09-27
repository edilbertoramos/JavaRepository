//
//  Owner.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Owner {
    
    var login = String()
    var id = Int()
    var node_id = String()
    var avatar_url = String()
    var gravatar_id = String()
    var url = String()
    var html_url = String()
    var followers_url = String()
    var following_url = String()
    var gists_url = String()
    var starred_url = String()
    var subscriptions_url = String()
    var organizations_url = String()
    var repos_url = String()
    var events_url = String()
    var received_events_url = String()
    var type = String()
    var site_admin = true

}

extension Owner: Mappable {
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        login                       <- map["login"]
        id                          <- map["id"]
        node_id                     <- map["node_id"]
        avatar_url                  <- map["avatar_url"]
        gravatar_id                 <- map["gravatar_id"]
        url                         <- map["url"]
        html_url                    <- map["html_url"]
        followers_url               <- map["followers_url"]
        following_url               <- map["following_url"]
        gists_url                   <- map["gists_url"]
        starred_url                 <- map["starred_url"]
        subscriptions_url           <- map["subscriptions_url"]
        organizations_url           <- map["organizations_url"]
        repos_url                   <- map["repos_url"]
        events_url                  <- map["events_url"]
        received_events_url         <- map["received_events_url"]
        type                        <- map["type"]
        site_admin                  <- map["site_admin"]
        
    }
    
}

// MARK: JSON Object example
//    "login": "alibaba",
//    "id": 1961952,
//    "node_id": "MDEyOk9yZ2FuaXphdGlvbjE5NjE5NTI=",
//    "avatar_url": "https://avatars1.githubusercontent.com/u/1961952?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/alibaba",
//    "html_url": "https://github.com/alibaba",
//    "followers_url": "https://api.github.com/users/alibaba/followers",
//    "following_url": "https://api.github.com/users/alibaba/following{/other_user}",
//    "gists_url": "https://api.github.com/users/alibaba/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/alibaba/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/alibaba/subscriptions",
//    "organizations_url": "https://api.github.com/users/alibaba/orgs",
//    "repos_url": "https://api.github.com/users/alibaba/repos",
//    "events_url": "https://api.github.com/users/alibaba/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/alibaba/received_events",
//    "type": "Organization",
//    "site_admin": false

