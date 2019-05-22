

struct Post {
    let imageUrl: String
    let text: String
    let likesCount: Int
    let viewsCount: Int

    init(post: JSON) {
        imageUrl = post["attachments"][0]["photo"]["sizes"][3]["url"].stringValue
        text = post["text"].stringValue
        likesCount = 10
        viewsCount = 10
    }
}
