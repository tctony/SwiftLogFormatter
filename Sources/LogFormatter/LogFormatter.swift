import Logging

public protocol LogFormatter {

    func format(level: Logger.Level,
                message: Logger.Message,
                metadata: Logger.Metadata,
                file: String,
                function: String,
                line: UInt) -> String

}

public final class LogDefaultFormatter: LogFormatter {

    public var shortFileName: (String) -> String = { (path) -> String in
        if let index = path.lastIndex(of: "/") {
            return String(path.suffix(from: path.index(index, offsetBy: 1)))
        }
        return path
    }

    public init(shortFileName: ((String) -> String)? = nil) {
        if shortFileName != nil {
            self.shortFileName = shortFileName!
        }
    }

    public func format(level: Logger.Level,
                       message: Logger.Message,
                       metadata: Logger.Metadata,
                       file: String,
                       function: String,
                       line: UInt) -> String {

        var formatedMessage = String("[\(level)] \(self.shortFileName(file))@\(line) \(function) \(message)")

        if let combinedPrettyMetadata = self.prettify(metadata) {
            formatedMessage += " -- " + combinedPrettyMetadata
        }

        return formatedMessage
    }

    private func prettify(_ metadata: Logger.Metadata) -> String? {
        if metadata.isEmpty {
            return nil
        }
        return metadata.map {
            "\($0)=\($1)"
        }.joined(separator: " ")
    }
}
