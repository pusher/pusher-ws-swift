import Foundation

@objcMembers
open class PusherError: NSObject {

    // Code is optional, message is not: https://pusher.com/docs/channels/library_auth_reference/pusher-websockets-protocol#-pusher-error-channels-client-
    /// The error code
    public let code: Int?
    /// The error message
    public let message: String

    internal let raw: [String:Any]

    internal init?(jsonObject: [String:Any]) {
        guard let data = jsonObject["data"] as? [String:Any] else {
            return nil
        }

        guard let message = data["message"] as? String else {
            return nil
        }

        self.code = data["code"] as? Int
        self.message = message
        self.raw = jsonObject
    }
}