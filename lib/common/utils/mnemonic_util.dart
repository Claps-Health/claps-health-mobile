import 'package:app/common/index.dart';
import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:convert/convert.dart';

String generateMnemonicSentence() {
  Mnemonic mnemonic = Mnemonic.generate(
    Language.english,
    entropyLength:
        128, // 128 => 12 words, 160 => 15 words, 192 => 18 words, 224 => 21 words, 256 => 24 words
  );
  return mnemonic.sentence;
}

String generateSentenceFromEntropy(String hexEntropy) {
  List<int> bytesEntropy = hex.decode(hexEntropy);
  Mnemonic mnemonicFromEntropy = Mnemonic(bytesEntropy, Language.english);
  // Console.log(mnemonicFromEntropy.sentence);
  return mnemonicFromEntropy.sentence;
}

Mnemonic? getMnemonicFromSentence(String sentence) {
  // Constructs a Mnemonic from Sentence/Phrase
  Mnemonic? mnemonicFromSentence;

  try {
    mnemonicFromSentence = Mnemonic.fromSentence(sentence, Language.english);
  } catch (e) {
    Console.log(e);
  }

  // Console.log(hex.encode(mnemonicFromSentence.seed));
  return mnemonicFromSentence;
}

bool checkWordIsBIP39Compatible(String word) {
  return Language.english.isValid(word);
}

// NFKD word formatting is mandatory in BIP39,
// please take care: https://github.com/flutter/flutter/issues/104927#issuecomment-1141140735
