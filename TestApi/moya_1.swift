import Foundation
import Moya

enum MyAPI {
    case getQuotes
}

extension MyAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://172.245.154.103:3000")!
    }

    var path: String {
        switch self {
        case .getQuotes:
            return "/xinyu"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data() // 这里可以提供一些示例数据，通常用于测试
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
