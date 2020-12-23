# 導入方法

## 動作環境

- Swift 5
- Xcode 12
- iOS 14

## 事前準備

- XcodeGenの導入
  - https://github.com/yonaskolb/XcodeGen

## インストール

はじめにBundlerを導入します。

```shell
bundle install --path vendor/bundle
```

次に.xcodeprojと.xcworkspaceを作成していきます。

```shell
make setup
```

ちなみにmakeの中身はMakefileに記載している通り以下が実行されます。

```makefile
setup:
	xcodegen generate
	bundle exec pod install
```

以上で導入完了です。