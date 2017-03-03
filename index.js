import React from 'react';
import { requireNativeComponent, NativeModules } from 'react-native';

class RNBlurCameraView extends React.Component {
    
  render() {
    return <RNBlurCamera { ...this.props } />;
  }

  getSnapshot(){
    return new Promise((resolve, reject) => {
      NativeModules.RNBlurCameraManager.getSnapshot((err, data) => {
        if (!err){
          resolve(data);
        } else {
          reject(err);  
        }
      });
    });
  }
}

RNBlurCameraView.propTypes = {
  blurRadius: React.PropTypes.number,
  blurEnabled: React.PropTypes.bool,
};

var RNBlurCamera = requireNativeComponent('RNBlurCamera', RNBlurCamera);

module.exports = RNBlurCameraView;