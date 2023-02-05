import RxSwift
import Foundation

let disposebag = DisposeBag()


enum TraitsError: Error {
    case single
    case maybe
    case completable
}

print("----single1----")
Single<String>.just("🍊")
    .subscribe(onSuccess: {
        print($0)
    },
    onFailure: {
        print("error: \($0)")
    },
    onDisposed: {
      print("disposed")
    }
    )
    .disposed(by: disposebag)


print("----single2----")
Observable<String>.create { observer -> Disposable in
    
    observer.onError(TraitsError.single)
    return Disposables.create()
}
    .asSingle()
    .subscribe(onSuccess: {
        print($0)
    },
    onFailure: {
        print("error: \($0.localizedDescription)")
    },
    onDisposed: {
      print("disposed")
    }
    )
    .disposed(by: disposebag)


print("----single3----")
struct SomeJson: Decodable {
    let name: String
}

enum JsonError: Error {
    case decodingError
}

let json1 = """
    {"name": "kang"}
"""

let json2 = """
    {"my_name": "park"}
"""

func decode(json: String) -> Single<SomeJson> {
    
    Single<SomeJson>.create { observer -> Disposable in
        guard let data = json.data(using: .utf8),
           let json = try? JSONDecoder().decode(SomeJson.self, from: data) else {
                observer(.failure(JsonError.decodingError))
                return Disposables.create()
        }
        observer(.success(json))
        return Disposables.create()
    }
}

decode(json: json1)
    .subscribe {
        
        switch $0 {
        case .success(let json): print(json)
        case .failure(let error): print(error)
        }
    }
    .disposed(by: disposebag)
