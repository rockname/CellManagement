import Foundation

public struct Status {
    public var id: String
    public var userId: String
    public var userNmae: String
    public var body: String
    public var iconUrl: URL
    public var attachmentImageUrls: [URL]
    public var createdAt: Date

    public init(
        id: String,
        userId: String,
        userNmae: String,
        body: String,
        iconUrl: URL,
        attachmentImageUrls: [URL],
        createdAt: Date
        ) {
        self.id = id
        self.userId = userId
        self.userNmae = userNmae
        self.body = body
        self.iconUrl = iconUrl
        self.attachmentImageUrls = attachmentImageUrls
        self.createdAt = createdAt
    }
}
