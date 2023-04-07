import 'dart:io';
import 'package:image/image.dart' as img;

void main() {
  final dir = Directory('./images');
  final files = dir.listSync();
  for (var file in files) {
    final fileFullName = file.path.split(Platform.pathSeparator).last;
    final fileName = fileFullName.split('.').first;
    print(fileName);

    img.Command()
      ..decodeWebPFile(file.path)
      ..encodePng()
      ..writeToFile('./converted/$fileName.png')
      ..executeThread();

    /*   final imageWebp = img.decodeWebP(File(file.path).readAsBytesSync());
    if (imageWebp != null) {
      final imagePng = img.encodePng(imageWebp);
      File('./convertidas/$fileName.png').writeAsBytesSync(imagePng);
    } */
  }
}


/**
 * ENG
 * Put the .webp images in the "images" directory, run main, the PNG 
 * images will be saved in the "converted" folder
 * 
 * PT/BR
 * Ponha as imagens .webp no diretorio "images", 
 * execute o main, as imagens PNG serão salvas na pasta "converted"
 */