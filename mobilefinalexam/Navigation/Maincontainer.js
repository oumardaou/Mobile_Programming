import * as React from 'react';
import { View, Text } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createDrawerNavigator, DrawerContentScrollView, DrawerItemList, DrawerItem } from '@react-navigation/drawer';

import Ionicons from 'react-native-vector-icons/Ionicons';

import HomeScreen from './Screens/HomeScreen';
import GpsScreen from './Screens/Gps';
import LightSensorScreen from './Screens/LightSensorScreen';
import MotionAndSecurity from './Screens/MotionAndSecurity'; 
const HomeName = 'Home';
const GpsName = 'Gps';
const LightSensorName = 'Light Sensor';
const MotionAndSecurityName = 'Motion and Security';


const Drawer = createDrawerNavigator();

export default function MainContainer() {
  return (
    <NavigationContainer>
      <Drawer.Navigator
        initialRouteName={HomeName}
        drawerContent={(props) => <CustomDrawerContent {...props} />}>
        <Drawer.Screen name={HomeName} component={HomeScreen} />
        <Drawer.Screen name={GpsName} component={GpsScreen} />
        <Drawer.Screen name={LightSensorName} component={LightSensorScreen} />
       <Drawer.Screen name={MotionAndSecurityName} component={MotionAndSecurity} /> 
  
        
      </Drawer.Navigator>
    </NavigationContainer>
  );
}

function CustomDrawerContent(props) {
  return (
    <DrawerContentScrollView {...props}>
      <DrawerItemList {...props} />
      <DrawerItem
        label="Close drawer"
        onPress={() => props.navigation.closeDrawer()}
      />
    </DrawerContentScrollView>
  );
}
