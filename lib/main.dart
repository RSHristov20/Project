import 'package:bubolechka2/data/categories.dart';
import 'package:bubolechka2/language_selector.dart';
import 'package:bubolechka2/models/bubo_category.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BuboApp());
}

class BuboApp extends StatelessWidget {
  const BuboApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubolechka 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BuboHomePage(),
    );
  }
}

class BuboHomePage extends StatefulWidget {
  const BuboHomePage({Key? key}) : super(key: key);

  @override
  State<BuboHomePage> createState() => _BuboHomePageState();
}

class _BuboHomePageState extends State<BuboHomePage> {
  String _language = 'bg';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Champions.jpg'),
                    fit: BoxFit.cover)),
            child: null,
          ),
          Positioned(
            top: 30,
            bottom: 100,
            left: 20,
            right: 20,
            child: BuboCategoryViewer(_language),
          ),
          Positioned(
              right: 30,
              bottom: 30,
              width: width > height ? 300 : 54,
              height: width < height ? 300 : 54,
              child: LanguageSelector(width > height,
                  onLanguageChange: (newLanguage) {
                setState(() {
                  _language = newLanguage.toLowerCase();
                });
              })),
          Positioned(
            bottom: 30,
            left: 30,
            width: 200,
            child: Image.asset('assets/logo.png'),
          ),
        ],
      ),
    );
  }
}

class BuboCategoryViewer extends StatelessWidget {
  final String language;

  const BuboCategoryViewer(this.language, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var widthPerCategory = 300;

    if (width > widthPerCategory) {
      var itemsPerRow = (width / widthPerCategory).floor();

      return GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 0,
        crossAxisCount: itemsPerRow,
        children: buboCategories.map((buboCategory) {
          return BuboCategoryListItem(language: language, category: buboCategory);
        }).toList(),
      );
    } else {
      return ListView(
        children: buboCategories.map((buboCategory) {
          return BuboCategoryListItem(language: language, category: buboCategory);
        }).toList(),
      );
    }
  }
}

class BuboCategoryListItem extends StatefulWidget {
  final String language;
  final BuboCategory category;

  const BuboCategoryListItem({required this.language, required this.category, Key? key})
      : super(key: key);

  @override
  _BuboCategoryListItemState createState() => _BuboCategoryListItemState();
}

class _BuboCategoryListItemState extends State<BuboCategoryListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isHovered = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle category tap
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
            _animationController.forward();
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
            _animationController.reverse();
          });
        },
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final transform = Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value * 3.141592);
            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: _isHovered ? Colors.blue : Colors.transparent,
                  border: _isHovered
                      ? Border.all(color: Colors.blue, width: 2)
                      : Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _isHovered
                    ? _buildBackContent()
                    : _buildFrontContent(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFrontContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(widget.category.image, width: 230, fit: BoxFit.fill),
        const SizedBox(height: 2),
        Text(
          widget.category.translatedLabels[widget.language] ?? 'Not available',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBackContent() {
  return Container(
    width: 500,
    height: 500,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Transform(
      transform: Matrix4.identity()..rotateY(-3.141592),
      alignment: Alignment.center,
      child: Center(
        child: Text(
          'Manchester United',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

}