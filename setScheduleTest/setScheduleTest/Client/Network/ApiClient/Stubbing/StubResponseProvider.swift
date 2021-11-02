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
//        var result = get(type: type)
        var data: Data? = nil
        
        if T.self is SearchResponse<Movie>.Type {
            let strResponse = "{\n    page = 1;\n    results =     (\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/fNG7i7RqMErkcqhohV2a6cV1Ehy.jpg\";\n            \"genre_ids\" =             (\n                28,\n                878\n            );\n            id = 603;\n            \"original_language\" = en;\n            \"original_title\" = \"The Matrix\";\n            overview = \"Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.\";\n            popularity = \"81.011\";\n            \"poster_path\" = \"/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg\";\n            \"release_date\" = \"1999-03-30\";\n            title = \"The Matrix\";\n            video = 0;\n            \"vote_average\" = \"8.199999999999999\";\n            \"vote_count\" = 20106;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/87uShMszqPxwA034GsskGdzJOgN.jpg\";\n            \"genre_ids\" =             (\n                12,\n                16,\n                18,\n                10751\n            );\n            id = 10948;\n            \"original_language\" = en;\n            \"original_title\" = \"The Fox and the Hound\";\n            overview = \"When a feisty little fox named Tod is adopted into a farm family, he quickly becomes friends with a fun and adorable hound puppy named Copper. Life is full of hilarious adventures until Copper is expected to take on his role as a hunting dog -- and the object of his search is his best friend!\";\n            popularity = \"48.089\";\n            \"poster_path\" = \"/1382VHxqZDXu2t8i46zf4fP71JG.jpg\";\n            \"release_date\" = \"1981-07-10\";\n            title = \"The Fox and the Hound\";\n            video = 0;\n            \"vote_average\" = \"7.1\";\n            \"vote_count\" = 2538;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg\";\n            \"genre_ids\" =             (\n                18,\n                80\n            );\n            id = 238;\n            \"original_language\" = en;\n            \"original_title\" = \"The Godfather\";\n            overview = \"Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.\";\n            popularity = \"67.884\";\n            \"poster_path\" = \"/eEslKSwcqmiNS6va24Pbxf2UKmJ.jpg\";\n            \"release_date\" = \"1972-03-14\";\n            title = \"The Godfather\";\n            video = 0;\n            \"vote_average\" = \"8.699999999999999\";\n            \"vote_count\" = 14985;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/mZj8EUr6F1x2PWZjKPxaeYd5WRw.jpg\";\n            \"genre_ids\" =             (\n                12,\n                16,\n                35,\n                10751,\n                14\n            );\n            id = 11688;\n            \"original_language\" = en;\n            \"original_title\" = \"The Emperor\'s New Groove\";\n            overview = \"Kuzco is a self-centered emperor who summons Pacha from a village and to tell him that his home will be destroyed to make room for Kuzco\'s new summer home. Kuzco\'s advisor, Yzma, tries to poison Kuzco and accidentally turns him into a llama, who accidentally ends up in Pacha\'s village. Pacha offers to help Kuzco if he doesn\'t destroy his house, and so they form an unlikely partnership.\";\n            popularity = \"99.44\";\n            \"poster_path\" = \"/wwbgkXQBEKtnyIJapk6gUgWkVw8.jpg\";\n            \"release_date\" = \"2000-12-15\";\n            title = \"The Emperor\'s New Groove\";\n            video = 0;\n            \"vote_average\" = \"7.5\";\n            \"vote_count\" = 5154;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/rnMwOM8gMqo6Gf6XXMpaJEayUwk.jpg\";\n            \"genre_ids\" =             (\n                16,\n                35,\n                10751,\n                12\n            );\n            id = 10112;\n            \"original_language\" = en;\n            \"original_title\" = \"The Aristocats\";\n            overview = \"When Madame Adelaide Bonfamille leaves her fortune to Duchess and her children\\U2014Bonfamille\\U2019s beloved family of cats\\U2014the butler plots to steal the money and kidnaps the legatees, leaving them out on a country road. All seems lost until the wily Thomas O\\U2019Malley Cat and his jazz-playing alley cats come to the aristocats\\U2019 rescue.\";\n            popularity = \"53.906\";\n            \"poster_path\" = \"/1BVOSmQUhphMgnTxnXyfQ9tL1Sc.jpg\";\n            \"release_date\" = \"1970-12-24\";\n            title = \"The Aristocats\";\n            video = 0;\n            \"vote_average\" = \"7.3\";\n            \"vote_count\" = 4007;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/wfClZdRb1x4LZ8B73Y9RSn8XAPa.jpg\";\n            \"genre_ids\" =             (\n                10751,\n                16,\n                12,\n                878,\n                35\n            );\n            id = 10386;\n            \"original_language\" = en;\n            \"original_title\" = \"The Iron Giant\";\n            overview = \"In the small town of Rockwell, Maine in October 1957, a giant metal machine befriends a nine-year-old boy and ultimately finds its humanity by unselfishly saving people from their own fears and prejudices.\";\n            popularity = \"69.52800000000001\";\n            \"poster_path\" = \"/bMr9Ir2hCFu2R72pjCA43uRMT4r.jpg\";\n            \"release_date\" = \"1999-08-06\";\n            title = \"The Iron Giant\";\n            video = 0;\n            \"vote_average\" = \"7.9\";\n            \"vote_count\" = 4242;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/ukalDRKzS5eS1qJufmEsXdOSrBl.jpg\";\n            \"genre_ids\" =             (\n                14,\n                27,\n                18,\n                53\n            );\n            id = 9100;\n            \"original_language\" = en;\n            \"original_title\" = \"The Craft\";\n            overview = \"A Catholic school newcomer falls in with a clique of teen witches who wield their powers against all who dare to cross them -- be they teachers, rivals or meddlesome parents.\";\n            popularity = \"40.68\";\n            \"poster_path\" = \"/8UCScpzQbeJcSkY7ZgRpblYh0lP.jpg\";\n            \"release_date\" = \"1996-05-03\";\n            title = \"The Craft\";\n            video = 0;\n            \"vote_average\" = \"6.7\";\n            \"vote_count\" = 1302;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/3sbmRuIpYEH5dMvec4z4JxKQHoj.jpg\";\n            \"genre_ids\" =             (\n                10751,\n                16,\n                12\n            );\n            id = 9325;\n            \"original_language\" = en;\n            \"original_title\" = \"The Jungle Book\";\n            overview = \"The boy Mowgli makes his way to the man-village with Bagheera, the wise panther. Along the way he meets jazzy King Louie, the hypnotic snake Kaa and the lovable, happy-go-lucky bear Baloo, who teaches Mowgli \\\"The Bare Necessities\\\" of life and the true meaning of friendship.\";\n            popularity = \"63.227\";\n            \"poster_path\" = \"/fyKUxjaOP8KINir6MPFprsGtiT0.jpg\";\n            \"release_date\" = \"1967-10-18\";\n            title = \"The Jungle Book\";\n            video = 0;\n            \"vote_average\" = \"7.3\";\n            \"vote_count\" = 5032;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/jRJrQ72VLyEnVsvwfep8Xjlvu8c.jpg\";\n            \"genre_ids\" =             (\n                80,\n                18,\n                28\n            );\n            id = 101;\n            \"original_language\" = en;\n            \"original_title\" = \"L\\U00e9on: The Professional\";\n            overview = \"L\\U00e9on, the top hit man in New York, has earned a rep as an effective \\\"cleaner\\\". But when his next-door neighbors are wiped out by a loose-cannon DEA agent, he becomes the unwilling custodian of 12-year-old Mathilda. Before long, Mathilda\'s thoughts turn to revenge, and she considers following in L\\U00e9on\'s footsteps.\";\n            popularity = \"60.833\";\n            \"poster_path\" = \"/wHqGb8J6tXBVwjqWooGMtNEjs2A.jpg\";\n            \"release_date\" = \"1994-09-14\";\n            title = \"L\\U00e9on: The Professional\";\n            video = 0;\n            \"vote_average\" = \"8.300000000000001\";\n            \"vote_count\" = 11403;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/deZYjgLWPHStzvk7hCgf8pBqFdC.jpg\";\n            \"genre_ids\" =             (\n                10751,\n                16,\n                10749\n            );\n            id = 10340;\n            \"original_language\" = en;\n            \"original_title\" = \"Lady and the Tramp\";\n            overview = \"Lady, a golden cocker spaniel, meets up with a mongrel dog who calls himself the Tramp. He is obviously from the wrong side of town, but happenings at Lady\'s home make her decide to travel with him for a while.\";\n            popularity = \"53.29\";\n            \"poster_path\" = \"/340NcWz9SQXWQyf4oicMxjbrLOb.jpg\";\n            \"release_date\" = \"1955-06-22\";\n            title = \"Lady and the Tramp\";\n            video = 0;\n            \"vote_average\" = \"7.1\";\n            \"vote_count\" = 4199;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/l6hQWH9eDksNJNiXWYRkWqikOdu.jpg\";\n            \"genre_ids\" =             (\n                14,\n                18,\n                80\n            );\n            id = 497;\n            \"original_language\" = en;\n            \"original_title\" = \"The Green Mile\";\n            overview = \"A supernatural tale set on death row in a Southern prison, where gentle giant John Coffey possesses the mysterious power to heal people\'s ailments. When the cell block\'s head guard, Paul Edgecomb, recognizes Coffey\'s miraculous gift, he tries desperately to help stave off the condemned man\'s execution.\";\n            popularity = \"57.193\";\n            \"poster_path\" = \"/velWPhVMQeQKcxggNEU8YmIo52R.jpg\";\n            \"release_date\" = \"1999-12-10\";\n            title = \"The Green Mile\";\n            video = 0;\n            \"vote_average\" = \"8.5\";\n            \"vote_count\" = 12961;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/k7GM13qRYSour3lk90Dq1EwdpoW.jpg\";\n            \"genre_ids\" =             (\n                18,\n                53,\n                9648\n            );\n            id = 2649;\n            \"original_language\" = en;\n            \"original_title\" = \"The Game\";\n            overview = \"In honor of his birthday, San Francisco banker Nicholas Van Orton, a financial genius and a cold-hearted loner, receives an unusual present from his younger brother, Conrad: a gift certificate to play a unique kind of game. In nary a nanosecond, Nicholas finds himself consumed by a dangerous set of ever-changing rules, unable to distinguish where the charade ends and reality begins.\";\n            popularity = \"27.804\";\n            \"poster_path\" = \"/4UOa079915QjiTA2u5hT2yKVgUu.jpg\";\n            \"release_date\" = \"1997-09-12\";\n            title = \"The Game\";\n            video = 0;\n            \"vote_average\" = \"7.6\";\n            \"vote_count\" = 4649;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/6TjllWT3cGrPFyqDXurVZ3L8bBi.jpg\";\n            \"genre_ids\" =             (\n                9648,\n                53,\n                18\n            );\n            id = 745;\n            \"original_language\" = en;\n            \"original_title\" = \"The Sixth Sense\";\n            overview = \"Following an unexpected tragedy, a child psychologist named Malcolm Crowe meets an nine year old boy named Cole Sear, who is hiding a dark secret.\";\n            popularity = \"43.249\";\n            \"poster_path\" = \"/fIssD3w3SvIhPPmVo4WMgZDVLID.jpg\";\n            \"release_date\" = \"1999-08-06\";\n            title = \"The Sixth Sense\";\n            video = 0;\n            \"vote_average\" = \"7.9\";\n            \"vote_count\" = 8986;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/2G20ecZ4HrWWmxn2gBdN2gxcxTy.jpg\";\n            \"genre_ids\" =             (\n                27,\n                878,\n                53\n            );\n            id = 8843;\n            \"original_language\" = en;\n            \"original_title\" = \"The Cell\";\n            overview = \"A psychotherapist journeys inside a comatose serial killer in the hopes of saving his latest victim.\";\n            popularity = \"27.355\";\n            \"poster_path\" = \"/58U0jRJmX8K62Zh1QcYVwQDoDtE.jpg\";\n            \"release_date\" = \"2000-08-17\";\n            title = \"The Cell\";\n            video = 0;\n            \"vote_average\" = \"6.3\";\n            \"vote_count\" = 1135;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/4dtbvoAaqiM3fVwzdffLxUdAiY6.jpg\";\n            \"genre_ids\" =             (\n                10751,\n                35,\n                14\n            );\n            id = 8871;\n            \"original_language\" = en;\n            \"original_title\" = \"How the Grinch Stole Christmas\";\n            overview = \"Inside a snowflake exists the magical land of Whoville. In Whoville, live the Whos, an almost mutated sort of Munchkin-like people. All the Whos love Christmas, yet just outside of their beloved Whoville lives the Grinch. The Grinch is a nasty creature that hates Christmas, and plots to steal it away from the Whos, whom he equally abhors. Yet a small child, Cindy Lou Who, decides to try befriending the Grinch.\";\n            popularity = \"89.232\";\n            \"poster_path\" = \"/1WZbbPApEivA421gCOluuzMMKCk.jpg\";\n            \"release_date\" = \"2000-11-17\";\n            title = \"How the Grinch Stole Christmas\";\n            video = 0;\n            \"vote_average\" = \"6.7\";\n            \"vote_count\" = 5515;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/bxY7ve1LP8atCIuvr4jeeJMmU4w.jpg\";\n            \"genre_ids\" =             (\n                35,\n                18\n            );\n            id = 37165;\n            \"original_language\" = en;\n            \"original_title\" = \"The Truman Show\";\n            overview = \"Truman Burbank is the star of The Truman Show, a 24-hour-a-day reality TV show that broadcasts every aspect of his life without his knowledge. His entire life has been an unending soap opera for consumption by the rest of the world. And everyone he knows, including his wife and his best friend is really an actor, paid to be part of his life.\";\n            popularity = \"39.655\";\n            \"poster_path\" = \"/e5EMJEQnWkWb8G6sTMkN91qiqUz.jpg\";\n            \"release_date\" = \"1998-06-04\";\n            title = \"The Truman Show\";\n            video = 0;\n            \"vote_average\" = \"8.1\";\n            \"vote_count\" = 13827;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/4enK0hfkyqljQvFqACcx74c007e.jpg\";\n            \"genre_ids\" =             (\n                27,\n                9648\n            );\n            id = 2667;\n            \"original_language\" = en;\n            \"original_title\" = \"The Blair Witch Project\";\n            overview = \"In October of 1994 three student filmmakers disappeared in the woods near Burkittsville, Maryland, while shooting a documentary. A year later their footage was found.\";\n            popularity = \"56.614\";\n            \"poster_path\" = \"/9050VGrYjYrEjpOvDZVAngLbg1f.jpg\";\n            \"release_date\" = \"1999-07-14\";\n            title = \"The Blair Witch Project\";\n            video = 0;\n            \"vote_average\" = \"6.3\";\n            \"vote_count\" = 3476;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/qCU097AXMPAsmpVK4j9kzMTxt2d.jpg\";\n            \"genre_ids\" =             (\n                12,\n                14,\n                10751\n            );\n            id = 630;\n            \"original_language\" = en;\n            \"original_title\" = \"The Wizard of Oz\";\n            overview = \"Young Dorothy finds herself in a magical world where she makes friends with a lion, a scarecrow and a tin man as they make their way along the yellow brick road to talk with the Wizard and ask for the things they miss most in their lives. The Wicked Witch of the West is the only thing that could stop them.\";\n            popularity = \"58.225\";\n            \"poster_path\" = \"/bSA6DbAC5gdkaooU164lQUX6rVs.jpg\";\n            \"release_date\" = \"1939-08-15\";\n            title = \"The Wizard of Oz\";\n            video = 0;\n            \"vote_average\" = \"7.6\";\n            \"vote_count\" = 4309;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/poec6RqOKY9iSiIUmfyfPfiLtvB.jpg\";\n            \"genre_ids\" =             (\n                18,\n                80\n            );\n            id = 240;\n            \"original_language\" = en;\n            \"original_title\" = \"The Godfather: Part II\";\n            overview = \"In the continuing saga of the Corleone crime family, a young Vito Corleone grows up in Sicily and in 1910s New York. In the 1950s, Michael Corleone attempts to expand the family business into Las Vegas, Hollywood and Cuba.\";\n            popularity = \"48.482\";\n            \"poster_path\" = \"/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg\";\n            \"release_date\" = \"1974-12-20\";\n            title = \"The Godfather: Part II\";\n            video = 0;\n            \"vote_average\" = \"8.6\";\n            \"vote_count\" = 9008;\n        },\n                {\n            adult = 0;\n            \"backdrop_path\" = \"/c9xSFZQtC4c16Vn5CMOaB1pGk9J.jpg\";\n            \"genre_ids\" =             (\n                18,\n                36,\n                10752,\n                28\n            );\n            id = 2024;\n            \"original_language\" = en;\n            \"original_title\" = \"The Patriot\";\n            overview = \"After proving himself on the field of battle in the French and Indian War, Benjamin Martin wants nothing more to do with such things, preferring the simple life of a farmer. But when his son Gabriel enlists in the army to defend their new nation, America, against the British, Benjamin reluctantly returns to his old life to protect his son.\";\n            popularity = \"23.113\";\n            \"poster_path\" = \"/fWZd815QxUCUcrWQZwUkAp9ljG.jpg\";\n            \"release_date\" = \"2000-06-28\";\n            title = \"The Patriot\";\n            video = 0;\n            \"vote_average\" = \"7.1\";\n            \"vote_count\" = 2938;\n        }\n    );\n    \"total_pages\" = 105;\n    \"total_results\" = 2085;\n}"
            
            data = strResponse.data(using: .utf8)
        }
        
        return data
    }
}
