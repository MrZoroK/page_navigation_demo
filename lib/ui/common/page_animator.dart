import 'package:flutter/material.dart';

class NoAnimPageTransitionsBuilder extends PageTransitionsBuilder {
  const NoAnimPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

class NoAnimPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
    builder: builder,
    maintainState: maintainState,
    settings: settings,
    fullscreenDialog: fullscreenDialog
  );

  @override Widget buildTransitions(BuildContext context,
    Animation<double> animation, Animation<double> secondAnimation, Widget child) {
      return child;
  }
}

class WidgetAnimator extends StatefulWidget {
  final Widget child;
  @override WidgetAnimator(this.child);
  @override
  State<StatefulWidget> createState() => WidgetAnimatorState();
}
class WidgetAnimatorState extends State<WidgetAnimator> {
  Animation<double> _animController;
  Animation<Offset> _pageTranslation;

  @override void didChangeDependencies() {
    _animController = ModalRoute.of(context).animation;
    _pageTranslation = Tween(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0)
    ).animate(
      CurvedAnimation(
        parent: _animController,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)
      )      
    );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (BuildContext context, Widget child){
        return FractionalTranslation(
          translation: _pageTranslation.value,
          child: widget.child,
        );
      },
    );
  }
}