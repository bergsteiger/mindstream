// CommonLang.ms.tpl
// Шаблоны генерации для "общепринятых языков"

USES
 Documentation.ms.dict
 NoStrangeSymbols.ms.dict
 arrays.ms.dict
 Generation.ms.dict
 string.ms.dict
;

elem_proc DumpAsIs
 %SUMMARY 'Процедура печатающая содержимое элемента модели. Рекурсивно.' ;

 CatSep> cIndentChar
 [
  g_CurrentGeneratorName ':'
   %REMARK 'Выводим имя текущего генератора. Для отладки' 
  for ( Self LIST %ST Reverted ) .Name
   %REMARK 'Выводим стереотип элемента, рекурсивно'
  Self .Name 
   %REMARK 'Выводим имя элемента'
 ] OutToFile

 'Родители ' (+)? 
  CatSep> cIndentChar [ for ( Self .Parents >reverted> ) .Name ] ?OutToFile

 'Наследуемые ' (+)? 
  CatSep> cIndentChar [ for ( Self .Inherited ) .Name ] ?OutToFile

 'Реализуемые ' (+)? 
  CatSep> cIndentChar [ for ( Self .Implements ) .Name ] ?OutToFile

 TRY
  Self .generate.children
  %REMARK 'Выводим детей элемента, тем же самым генератором'
 FINALLY
  [ '; // ' Self .Name ] OutToFile
  %REMARK 'Выводим закрывающую скобку элемента'
 END
; // DumpAsIs

elem_generator dump
 %SUMMARY 'Генератор выводящий дамп элемента модели.' ;
 %GEN_PROPERTY Name 'dump'
 %REMARK 'Имя генератора и расширение файла целевого языка. Потом мы сделаем так, чтобы они могли не совпадать'

 Self .DumpAsIs
 %REMARK 'Пока выводим всё "как есть", без трансформации в целевой язык'
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
