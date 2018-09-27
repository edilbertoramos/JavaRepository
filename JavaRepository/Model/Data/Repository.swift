//
//  Repository.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation
import ObjectMapper

struct Repository {
    
    // Relations
    var owner = Owner()
    var license = License()
    
    // Others
    var id = Int()
    var node_id = String()
    var name = String()
    var full_name = String()
    var private_condition = false
    var html_url = String()
    var description = String()
    var fork = false
    var url = String()
    var forks_url = String()
    var keys_url = String()
    var collaborators_url = String()
    var teams_url = String()
    var hooks_url = String()
    var issue_events_url = String()
    var events_url = String()
    var assignees_url = String()
    var branches_url = String()
    var tags_url = String()
    var blobs_url = String()
    var git_tags_url = String()
    var git_refs_url = String()
    var trees_url = String()
    var statuses_url = String()
    var languages_url = String()
    var stargazers_url = String()
    var contributors_url = String()
    var subscribers_url = String()
    var subscription_url = String()
    var commits_url = String()
    var git_commits_url = String()
    var comments_url = String()
    var issue_comment_url = String()
    var contents_url = String()
    var compare_url = String()
    var merges_url = String()
    var archive_url = String()
    var downloads_url = String()
    var issues_url = String()
    var pulls_url = String()
    var milestones_url = String()
    var notifications_url = String()
    var labels_url = String()
    var releases_url = String()
    var deployments_url = String()
    var created_at = String()
    var updated_at = String()
    var pushed_at = String()
    var git_url = String()
    var ssh_url = String()
    var clone_url = String()
    var svn_url = String()
    var homepage = String()
    var size = Int()
    var stargazers_count = Int()
    var watchers_count = Int()
    var language = String()
    var has_issues = String()
    var has_projects = false
    var has_downloads = false
    var has_wiki = false
    var has_pages = false
    var forks_count = Int()
    var mirror_url = String()
    var archived = false
    var open_issues_count = Int()
    var forks = Int()
    var open_issues = Int()
    var watchers = Int()
    var default_branch = String()
    var score = Double()
    
}

extension Repository: Mappable {
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        
        // Relations
        owner                       <- map["owner"]
        license                     <- map["license"]

        // Other
        id                          <- map["id"]
        node_id                     <- map["node_id"]
        name                        <- map["name"]
        full_name                   <- map["full_name"]
        private_condition           <- map["private"]
        html_url                    <- map["html_url"]
        description                 <- map["description"]
        fork                        <- map["fork"]
        url                         <- map["url"]
        forks_url                   <- map["forks_url"]
        keys_url                    <- map["keys_url"]
        collaborators_url           <- map["collaborators_url"]
        teams_url                   <- map["teams_url"]
        hooks_url                   <- map["hooks_url"]
        issue_events_url            <- map["issue_events_url"]
        events_url                  <- map["events_url"]
        assignees_url               <- map["assignees_url"]
        branches_url                <- map["branches_url"]
        tags_url                    <- map["tags_url"]
        blobs_url                   <- map["blobs_url"]
        git_tags_url                <- map["git_tags_url"]
        git_refs_url                <- map["git_refs_url"]
        trees_url                   <- map["trees_url"]
        statuses_url                <- map["statuses_url"]
        languages_url               <- map["languages_url"]
        stargazers_url              <- map["stargazers_url"]
        contributors_url            <- map["contributors_url"]
        subscribers_url             <- map["subscribers_url"]
        subscription_url            <- map["subscription_url"]
        commits_url                 <- map["commits_url"]
        git_commits_url             <- map["git_commits_url"]
        comments_url                <- map["comments_url"]
        issue_comment_url           <- map["issue_comment_url"]
        contents_url                <- map["contents_url"]
        compare_url                 <- map["compare_url"]
        merges_url                  <- map["merges_url"]
        archive_url                 <- map["archive_url"]
        downloads_url               <- map["downloads_url"]
        issues_url                  <- map["issues_url"]
        pulls_url                   <- map["pulls_url"]
        milestones_url              <- map["milestones_url"]
        notifications_url           <- map["notifications_url"]
        labels_url                  <- map["labels_url"]
        releases_url                <- map["releases_url"]
        deployments_url             <- map["deployments_url"]
        created_at                  <- map["created_at"]
        updated_at                  <- map["updated_at"]
        pushed_at                   <- map["pushed_at"]
        git_url                     <- map["git_url"]
        ssh_url                     <- map["ssh_url"]
        clone_url                   <- map["clone_url"]
        svn_url                     <- map["svn_url"]
        homepage                    <- map["homepage"]
        size                        <- map["size"]
        stargazers_count            <- map["stargazers_count"]
        watchers_count              <- map["watchers_count"]
        language                    <- map["language"]
        has_issues                  <- map["has_issues"]
        has_projects                <- map["has_projects"]
        has_downloads               <- map["has_downloads"]
        has_wiki                    <- map["has_wiki"]
        has_pages                   <- map["has_pages"]
        forks_count                 <- map["forks_count"]
        mirror_url                  <- map["mirror_url"]
        archived                    <- map["archived"]
        open_issues_count           <- map["open_issues_count"]
        forks                       <- map["forks"]
        open_issues                 <- map["open_issues"]
        watchers                    <- map["watchers"]
        default_branch              <- map["default_branch"]
        score                       <- map["score"]
        
    }
    
    
}

