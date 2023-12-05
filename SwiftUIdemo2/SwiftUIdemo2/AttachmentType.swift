import UIKit

public enum AttachmentType: Hashable {

    case image(UIImage)

    case url(URL)

    case data(Data)
}
