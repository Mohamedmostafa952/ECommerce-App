
import 'package:e_commerce_app/features/main_layout/presentation/cubit_states/main_layout_states.dart';
import 'package:e_commerce_app/features/main_layout/tabs/favorites/presentation/screens/favorites_tab.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/screens/home_tab.dart';
import 'package:e_commerce_app/features/main_layout/tabs/products/presentation/screens/products_tab.dart';
import 'package:e_commerce_app/features/main_layout/tabs/profile/presentation/screens/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainLayoutViewModel extends Cubit<MainLayoutStates>{
  MainLayoutViewModel(): super(MainLayoutInitialState());

  List<Widget> tabs = [HomeTab(), ProductsTab(), FavoritesTab(), ProfileTab()];

  int selectedIndex = 0;

  void onBottomNavBarItemTap(int index){
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}