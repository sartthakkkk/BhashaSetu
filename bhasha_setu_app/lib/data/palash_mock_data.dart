import 'package:flutter/material.dart';
import '../models/language_models.dart';

class PalashMockData {
  PalashMockData._();

  // Preset Classroom Translation Library
  static final List<TranslationEntry> defaultTranslations = [
    TranslationEntry(
      id: 'trans_1',
      hindiText: 'सभी बच्चे अपनी जगह पर बैठ जाएं और किताब खोलें।',
      tribalText: 'ᱡᱚᱛᱚ ᱜᱤᱫᱽᱨᱟᱹ ᱟᱯᱱᱟᱨᱟᱜ ᱴᱷᱟᱶᱨᱮ ᱫᱩᱲᱩᱵ ᱯᱮ ᱟᱨ ᱯᱩᱛᱷᱤ ᱡᱷᱤᱡᱽ ᱯᱮ᱾',
      devanagariTransliteration: 'जोतो गिदरा आपणाराग ठांवरे दुड़ुब पे आर पुथी झीज पे।',
      phoneticPronunciation: 'Joto gidrạ apnarag ṭhaō̃re duṛub pe ar puthi jhij pe.',
      language: TribalLanguage.santhali,
      category: 'Classroom Management',
      confidence: 0.992,
      latencySeconds: 0.86,
      audioWaveform: [0.2, 0.5, 0.8, 0.6, 0.9, 0.4, 0.7, 0.3, 0.6, 0.2],
      durationSeconds: 3.2,
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
    TranslationEntry(
      id: 'trans_2',
      hindiText: 'आज हम सब एक मजेदार कहानी सुनेंगे।',
      tribalText: 'ᱛᱮᱦᱮᱧ ᱫᱚ ᱟᱵᱚ ᱢᱤᱫᱴᱟᱝ ᱨᱟᱹᱥᱠᱟᱹ ᱠᱟᱹᱦᱱᱤ ᱵᱚᱱ ᱟᱸᱡᱚᱢᱟ᱾',
      devanagariTransliteration: 'तेहेञ दो आबो मिदटांग ऱा़स्का़ का़हनी बोन आंजोमा।',
      phoneticPronunciation: 'Teheñ do abo midṭang rạskạ kạhni bon añjoma.',
      language: TribalLanguage.santhali,
      category: 'Oral Storytelling',
      confidence: 0.988,
      latencySeconds: 1.12,
      audioWaveform: [0.3, 0.7, 0.4, 0.9, 0.8, 0.5, 0.6, 0.8, 0.4, 0.2],
      durationSeconds: 2.8,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    TranslationEntry(
      id: 'trans_3',
      hindiText: 'श्यामपट्ट पर लिखे अक्षरों को अपनी कॉपी में लिखो।',
      tribalText: 'ᱵᱳᱨᱰ ᱨᱮ ᱚᱞ ᱟᱠᱟᱱ ᱟᱠᱷᱚᱨ ᱠᱚ ᱟᱯᱱᱟᱨᱟᱜ ᱠᱷᱟᱛᱟ ᱨᱮ ᱚᱞ ᱢᱮ᱾',
      devanagariTransliteration: 'बोर्ड रे ओल आकान आखोर को आपणाराग खाता रे ओल मे।',
      phoneticPronunciation: 'Bord re ol akan akhor ko apnarag khata re ol me.',
      language: TribalLanguage.santhali,
      category: 'Writing Exercise',
      confidence: 0.979,
      latencySeconds: 0.94,
      audioWaveform: [0.4, 0.8, 0.6, 0.9, 0.5, 0.7, 0.8, 0.4, 0.3, 0.1],
      durationSeconds: 3.5,
      timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
    ),
    TranslationEntry(
      id: 'trans_4',
      hindiText: 'बहुत अच्छा! आप सबने बहुत सुंदर चित्र बनाया है।',
      tribalText: 'ᱟᱹᱰᱤ ᱵᱷᱟᱹᱜᱤ! ᱟᱯᱮ ᱡᱚᱛᱚ ᱦᱚᱲ ᱟᱹᱰᱤ ᱪᱚᱨᱚᱠ ᱪᱤᱛᱟᱹᱨ ᱯᱮ ᱵᱮᱱᱟᱣ ᱠᱮᱫᱟ᱾',
      devanagariTransliteration: 'आ़डी़ भा़गी! आपे जोतो होड़ आ़डी़ चोरोक चीता़र पे बेनाव केदा।',
      phoneticPronunciation: 'Aḍi bhạgi! Ape joto hoṛ aḍi chorok chitạr pe benao keda.',
      language: TribalLanguage.santhali,
      category: 'Encouragement',
      confidence: 0.995,
      latencySeconds: 0.78,
      audioWaveform: [0.2, 0.6, 0.9, 0.8, 0.9, 0.7, 0.5, 0.3, 0.2, 0.1],
      durationSeconds: 3.1,
      timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
    ),
    TranslationEntry(
      id: 'trans_5',
      hindiText: 'पंक्ति में सीधे खड़े हो जाओ और हाथ जोड़ो।',
      tribalText: 'ᱫᱷᱟᱹᱲ ᱨᱮ ᱥᱚᱡᱷᱮ ᱛᱤᱸᱜᱩᱱ ᱯᱮ ᱟᱨ ᱛᱤ ᱡᱚᱲᱟᱣ ᱯᱮ᱾',
      devanagariTransliteration: 'धा़ड़ रे सोज्हे तींगुन पे आर ती जोड़ाव पे।',
      phoneticPronunciation: 'Dhạṛ re sojhe tiṅgun pe ar ti joṛao pe.',
      language: TribalLanguage.santhali,
      category: 'Morning Assembly',
      confidence: 0.984,
      latencySeconds: 1.05,
      audioWaveform: [0.3, 0.7, 0.5, 0.8, 0.6, 0.9, 0.4, 0.3, 0.2, 0.1],
      durationSeconds: 2.6,
      timestamp: DateTime.now().subtract(const Duration(minutes: 35)),
    ),
  ];

  // Quick Classroom Preset Prompts
  static final List<Map<String, dynamic>> presetTeacherPrompts = [
    {
      'hindi': 'सभी बच्चे अपनी जगह पर बैठ जाएं।',
      'category': 'Management',
      'icon': Icons.airline_seat_recline_normal_rounded,
    },
    {
      'hindi': 'गणित की पुस्तक पृष्ठ संख्या 12 खोलें।',
      'category': 'FLN Numeracy',
      'icon': Icons.menu_book_rounded,
    },
    {
      'hindi': 'आज हम सब एक मजेदार कहानी सुनेंगे।',
      'category': 'Oral Story',
      'icon': Icons.auto_stories_rounded,
    },
    {
      'hindi': 'बहुत अच्छा! आप सबने बहुत सुंदर काम किया।',
      'category': 'Appreciation',
      'icon': Icons.stars_rounded,
    },
    {
      'hindi': 'पंक्ति में सीधे खड़े हो जाओ और हाथ जोड़ो।',
      'category': 'Assembly',
      'icon': Icons.groups_rounded,
    },
    {
      'hindi': 'मेरे पीछे-पीछे बोलो और दोहराओ।',
      'category': 'Repetition',
      'icon': Icons.record_voice_over_rounded,
    },
    {
      'hindi': 'किस-किस बच्चे ने गृहकार्य पूरा किया है?',
      'category': 'Homework',
      'icon': Icons.fact_check_rounded,
    },
    {
      'hindi': 'चित्र देखकर बताओ इसमें क्या-क्या दिख रहा है?',
      'category': 'Visual FLN',
      'icon': Icons.image_search_rounded,
    },
  ];

  // Translation Database for Santhali, Ho, and Mundari
  static TranslationEntry generateTranslation(String hindiQuery, TribalLanguage language) {
    // Check known variations or intelligently map
    final clean = hindiQuery.trim();
    
    // Santhali Dictionary Maps
    if (language == TribalLanguage.santhali) {
      if (clean.contains('बैठ') || clean.contains('जगह')) {
        return TranslationEntry(
          id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
          hindiText: clean,
          tribalText: 'ᱡᱚᱛᱚ ᱜᱤᱫᱽᱨᱟᱹ ᱟᱯᱱᱟᱨᱟᱜ ᱴᱷᱟᱶᱨᱮ ᱫᱩᱲᱩᱵ ᱯᱮ᱾',
          devanagariTransliteration: 'जोतो गिदराण आपणाराग ठांवरे दुड़ुब पे।',
          phoneticPronunciation: 'Joto gidrạ apnarag ṭhaō̃re duṛub pe.',
          language: language,
          category: 'Classroom Management',
          confidence: 0.994,
          latencySeconds: 0.92,
          audioWaveform: [0.3, 0.6, 0.8, 0.7, 0.9, 0.5, 0.6, 0.4, 0.2],
          timestamp: DateTime.now(),
        );
      } else if (clean.contains('गणित') || clean.contains('संख्या') || clean.contains('पृष्ठ')) {
        return TranslationEntry(
          id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
          hindiText: clean,
          tribalText: 'ᱞᱮᱠᱷᱟ ᱯᱩᱛᱷᱤ ᱨᱮᱭᱟᱜ ᱜᱮᱞᱵᱟᱨ ᱥᱟᱦᱴᱟ ᱡᱷᱤᱡᱽ ᱯᱮ᱾',
          devanagariTransliteration: 'लेखा पुथी रेयाग गेलबार साहटा झीज पे।',
          phoneticPronunciation: 'Lekha puthi reyag gelbar sahṭa jhij pe.',
          language: language,
          category: 'FLN Numeracy',
          confidence: 0.987,
          latencySeconds: 1.15,
          audioWaveform: [0.2, 0.5, 0.8, 0.9, 0.7, 0.4, 0.8, 0.3, 0.1],
          timestamp: DateTime.now(),
        );
      } else if (clean.contains('कहानी') || clean.contains('सुन')) {
        return TranslationEntry(
          id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
          hindiText: clean,
          tribalText: 'ᱛᱮᱦᱮᱧ ᱫᱚ ᱟᱵᱚ ᱢᱤᱫᱴᱟᱝ ᱨᱟᱹᱥᱠᱟᱹ ᱠᱟᱹᱦᱱᱤ ᱵᱚᱱ ᱟᱸᱡᱚᱢᱟ᱾',
          devanagariTransliteration: 'तेहेञ दो आबो मिदटांग ऱा़स्का़ का़हनी बोन आंजोमा।',
          phoneticPronunciation: 'Teheñ do abo midṭang rạskạ kạhni bon añjoma.',
          language: language,
          category: 'Oral Storytelling',
          confidence: 0.991,
          latencySeconds: 0.84,
          audioWaveform: [0.4, 0.7, 0.9, 0.6, 0.8, 0.5, 0.7, 0.3, 0.2],
          timestamp: DateTime.now(),
        );
      } else if (clean.contains('अच्छा') || clean.contains('सुंदर') || clean.contains('शाबाश')) {
        return TranslationEntry(
          id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
          hindiText: clean,
          tribalText: 'ᱟᱹᱰᱤ ᱵᱷᱟᱹᱜᱤ! ᱟᱯᱮ ᱡᱚᱛᱚ ᱦᱚᱲ ᱟᱹᱰᱤ ᱪᱚᱨᱚᱠ ᱠᱟᱹᱢᱤ ᱠᱮᱫᱟ᱾',
          devanagariTransliteration: 'आ़डी़ भा़गी! आपे जोतो होड़ आ़डी़ चोरोक का़मी केदा।',
          phoneticPronunciation: 'Aḍi bhạgi! Ape joto hoṛ aḍi chorok kạmi keda.',
          language: language,
          category: 'Appreciation',
          confidence: 0.996,
          latencySeconds: 0.74,
          audioWaveform: [0.3, 0.8, 0.9, 0.7, 0.9, 0.6, 0.4, 0.2],
          timestamp: DateTime.now(),
        );
      } else if (clean.contains('खड़े') || clean.contains('पंक्ति') || clean.contains('हाथ')) {
        return TranslationEntry(
          id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
          hindiText: clean,
          tribalText: 'ᱫᱷᱟᱹᱲ ᱨᱮ ᱥᱚᱡᱷᱮ ᱛᱤᱸᱜᱩᱱ ᱯᱮ ᱟᱨ ᱛᱤ ᱡᱚᱲᱟᱣ ᱯᱮ᱾',
          devanagariTransliteration: 'धा़ड़ रे सोज्हे तींगुन पे आर ती जोड़ाव पे।',
          phoneticPronunciation: 'Dhạṛ re sojhe tiṅgun pe ar ti joṛao pe.',
          language: language,
          category: 'Assembly Discipline',
          confidence: 0.985,
          latencySeconds: 1.02,
          audioWaveform: [0.2, 0.6, 0.8, 0.7, 0.5, 0.4, 0.2],
          timestamp: DateTime.now(),
        );
      } else if (clean.contains('दोहराओ') || clean.contains('पीछे')) {
        return TranslationEntry(
          id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
          hindiText: clean,
          tribalText: 'ᱤᱧᱟᱜ ᱛᱟᱭᱚᱢ-ᱛᱟᱭᱚᱢ ᱛᱮ ᱢᱮᱱ ᱯᱮ ᱟᱨ ᱫᱚᱦᱲᱟᱭ ᱯᱮ᱾',
          devanagariTransliteration: 'इञाग तायोम-तायोम ते मेन पे आर दोहड़ाय पे।',
          phoneticPronunciation: 'Iñag tayom-tayom te men pe ar dohṛay pe.',
          language: language,
          category: 'Phonetic Drill',
          confidence: 0.989,
          latencySeconds: 0.89,
          audioWaveform: [0.3, 0.7, 0.8, 0.6, 0.7, 0.4, 0.3],
          timestamp: DateTime.now(),
        );
      } else {
        // Fallback realistic synthesis in Santhali
        return TranslationEntry(
          id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
          hindiText: clean,
          tribalText: 'ᱟᱞᱮ ᱥᱟᱱᱛᱟᱲᱤ ᱛᱮ ᱱᱚᱣᱟ ᱠᱟᱛᱷᱟ ᱵᱚᱱ ᱪᱮᱫᱚᱜᱼᱟ᱾',
          devanagariTransliteration: 'आले संथाली ते नोवा काथा बोन चेदोग-आ।',
          phoneticPronunciation: 'Ale santhali te nowa katha bon chedôg-a.',
          language: language,
          category: 'Classroom Instruction',
          confidence: 0.978,
          latencySeconds: 1.28,
          audioWaveform: [0.2, 0.6, 0.8, 0.5, 0.7, 0.3, 0.2],
          timestamp: DateTime.now(),
        );
      }
    } else if (language == TribalLanguage.ho) {
      // Ho Language (West Singhbhum)
      return TranslationEntry(
        id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
        hindiText: clean,
        tribalText: 'सबिन होंको अकोअः ठांइरे दुबुङपे आर पुथी उताइपे।',
        devanagariTransliteration: 'सबिन होंको अकोअः ठांइरे दुबुङपे आर पुथी उताइपे।',
        phoneticPronunciation: 'Sabin honko akoah thayire dubungpe ar puthi utaipe.',
        language: language,
        category: 'Classroom Command (Ho)',
        confidence: 0.981,
        latencySeconds: 1.08,
        audioWaveform: [0.3, 0.7, 0.9, 0.6, 0.8, 0.4, 0.2],
        timestamp: DateTime.now(),
      );
    } else {
      // Mundari Language (Khunti / Ranchi)
      return TranslationEntry(
        id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
        hindiText: clean,
        tribalText: 'सोबेन हुनको आपन-आपन ठावरे दुबपे आर पोथी निड़पे।',
        devanagariTransliteration: 'सोबेन हुनको आपन-आपन ठावरे दुबपे आर पोथी निड़पे।',
        phoneticPronunciation: 'Soben hunko apan-apan thaware dubpe ar pothi nirpe.',
        language: language,
        category: 'Classroom Command (Mundari)',
        confidence: 0.983,
        latencySeconds: 1.14,
        audioWaveform: [0.2, 0.8, 0.7, 0.9, 0.5, 0.3, 0.1],
        timestamp: DateTime.now(),
      );
    }
  }

  // NIPUN Dual-Language Flashcard Collection
  static final List<FlashcardItem> flashcards = [
    // Numeracy - Balvatika & Class 1
    const FlashcardItem(
      id: 'fc_num_1',
      grade: FLNGrade.balvatika,
      competency: FLNCompetency.numeracy,
      category: 'Numbers & Counting',
      hindiWord: 'एक (१)',
      hindiContext: 'एक सेब / एक सूर्य',
      tribalWord: 'ᱢᱤᱫ (᱑)',
      tribalDevanagari: 'मिद (१)',
      phoneticGuide: 'Mid',
      englishMeaning: 'One',
      visualIcon: Icons.looks_one_rounded,
      cardTint: Color(0xFF00F5A0),
      exampleSentenceHindi: 'आसमान में एक सूरज चमक रहा है।',
      exampleSentenceTribal: 'ᱥᱮᱨᱢᱟ ᱨᱮ ᱢᱤᱫᱴᱟᱝ ᱵᱮᱞᱟ ᱡᱩᱞᱩᱜ ᱠᱟᱱᱟ᱾',
    ),
    const FlashcardItem(
      id: 'fc_num_2',
      grade: FLNGrade.balvatika,
      competency: FLNCompetency.numeracy,
      category: 'Numbers & Counting',
      hindiWord: 'दो (२)',
      hindiContext: 'दो आंखें / दो पक्षी',
      tribalWord: 'ᱵᱟᱨ (᱒)',
      tribalDevanagari: 'बार (२)',
      phoneticGuide: 'Bar',
      englishMeaning: 'Two',
      visualIcon: Icons.looks_two_rounded,
      cardTint: Color(0xFF00D2FF),
      exampleSentenceHindi: 'हमारे दो हाथ और दो पैर हैं।',
      exampleSentenceTribal: 'ᱟᱵᱚᱣᱟᱜ ᱵᱟᱨᱭᱟ ᱛᱤ ᱟᱨ ᱵᱟᱨᱭᱟ ᱡᱟᱸᱜᱟ ᱢᱮᱱᱟᱜᱼᱟ᱾',
    ),
    const FlashcardItem(
      id: 'fc_num_3',
      grade: FLNGrade.class1,
      competency: FLNCompetency.numeracy,
      category: 'Numbers & Counting',
      hindiWord: 'तीन (३)',
      hindiContext: 'तीन पहिये / तीन रंग',
      tribalWord: 'ᱯᱮ (᱓)',
      tribalDevanagari: 'पे (३)',
      phoneticGuide: 'Pé',
      englishMeaning: 'Three',
      visualIcon: Icons.looks_3_rounded,
      cardTint: Color(0xFFFFB703),
      exampleSentenceHindi: 'रिक्शा में तीन पहिये होते हैं।',
      exampleSentenceTribal: 'ᱨᱤᱠᱥᱟ ᱨᱮ ᱯᱮᱭᱟ ᱪᱟᱠᱟ ᱛᱟᱦᱮᱸᱱᱟ᱾',
    ),
    const FlashcardItem(
      id: 'fc_num_5',
      grade: FLNGrade.class1,
      competency: FLNCompetency.numeracy,
      category: 'Numbers & Counting',
      hindiWord: 'पाँच (५)',
      hindiContext: 'पाँच उंगलियां',
      tribalWord: 'ᱢᱚᱬᱮ (᱕)',
      tribalDevanagari: 'मोणे (५)',
      phoneticGuide: 'Mõṛē',
      englishMeaning: 'Five',
      visualIcon: Icons.looks_5_rounded,
      cardTint: Color(0xFF8B5CF6),
      exampleSentenceHindi: 'एक हाथ में पाँच उंगलियां होती हैं।',
      exampleSentenceTribal: 'ᱢᱤᱫ ᱛᱤ ᱨᱮ ᱢᱚᱬᱮ ᱜᱚᱴᱟᱝ ᱠᱟᱹᱴᱩᱵ ᱛᱟᱦᱮᱸᱱᱟ᱾',
    ),

    // Picture Vocabulary - Nature & Animals
    const FlashcardItem(
      id: 'fc_voc_1',
      grade: FLNGrade.balvatika,
      competency: FLNCompetency.vocabulary,
      category: 'Animals & Birds',
      hindiWord: 'हाथी',
      hindiContext: 'बड़ा जंगली जानवर',
      tribalWord: 'ᱦᱟᱹᱛᱤ',
      tribalDevanagari: 'हा़ती',
      phoneticGuide: 'Hạti',
      englishMeaning: 'Elephant',
      visualIcon: Icons.pets_rounded,
      cardTint: Color(0xFF10B981),
      exampleSentenceHindi: 'हाथी जंगल का सबसे बड़ा जानवर है।',
      exampleSentenceTribal: 'ᱦᱟᱹᱛᱤ ᱫᱚ ᱵᱤᱨ ᱨᱤᱱᱤᱡ ᱡᱚᱛᱚ ᱠᱷᱚᱱ ᱢᱟᱨᱟᱝ ᱡᱤᱭᱟᱹᱞᱤ ᱠᱟᱱᱟᱭ᱾',
    ),
    const FlashcardItem(
      id: 'fc_voc_2',
      grade: FLNGrade.class1,
      competency: FLNCompetency.vocabulary,
      category: 'Nature & Plants',
      hindiWord: 'पेड़',
      hindiContext: 'हरा भरा विशाल वृक्ष',
      tribalWord: 'ᱫᱟᱨᱮ',
      tribalDevanagari: 'दारे',
      phoneticGuide: 'Dare',
      englishMeaning: 'Tree',
      visualIcon: Icons.park_rounded,
      cardTint: Color(0xFF06D6A0),
      exampleSentenceHindi: 'पेड़ हमें मीठे फल और छाया देते हैं।',
      exampleSentenceTribal: 'ᱫᱟᱨᱮ ᱫᱚ ᱟᱵᱚ ᱦᱮᱲᱮᱢ ᱡᱚ ᱟᱨ ᱩᱢᱩᱞ ᱮ ᱮᱢᱟᱵᱚᱱᱟ᱾',
    ),
    const FlashcardItem(
      id: 'fc_voc_3',
      grade: FLNGrade.class2,
      competency: FLNCompetency.vocabulary,
      category: 'Water & Environment',
      hindiWord: 'पानी / जल',
      hindiContext: 'जीवनदायिनी नदी और वर्षा',
      tribalWord: 'ᱫᱟᱜ',
      tribalDevanagari: 'दाग',
      phoneticGuide: 'Dāg',
      englishMeaning: 'Water',
      visualIcon: Icons.water_drop_rounded,
      cardTint: Color(0xFF00D2FF),
      exampleSentenceHindi: 'साफ पानी पीना स्वास्थ्य के लिए जरूरी है।',
      exampleSentenceTribal: 'ᱥᱟᱯᱷᱟ ᱫᱟᱜ ᱧᱩ ᱫᱚ ᱦᱚᱲᱢᱚ ᱞᱟᱹᱜᱤᱫ ᱟᱹᱰᱤ ᱡᱟᱹᱨᱩᱲ ᱠᱟᱱᱟ᱾',
    ),

    // Oral Expression & Human Body
    const FlashcardItem(
      id: 'fc_oral_1',
      grade: FLNGrade.balvatika,
      competency: FLNCompetency.oralLanguage,
      category: 'Body Parts',
      hindiWord: 'आंख',
      hindiContext: 'देखने का अंग',
      tribalWord: 'ᱢᱮᱫ',
      tribalDevanagari: 'मेद',
      phoneticGuide: 'Mēd',
      englishMeaning: 'Eye',
      visualIcon: Icons.visibility_rounded,
      cardTint: Color(0xFFEC4899),
      exampleSentenceHindi: 'हम अपनी आँखों से दुनिया देखते हैं।',
      exampleSentenceTribal: 'ᱟᱵᱚ ᱫᱚ ᱟᱵᱚᱣᱟᱜ ᱢᱮᱫ ᱛᱮ ᱫᱷᱟᱹᱨᱛᱤ ᱵᱚᱱ ᱧᱮᱞᱟ᱾',
    ),
    const FlashcardItem(
      id: 'fc_oral_2',
      grade: FLNGrade.class2,
      competency: FLNCompetency.oralLanguage,
      category: 'Body Parts',
      hindiWord: 'हाथ',
      hindiContext: 'काम करने और लिखने का अंग',
      tribalWord: 'ᱛᱤ',
      tribalDevanagari: 'ती',
      phoneticGuide: 'Tī',
      englishMeaning: 'Hand',
      visualIcon: Icons.pan_tool_rounded,
      cardTint: Color(0xFFFF5964),
      exampleSentenceHindi: 'खाना खाने से पहले हाथ साबुन से धोएं।',
      exampleSentenceTribal: 'ᱫᱟᱠᱟ ᱡᱚᱢ ᱢᱟᱬᱟᱝ ᱨᱮ ᱛᱤ ᱥᱟᱵᱚᱱ ᱛᱮ ᱟᱹᱨᱩᱵ ᱯᱮ᱾',
    ),
  ];

  // Pre-Generated Printable Bilingual Worksheets
  static final List<WorksheetItem> sampleWorksheets = [
    const WorksheetItem(
      id: 'ws_fln_1',
      title: 'NIPUN FLN: गिनती और चित्र मिलान (Numeracy Match)',
      grade: FLNGrade.balvatika,
      competency: FLNCompetency.numeracy,
      learningOutcomeCode: 'M-BV-01',
      instructionHindi: 'बाईं ओर दी गई संख्या को सही संथाली (ओल चिकी) शब्द और चित्र से मिलान करें।',
      instructionTribal: 'ᱮᱸᱜᱟ ᱯᱟᱦᱴᱟ ᱨᱮᱭᱟᱜ ᱞᱮᱠᱷᱟ ᱥᱟᱶ ᱡᱚᱛᱷᱟᱛ ᱪᱤᱛᱟᱹᱨ ᱟᱨ ᱥᱟᱱᱛᱟᱲᱤ ᱟᱹᱲᱟᱹ ᱡᱚᱲᱟᱣ ᱢᱮ᱾',
      pairs: [
        WorksheetMatchingPair(
          hindiItem: '१ (एक)',
          tribalScript: '᱑ - ᱢᱤᱫ',
          tribalDevanagari: '१ - मिद',
          icon: Icons.wb_sunny_rounded,
        ),
        WorksheetMatchingPair(
          hindiItem: '२ (दो)',
          tribalScript: '᱒ - ᱵᱟᱨ',
          tribalDevanagari: '२ - बार',
          icon: Icons.visibility_rounded,
        ),
        WorksheetMatchingPair(
          hindiItem: '३ (तीन)',
          tribalScript: '᱓ - ᱯᱮ',
          tribalDevanagari: '३ - पे',
          icon: Icons.change_history_rounded,
        ),
        WorksheetMatchingPair(
          hindiItem: '५ (पाँच)',
          tribalScript: '᱕ - ᱢᱚᱬᱮ',
          tribalDevanagari: '५ - मोणे',
          icon: Icons.pan_tool_rounded,
        ),
      ],
      tracingWords: ['ᱢᱤᱫ', 'ᱵᱟᱨ', 'ᱯᱮ', 'ᱢᱚᱬᱮ'],
      generatedTime: 'Auto-Compiled: FLN Week 3 Module',
    ),
    const WorksheetItem(
      id: 'ws_fln_2',
      title: 'NIPUN FLN: प्रकृति और पशु शब्दावली (Nature Vocabulary)',
      grade: FLNGrade.class1,
      competency: FLNCompetency.vocabulary,
      learningOutcomeCode: 'L-C1-04',
      instructionHindi: 'चित्र पहचानकर संथाली (ओल चिकी) नाम के ऊपर पेंसिल घुमाएं और हिंदी अर्थ लिखें।',
      instructionTribal: 'ᱪᱤᱛᱟᱹᱨ ᱩᱨᱩᱢ ᱠᱟᱛᱮ ᱥᱟᱱᱛᱟᱲᱤ (ᱚᱞ ᱪᱤᱠᱤ) ᱧᱩᱛᱩᱢ ᱪᱮᱛᱟᱱ ᱨᱮ ᱚᱞ ᱯᱮ᱾',
      pairs: [
        WorksheetMatchingPair(
          hindiItem: 'पेड़ (वृक्ष)',
          tribalScript: 'ᱫᱟᱨᱮ',
          tribalDevanagari: 'दारे',
          icon: Icons.park_rounded,
        ),
        WorksheetMatchingPair(
          hindiItem: 'जल (पानी)',
          tribalScript: 'ᱫᱟᱜ',
          tribalDevanagari: 'दाग',
          icon: Icons.water_drop_rounded,
        ),
        WorksheetMatchingPair(
          hindiItem: 'हाथी (गज)',
          tribalScript: 'ᱦᱟᱹᱛᱤ',
          tribalDevanagari: 'हा़ती',
          icon: Icons.pets_rounded,
        ),
      ],
      tracingWords: ['ᱫᱟᱨᱮ', 'ᱫᱟᱜ', 'ᱦᱟᱹᱛᱤ'],
      generatedTime: 'Auto-Compiled: FLN Week 5 Module',
    ),
  ];

  // Curriculum Lesson Plans (NIPUN Bharat Week 1 - 4)
  static final List<CurriculumLesson> curriculumLessons = [
    const CurriculumLesson(
      id: 'curr_w1',
      weekNumber: 1,
      theme: 'हमारा विद्यालय और नए मित्र (Our School & Friends)',
      grade: FLNGrade.balvatika,
      subject: 'मौखिक भाषा विकास (Oral Expression)',
      learningOutcome: 'विद्यार्थी शिक्षक के अभिवादन और सरल निर्देशों को समझकर मातृभाषा में प्रतिक्रिया दे सकें।',
      summaryHindi: 'कक्षा में आत्मीय वातावरण बनाना और बच्चों को बिना झिझक बोलने के लिए प्रेरित करना।',
      summaryTribal: 'ᱠᱞᱟᱥ ᱨᱮ ᱨᱟᱹᱥᱠᱟᱹ ᱦᱚᱭ-ᱦᱤᱥᱤᱫ ᱵᱮᱱᱟᱣ ᱟᱨ ᱜᱤᱫᱽᱨᱟᱹ ᱠᱚ ᱱᱟᱯᱟᱭ ᱛᱮ ᱨᱚᱲ ᱞᱟᱹᱜᱤᱫ ᱩᱫᱽᱜᱟᱹᱣ᱾',
      dialogueSteps: [
        CurriculumDialogueStep(
          stepTitle: '१. सुबह का अभिवादन (Morning Greeting)',
          teacherHindi: 'सुप्रभात बच्चों! आप सब कैसे हैं?',
          tribalOlChiki: 'ᱡᱚᱦᱟᱨ ᱜᱤᱫᱽᱨᱟᱹ ᱠᱚ! ᱟᱯᱮ ᱪᱮᱫ ᱞᱮᱠᱟ ᱢᱮᱱᱟᱜ ᱯᱮᱭᱟ?',
          tribalDevanagari: 'जोहार गिदरा़ को! आपे चेद लेका मेनाग पेया?',
          studentExpectedResponse: 'ᱡᱚᱦᱟᱨ ᱜᱩᱨᱩ ᱜᱚᱢᱠᱮ! ᱟᱞᱮ ᱱᱟᱯᱟᱭ ᱜᱮ ᱢᱮᱱᱟᱜ ᱞᱮᱭᱟ᱾ (जोहार गुरु गोमके! आले नापाय गे मेनाग लेया।)',
        ),
        CurriculumDialogueStep(
          stepTitle: '२. बैठने का निर्देश (Sitting Arrangement)',
          teacherHindi: 'सभी बच्चे गोल घेरा बनाकर बैठ जाएं।',
          tribalOlChiki: 'ᱡᱚᱛᱚ ᱜᱤᱫᱽᱨᱟᱹ ᱜᱩᱞᱟᱹᱭ ᱠᱟᱛᱮ ᱫᱩᱲᱩᱵ ᱯᱮ᱾',
          tribalDevanagari: 'जोतो गिदरा़ गुला़य काते दुड़ुब पे।',
          studentExpectedResponse: '[बच्चे गोल घेरे में बैठते हैं]',
        ),
      ],
    ),
    const CurriculumLesson(
      id: 'curr_w2',
      weekNumber: 2,
      theme: 'संख्या बोध १ से ५ (Counting 1 to 5 with Objects)',
      grade: FLNGrade.class1,
      subject: 'प्रारंभिक संख्यात्मकता (FLN Numeracy)',
      learningOutcome: 'विद्यार्थी कंकड़, पत्तियों और उंगलियों की मदद से १ से ५ तक की गिनती मातृभाषा में गिन सकें।',
      summaryHindi: 'स्थानीय परिवेश की वस्तुओं से मूर्त रूप में संख्या ज्ञान देना।',
      summaryTribal: 'ᱟᱛᱳ-ᱴᱚᱞᱟ ᱨᱮᱭᱟᱜ ᱡᱤᱱᱤᱥ (ᱫᱷᱤᱨᱤ, ᱥᱟᱠᱟᱢ) ᱛᱮ ᱞᱮᱠᱷᱟ ᱪᱮᱫᱚᱜ ᱠᱟᱹᱢᱤ᱾',
      dialogueSteps: [
        CurriculumDialogueStep(
          stepTitle: '१. उंगलियों से गिनना (Counting with Fingers)',
          teacherHindi: 'अपने हाथ की उंगलियां मेरे साथ गिनो: एक, दो, तीन!',
          tribalOlChiki: 'ᱟᱯᱱᱟᱨ ᱛᱤ ᱨᱮᱭᱟᱜ ᱠᱟᱹᱴᱩᱵ ᱤᱧ ᱥᱟᱶ ᱞᱮᱠᱷᱟᱭ ᱯᱮ: ᱢᱤᱫ, ᱵᱟᱨ, ᱯᱮ!',
          tribalDevanagari: 'आपणार ती रेयाग का़टुब इञ सांव लेखाय पे: मिद, बार, पे!',
          studentExpectedResponse: 'ᱢᱤᱫ, ᱵᱟᱨ, ᱯᱮ, ᱯᱩᱱ, ᱢᱚᱬᱮ! (मिद, बार, पे, पुन, मोणे!)',
        ),
        CurriculumDialogueStep(
          stepTitle: '२. कंकड़ गतिविधि (Pebble Activity)',
          teacherHindi: 'यहाँ मेज पर ३ कंकड़ रखो।',
          tribalOlChiki: 'ᱱᱚᱸᱰᱮ ᱴᱮᱵᱩᱞ ᱨᱮ ᱯᱮᱭᱟ ᱫᱷᱤᱨᱤ ᱫᱚᱦᱚᱭ ᱯᱮ᱾',
          tribalDevanagari: 'नोंडे टेबल रे पेया धीरी दोहोय पे।',
          studentExpectedResponse: '[बच्चे ३ कंकड़ मेज पर रखते हैं]',
        ),
      ],
    ),
  ];
}
