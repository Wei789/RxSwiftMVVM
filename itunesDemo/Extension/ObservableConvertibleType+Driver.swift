import RxSwift
import RxCocoa

extension ObservableConvertibleType {
    func asDriver() -> Driver<Element> {
        asDriver(onErrorDriveWith: .never())
    }
}
