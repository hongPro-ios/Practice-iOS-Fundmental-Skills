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


## TableViewPractice
### TableViewMoveAndDeleteCell
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

### TableViewPagenation
확인하고자 한 부분
1. 일반적인 페이지내이션 구성은 어떻게 이뤄져 있을까
- 연속 fetching이 안되도록 플레그 걸어 두고 `func scrollViewDidScroll(_ scrollView: UIScrollView)` 스크롤 델리게이트로 위치 감지 및 fetching 실시
- scrollView.frame.size.height  가 화면에 표시되는 테이블사이즈(일반적인 화면사이즈)
- tableView.contentSize.height 가 스크롤로 숨겨져있는 테이블총 사이즈가 되니 혼동하지 않도록!

##v TableViewSwipeActions
확인하고자 한 부분
1. 커스텀으로 Action을 더 추가시키고 싶을 때 어떻게 조치하는가?
- `func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {`
- `func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {`
- 을 이용하는 것은 TableViewMoveAndDeleteCell와 같다. 여기에 추가할 액션을 더 넣어주면 된다. 
```swift
func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
        self.users.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    let user = users[indexPath.row]
    let favoriteActionTitle = user.isFavorite ? "Unfavorite" : "Favorite"
    let muteActionTitle = user.isMuted ? "Unmute" : "Mute"
    
    let favoriteAction = UITableViewRowAction(style: .normal, title: favoriteActionTitle) { _, indexPath in
        self.users[indexPath.row].isFavorite.toggle()
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    let muteAction = UITableViewRowAction(style: .normal, title: muteActionTitle) { _, indexPath in
        self.users[indexPath.row].isMuted.toggle()
        self.tableView.reloadRows(at: [indexPath], with: .bottom)
    }
    
    favoriteAction.backgroundColor = .systemBlue
    muteAction.backgroundColor = .orange
    
    return [deleteAction, favoriteAction, muteAction]
}
```

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

## UnitXCTest
확인하고자 한 부분
1. xcode에서 유닛테스트 어떻게 하는거지?

- 유닛테스트 단축기()
    1. 빌드런 : 커맨드 + U
    2. 빌드: 쉬프트 + 커맨드 + U
    3. 런: 옵션 + 커맨드 + 
    4. 선택런: 컨 + 옵 + 커 + U
    ref: https://swiftsenpai.com/xcode/xcode-unit-test-shortcuts/

## AnimationPractice
확인하고자 한 부분
1. 애니메이션 어떻게 설정하는거지????
- 이번에 알아본 애니매이션은 아주 기초적인 그리고 제공되는 zoom rotate random 애니메이션이였다.
- cocoapod으로 ViewAnimator를 받아서 이요하긴 했지만 내부 자체가 매우 간단한 코드로 이뤄져있다.
- 기본제공 애니메이션은 어떤것이 있는지 조금더 알아보고 커스텀 애니메이션에 관해 알아봐야한다.

## FileManage
확인하고자 한 부부
1. FileManage는 무슨기능을 제공해주지??
- 이름과 같이 folder, file을 CRUD해주는 기능을 제공한다.  디바이스에 로그 남길 때 유용하게 쓰이겠다.

## Sidebar
확인하고자 한 부분
1. 사이드바 어떻게 만들어내는거지?
- controllerView를 부모자식으로 상속 연결해놓고 애니매니션 이용한다. addChild랑 


## MVVMBindingsPattern
확인하고자 한 부분
1. RxSwift를 사용하지 않고 순수하게 Observable와 bind를 정의해서 사용하는 방법 알아보기
- 기본이론은 단순하다. Observable이라는 클래스에 데이터를 담고, 데이터가 갱신될 때 모델의 bind의 인수인 클로져를 실행시켜 주는것


## UnitTest 재조사
확인하고자 한 부분
1. swift에서 unit test작성절차 및 실제 적용 테스트
2. 비동기 코드 테스트(Unit Testing in Swift: Asynchronous Expectations) : https://medium.com/swlh/unit-testing-in-swift-asynchronous-expectations-376e1427aeb9
  - 몇가지 캐이스가 있다. completion closure을 가지고 있는경우
     핵심은 핸들러의 경우 다른 쓰레드에서 실행되기 때문에 핸들러에 XCTAssert를 넣어도 씹힌다. 그래서 기다리게 만드는 method를 이용하는것
     expectation과 waitForExpectations을 이용한다. 사용방법은 아래의 코드 참고
     ```swift
     func testRetrieveAlumni() {
         let school = School(students: [])
         var result: Result<[Student], NetworkError>?
             
         // Create the expectation.
         let expectation = self.expectation(description: "Waiting for the retrieveAlumni call to complete.")
             
         // Perform the asynchronous call.
         school.retrieveAlumni { response in
             // Save the response.
             result = response
             // Fulfill the expectation.
             expectation.fulfill()
         }
             
         // Wait for expectations for a maximum of 2 seconds.
         waitForExpectations(timeout: 2) { error in
             XCTAssertNil(error)
             switch result {
             case .success(let alumni):
                 XCTAssertEqual(alumni.count, 2)
             case .failure,
                  .none:
                 XCTFail()
             }
         }
     }
     ```
  - 리턴이 없는 function 테스트 (FAF)
    이런 함수를 fire and forget이라고 한다. 이 경우 async로 작동되는 쓰레드를 통일시켜서 테스트 하는 방법을 취한다. 결과적으로 절차적 코드로 바꿔서 테스트 한다는뜻.
    하지만 이렇게 하면 기존 코드에 thread  injection인수를 넣어줘야 하여 본 코드의 수정이 들어간다.
    이런 방법도 있다는걸 알아 두자
  - 이 후 mock으로 의존성 끊어내는 방법이 나오니 그 방법을 활용하도록!


## PageControl
확인하고자 한 부분
1. pageControl이 어떻게 작동 되는거지?
- pageControl이 자동으로 뷰를 이동시켜 주는것이 아니다. 스크롤뷰나 그를 상속한 뷰들과 pageControl를 연계시켜서  paging처리를 하는것이다
- 참고: https://www.youtube.com/watch?v=EKAVB_56RIU
- 심화: https://techlife.cookpad.com/entry/2019/08/16/090000
