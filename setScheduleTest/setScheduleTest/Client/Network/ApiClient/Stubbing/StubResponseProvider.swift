//
//  StubResponseProvider.swift
//  tawktestios
//
//  Created by JMC on 3/8/21.
//

import Foundation


public class StubResponseProvider{
    public static func getType<T: Codable>(type: T.Type) -> T{
        var type: T!
        
        if T.self is SearchResponse<Movie>.Type {
            type = SearchResponse<Movie>() as! T
        }
        
        return type
    }
    
    public static func get<T: Codable>(type: T.Type) -> Data?{
        var data: Data? = nil
        
        if T.self is SearchResponse<Movie>.Type {
//            let strResponse = "{\"page\" : 1; \"results\" : [{\"adult\" : 0; \"backdrop_path\" : \"/fNG7i7RqMErkcqhohV2a6cV1Ehy.jpg\";          \"genre_ids\" : (28, 878); \"id\" : 603; \"original_language\" : en; \"original_title\" : \"The Matrix\"; \"overview\" : \"Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.\"; \"popularity\" : \"81.011\"; \"poster_path\" : \"/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg\"; \"release_date\" : \"1999-03-30\"; \"title\" : \"The Matrix\"; \"video\" : 0; \"vote_average\" : \"8.199999999999999\"; \"vote_count\" : 20106; }]; \"total_pages\" : 105; \"total_results\" : 2085;}"
            
            let response = [
                "page": 1,
                "results": [
                    [
                        "adult": false,
                        "backdrop_path": "/eBGKU0ZLJmxtVtzESTB1mfllX1J.jpg",
                        "genre_ids": [
                            80,
                            28,
                            53
                        ],
                        "id": 630004,
                        "original_language": "en",
                        "original_title": "The Vault",
                        "overview": "When an engineer learns of a mysterious, impenetrable fortress hidden under The Bank of Spain, he joins a crew of master thieves who plan to steal the legendary lost treasure locked inside while the whole country is distracted by Spain's World Cup Final. With thousands of soccer fans cheering in the streets, and security forces closing in, the crew have just minutes to pull off the score of a lifetime.",
                        "popularity": 1683.349,
                        "poster_path": "/kWhXubAiIcHW0xn5GThflqaKZqh.jpg",
                        "release_date": "2021-03-03",
                        "title": "The Vault",
                        "video": false,
                        "vote_average": 7,
                        "vote_count": 376
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/4O40vu2KOgnFfxvrZgzBG6havQ.jpg",
                        "genre_ids": [
                            28,
                            80,
                            53
                        ],
                        "id": 645788,
                        "original_language": "en",
                        "original_title": "The Protégé",
                        "overview": "Rescued as a child by the legendary assassin Moody and trained in the family business, Anna is the world’s most skilled contract killer. When Moody, the man who was like a father to her and taught her everything she needs to know about trust and survival, is brutally killed, Anna vows revenge. As she becomes entangled with an enigmatic killer whose attraction to her goes way beyond cat and mouse, their confrontation turns deadly and the loose ends of a life spent killing will weave themselves ever tighter.",
                        "popularity": 1473.813,
                        "poster_path": "/o9FY8N5c8CXf22q8s4CmRRjAQJx.jpg",
                        "release_date": "2021-08-19",
                        "title": "The Protégé",
                        "video": false,
                        "vote_average": 6.8,
                        "vote_count": 314
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/zsH3iW60T1t2HBTtrSKzzxJ406J.jpg",
                        "genre_ids": [
                            16,
                            35,
                            10751
                        ],
                        "id": 846214,
                        "original_language": "en",
                        "original_title": "The Simpsons: The Good, the Bart, and the Loki",
                        "overview": "Loki is banished from Asgard once again and must face his toughest opponents yet: the Simpsons and Springfield’s mightiest heroes. The God of Mischief teams up with Bart Simpson in the ultimate crossover event paying tribute to the Marvel Cinematic Universe of superheroes and villains.",
                        "popularity": 346.645,
                        "poster_path": "/rtMdtzywcAGOrF6t8fbxJBqpdcq.jpg",
                        "release_date": "2021-07-07",
                        "title": "The Simpsons: The Good, the Bart, and the Loki",
                        "video": false,
                        "vote_average": 7.7,
                        "vote_count": 426
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/cinER0ESG0eJ49kXlExM0MEWGxW.jpg",
                        "genre_ids": [
                            28,
                            12,
                            14
                        ],
                        "id": 566525,
                        "original_language": "en",
                        "original_title": "Shang-Chi and the Legend of the Ten Rings",
                        "overview": "Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.",
                        "popularity": 1158.567,
                        "poster_path": "/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg",
                        "release_date": "2021-09-01",
                        "title": "Shang-Chi and the Legend of the Ten Rings",
                        "video": false,
                        "vote_average": 7.7,
                        "vote_count": 1374
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/jlGmlFOcfo8n5tURmhC7YVd4Iyy.jpg",
                        "genre_ids": [
                            28,
                            12,
                            14
                        ],
                        "id": 436969,
                        "original_language": "en",
                        "original_title": "The Suicide Squad",
                        "overview": "Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.",
                        "popularity": 941.322,
                        "poster_path": "/kb4s0ML0iVZlG6wAKbbs9NAm6X.jpg",
                        "release_date": "2021-07-28",
                        "title": "The Suicide Squad",
                        "video": false,
                        "vote_average": 7.8,
                        "vote_count": 4608
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/kzIiKLccwuzD3qD5OHFyPIkiqEw.jpg",
                        "genre_ids": [
                            28,
                            10749,
                            16
                        ],
                        "id": 317442,
                        "original_language": "ja",
                        "original_title": "The Last: Naruto the Movie",
                        "overview": "Two years after the events of the Fourth Great Ninja War, the moon that Hagoromo Otsutsuki created long ago to seal away the Gedo Statue begins to descend towards the world, threatening to become a meteor that would destroy everything on impact. Amidst this crisis, a direct descendant of Kaguya Otsutsuki named Toneri Otsutsuki attempts to kidnap Hinata Hyuga but ends up abducting her younger sister Hanabi. Naruto and his allies now mount a rescue mission before finding themselves embroiled in a final battle to decide the fate of everything.",
                        "popularity": 248.817,
                        "poster_path": "/bAQ8O5Uw6FedtlCbJTutenzPVKd.jpg",
                        "release_date": "2014-12-06",
                        "title": "The Last: Naruto the Movie",
                        "video": false,
                        "vote_average": 7.9,
                        "vote_count": 1068
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/4ZGCd0jz0F4rguSPKuFHpc1xhvg.jpg",
                        "genre_ids": [
                            53,
                            27
                        ],
                        "id": 638045,
                        "original_language": "en",
                        "original_title": "The Toll",
                        "overview": "A socially awkward driver and a weary passenger try to make it to their destination while being haunted by a supernatural threat.",
                        "popularity": 292.982,
                        "poster_path": "/q6vV6sSWz9cytmc8L9IEBjjyFmV.jpg",
                        "release_date": "2021-03-26",
                        "title": "The Toll",
                        "video": false,
                        "vote_average": 6.2,
                        "vote_count": 56
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/wfrfxivLOBtGMC98tIr2LSOeKSe.jpg",
                        "genre_ids": [
                            16,
                            35,
                            10751
                        ],
                        "id": 639721,
                        "original_language": "en",
                        "original_title": "The Addams Family 2",
                        "overview": "The Addams get tangled up in more wacky adventures and find themselves involved in hilarious run-ins with all sorts of unsuspecting characters.",
                        "popularity": 1618.449,
                        "poster_path": "/ld7YB9vBRp1GM1DT3KmFWSmtBPB.jpg",
                        "release_date": "2021-10-01",
                        "title": "The Addams Family 2",
                        "video": false,
                        "vote_average": 7.5,
                        "vote_count": 495
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/5Zv5KmgZzdIvXz2KC3n0MyecSNL.jpg",
                        "genre_ids": [
                            28,
                            53,
                            80
                        ],
                        "id": 634528,
                        "original_language": "en",
                        "original_title": "The Marksman",
                        "overview": "Jim Hanson’s quiet life is suddenly disturbed by two people crossing the US/Mexico border – a woman and her young son – desperate to flee a Mexican cartel. After a shootout leaves the mother dead, Jim becomes the boy’s reluctant defender. He embraces his role as Miguel’s protector and will stop at nothing to get him to safety, as they go on the run from the relentless assassins.",
                        "popularity": 323.772,
                        "poster_path": "/6vcDalR50RWa309vBH1NLmG2rjQ.jpg",
                        "release_date": "2021-01-15",
                        "title": "The Marksman",
                        "video": false,
                        "vote_average": 7.2,
                        "vote_count": 937
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/jw6ASGRT2gi8EjCImpGtbiJ9NQ9.jpg",
                        "genre_ids": [
                            27
                        ],
                        "id": 632357,
                        "original_language": "en",
                        "original_title": "The Unholy",
                        "overview": "Alice, a young hearing-impaired girl who, after a supposed visitation from the Virgin Mary, is inexplicably able to hear, speak and heal the sick. As word spreads and people from near and far flock to witness her miracles, a disgraced journalist hoping to revive his career visits the small New England town to investigate. When terrifying events begin to happen all around, he starts to question if these phenomena are the works of the Virgin Mary or something much more sinister.",
                        "popularity": 383.72,
                        "poster_path": "/bShgiEQoPnWdw4LBrYT5u18JF34.jpg",
                        "release_date": "2021-03-31",
                        "title": "The Unholy",
                        "video": false,
                        "vote_average": 6.9,
                        "vote_count": 1403
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/tehpKMsls621GT9WUQie2Ft6LmP.jpg",
                        "genre_ids": [
                            27,
                            28,
                            53
                        ],
                        "id": 602223,
                        "original_language": "en",
                        "original_title": "The Forever Purge",
                        "overview": "All the rules are broken as a sect of lawless marauders decides that the annual Purge does not stop at daybreak and instead should never end as they chase a group of immigrants who they want to punish because of their harsh historical past.",
                        "popularity": 499.538,
                        "poster_path": "/lB068qa6bQ0QKYKyC2xnYGvYjl7.jpg",
                        "release_date": "2021-06-30",
                        "title": "The Forever Purge",
                        "video": false,
                        "vote_average": 7.4,
                        "vote_count": 1377
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/yizL4cEKsVvl17Wc1mGEIrQtM2F.jpg",
                        "genre_ids": [
                            28,
                            878,
                            12
                        ],
                        "id": 588228,
                        "original_language": "en",
                        "original_title": "The Tomorrow War",
                        "overview": "The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.",
                        "popularity": 545.561,
                        "poster_path": "/34nDCQZwaEvsy4CFO5hkGRFDCVU.jpg",
                        "release_date": "2021-07-02",
                        "title": "The Tomorrow War",
                        "video": false,
                        "vote_average": 8.1,
                        "vote_count": 4472
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/6FzuNrApEc71aJ3CwwkpadbNled.jpg",
                        "genre_ids": [
                            28,
                            35,
                            80
                        ],
                        "id": 581644,
                        "original_language": "en",
                        "original_title": "The Misfits",
                        "overview": "After being recruited by a group of unconventional thieves, renowned criminal Richard Pace finds himself caught up in an elaborate gold heist that promises to have far-reaching implications on his life and the lives of countless others.",
                        "popularity": 282.45,
                        "poster_path": "/dPOyYnCkRbWAEem85N3VFpQODf5.jpg",
                        "release_date": "2021-06-10",
                        "title": "The Misfits",
                        "video": false,
                        "vote_average": 5.6,
                        "vote_count": 162
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/owraiceOKtSOa3t8sp3wA9K2Ox6.jpg",
                        "genre_ids": [
                            16,
                            28,
                            12,
                            878
                        ],
                        "id": 703771,
                        "original_language": "en",
                        "original_title": "Deathstroke: Knights & Dragons - The Movie",
                        "overview": "The assassin Deathstroke tries to save his family from the wrath of H.I.V.E. and the murderous Jackal.",
                        "popularity": 1097.881,
                        "poster_path": "/vFIHbiy55smzi50RmF8LQjmpGcx.jpg",
                        "release_date": "2020-08-04",
                        "title": "Deathstroke: Knights & Dragons - The Movie",
                        "video": false,
                        "vote_average": 6.9,
                        "vote_count": 290
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/3pIqd1hgZ2xqzWEyiYp4blqE9Fi.jpg",
                        "genre_ids": [
                            53,
                            36,
                            18
                        ],
                        "id": 522241,
                        "original_language": "en",
                        "original_title": "The Courier",
                        "overview": "Cold War spy Greville Wynne and his Russian source try to put an end to the Cuban Missile Crisis.",
                        "popularity": 266.492,
                        "poster_path": "/zFIjKtZrzhmc7HecdFXXjsLR2Ig.jpg",
                        "release_date": "2021-03-18",
                        "title": "The Courier",
                        "video": false,
                        "vote_average": 7.2,
                        "vote_count": 449
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/nNmJRkg8wWnRmzQDe2FwKbPIsJV.jpg",
                        "genre_ids": [
                            878,
                            28,
                            12
                        ],
                        "id": 24428,
                        "original_language": "en",
                        "original_title": "The Avengers",
                        "overview": "When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!",
                        "popularity": 230.962,
                        "poster_path": "/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg",
                        "release_date": "2012-04-25",
                        "title": "The Avengers",
                        "video": false,
                        "vote_average": 7.7,
                        "vote_count": 25603
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/xYz4u1jWCKyXGzddMJeOL845DTr.jpg",
                        "genre_ids": [
                            28,
                            12,
                            14
                        ],
                        "id": 1930,
                        "original_language": "en",
                        "original_title": "The Amazing Spider-Man",
                        "overview": "Peter Parker is an outcast high schooler abandoned by his parents as a boy, leaving him to be raised by his Uncle Ben and Aunt May. Like most teenagers, Peter is trying to figure out who he is and how he got to be the person he is today. As Peter discovers a mysterious briefcase that belonged to his father, he begins a quest to understand his parents' disappearance – leading him directly to Oscorp and the lab of Dr. Curt Connors, his father's former partner. As Spider-Man is set on a collision course with Connors' alter ego, The Lizard, Peter will make life-altering choices to use his powers and shape his destiny to become a hero.",
                        "popularity": 350.782,
                        "poster_path": "/jIfkQNARYyERqRAq1p1c8xgePp4.jpg",
                        "release_date": "2012-06-23",
                        "title": "The Amazing Spider-Man",
                        "video": false,
                        "vote_average": 6.6,
                        "vote_count": 13466
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/fQlfObqEH8Jam5WQrLUMngbEroZ.jpg",
                        "genre_ids": [
                            37,
                            28
                        ],
                        "id": 859860,
                        "original_language": "en",
                        "original_title": "Catch the Bullet",
                        "overview": "U.S. marshal Britt MacMasters returns from a mission to find his father wounded and his son kidnapped by the outlaw Jed Blake. Hot on their trail, Britt forms a posse with a gunslinging deputy and a stoic Pawnee tracker. But Jed and Britt tread dangerously close to the Red Desert’s Sioux territory.",
                        "popularity": 493.704,
                        "poster_path": "/7PoomidF9HlMKXcAyOJ87lGkhSp.jpg",
                        "release_date": "2021-09-10",
                        "title": "Catch the Bullet",
                        "video": false,
                        "vote_average": 5.6,
                        "vote_count": 67
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/qi6Edc1OPcyENecGtz8TF0DUr9e.jpg",
                        "genre_ids": [
                            27,
                            9648,
                            53
                        ],
                        "id": 423108,
                        "original_language": "en",
                        "original_title": "The Conjuring: The Devil Made Me Do It",
                        "overview": "Paranormal investigators Ed and Lorraine Warren encounter what would become one of the most sensational cases from their files. The fight for the soul of a young boy takes them beyond anything they'd ever seen before, to mark the first time in U.S. history that a murder suspect would claim demonic possession as a defense.",
                        "popularity": 450.174,
                        "poster_path": "/xbSuFiJbbBWCkyCCKIMfuDCA4yV.jpg",
                        "release_date": "2021-05-25",
                        "title": "The Conjuring: The Devil Made Me Do It",
                        "video": false,
                        "vote_average": 7.8,
                        "vote_count": 3828
                    ],
                    [
                        "adult": false,
                        "backdrop_path": "/l5yp73psXVRYy2ce09lD8yDuu2g.jpg",
                        "genre_ids": [
                            27,
                            53
                        ],
                        "id": 138843,
                        "original_language": "en",
                        "original_title": "The Conjuring",
                        "overview": "Paranormal investigators Ed and Lorraine Warren work to help a family terrorized by a dark presence in their farmhouse. Forced to confront a powerful entity, the Warrens find themselves caught in the most terrifying case of their lives.",
                        "popularity": 205.46,
                        "poster_path": "/wVYREutTvI2tmxr6ujrHT704wGF.jpg",
                        "release_date": "2013-03-20",
                        "title": "The Conjuring",
                        "video": false,
                        "vote_average": 7.5,
                        "vote_count": 8805
                    ]
                ],
                "total_pages": 500,
                "total_results": 10000
            ] as [String : Any]
            
            data = try? JSONSerialization.data(withJSONObject: response, options: .fragmentsAllowed)
            debugPrint("StubResponseProvider -- get() -- response = \((try? JSONSerialization.jsonObject(with: data ?? Data([]), options: .allowFragments)) ?? NSDictionary())")
        }
        
        return data
    }
}
