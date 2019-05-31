echo "===生成各个plugin的二进制库文件==="
cd ios/Pods
#/usr/bin/env xcrun xcodebuild clean
#/usr/bin/env xcrun xcodebuild build -configuration Release ARCHS='arm64 armv7' BUILD_AOT_ONLY=YES VERBOSE_SCRIPT_LOGGING=YES -workspace Runner.xcworkspace -scheme Runner BUILD_DIR=../build/ios -sdk iphoneos
plugin_arr=("flutter_boost" "xservice_kit")
for plugin_name in ${plugin_arr}
do
    echo "生成lib${plugin_name}.a..."
    /usr/bin/env xcrun xcodebuild build -configuration Release ARCHS='arm64 armv7' -target ${plugin_name} BUILD_DIR=../../build/ios -sdk iphoneos -quiet
    /usr/bin/env xcrun xcodebuild build -configuration Debug ARCHS='x86_64' -target ${plugin_name} BUILD_DIR=../../build/ios -sdk iphonesimulator -quiet
    echo "合并lib${plugin_name}.a..."
    lipo -create "../../build/ios/Debug-iphonesimulator/${plugin_name}/lib${plugin_name}.a" "../../build/ios/Release-iphoneos/${plugin_name}/lib${plugin_name}.a" -o "../../build/ios/Release-iphoneos/${plugin_name}/lib${plugin_name}.a"
done

echo "===生成注册入口的二进制库文件==="
for reg_enter_name in "flutter_plugin_entrance" "flutter_service_register"
do
    echo "生成lib${reg_enter_name}.a..."
    /usr/bin/env xcrun xcodebuild build -configuration Release ARCHS='arm64 armv7' -target ${reg_enter_name} BUILD_DIR=../../build/ios -sdk iphoneos
    /usr/bin/env xcrun xcodebuild build -configuration Debug ARCHS='x86_64' -target ${reg_enter_name} BUILD_DIR=../../build/ios -sdk iphonesimulator
    echo "合并lib${reg_enter_name}.a..."
    lipo -create "../../build/ios/Debug-iphonesimulator/${reg_enter_name}/lib${reg_enter_name}.a" "../../build/ios/Release-iphoneos/${reg_enter_name}/lib${reg_enter_name}.a" -o "../../build/ios/Release-iphoneos/${reg_enter_name}/lib${reg_enter_name}.a"
done