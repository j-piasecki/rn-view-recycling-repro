import React from 'react';
import {useState} from 'react';
import {SafeAreaView, Button, View} from 'react-native';

import ReproView from 'react-native-repro';

export default function App() {
  const [nested, setNested] = useState(true);
  const [auto, setAuto] = useState(false);
  const [wide, setWide] = useState(true);
  const [tall, setTall] = useState(true);

  return (
    <SafeAreaView style={{flex: 1}}>
      <Button
        title={`Toggle ReproView (${nested})`}
        onPress={() => setNested(!nested)}
      />
      <Button
        title={`Toggle auto W+H (${auto})`}
        onPress={() => setAuto(!auto)}
      />
      <Button title={`Toggle wide (${wide})`} onPress={() => setWide(!wide)} />
      <Button title={`Toggle tall (${tall})`} onPress={() => setTall(!tall)} />
      {nested && (
        <View
          style={{width: wide ? 350 : 250, height: tall ? 500 : 400}}
          collapsable={false}>
          <ReproView
            autoSize={auto}
            style={{
              width: wide ? 350 : 250,
              height: tall ? 500 : 400,
              backgroundColor: 'red',
            }}>
            <View style={{width: 200, height: 200, backgroundColor: 'blue'}} />
          </ReproView>
        </View>
      )}

      {!nested && (
        <View
          collapsable={false}
          style={{
            width: wide ? 350 : 250,
            height: tall ? 500 : 400,
            backgroundColor: 'green',
          }}>
          <View style={{width: 200, height: 200, backgroundColor: 'blue'}} />
        </View>
      )}
    </SafeAreaView>
  );
}
