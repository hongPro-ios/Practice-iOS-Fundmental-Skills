# Practice-iOS-Fundmental-Skills

## NavigationControllerWithCode
확인하고자 한 부분
1. UIViewController.present를 통한 화면표시
- 결과: 완전히 다른 창을 띄우는 방식 dimiss가능
2. UINavigationController.pushViewController 화면표시
- 결과: 창을 띄운 다기 보다는 스택을 쌓는 방식 dimiss가능
3. UIViewController의 dismiss fuction 적용범위
- 결과: dimiss는 navigation을 가지고 있는 UIViewController에서 써지고 그 해당범위는 UIViewController에 정의된 UINavigationController이다. dimiss되었을땐 네비게이션에 쌓인거 싹 날아간다.

## TabBarControllerWithCode
확인하고자 한 부분
1. 코드를 통한 TabBarView 표시
- 결과: 어렵지 않게 구현이 가능하다. 주의점은 탭바뷰가 화면에 보여도 해당 탭을 클릭 했을때 초기화가 이뤄진다(viewDidLoad). 그렇기 때문에 title을 tabBarView구현부에서 설정해주는 것이 좋다.
2. TabBar의 아이콘, 이름 변경방법
- 결과: 탭바뷰.tabBar.items 에서 관리된다.
3. 아이콘에 뱃지넣기


## JustPublisher
확인하고자 한 부분
1. JustPublisher가 뭐야??
- 결과: RxSwift에서 just와 거의 같은 역할을 수행한다.
이번에 처음으로 swift에서 기본으로 제공해주는 Combine 라이브러리를 써봤다. Rx형태의 기능을 제공해 주는 것 같다.
아직 함수형 프로그래밍을 잘 모르지만, 아는 RxSwift를 기준으로 보면 비슷한 것이 많다
- AnyPublisher가 Observable 혹은 PublishSubject와 흡사하다
    - .receive 연산자?는 observeOn 혹은 subscribeOn와 흡사하다
    - .sink 연산자는 subscribe 혹은 drive 혹은 bind오 흡사하다.
    - Just는 Observable.just와 흡사하다.

    # Rx복습
    - subscribeOn은 Observable이 실행될 스케줄러를 지정한다.(위치 상관없음)
    - observeOn은 이어지는 연산자가 실행될 스케줄러를 지정한다(스케줄러를 변경하지 않으면 스케줄러는 바뀌지 않는다)