.PHONY: setup
setup:
	# ビルド時に生成されるファイル群のクリーン (削除)
	make clean
	# プラグインのライブラリなどを取得,更新
	make pub_get

# 自動生成系をまとめたcommand群
flutter_generate:
	make setup
	# lintリストの取得
	make lint
	# コード生成(build_runner)
	make build_runner

submit_ios:
	make setup
	# Xcodeを開く
	open ios/Runner.xcworkspace

submit_android:
	make setup
	# AndroidのBundleを生成する
	flutter build appbundle

.PHONY: clean
clean:
	flutter clean

.PHONY: repair
repair:
	flutter pub cache repair

pub_get:
	flutter pub get

which_flutter:
	which flutter

build_apk:
	flutter build apk

build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

build_runner_w:
	flutter pub run build_runner watch -d

.PHONY: lint
lint:
	dart run custom_lint

slang:
	dart run slang

.PHONY: run-dev
run-dev:
	flutter run --debug --flavor development

.PHONY: run-stg
run-stg:
	flutter run --debug --flavor staging
	
.PHONY: run-prd
run-prd:
	flutter run --debug --flavor production