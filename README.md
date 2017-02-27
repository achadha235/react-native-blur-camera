
# react-native-blur-camera

## Getting started

`$ npm install react-native-blur-camera --save`

### Mostly automatic installation

`$ react-native link react-native-blur-camera`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-blur-camera` and add `RNBlurCamera.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBlurCamera.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNBlurCameraPackage;` to the imports at the top of the file
  - Add `new RNBlurCameraPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-blur-camera'
  	project(':react-native-blur-camera').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-blur-camera/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-blur-camera')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNBlurCamera.sln` in `node_modules/react-native-blur-camera/windows/RNBlurCamera.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Com.Reactlibrary.RNBlurCamera;` to the usings at the top of the file
  - Add `new RNBlurCameraPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNBlurCamera from 'react-native-blur-camera';

// TODO: What to do with the module?
RNBlurCamera;
```
  