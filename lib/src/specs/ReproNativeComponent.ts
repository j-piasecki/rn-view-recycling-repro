import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type {ViewProps} from 'react-native';

interface NativeProps extends ViewProps {
  autoSize: boolean;
}

export default codegenNativeComponent<NativeProps>('ReproView');
