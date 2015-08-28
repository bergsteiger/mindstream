// CommonLang.ms.tpl
// Шаблоны генерации для "общепринятых языков"

USES
 Documentation.ms.dict
 params.ms.dict
 NoStrangeSymbols.ms.dict
 arrays.ms.dict
 ElementsRTTI.ms.dict
 Generation.ms.dict
 string.ms.dict
;

STRING FUNCTION CatSepIndent>
 ARRAY right aValues
 CatSep> cIndentChar aValues =: Result
; // CatSepIndent>

elem_generator DumpAsIs
 %SUMMARY 'Процедура печатающая содержимое элемента модели. Рекурсивно.' ;

 CatSepIndent>
 [
   Self .Stereotypes .reverted> ==> .Name
   %REMARK 'Выводим стереотип элемента, рекурсивно'
  Self .Name 
   %REMARK 'Выводим имя элемента'
 ] OutToFile

 'Родители ' (+)? 
  CatSepIndent> ( Self .Parents .reverted> .map> .Name ) ?OutToFile

 'Наследуемые ' (+)? 
  CatSepIndent> ( Self .Inherited .map> .Name ) ?OutToFile

 'Реализуемые ' (+)? 
  CatSepIndent> ( Self .Implements .map> .Name ) ?OutToFile

  Self .generate.children
  %REMARK 'Выводим детей элемента, тем же самым генератором'
  [ '; // ' Self .Name ] OutToFile
  %REMARK 'Выводим закрывающую скобку элемента'
; // DumpAsIs

elem_generator dump
 %SUMMARY 'Генератор выводящий дамп элемента модели.' ;
 %GEN_PROPERTY Name 'dump'
 %REMARK 'Имя генератора и расширение файла целевого языка. Потом мы сделаем так, чтобы они могли не совпадать'
 %INHERITS  @ .DumpAsIs ;

 @SELF .Inherited ==> ( Self SWAP DO )
; // dump

elem_generator pas
 %SUMMARY 'Генератор выводящий элементы модели в Паскаль.' ;
 %GEN_PROPERTY Name 'pas'
 %REMARK 'Имя генератора и расширение файла целевого языка. Потом мы сделаем так, чтобы они могли не совпадать'

 Self .DumpAsIs
 %REMARK 'Пока выводим всё "как есть", без трансформации в целевой язык'
; // pas

elem_generator script
 %SUMMARY 'Генератор выводящий элементы модели в ms.script.' ;
 %GEN_PROPERTY Name 'ms.script'
 %REMARK 'Имя генератора и расширение файла целевого языка. Потом мы сделаем так, чтобы они могли не совпадать'

 Self .DumpAsIs
 %REMARK 'Пока выводим всё "как есть", без трансформации в целевой язык'
; // script

elem_generator c++
 %SUMMARY '
 Генератор выводящий элементы модели в c++. 
 Про файлы *.h мы потом поговорим отдельно.
 ' ;
 %GEN_PROPERTY Name 'cpp'
 %REMARK 'Имя генератора и расширение файла целевого языка. Потом мы сделаем так, чтобы они могли не совпадать'

 Self .DumpAsIs
 %REMARK 'Пока выводим всё "как есть", без трансформации в целевой язык'
; // c++

elem_generator h
 %SUMMARY '
 Генератор выводящий элементы модели в *.h. 
 Про файлы *.h мы потом поговорим отдельно.
 ' ;
 %GEN_PROPERTY Name 'h'
 %REMARK 'Имя генератора и расширение файла целевого языка. Потом мы сделаем так, чтобы они могли не совпадать'

 Self .DumpAsIs
 %REMARK 'Пока выводим всё "как есть", без трансформации в целевой язык'
; // h
