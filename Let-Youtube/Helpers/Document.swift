//
//  Document.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/21.
//  Copyright © 2019 201302458. All rights reserved.
//

/*
 Warnning! don't compile this .swift file.
 It's document that organize what I've leanred.
 */

/*
 1. UIModalPresentationStyle
    새로운 view를 modal로 띄울 때, .fullScreen이 아닌 .formSheet가 적용되는 현상이 있었다.
    viewController.modalPresentationStyle의 default는 .automatic 이였고,
    이는 시스템이 .fullScreen이 아닌 .formSheet로 설정하였다.
 
 2. SceneDelegate
    iOS 13 업데이트 이후로 AppDelegate와 SceneDelegate로 분리됨과 동시에 life cycle이 변경되었다.
    이는 Apple의 설명 동영상을 보는것이 더 좋다.
    https://developer.apple.com/videos/play/wwdc2019/258/
 
 3. UIApplication.shared.window
    iOS 13 이후 저 형태로 사용할 수 없다. Scene이 추가됨에 따라,
    let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first 를 통해
    windows 중 keyWindow인 첫 번째 객체를 keyrWindow로 설정한다. 다만, 이는 optional 값이기 때문에
    guard let window = keyWindow else { return } 을 통해 nil을 검사해야 한다.
 
 4. statusBar Background color 변경
    iOS 13 이후로 statusBarManager가 생겼다. 그래서 statusbar의 배경색을 바꾸고 싶다면,
    let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
    statusBar.backgroundColor = UIColor.systemBackground
    UIApplication.shared.keyWindow?.addSubview(statusBar)
    과 같이 사용하도록 하자.
 */
