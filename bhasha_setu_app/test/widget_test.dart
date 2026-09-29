import 'package:flutter_test/flutter_test.dart';
import 'package:mtb_mle_ai_app/data/app_state.dart';
import 'package:mtb_mle_ai_app/data/palash_mock_data.dart';
import 'package:mtb_mle_ai_app/main.dart';
import 'package:mtb_mle_ai_app/models/language_models.dart';
import 'package:mtb_mle_ai_app/widgets/floating_glass_navbar.dart';
import 'package:mtb_mle_ai_app/widgets/pulsing_mic_orb.dart';

void main() {
  testWidgets('PALASH MTB-MLE AI smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PalashApp());
    await tester.pump(const Duration(milliseconds: 300));

    // Verify core components
    expect(find.text('PALASH'), findsOneWidget);
    expect(find.byType(PulsingMicOrb), findsOneWidget);
    expect(find.byType(FloatingGlassNavbar), findsOneWidget);
  });

  test('Mock translation engine test for Santhali, Ho, and Mundari', () {
    final state = PalashAppState();
    expect(state.selectedLanguage, TribalLanguage.santhali);

    final satTranslation = PalashMockData.generateTranslation(
      'सभी बच्चे अपनी जगह पर बैठ जाएं।',
      TribalLanguage.santhali,
    );
    expect(satTranslation.tribalText.isNotEmpty, true);
    expect(satTranslation.devanagariTransliteration.isNotEmpty, true);

    final hoTranslation = PalashMockData.generateTranslation(
      'सभी बच्चे अपनी जगह पर बैठ जाएं।',
      TribalLanguage.ho,
    );
    expect(hoTranslation.tribalText.contains('दुबुङपे'), true);

    final munTranslation = PalashMockData.generateTranslation(
      'सभी बच्चे अपनी जगह पर बैठ जाएं।',
      TribalLanguage.mundari,
    );
    expect(munTranslation.tribalText.contains('दुबपे'), true);
  });
}
