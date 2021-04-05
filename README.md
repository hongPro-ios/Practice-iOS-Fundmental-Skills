# Practice-iOS-Fundmental-Skills

## NavigationControllerWithCode
확인하고자 한 부분
1. UIViewController.present를 통한 화면표시
- 결과: 완전히 다른 창을 띄우는 방식 dimiss가능
2. UINavigationController.pushViewController 화면표시
- 결과: 창을 띄운 다기 보다는 스택을 쌓는 방식 dimiss가능
3. UIViewController의 dismiss fuction 적용범위
- 결과: dimiss는 navigation을 가지고 있는 UIViewController에서 써지고 그 해당범위는 UIViewController에 정의된 UINavigationController이다. dimiss되었을땐 네비게이션에 쌓인거 싹 날아간다.