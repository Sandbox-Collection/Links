import SwiftUI

@main
struct LinksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

/*
 
 AASA 파일
 ```
 {
     "applinks": {
         "apps": [],
         "details": [
             {
                 "appID": "TeamID.com.yourcompany.yourapp",
                 "paths": ["*"]
             }
         ]
     }
 }
 ```
 TeamID는 Apple Developer 계정의 Team ID
 com.yourcompany.yourapp은 앱의 Bundle ID
 paths는 앱에서 처리할 경로를 지정합니다. ["*"]는 모든 경로를 앱에서 처리한다는 의미
 특정 경로 처리 시, "paths": ["/home", "/settings"]
 
AASA 파일의 운영 방식
이 파일은 웹 서버에만 존재 (앱 내부에는 포함되지 않음).
파일은 다음 위치 중 하나에 호스팅
https://yourdomain.com/.well-known/apple-app-site-association
https://yourdomain.com/apple-app-site-association

HTTPS를 통해 제공
Content-Type은 application/json이어야 함

iOS 기기가 작동하는 방식:
사용자가 앱을 처음 설치할 때 iOS는 앱의 Associated Domains 설정을 확인
iOS는 설정된 도메인에서 AASA 파일을 다운로드하고 캐시
사용자가 해당 도메인의 링크를 탭할 때 iOS는 캐시된 AASA 파일을 확인하여 해당 링크가 앱으로 열릴 자격이 있는지 확인

따라서, 앱은 AASA 파일을 가지고 있을 필요가 없으며, 단지 Xcode에서 Associated Domains 기능을 활성화하고 적절한 도메인을 지정하기만 하면 됨.
실제 AASA 파일은 웹 서버에서 관리.
이러한 방식으로 Universal Links는 웹과 앱 사이의 연결을 안전하게 유지할 수 있으며, Apple이 중간에서 검증 과정을 제공
 
 차이점
 DeepLink (URL 스킴)
 앱의 Info.plist에 커스텀 URL 스킴 등록 (CFBundleURLTypes)
 myapp:// 형식의 URL을 사용
 설정이 단순하고 쉬움
 다른 앱이 같은 URL 스킴을 등록할 수 있어 보안에 취약

 Universal Links
 Xcode에서 Associated Domains 기능 활성화
 웹 서버에 apple-app-site-association(AASA) 파일 호스팅
 https:// 형식의 표준 웹 URL을 사용
 설정이 더 복잡하지만 보안성이 높음
 앱이 설치되지 않은 경우 웹사이트로 폴백
 
 코드 측면에서는 두 방식 모두 같은 onOpenURL 메서드를 통해 처리되므로, 한 앱에서 두 가지 방식을 모두 지원하는 것이 일반적
                                         
*/
