import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/app_bar.dart';


class MemoryTestScreen extends StatefulWidget {
  const MemoryTestScreen({super.key});

  @override
  State<MemoryTestScreen> createState() => _MemoryTestScreenState();
}

class _MemoryTestScreenState extends State<MemoryTestScreen> {
  final List<String> _baseImages = [
      'https://img.freepik.com/premium-photo/random-image_590832-9826.jpg',
    'https://images.unsplash.com/photo-1485827404703-89b55fcc595e',
    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e',
  ];
  late List<String> _cards;
  late List<bool> _revealed;
  late List<bool> _matched;
  final List<int> _selectedIndices = [];
  Timer? _flipBackTimer;
  Timer? _introTimer;
  bool _isIntroShowingAll = true;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  void _setup() {
    final deck = [..._baseImages, ..._baseImages];
    deck.shuffle();
    setState(() {
      _cards = deck;
      _revealed = List.filled(deck.length, true);
      _matched = List.filled(deck.length, false);
      _selectedIndices.clear();
      _isIntroShowingAll = true;
    });
    _introTimer?.cancel();
    _introTimer = Timer(const Duration(seconds: 6), () {
      setState(() {
        _isIntroShowingAll = false;
        for (int i = 0; i < _revealed.length; i++) {
          if (!_matched[i]) _revealed[i] = false;
        }
      });
    });
  }

  void _onCardTap(int index) {
    if (_revealed[index] || _matched[index] || _selectedIndices.length == 2 || _isIntroShowingAll) return;
    setState(() {
      _revealed[index] = true;
      _selectedIndices.add(index);
    });
    if (_selectedIndices.length == 2) {
      final first = _selectedIndices[0];
      final second = _selectedIndices[1];
      if (_cards[first] == _cards[second]) {
        setState(() {
          _matched[first] = true;
          _matched[second] = true;
          _selectedIndices.clear();
        });
      } else {
        _flipBackTimer?.cancel();
        _flipBackTimer = Timer(const Duration(milliseconds: 600), () {
          setState(() {
            _revealed[first] = false;
            _revealed[second] = false;
            _selectedIndices.clear();
          });
        });
      }
    }
  }

  @override
  void dispose() {
    _flipBackTimer?.cancel();
    _introTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.moreLightGrey,
      body: Column(
        children: [
          const ScreenAppBar(title: 'memory_test'),
          Padding(
            padding: const EdgeInsets.all(AppPadding.kPadding),
            child: Text(
              'memory_test_instruction'.tr,
              style: getRegulerTextStyle(color: ColorManager.greyColor),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.kPadding),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: AppPadding.kPadding,
                mainAxisSpacing: AppPadding.kPadding,
              ),
              itemCount: _cards.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onCardTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: ColorManager.lightGrey),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        AnimatedOpacity(
                          opacity: _revealed[index] || _matched[index] ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              _cards[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                        if (!(_revealed[index] || _matched[index]))
                          const Center(
                            child: Icon(Icons.help_outline, size: 36, color: ColorManager.greyColor),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.kPadding),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.kPrimary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: _setup,
              child: Text(
                'memory_test_retry'.tr,
                style: getMediumTextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
