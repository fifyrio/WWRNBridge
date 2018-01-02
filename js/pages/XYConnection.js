/**
 * Created by wuw on 2017/9/1.
 */

import React, { Component } from 'react';
import {
  StyleSheet,
  View,
  Text,
} from 'react-native';
import { NativeModules } from 'react-native';

'use strict';

export default class XYConnection extends Component{

  render(){
    return(
        <View style={styles.container}>
          <Text>Hello, fuck you</Text>
          <Text onPress={this.gotoVC}>Go To Mine</Text>
        </View>
    )
  }

  gotoVC(){
    let connection = NativeModules.XYConnection;
    connection.testName('Will');
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    marginTop: 64,
  },
});
