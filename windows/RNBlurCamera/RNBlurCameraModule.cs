using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Com.Reactlibrary.RNBlurCamera
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNBlurCameraModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNBlurCameraModule"/>.
        /// </summary>
        internal RNBlurCameraModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNBlurCamera";
            }
        }
    }
}
