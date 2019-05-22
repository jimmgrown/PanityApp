import SwiftyVK

class VKPostManager {
    
    static func loadPosts(offset: Int, completion: @escaping (_ posts: [Post]) -> Void) {
        let params = [
            Parameter.ownerId: "-63458533",
            Parameter.count: "20",
            Parameter.offset: String(offset + 1)
        ]
        
        VK.API.Wall.get(params)
            .onSuccess { (result) in
                let json = JSON(result)
                let items = json["items"]
                var posts = [Post]()
                items.forEach { (item) in
                    posts.append(Post(post: item.1))
                }
                DispatchQueue.main.async {
                    completion(posts)
                }
            }
            .onError { (error) in
                print(error)
            }.send()
    }
    
}
