import RxSwift
import RxCocoa

extension ObservableConvertibleType {
    func asSignal() -> Signal<Element> {
        asSignal(onErrorSignalWith: .never())
    }
}
