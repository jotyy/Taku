import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../util/error_snackbar.dart';
import '../app_theme.dart';

const double _kFlingVelocity = 2.0;

/// Backdrop component
class Backdrop extends StatefulWidget {
  final Widget frontLayer;
  final Widget backLayer;

  const Backdrop({Key key, @required this.frontLayer, @required this.backLayer})
      : super(key: key);

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: "Backdrop");
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), value: 1.0, vsync: this);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Backdrop oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_frontLayerVisible) {
      _controller.fling(velocity: _kFlingVelocity);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _frontLayerVisible {
    final status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(
        velocity: _frontLayerVisible ? -_kFlingVelocity : _kFlingVelocity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _appBar,
      floatingActionButton: _fab,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: LayoutBuilder(builder: _buildStack),
    );
  }

  Widget get _appBar {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => _toggleBackdropLayerVisibility),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.color_lens, color: Colors.white),
            onPressed: () async => context
                .read(appThemeNotifierProvider)
                .toggle()
                .catchError((error) {
              showErrorSnackbar(
                  L10n.of(context).error, L10n.of(context).failedSwitchTheme);
            }),
          ),
          IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {})
        ],
      ),
    );
  }

  Widget get _fab {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed(Constants.pageQRScanner));
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final layerSize = constraints.biggest;
    const layerMarginTop = 48.0;

    var layerAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0.0, layerMarginTop, 0.0, 0.0),
      end: RelativeRect.fromLTRB(0.0, layerSize.height, 0.0, -layerSize.height),
    ).animate(_controller.view);

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        ExcludeSemantics(
          child: widget.backLayer,
          excluding: _frontLayerVisible,
        ),
        PositionedTransition(
          rect: layerAnimation,
          child: _FrontLayer(
            onTap: _toggleBackdropLayerVisibility,
            child: widget.frontLayer,
          ),
        ),
      ],
    );
  }
}

class _FrontLayer extends StatelessWidget {
  const _FrontLayer({
    Key key,
    this.onTap,
    @required this.child,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      color: Theme.of(context).primaryColorDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36.0), topRight: Radius.circular(36.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              height: 20.0,
              alignment: AlignmentDirectional.centerStart,
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    )),
                child: child),
          ),
        ],
      ),
    );
  }
}
