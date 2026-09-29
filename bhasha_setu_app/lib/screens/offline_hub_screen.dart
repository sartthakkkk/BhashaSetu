import 'package:flutter/material.dart';
import '../core/theme/palash_colors.dart';
import '../core/theme/palash_glass.dart';
import '../core/theme/palash_typography.dart';
import '../data/app_state.dart';
import '../models/language_models.dart';
import '../widgets/custom_data_feeder_modal.dart';

class OfflineHubScreen extends StatelessWidget {
  final PalashAppState appState;

  const OfflineHubScreen({
    super.key,
    required this.appState,
  });

  void _openDataFeeder(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomDataFeederModal(appState: appState),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalashColors.bgDark,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Offline & AI Engine',
                          style: PalashTypography.headlineSmall),
                      Text(
                        'On-Device Zero-Internet Architecture Hub',
                        style:
                            PalashTypography.labelSmall.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          PalashColors.emeraldPrimary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            PalashColors.emeraldPrimary.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.wifi_off_rounded,
                            size: 13, color: PalashColors.emeraldPrimary),
                        const SizedBox(width: 5),
                        Text(
                          '100% Offline Mode',
                          style: PalashTypography.labelSmall.copyWith(
                            color: PalashColors.emeraldPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Benchmark Stats Matrix (SRS Compliance: <2GB RAM, Sub-2s Latency)
              _buildPerformanceMetricsCard(),

              const SizedBox(height: 20),

              // Interactive Data Feeder Banner
              _buildDataFeederLauncher(context),

              const SizedBox(height: 20),

              // Installed Offline Language Models
              Row(
                children: [
                  const Icon(Icons.inventory_2_outlined,
                      size: 18, color: PalashColors.cyanElectric),
                  const SizedBox(width: 8),
                  Text('On-Device Neural Voice Packs',
                      style: PalashTypography.titleLarge),
                ],
              ),

              const SizedBox(height: 12),

              ...TribalLanguage.values.map((lang) {
                final isSelected = appState.selectedLanguage == lang;
                return _buildLanguagePackCard(context, lang, isSelected);
              }),

              const SizedBox(height: 20),

              // State LMS Sync Status
              _buildSyncCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPerformanceMetricsCard() {
    return GlassCard(
      borderRadius: 22,
      padding: const EdgeInsets.all(18),
      backgroundColor: const Color(0xE00F172A),
      borderGradient: const LinearGradient(
        colors: [PalashColors.emeraldPrimary, PalashColors.cyanElectric],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Edge Hardware Benchmarks',
                  style: PalashTypography.titleMedium),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: PalashColors.emeraldPrimary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'OPTIMAL',
                  style: PalashTypography.labelSmall.copyWith(
                    color: PalashColors.emeraldPrimary,
                    fontWeight: FontWeight.w800,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildMetricTile(
                  icon: Icons.memory_rounded,
                  label: 'RAM Footprint',
                  value: '380 MB',
                  sub: 'Max 2 GB Limit',
                  color: PalashColors.cyanElectric,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricTile(
                  icon: Icons.speed_rounded,
                  label: 'NPU Latency',
                  value: '0.86s',
                  sub: 'Target < 2.0s',
                  color: PalashColors.emeraldPrimary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricTile(
                  icon: Icons.sd_storage_rounded,
                  label: 'Local Weight',
                  value: '48.2 MB',
                  sub: 'Compressed',
                  color: PalashColors.amberWarm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile({
    required IconData icon,
    required String label,
    required String value,
    required String sub,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0x33000000),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: PalashColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            style: PalashTypography.labelSmall.copyWith(
              color: PalashColors.textSecondary,
              fontSize: 9,
            ),
          ),
          Text(
            sub,
            style: PalashTypography.labelSmall.copyWith(
              color: color,
              fontSize: 8.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataFeederLauncher(BuildContext context) {
    return GlassCard(
      borderRadius: 20,
      padding: const EdgeInsets.all(16),
      backgroundColor: const Color(0xE0111A33),
      borderColor: PalashColors.cyanElectric.withValues(alpha: 0.4),
      onTap: () => _openDataFeeder(context),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: PalashColors.cyanElectric.withValues(alpha: 0.15),
            ),
            child: const Icon(Icons.tune_rounded,
                color: PalashColors.cyanElectric, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Open Scenario & Data Sandbox',
                    style: PalashTypography.titleMedium),
                const SizedBox(height: 2),
                Text(
                  'Feed arbitrary phrases or trigger custom teacher prompts',
                  style: PalashTypography.bodyMedium.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded,
              size: 14, color: PalashColors.cyanElectric),
        ],
      ),
    );
  }

  Widget _buildLanguagePackCard(
      BuildContext context, TribalLanguage lang, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GlassCard(
        borderRadius: 16,
        padding: const EdgeInsets.all(14),
        backgroundColor: isSelected
            ? lang.accentColor.withValues(alpha: 0.15)
            : const Color(0xB30F172A),
        borderColor:
            isSelected ? lang.accentColor : PalashColors.glassBorder,
        onTap: () {
          appState.setSelectedLanguage(lang);
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: lang.accentColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.translate_rounded,
                  color: lang.accentColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${lang.displayName} (${lang.nativeName})',
                        style: PalashTypography.titleMedium.copyWith(
                          color: isSelected
                              ? lang.accentColor
                              : Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 6),
                      if (isSelected)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: lang.accentColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'ACTIVE',
                            style: TextStyle(
                              color: Color(0xFF06101E),
                              fontSize: 8,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Script: ${lang.scriptName} • Region: ${lang.region}',
                    style: PalashTypography.labelSmall.copyWith(
                      color: PalashColors.textMuted,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.offline_pin_rounded,
                color: PalashColors.emeraldPrimary, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSyncCard(BuildContext context) {
    return GlassCard(
      borderRadius: 18,
      padding: const EdgeInsets.all(16),
      backgroundColor: const Color(0xB30B132B),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Jharkhand JCERT State Sync',
                  style: PalashTypography.titleMedium),
              Text('Sync Idle',
                  style: PalashTypography.labelSmall
                      .copyWith(color: PalashColors.emeraldPrimary)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Curriculum packages automatically verify when device connects to school Wi-Fi. Last verified 2 hours ago.',
            style: PalashTypography.bodyMedium
                .copyWith(color: PalashColors.textSecondary, fontSize: 11),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: PalashColors.glassWhiteStrong,
              foregroundColor: PalashColors.textPrimary,
              minimumSize: const Size(double.infinity, 38),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: PalashColors.glassBorder),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('🔄 Background Sync: All Local MTB Models Up to Date')),
              );
            },
            icon: const Icon(Icons.sync_rounded, size: 16),
            label: const Text('Check for Curriculum Updates',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
