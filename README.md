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

## RingAnimation
확인하고자 한 부분
1. 그림은 어떻게 그리는거지?
- 결과: CAShapeLayer와 UIBezierPath이용해서 그림을 그릴 수 있다.. 아직 원밖에 안해봐서 원밖에 모르겠지만 다른형태도 이걸로 그릴 수 있는 것 같다.
2. 애니메이션은 어떻게 동작하는거지?
- 결과: CABasicAnimation이용해서 애니메이션을 돌리는데... 아직 잘 모르겠다.


## TableViewMoveAndDeleteCell
확인하고자 한 부분
1. TableView Cell 이동
- 이동에 사용되는 TableViewDelegate func은 2개이다.
`func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {}`
`func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {}`
tableView의 isEditing 속성이 true인 상태에서 조작이 가능하다. 
```swift
func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
}

func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    models.swapAt(sourceIndexPath.row, destinationIndexPath.row)
}
```

2. TableView Cell 삭제
- 삭제에 사용되는 TableViewDelegate func은 2개이다.
`func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {}`
`func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {}`
중요한 포인트!!! table이 갱신되기 전에  cell뿐만 아니라 실제 모델 데이터를 같이 삭제 해줘야 crash가 안난다.
```swift
func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
}

func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle  == .delete {
        tableView.beginUpdates()
        models.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
}
```

## TableViewPagenation
확인하고자 한 부분
1. 일반적인 페이지내이션 구성은 어떻게 이뤄져 있을까
- 연속 fetching이 안되도록 플레그 걸어 두고 `func scrollViewDidScroll(_ scrollView: UIScrollView)` 스크롤 델리게이트로 위치 감지 및 fetching 실시
- scrollView.frame.size.height  가 화면에 표시되는 테이블사이즈(일반적인 화면사이즈)
- tableView.contentSize.height 가 스크롤로 숨겨져있는 테이블총 사이즈가 되니 혼동하지 않도록!

## PassData
확인하고자 한 부분
1. 일반적인 화면간 데이터를 주고받는 방법
-   1. 초기화시 건내는 방법,  2. Closure을 활용하는 방법, 3. NotificationCenter를 이용하는 방법이있다.
- 초기화시 거낸는 방법은 일방적인 전달을 담당할 때 사용(ex 띄울 화면에 필요한 정보 넘기기)
- Closure을 사용하는 방법은 화면간 1:1매칭 이용할 때사용(ex 현 textField를 터치하면 팝업띄어서  입력한 내용 textField에 넣기)
- NotificationCenter은 방법을 전 화면에서 접근 가능한 데이터 저장소를 따로 두고 거기다가 데이터를 넣고 접근하는 방식으로써 어떤화면에서든 데이터 접근이 가능하다.

## VIPER : 아키텍처 패턴
확인하고자 한 부분
1. 어떻게 이루어져있고 어떤 역할을 하는가.
- V: View: Presenter의 요청대로 디스플레이하고, 사용자 입력을 Presenter로 보내는 작업을 합니다.
- I: Interactor: Entity조작 및 백엔드 작업
- P: Presenter: Interactor에서 데이터 취득, View에 데이터 준비 및 타이밍 제어, Router 타이밍 제어
- E: Entity: 모델객체
- R: Router: 화면전환
- VIPER설명: https://nightohl.tistory.com/entry/iOS-%EC%95%84%ED%82%A4%ED%85%8D%EC%B2%98-%ED%8C%A8%ED%84%B4-VIPER
