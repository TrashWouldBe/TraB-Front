# TraB-Front

## 세팅법

- 아래의 명령어를 터미널에 입력

`firebase login`

`dart pub global activate flutterfire_cli`

`flutterfire configure`

- IOS, Android 선택
  - 이후 firebase_options.dart파일 생성 확인

[참고 문헌](https://firebase.google.com/docs/flutter/setup?hl=ko&platform=ios)

- code generator 사용 (riverpod, json_generator, freezed_annotation)

`dart run build_runner build`

## PR 요청 메세지 포맷

최대한 정성껏

자기가 변경, 추가한 내용 리스트 형식으로 명시

주의해야되는 이슈 있으면 꼭 작성 부탁.

## Branch 명

{종류}/{기능이름}-{작업자명}

feature/mypage-saewoo

## Commit 포맷

아래 링크로 확인하세요.

[링크](https://velog.io/@archivvonjang/Git-Commit-Message-Convention)
