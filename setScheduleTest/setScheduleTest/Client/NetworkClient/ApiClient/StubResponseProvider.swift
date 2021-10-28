//
//  StubResponseProvider.swift
//  tawktestios
//
//  Created by JMC on 3/8/21.
//

import Foundation


public class StubResponseProvider{
    
    public static func getGithubUserListResponse() -> [GithubUser] {
        let user1 = GithubUser()
        user1.id = 10
        user1.username = "test name 1"
        user1.avatarUrl = "www.testapp.com/img/10"

        let user2 = GithubUser()
        user2.id = 11
        user2.username = "test name 2"
        user2.avatarUrl = "www.testapp.com/img/11"

        let user3 = GithubUser()
        user3.id = 12
        user3.username = "test name 3"
        user3.avatarUrl = "www.testapp.com/img/12"

        return [user1, user2, user3]
    }
    
    public static func get<T: Codable>(type: T.Type) -> [[String: Any]]{
        var result = [[String: Any]]()
        
        if T.self is [GithubUser].Type {
            result = [["response": [
                [
                  "login": "mojombo",
                  "id": 1,
                  "node_id": "MDQ6VXNlcjE=",
                  "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/mojombo",
                  "html_url": "https://github.com/mojombo",
                  "followers_url": "https://api.github.com/users/mojombo/followers",
                  "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
                  "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
                  "organizations_url": "https://api.github.com/users/mojombo/orgs",
                  "repos_url": "https://api.github.com/users/mojombo/repos",
                  "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/mojombo/received_events",
                  "type": "User",
                  "site_admin": false
                ],
                [
                  "login": "defunkt",
                  "id": 2,
                  "node_id": "MDQ6VXNlcjI=",
                  "avatar_url": "https://avatars.githubusercontent.com/u/2?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/defunkt",
                  "html_url": "https://github.com/defunkt",
                  "followers_url": "https://api.github.com/users/defunkt/followers",
                  "following_url": "https://api.github.com/users/defunkt/following{/other_user}",
                  "gists_url": "https://api.github.com/users/defunkt/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/defunkt/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/defunkt/subscriptions",
                  "organizations_url": "https://api.github.com/users/defunkt/orgs",
                  "repos_url": "https://api.github.com/users/defunkt/repos",
                  "events_url": "https://api.github.com/users/defunkt/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/defunkt/received_events",
                  "type": "User",
                  "site_admin": false
                ],
                [
                  "login": "pjhyett",
                  "id": 3,
                  "node_id": "MDQ6VXNlcjM=",
                  "avatar_url": "https://avatars.githubusercontent.com/u/3?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/pjhyett",
                  "html_url": "https://github.com/pjhyett",
                  "followers_url": "https://api.github.com/users/pjhyett/followers",
                  "following_url": "https://api.github.com/users/pjhyett/following{/other_user}",
                  "gists_url": "https://api.github.com/users/pjhyett/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/pjhyett/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/pjhyett/subscriptions",
                  "organizations_url": "https://api.github.com/users/pjhyett/orgs",
                  "repos_url": "https://api.github.com/users/pjhyett/repos",
                  "events_url": "https://api.github.com/users/pjhyett/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/pjhyett/received_events",
                  "type": "User",
                  "site_admin": false
                ],
                [
                  "login": "wycats",
                  "id": 4,
                  "node_id": "MDQ6VXNlcjQ=",
                  "avatar_url": "https://avatars.githubusercontent.com/u/4?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/wycats",
                  "html_url": "https://github.com/wycats",
                  "followers_url": "https://api.github.com/users/wycats/followers",
                  "following_url": "https://api.github.com/users/wycats/following{/other_user}",
                  "gists_url": "https://api.github.com/users/wycats/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/wycats/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/wycats/subscriptions",
                  "organizations_url": "https://api.github.com/users/wycats/orgs",
                  "repos_url": "https://api.github.com/users/wycats/repos",
                  "events_url": "https://api.github.com/users/wycats/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/wycats/received_events",
                  "type": "User",
                  "site_admin": false
                ],
                [
                  "login": "ezmobius",
                  "id": 5,
                  "node_id": "MDQ6VXNlcjU=",
                  "avatar_url": "https://avatars.githubusercontent.com/u/5?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/ezmobius",
                  "html_url": "https://github.com/ezmobius",
                  "followers_url": "https://api.github.com/users/ezmobius/followers",
                  "following_url": "https://api.github.com/users/ezmobius/following{/other_user}",
                  "gists_url": "https://api.github.com/users/ezmobius/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/ezmobius/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/ezmobius/subscriptions",
                  "organizations_url": "https://api.github.com/users/ezmobius/orgs",
                  "repos_url": "https://api.github.com/users/ezmobius/repos",
                  "events_url": "https://api.github.com/users/ezmobius/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/ezmobius/received_events",
                  "type": "User",
                  "site_admin": false
                ],
                [
                  "login": "ivey",
                  "id": 6,
                  "node_id": "MDQ6VXNlcjY=",
                  "avatar_url": "https://avatars.githubusercontent.com/u/6?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/ivey",
                  "html_url": "https://github.com/ivey",
                  "followers_url": "https://api.github.com/users/ivey/followers",
                  "following_url": "https://api.github.com/users/ivey/following{/other_user}",
                  "gists_url": "https://api.github.com/users/ivey/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/ivey/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/ivey/subscriptions",
                  "organizations_url": "https://api.github.com/users/ivey/orgs",
                  "repos_url": "https://api.github.com/users/ivey/repos",
                  "events_url": "https://api.github.com/users/ivey/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/ivey/received_events",
                  "type": "User",
                  "site_admin": false
                ],
                [
                  "login": "evanphx",
                  "id": 7,
                  "node_id": "MDQ6VXNlcjc=",
                  "avatar_url": "https://avatars.githubusercontent.com/u/7?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/evanphx",
                  "html_url": "https://github.com/evanphx",
                  "followers_url": "https://api.github.com/users/evanphx/followers",
                  "following_url": "https://api.github.com/users/evanphx/following{/other_user}",
                  "gists_url": "https://api.github.com/users/evanphx/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/evanphx/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/evanphx/subscriptions",
                  "organizations_url": "https://api.github.com/users/evanphx/orgs",
                  "repos_url": "https://api.github.com/users/evanphx/repos",
                  "events_url": "https://api.github.com/users/evanphx/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/evanphx/received_events",
                  "type": "User",
                  "site_admin": false
                ],
                [
                  "login": "vanpelt",
                  "id": 17,
                  "node_id": "MDQ6VXNlcjE3",
                  "avatar_url": "https://avatars.githubusercontent.com/u/17?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/vanpelt",
                  "html_url": "https://github.com/vanpelt",
                  "followers_url": "https://api.github.com/users/vanpelt/followers",
                  "following_url": "https://api.github.com/users/vanpelt/following{/other_user}",
                  "gists_url": "https://api.github.com/users/vanpelt/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/vanpelt/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/vanpelt/subscriptions",
                  "organizations_url": "https://api.github.com/users/vanpelt/orgs",
                  "repos_url": "https://api.github.com/users/vanpelt/repos",
                  "events_url": "https://api.github.com/users/vanpelt/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/vanpelt/received_events",
                  "type": "User",
                  "site_admin": false
                ]
            ]]
            ]
        }
        
        else if T.self is GithubUser.Type {
            result = [["response": [
                  "login": "tawk",
                  "id": 9743939,
                  "node_id": "MDEyOk9yZ2FuaXphdGlvbjk3NDM5Mzk=",
                  "avatar_url": "https://avatars.githubusercontent.com/u/9743939?v=4",
                  "gravatar_id": "",
                  "url": "https://api.github.com/users/tawk",
                  "html_url": "https://github.com/tawk",
                  "followers_url": "https://api.github.com/users/tawk/followers",
                  "following_url": "https://api.github.com/users/tawk/following{/other_user}",
                  "gists_url": "https://api.github.com/users/tawk/gists{/gist_id}",
                  "starred_url": "https://api.github.com/users/tawk/starred{/owner}{/repo}",
                  "subscriptions_url": "https://api.github.com/users/tawk/subscriptions",
                  "organizations_url": "https://api.github.com/users/tawk/orgs",
                  "repos_url": "https://api.github.com/users/tawk/repos",
                  "events_url": "https://api.github.com/users/tawk/events{/privacy}",
                  "received_events_url": "https://api.github.com/users/tawk/received_events",
                  "type": "Organization",
                  "site_admin": false,
                  "name": "tawk.to",
                  "company": "",
                  "blog": "https://www.tawk.to",
                  "location": "",
                  "email": "",
                  "hireable": "",
                  "bio": "",
                  "twitter_username": "tawktotawk",
                  "public_repos": 29,
                  "public_gists": 0,
                  "followers": 0,
                  "following": 0,
                  "created_at": "2014-11-14T12:23:56Z",
                  "updated_at": "2021-08-06T09:20:54Z"
                ]
            ]]
        }
        
        return result
    }
}
