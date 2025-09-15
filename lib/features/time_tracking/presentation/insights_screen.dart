import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import 'widgets/usage_chart.dart';
import 'widgets/usage_list.dart';

class InsightsScreen extends ConsumerStatefulWidget {
  const InsightsScreen({super.key});

  @override
  ConsumerState<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends ConsumerState<InsightsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final usageData = ref.watch(usageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Time Insights'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Daily'),
            Tab(text: 'Weekly'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildInsights(context, usageData.daily),
          _buildInsights(context, usageData.weekly),
        ],
      ),
    );
  }

  Widget _buildInsights(BuildContext context, List<Map<String, dynamic>> data) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: UsageChart(data: data),
            ),
          ),
          ExpansionTile(
            title: const Text('Per-App Usage'),
            children: [UsageList(data: data)],
          ),
        ],
      ),
    );
  }
}