//"id": 22790488,
//"node_id": "MDEwOlJlcG9zaXRvcnkyMjc5MDQ4OA==",
//"name": "java-design-patterns",
//"full_name": "iluwatar/java-design-patterns",
//"private": false,
//"owner": {
//    "login": "iluwatar",
//    "id": 582346,
//    "node_id": "MDQ6VXNlcjU4MjM0Ng==",
//    "avatar_url": "https://avatars1.githubusercontent.com/u/582346?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/iluwatar",
//    "html_url": "https://github.com/iluwatar",
//    "followers_url": "https://api.github.com/users/iluwatar/followers",
//    "following_url": "https://api.github.com/users/iluwatar/following{/other_user}",
//    "gists_url": "https://api.github.com/users/iluwatar/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/iluwatar/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/iluwatar/subscriptions",
//    "organizations_url": "https://api.github.com/users/iluwatar/orgs",
//    "repos_url": "https://api.github.com/users/iluwatar/repos",
//    "events_url": "https://api.github.com/users/iluwatar/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/iluwatar/received_events",
//    "type": "User",
//    "site_admin": false
//},
//"html_url": "https://github.com/iluwatar/java-design-patterns",
//"description": "Design patterns implemented in Java",
//"fork": false,
//"url": "https://api.github.com/repos/iluwatar/java-design-patterns",
//"forks_url": "https://api.github.com/repos/iluwatar/java-design-patterns/forks",
//"keys_url": "https://api.github.com/repos/iluwatar/java-design-patterns/keys{/key_id}",
//"collaborators_url": "https://api.github.com/repos/iluwatar/java-design-patterns/collaborators{/collaborator}",
//"teams_url": "https://api.github.com/repos/iluwatar/java-design-patterns/teams",
//"hooks_url": "https://api.github.com/repos/iluwatar/java-design-patterns/hooks",
//"issue_events_url": "https://api.github.com/repos/iluwatar/java-design-patterns/issues/events{/number}",
//"events_url": "https://api.github.com/repos/iluwatar/java-design-patterns/events",
//"assignees_url": "https://api.github.com/repos/iluwatar/java-design-patterns/assignees{/user}",
//"branches_url": "https://api.github.com/repos/iluwatar/java-design-patterns/branches{/branch}",
//"tags_url": "https://api.github.com/repos/iluwatar/java-design-patterns/tags",
//"blobs_url": "https://api.github.com/repos/iluwatar/java-design-patterns/git/blobs{/sha}",
//"git_tags_url": "https://api.github.com/repos/iluwatar/java-design-patterns/git/tags{/sha}",
//"git_refs_url": "https://api.github.com/repos/iluwatar/java-design-patterns/git/refs{/sha}",
//"trees_url": "https://api.github.com/repos/iluwatar/java-design-patterns/git/trees{/sha}",
//"statuses_url": "https://api.github.com/repos/iluwatar/java-design-patterns/statuses/{sha}",
//"languages_url": "https://api.github.com/repos/iluwatar/java-design-patterns/languages",
//"stargazers_url": "https://api.github.com/repos/iluwatar/java-design-patterns/stargazers",
//"contributors_url": "https://api.github.com/repos/iluwatar/java-design-patterns/contributors",
//"subscribers_url": "https://api.github.com/repos/iluwatar/java-design-patterns/subscribers",
//"subscription_url": "https://api.github.com/repos/iluwatar/java-design-patterns/subscription",
//"commits_url": "https://api.github.com/repos/iluwatar/java-design-patterns/commits{/sha}",
//"git_commits_url": "https://api.github.com/repos/iluwatar/java-design-patterns/git/commits{/sha}",
//"comments_url": "https://api.github.com/repos/iluwatar/java-design-patterns/comments{/number}",
//"issue_comment_url": "https://api.github.com/repos/iluwatar/java-design-patterns/issues/comments{/number}",
//"contents_url": "https://api.github.com/repos/iluwatar/java-design-patterns/contents/{+path}",
//"compare_url": "https://api.github.com/repos/iluwatar/java-design-patterns/compare/{base}...{head}",
//"merges_url": "https://api.github.com/repos/iluwatar/java-design-patterns/merges",
//"archive_url": "https://api.github.com/repos/iluwatar/java-design-patterns/{archive_format}{/ref}",
//"downloads_url": "https://api.github.com/repos/iluwatar/java-design-patterns/downloads",
//"issues_url": "https://api.github.com/repos/iluwatar/java-design-patterns/issues{/number}",
//"pulls_url": "https://api.github.com/repos/iluwatar/java-design-patterns/pulls{/number}",
//"milestones_url": "https://api.github.com/repos/iluwatar/java-design-patterns/milestones{/number}",
//"notifications_url": "https://api.github.com/repos/iluwatar/java-design-patterns/notifications{?since,all,participating}",
//"labels_url": "https://api.github.com/repos/iluwatar/java-design-patterns/labels{/name}",
//"releases_url": "https://api.github.com/repos/iluwatar/java-design-patterns/releases{/id}",
//"deployments_url": "https://api.github.com/repos/iluwatar/java-design-patterns/deployments",
//"created_at": "2014-08-09T16:45:18Z",
//"updated_at": "2018-09-27T02:17:53Z",
//"pushed_at": "2018-09-25T20:15:02Z",
//"git_url": "git://github.com/iluwatar/java-design-patterns.git",
//"ssh_url": "git@github.com:iluwatar/java-design-patterns.git",
//"clone_url": "https://github.com/iluwatar/java-design-patterns.git",
//"svn_url": "https://github.com/iluwatar/java-design-patterns",
//"homepage": "http://java-design-patterns.com",
//"size": 18392,
//"stargazers_count": 39529,
//"watchers_count": 39529,
//"language": "Java",
//"has_issues": true,
//"has_projects": false,
//"has_downloads": true,
//"has_wiki": true,
//"has_pages": true,
//"forks_count": 12799,
//"mirror_url": null,
//"archived": false,
//"open_issues_count": 180,
//"license": {
//    "key": "mit",
//    "name": "MIT License",
//    "spdx_id": "MIT",
//    "url": "https://api.github.com/licenses/mit",
//    "node_id": "MDc6TGljZW5zZTEz"
//},
//"forks": 12799,
//"open_issues": 180,
//"watchers": 39529,
//"default_branch": "master",
//"score": 1.0
