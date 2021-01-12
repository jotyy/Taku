import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../component/my_card.dart';
import '../../component/my_flexible_space_bar.dart';

class StatisticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          key: const Key('statistic_page'),
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: const Gap(0),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              expandedHeight: 100.0,
              centerTitle: true,
              pinned: true,
              flexibleSpace: MyFlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                titlePadding:
                    const EdgeInsetsDirectional.only(start: 16.0, bottom: 20.0),
                title: Text(
                  L10n.of(context).statistic,
                  style: const TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                centerTitle: true,
                background: Container(
                  height: 115.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 80.0)),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 120.0,
                    alignment: Alignment.center,
                    child: MyCard(
                      child: Row(
                        children: [
                          const _StatisticsTab('入库数', '200'),
                          const _StatisticsTab('出库数', '131'),
                          const _StatisticsTab('交易额', '1000.00'),
                        ],
                      ),
                    ),
                  ),
                ),
                120.0,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '数据走势',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(20),
                    _StatisticsItem('入库统计', Assets.images.jyetj, 1),
                    const Gap(20),
                    _StatisticsItem('出库统计', Assets.images.sjzs, 2),
                    const Gap(20),
                    _StatisticsItem('商品统计', Assets.images.sptj, 3),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

class _StatisticsTab extends StatelessWidget {
  const _StatisticsTab(this.title, this.content);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MergeSemantics(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              content,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap(6.0),
            Text(
              title,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.grey.withAlpha(180),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatisticsItem extends StatelessWidget {
  const _StatisticsItem(this.title, this.img, this.index, {Key key})
      : super(key: key);

  final String title;
  final AssetGenImage img;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.14,
      child: GestureDetector(
        onTap: () {},
        child: MyCard(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Assets.images.iconSelected
                          .image(height: 16.0, width: 16.0)
                    ],
                  ),
                ),
                Expanded(child: img.image(fit: BoxFit.fill))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this.widget, this.height);

  final Widget widget;
  final double height;

  // minHeight 和 maxHeight 的值设置为相同时，header就不会收缩了
  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
