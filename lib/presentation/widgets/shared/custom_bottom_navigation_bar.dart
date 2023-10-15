import 'dart:developer';

import 'package:deep_read_app/presentation/blocs/local_storage/local_storage_bloc.dart';
import 'package:deep_read_app/presentation/views/books/linkedin_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped(BuildContext context, int index) {
    log("INDEX $index");
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      // case 2:
      //   context.go('/home/2');
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      onTap: (value) {
        if (value == 1) {
          context.read<LocalStorageBloc>().add(ChargeFavoritesEvent());
        } else if (value == 2) {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.25, // 25% de la pantalla
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Configuración',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                FloatingActionButton(
                                  backgroundColor: const Color(0xFFFAF1D6),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LinkedInWebView(),
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.star),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Desarrollado por:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                FloatingActionButton(
                                  backgroundColor: const Color(0xFFFAF1D6),
                                  onPressed: () {},
                                  child: const Icon(Icons.theater_comedy),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Tema:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
        onItemTapped(context, value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_rounded),
          label: 'Configuración',
        ),
      ],
    );
  }
}
