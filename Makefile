setup:
	xcodegen generate
	bundle exec pod install --repo-update
	
setopen:
	xcodegen generate
	bundle exec pod install
	open CleanArchitectureSample.xcworkspace
# 
# environment:
# 	rbenv install -s
# 	rbenv rehash
# 	brew install mint
# 	mint install yonaskolb/xcodegen@2.14.0
# 	rbenv exec bundle install
# 
# install:
# 	make environment
# 	rbenv exec bundle exec fastlane setup_xcode
# 
# publish:
# 	make environment
# 	rbenv exec bundle exec fastlane preview
# 
# test:
# 	make environment
# 	rbenv exec bundle exec fastlane test
# 
# clean:
# 	rm -rf vendor
# 	rm -rf View/View.xcodeproj
# 	rm -rf UseCase/UseCase.xcodeproj
# 	rm -rf DataSource/DataSource.xcodeproj
# 	rm -rf main/main.xcodeproj
# 	rm -rf main.xcworkspace
# 	rm -rf Pods
