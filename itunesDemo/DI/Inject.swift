import Swinject

@propertyWrapper
public struct Inject<Value> {
    public private(set) var wrappedValue: Value

    public init() {
        self.init(name: nil, resolver: nil)
    }

    public init(name: String? = nil, resolver: Container? = nil) {
        guard let resolver = resolver ?? InjectSettings.resolver else {
            fatalError("Make sure InjectSettings.resolver is set!")
        }

        guard let value = resolver.resolve(Value.self, name: name) else {
            fatalError("Could not resolve non-optional \(Value.self)")
        }

        wrappedValue = value
    }

    public init<Wrapped>(name: String? = nil, resolver: Container? = nil) where Value == Wrapped? {
        guard let resolver = resolver ?? InjectSettings.resolver else {
            fatalError("Make sure InjectSettings.resolver is set!")
        }

        wrappedValue = resolver.resolve(Wrapped.self, name: name)
    }
}