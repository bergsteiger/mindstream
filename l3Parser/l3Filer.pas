unit l3Filer;
{* Реализация компонента-обертки вокруг потока. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. c                 }
{ Модуль: l3Filer - функции виртуальной файловой системы}
{ Начат: 08.04.1997 18:33             }
{ $Id: l3Filer.pas,v 1.203 2015/10/09 14:48:40 kostitsin Exp $ }

// $Log: l3Filer.pas,v $
// Revision 1.203  2015/10/09 14:48:40  kostitsin
// {requestlink: 604917289 } - инициализируем неинициализированное
//
// Revision 1.202  2015/09/25 09:44:34  dinishev
// {Requestlink:607284377}
//
// Revision 1.201  2015/05/19 16:46:46  lulin
// - чистим код.
//
// Revision 1.200  2015/05/08 12:12:07  dinishev
// {Requestlink:598615356}. Поддержка чтения картинок с формулами.
//
// Revision 1.199  2015/02/26 12:18:26  fireton
// - более правильно корректируем размер буфера при его переполнении
//
// Revision 1.198  2015/01/30 09:51:08  dinishev
// {Requestlink:522781827}
//
// Revision 1.197  2014/10/27 15:50:35  lulin
// - вставляем затычку.
//
// Revision 1.196  2014/04/08 08:18:00  dinishev
// {Requestlink:526715670}
//
// Revision 1.195  2014/02/03 16:10:25  lulin
// - рефакторинг парсера.
//
// Revision 1.194  2013/12/27 10:50:31  lulin
// {RequestLink:509706011}
//
// Revision 1.193  2013/12/16 16:57:56  lulin
// {RequestLink:509088042}
//
// Revision 1.192  2013/12/11 13:49:59  morozov
// {RequestLink: 508445329}
//
// Revision 1.191  2013/07/10 16:29:35  lulin
// - чистим код.
//
// Revision 1.190  2013/06/06 11:03:32  dinishev
// Фактичски правки для {Requestlink:459284359}
//
// Revision 1.189  2013/05/17 16:03:54  voba
// - K:455105818
//
// Revision 1.188  2013/04/29 11:38:06  fireton
// - заменил Assert на Stack2Log (чтобы не прерывать процессы, которые обламываются по assert)
//
// Revision 1.187  2013/04/26 10:20:56  fireton
// - возвращаем Assert
//
// Revision 1.186  2013/04/26 06:13:11  fireton
// - откручиваем Assert
//
// Revision 1.185  2013/04/25 13:41:37  voba
// - вставил  Assert контролирующий попытку записи в закрытый поток
//
// Revision 1.184  2013/04/10 16:00:33  lulin
// - портируем.
//
// Revision 1.183  2013/04/10 13:59:30  lulin
// - портируем.
//
// Revision 1.182  2013/04/10 11:27:01  lulin
// - портируем.
// - и поправил ошибку с проездом по памяти.
//
// Revision 1.181  2013/04/08 18:10:29  lulin
// - пытаемся отладиться под XE.
//
// Revision 1.180  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.179  2013/03/28 16:13:50  lulin
// - портируем.
//
// Revision 1.178  2012/07/11 09:56:36  fireton
// - получаем размер через GetSize инкапсулированного элемента (чтобы избежать Seek)
//
// Revision 1.177  2012/03/02 11:14:52  lulin
// - работа с файлами.
// - работа с символами.
// - работа со строками с длинной.
// - доопределение методов внутри стереотипов/классов.
//
// Revision 1.176  2012/02/28 12:55:37  lulin
// {RequestLink:336664105}
//
// Revision 1.175  2012/01/27 14:48:17  lulin
// http://mdp.garant.ru/pages/viewpage.action?pageId=288786476&focusedCommentId=331187776#comment-331187776
//
// Revision 1.174  2011/12/28 11:13:02  lulin
// {RequestLink:325256237}
//
// Revision 1.173  2011/12/27 15:34:04  lulin
// {RequestLink:324571064}
// - обкладываем все возможные неудачные Seek ловушками try..except. Чтобы таки попытаться считать документ.
//
// Revision 1.172  2011/09/20 09:25:38  lulin
// - очищаем состояние Filer'а.
//
// Revision 1.171  2011/09/19 13:54:04  lulin
// - очищаем состояние Filer'а.
//
// Revision 1.170  2011/09/19 13:17:16  lulin
// - очищаем состояние Filer'а.
//
// Revision 1.169  2011/09/19 10:23:01  lulin
// - делаем Filer'ам возможность быть не компонентами и кешируемыми.
//
// Revision 1.168  2011/09/19 10:13:35  lulin
// - делаем Filer'ам возможность быть не компонентами и кешируемыми.
//
// Revision 1.166  2011/05/06 15:49:38  lulin
// - делаем "предложения".
//
// Revision 1.165  2010/12/08 19:04:29  lulin
// {RequestLink:228688602}.
// - закругляем край у строки ввода.
//
// Revision 1.164  2010/11/19 14:40:18  fireton
// - _Write и Writeln для Tl3WString
//
// Revision 1.163  2010/11/19 14:39:49  lulin
// {RequestLink:220202427}.
//
// Revision 1.162  2010/07/28 10:57:45  lulin
// {RequestLink:228691360}.
//
// Revision 1.161  2010/06/18 11:41:11  lulin
// {RequestLink:219119831}.
// - правим ошибку.
// - добавляем тест.
// - давим вывод в лог.
// - вставляем проверку на корректность длины результирующей строки.
//
// Revision 1.160  2010/06/16 11:49:13  narry
// - K217689968
//
// Revision 1.159  2010/03/18 14:15:46  lulin
// {RequestLink:197951943}.
//
// Revision 1.158  2009/12/25 14:23:52  lulin
// - избегаем магических чисел.
//
// Revision 1.157  2009/12/25 14:16:49  lulin
// - выкидываем старый код.
//
// Revision 1.156  2009/12/25 14:09:31  lulin
// {RequestLink:175964656}.
//
// Revision 1.155  2009/12/24 19:04:16  lulin
// - вставлен Assert.
//
// Revision 1.154  2009/12/24 15:04:09  lulin
// {RequestLink:175540286}.
//
// Revision 1.153  2009/12/17 10:28:34  lulin
// - закомментировал устаревший метод.
//
// Revision 1.152  2009/12/17 10:15:42  lulin
// {RequestLink:174293230}. Не обрабатывали Юникод.
//
// Revision 1.151  2009/12/16 15:30:15  lulin
// - правильнее вычисляем конец файла.
//
// Revision 1.150  2009/12/16 15:26:29  lulin
// - правильнее вычислем указатель на запомненную строку.
//
// Revision 1.149  2009/12/16 15:06:19  lulin
// - обходимся без дополнительной строки. Просто расширяем существующий буфер.
//
// Revision 1.148  2009/12/16 14:22:03  lulin
// - боремся с распуханием буферов.
//
// Revision 1.147  2009/12/15 12:11:43  lulin
// - чистим код и правим ошибки.
//
// Revision 1.146  2009/12/15 09:58:55  lulin
// - по-другому перераспределяем память.
//
// Revision 1.145  2009/12/14 16:53:39  lulin
// {RequestLink:168230991}.
//
// Revision 1.144  2009/12/14 12:07:49  lulin
// - чистка кода.
//
// Revision 1.143  2009/12/14 12:01:44  lulin
// - временно отказываемся читать юникодные файлы.
//
// Revision 1.142  2009/12/14 11:58:41  lulin
// - прячем кишки.
//
// Revision 1.141  2009/12/14 11:46:55  lulin
// - готовимся к возврату более простых строк.
//
// Revision 1.140  2009/09/07 10:28:45  voba
// - opt. Tl3BufferStreamMemoryPool - Стандартный буфер для буферизованных потоков
//
// Revision 1.139  2009/07/23 08:15:07  lulin
// - вычищаем ненужное использование процессора операций.
//
// Revision 1.138  2009/03/18 14:59:56  lulin
// - делаем возможность отката, если во время записи произошло исключение.
//
// Revision 1.137  2008/12/12 19:19:30  lulin
// - <K>: 129762414.
//
// Revision 1.136  2008/06/06 11:58:08  fireton
// - форматирование
//
// Revision 1.135  2008/03/24 11:52:14  lulin
// - <K>: 85169205.
//
// Revision 1.134  2007/12/24 15:25:32  lulin
// - удалены ненужные файлы.
//
// Revision 1.133  2007/08/30 10:09:23  lulin
// - убираем ненужную функцию поиска.
//
// Revision 1.132  2007/08/28 17:07:12  lulin
// - оптимизируем загрузку строк.
//
// Revision 1.131  2007/08/28 16:25:14  lulin
// - не поддерживаем чтение очень старых версий EVD.
//
// Revision 1.130  2007/08/28 15:13:14  lulin
// - читаем данные в буфер, когда точно поняли, что он пустой.
//
// Revision 1.129  2007/08/28 14:27:03  lulin
// - поднимаем исключение, если считано меньше, чем просили.
//
// Revision 1.128  2007/08/28 13:53:29  lulin
// - оптимизируем чтение.
//
// Revision 1.127  2007/08/28 12:59:06  lulin
// - лишний раз не получаем файлер.
// - оптимизируем процедуру чтения файлера.
//
// Revision 1.126  2007/08/15 15:34:07  lulin
// - используем общую процедуру.
//
// Revision 1.125  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.124  2007/08/14 15:19:28  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.123  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.122  2007/08/14 13:13:20  lulin
// - откатываем предудущие изменения.
//
// Revision 1.120  2007/08/14 12:33:06  lulin
// - оптимизируем _Move.
//
// Revision 1.119  2007/08/14 12:27:56  lulin
// - cleanup.
//
// Revision 1.118  2007/08/14 12:07:16  lulin
// - cleanup.
//
// Revision 1.117  2007/08/14 11:42:14  lulin
// - оптимизируем _Move.
//
// Revision 1.116  2007/08/13 15:48:58  lulin
// - уменьшаем ненужное определение типа потока.
//
// Revision 1.115  2007/08/10 19:17:27  lulin
// - cleanup.
//
// Revision 1.114  2007/08/09 08:19:04  lulin
// - при записи строци используем целевую кодировку потока.
//
// Revision 1.113  2007/08/06 07:23:26  voba
// - bug fix
//
// Revision 1.112  2007/08/02 18:02:58  lulin
// - оптимизируем строки.
//
// Revision 1.111  2007/08/02 17:38:14  lulin
// - оптимизируем строки.
//
// Revision 1.110  2007/08/02 17:24:55  lulin
// - оптимизируем строки.
//
// Revision 1.109  2007/08/01 15:15:53  voba
// - opt.
//
// Revision 1.108  2007/02/12 18:45:06  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.107  2007/02/12 18:06:19  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.106  2007/02/12 16:40:36  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.105  2007/01/22 15:20:13  oman
// - new: Локализация библиотек - l3 (cq24078)
//
// Revision 1.104  2006/09/06 11:21:59  voba
// - bug fix
//
// Revision 1.103  2006/04/26 12:16:23  voba
// - bug fix: архивирующие потоки не работали над файловыми потоками, отличными от m3.
//
// Revision 1.102  2006/04/25 12:47:50  lulin
// - cleanup.
//
// Revision 1.101  2005/10/04 09:19:58  lulin
// - new behavior: сделана возможность получать имя записываемго в поток файла.
//
// Revision 1.100  2005/10/04 09:13:24  lulin
// - new behavior: сделана возможность получать имя записываемго в поток файла.
//
// Revision 1.99  2005/10/04 08:42:09  lulin
// - cleanup.
//
// Revision 1.98  2005/06/24 18:19:59  lulin
// - обрабатываем потоки, которые вообще не поддерживают Seek.
//
// Revision 1.97  2005/05/23 15:06:07  lulin
// - cleanup.
//
// Revision 1.96  2005/04/19 15:41:51  lulin
// - переходим на "правильный" ProcessMessages.
//
// Revision 1.95  2005/01/26 17:18:04  lulin
// - изменено собщение о загрузке файла.
//
// Revision 1.94  2005/01/24 11:43:23  lulin
// - new behavior: при освобождении заглушки очищаем указатель на нее.
//
// Revision 1.93  2005/01/19 14:29:56  lulin
// - не пишем дурацкий ноль и/или пустые квадратные скобки.
//
// Revision 1.92  2005/01/17 16:37:33  migel
// - add: поддержка задания времени таймаута при открытии файла на диске.
//
// Revision 1.91  2004/12/30 11:46:34  lulin
// - интерфейсы относящиеся к Preview переехали в библиотеку _AFW.
//
// Revision 1.90  2004/12/17 14:00:28  am
// change: в Tl3CustomFiler._Write вместо TStream._Write используем TStream.WriteBuffer, соотв. если запись не удаётся - поднимается исключение.
//
// Revision 1.89  2004/11/03 14:27:00  lulin
// - bug fix: не пытаемся делать Seek при записи файла.
//
// Revision 1.88  2004/10/19 17:58:04  lulin
// - new behavior: избавился от фрагментации памяти в методе TevCustomEvdReader._AddRawData.
//
// Revision 1.87  2004/09/27 11:32:58  lulin
// - new method: Im3DB.SingleDocument.
//
// Revision 1.86  2004/09/24 16:20:12  lulin
// - добавлены комментарии.
//
// Revision 1.85  2004/09/24 16:13:43  lulin
// - bug fix: аккуратнее обрабатываем переполнение буфера.
//
// Revision 1.84  2004/09/24 15:51:19  lulin
// - bug fix: повторная (неправильная) загрузка буфера приводила к затиранию чужой памяти.
// - bug fix: аккуратнее обходимся с ситуацией когда Stream = nil.
//
// Revision 1.83  2004/09/24 07:54:47  lulin
// - были несбалансированы скобки индикатора.
//
// Revision 1.82  2004/09/21 10:30:18  lulin
// - Release заменил на Cleanup.
//
// Revision 1.81  2004/08/31 17:02:20  law
// - cleanup: убраны ненужные параметры.
//
// Revision 1.80  2004/08/27 10:56:20  law
// - new const: l3_fmExclusiveReadWrite.
//
// Revision 1.79  2004/08/24 07:31:51  law
// - bug fix: падало при попытке установки f_EOF при открытии файла на запись.
//
// Revision 1.78  2004/08/24 04:47:23  law
// - bug fix: после падения при открытии файла последующая работа с существующим экземпляром Tl3CustomFiler была невозможно, т.к. в ней "повисал" старый поток - в котором произошла ошибка.
//
// Revision 1.77  2004/08/20 15:15:27  law
// - cleanup.
//
// Revision 1.76  2004/08/19 15:36:58  law
// - в нулевом приближении сделана индексация нового хранилища.
//
// Revision 1.75  2004/08/13 13:57:28  law
// - добавлена "своя" константа.
//
// Revision 1.74  2004/08/13 13:09:26  law
// - cleanup.
//
// Revision 1.73  2004/08/06 14:22:32  law
// - избавился от части Warnings/Hints.
//
// Revision 1.72  2004/05/20 12:06:27  law
// - bug fix: неправильно записывались концы строк в cp_UnicodeText и cp_Text.
//
// Revision 1.71  2004/05/07 16:38:17  law
// - заготовка для сбора статистики по длинам файлов.
//
// Revision 1.70  2004/04/26 14:28:24  law
// - new behavior: Tl3Filer теперь при чтении посимвольно учитывает кодировку.
// - bug fix: в свойство TevMemo.Buffer теперь нормально присваиваются строки с кодировкой Unicode.
//
// Revision 1.69  2004/04/26 13:06:03  law
// - bug fix: теперь в TevEdit и TevMemo корректно присваиваются строчки не только с кодировками CP_ANSI, CP_OEM.
//
// Revision 1.68  2004/03/31 17:59:28  law
// - bug fix: корректно пишем/читаем Unicode-строки в бинарный EVD.
//
// Revision 1.67  2004/03/31 17:31:09  law
// - new behavior: парсер теперь умеет читать unicode-строки (как в Delphi).
//
// Revision 1.66  2003/12/26 13:38:29  law
// - bug fix: другая (более успешная попытка) попытка починить ошибку CQ OIT5-4532.
//
// Revision 1.65  2003/11/06 14:13:54  law
// - bug fix: Tl3SubStream не работал с потоком, который не поддерживает Seek.
//
// Revision 1.64  2003/10/15 08:29:27  law
// - bug fix: оформление параграфов накапливалось в один буфер.
//
// Revision 1.63  2003/09/12 16:37:08  law
// - bug fix: не затиралось предыдущее значение окна для закрытия -> бесконечный цикл закрытия.
//
// Revision 1.62  2003/06/20 16:52:25  law
// - new behavior: при получении размера потока учитываем тот факт, что данная функция может быть нереализована.
//
// Revision 1.61  2003/03/13 16:37:20  law
// - change: попытка портировать на Builder.
//
// Revision 1.60  2002/12/24 13:02:03  law
// - change: объединил Int64_Seek c основной веткой.
//
// Revision 1.59.2.1  2002/12/23 15:51:28  law
// - bug fix: не работали с хранилищем > 2Гб.
//
// Revision 1.59  2002/09/09 13:25:05  law
// - cleanup.
//
// Revision 1.58  2002/04/15 12:18:27  law
// - new behavior: запрещение определения кодировки в режиме "не для чтения".
//
// Revision 1.57  2002/04/03 13:50:39  law
// - new const: 3_fmExclusiveWrite, l3_fmExclusiveAppend.
//
// Revision 1.56  2002/02/26 15:48:08  law
// - optimization: попытка оптимизации путем уменьшения фрагментации выделяемой памяти.
//
// Revision 1.55  2002/02/20 12:41:39  law
// - new behavior: стараемся избежать двойной буферизации.
//
// Revision 1.54  2002/01/29 12:49:20  law
// - new behavior: переделан способ кеширования буферов.
//
// Revision 1.53  2002/01/16 15:43:30  law
// - bug fix: несогласованность при работе с индикатором.
//
// Revision 1.52  2002/01/08 12:11:27  narry
// - new behavior: проверка на совпадение имени файла при его присвоении.
//
// Revision 1.51  2002/01/08 09:29:50  law
// - change comment: исправлен предыдущий комментарий.
//
// Revision 1.50  2002/01/08 09:25:08  law
// - rename class: TevDOSFiler -> Tl3DOSFiler.
//
// Revision 1.49  2001/12/28 14:57:19  law
// - change: типы переименованы в соответствии с названием библиотеки.
//
// Revision 1.48  2001/10/18 14:54:37  law
// - new unit: l3WindowsStorageFiler.
//
// Revision 1.47  2001/10/15 14:56:09  law
// - bug fix: не нужен _LoadBuffer при Seek и Mode <> l3_fmRead.
//
// Revision 1.46  2001/09/11 10:12:02  law
// - new behavior: теперь в статус выводится идентификатор файла.
//
// Revision 1.45  2001/09/10 09:51:19  law
// - new behavior: изменена логика работы с индикатором при присваивании Stream.
//
// Revision 1.44  2001/09/07 12:40:38  law
// - new behavior: при закрытом потоке Filer открывает его когда отдает интерфейс IStream.
//
// Revision 1.43  2001/09/03 14:32:10  law
// - change method: изменен списока параметров метода Tl3CustomDOSFiler.Make.
//
// Revision 1.42  2001/09/03 14:22:40  law
// - new method: Tl3CustomDOSFiler.Make.
//
// Revision 1.41  2001/08/31 08:50:08  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.40  2001/08/29 07:01:10  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.39  2001/07/24 12:30:24  law
// - comments: xHelpGen.
//
// Revision 1.38  2001/04/27 12:22:19  voba
// - bug fix: добавлена обработка ошибки получения размера файла.
//
// Revision 1.37  2001/04/27 11:37:22  voba
// - bug fix: добавлена очистка буфера после сбоя открытия потока.
//
// Revision 1.36  2001/03/27 14:22:36  law
// - к Tl3CustomFiler добавлен метод Identifier.
//
// Revision 1.35  2001/03/12 10:17:26  law
// - добавлены функции WriteLn.
//
// Revision 1.34  2001/03/02 12:54:44  law
// - bug fix: AV при _f_Stream = nil.
//
// Revision 1.33  2000/12/15 14:57:02  law
// - вставлены директивы Log.
//

{$Include l3Define.inc}

interface

uses
  Windows,
  SysUtils,
  Classes,

  l3Interfaces,
  l3Types,
  l3IID,
  l3Base,
  l3BaseStream,
  l3Stream,
  l3Chars,
  l3ProgressComponent,
  l3ProtoProgressComponent
  ;
  
type
  Tl3CommentString = String[4];
  Tl3CommentState = (l3_csNone, l3_csLine, l3_csMultiLine, l3_csAnOtherMultiLine);
  Tl3NextTokenFlag = (l3_ntfSkipBlanks, l3_ntfSkipComment, l3_ntfCheckString, l3_ntfCheckDoubleQuotedString);
  Tl3NextTokenFlags = set of Tl3NextTokenFlag;
  Tl3GetFilePath = function : AnsiString of object;
  Tl3CheckAbortedLoadEvent = procedure(Sender: TObject; var Aborted: Bool) of object;
   {* - событие для проверки необходимости прервать операцию чтения. }

  Tl3FilerBuffer = class(Tl3String);

  Tl3StreamType = (l3_stUnknown, l3_stString, l3_stOther);

  {$IfDef l3FilerIsComponent}
  Tl3FilerOwner = Tl3ProgressComponentOwner;
  {$Else  l3FilerIsComponent}
  Tl3FilerOwner = TObject;
  {$EndIf l3FilerIsComponent}

  Tl3CustomFiler = class({$IfDef l3FilerIsComponent}Tl3ProgressComponent{$Else}Tl3ProtoProgressComponent{$EndIf}, Il3Rollback)
   {* Реализация компонента-обертки вокруг потока. }
    private
    // internal fields
      f_Buffer       : Tl3FilerBuffer; {-буфер чтения}
      f_BufS         : Tl3WString;
      f_BufSize      : Integer;
      f_BufferOffset : Long;
      f_PrevBuffer   : Tl3FilerBuffer;
      f_Mode         : Tl3FileMode;
      f_Line         : Tl3String;
      f_StreamType   : Tl3StreamType;
    private
    // internal fields
      f_StreamPos    : Int64;
      fl_WndToClose  : hWnd;
      fl_OpenCount   : Long;
    private
    // property fields
      f_ReadOnly     : Bool;
      f_AbortedLoad  : Bool;
      f_Handle       : Long;
      f_NeedProcessMessages : Bool;
      f_EOF           : Bool;
      f_CodePage      : Long;
      f_NotSeekStream : Bool;
      f_SoftEnterAsEOL: Boolean;
    protected
    // property fields
      f_Stream       : TStream;
    private
    // event fields
      f_OnGetFilePath      : Tl3GetFilePath;
      f_OnCheckAbortedLoad : Tl3CheckAbortedLoadEvent;
    protected
    // property methods
      function  pm_GetSize: Int64;
        {-}
      function  pm_GetOpened: Bool;
        {-}
      procedure pm_SetStream(Value: TStream);
        {-}
      function  pm_GetCOMStream: IStream;
      procedure pm_SetCOMStream(const Value: IStream);
        {-}
      procedure pm_SetMode(Value: Tl3FileMode);
        {-}
      procedure pm_SetHandle(Value: Long);
        {-}
      function  pm_GetCodePage: Long;
        {-}
    protected
    // internal methods
      function  InternalOpen(aMode: Tl3FileMode): Boolean;
        {* - метод для внутреннего открытия потока. }
      function  DoOpen: Boolean;
        virtual;
        {* - метод для открытия потока. Для перекрытия в потомках. }
      procedure DoClose;
        virtual;
        {* - метод для закрытия потока. Для перекрытия в потомках. }
      procedure ProcessMessages;
        {* - отдать управление. }
      procedure AbortLoad;
        {* - прервать операцию чтения. }
      procedure CheckAbortedLoad;
        {* - проверить необходимость прервать операцию чтения. }
      function  IsWriteMode(Mode: Tl3FileMode): Bool;
        {-}
      procedure FreeBuffer(aFullClean : Boolean);
        {* - освободить буфер. }
      function  LoadBuffer: Bool;
        {* - загрузить буфер. }
      procedure Cleanup;
        override;
        {-}
      procedure StartIndicator;
        {-}
      {$IfNDef l3FilerIsComponent}
      class function IsCacheable : Boolean;
        override;
      {$EndIf  l3FilerIsComponent}  
    public
    {public methods}
      constructor Create(anOwner: Tl3FilerOwner = nil); {$IfDef l3FilerIsComponent}override;{$EndIf}
        {-}
      function GetFilePath: AnsiString;
        {-}
      procedure Open; 
        {* - открыть поток. }
      procedure Close; 
        {* - закрыть поток. }
      procedure Rollback;
       {* Откатить данные }
      procedure Read(aBuf: PAnsiChar; aCount: Long);
        {* - считать буфер из потока. }
      function  SizedRead(aBuf: PAnsiChar; aCount: Long): Long;
        {* - считать буфер из потока. }
      function  ReadWord: Word;
        {-}
      function  ReadLong: Long;
        {-}
      function  ReadByte: Byte;
        {-}
      function  Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64;
        {* - сместить указатель потока. }
      function  ReadLn: Tl3WString;
        {* - считать строку до #13#10. }
      function  ReadHexLn(const aLineChars: TCharSet; aFinishChar: AnsiChar): Tl3WString;
        {* - Считать строку с данными в шестнадцатиричном виде. В качестве параметра - допустимые символы. }
      function  MakeReadString(aLen      : Long;
                               aCodePage : Long): Tl3String;
        {* - считать строку. }
      function  GetC: Tl3Char;
        {* - получить символ из потока. }
      procedure UngetC;
        {* - вернуть символ в поток. }
      procedure UngetChars(aCount: Integer);
        {* - вернуть несколько символов в поток. }
      function  Write(C: Char): Long;
        overload;
        {* - записать символ в поток. }
      function  Write(Buf: PAnsiChar; Count: Long): Long;
        overload;
        {* - записать буфер в поток. }
      function  Write(const S: AnsiString): Long;
        overload;
        {* - записать строку в поток. }
      function  Write(S: Tl3PrimString): Long;
        overload;
        {* - записать строку в поток. }
      function  WriteLn(S: Tl3PrimString): Long;
        overload;
        {* - записать строку в поток дополнив ее #13#10. }
      function  Write(const S: Tl3WString): Long;
        overload;
        {* - записать строку в поток. }
      function  WriteLn(const S: Tl3WString): Long;
        overload;
        {* - записать строку в поток дополнив ее #13#10. }
      function  WriteLn(const S: AnsiString): Long;
        overload;
        {* - записать строку в поток дополнив ее #13#10. }
      function  CloseQuery(Wnd: hWnd): Bool;
        {* - запрос на возможность закрытия. }
      function  GetCodePage: Long;
        {* - получить кодовую страницу символов потока эмпирическим путем. }
      procedure AnalizeCodePage;
        {* - установить __CodePage в значение, полученное при помощи GetCodePage. }
      procedure Analize(var OEMCount, ANSICount: Long);
        {* - проанализировать поток на предмет частоты встречаемости символов. }
      procedure SkipEOL;
        {* - пропустить конец строки. }
      function  OutEOL: Long;
        {* - вывести конец строки. }
      function  COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
      function  CheckLine(NeedChangeCodePage: Boolean = true): Tl3String;
        {* - вернуть временный буфер. }
      function  Identifier: String;
        virtual;
        {* - вернуть идентификатор потока (например имя файла). }
      procedure Flush;
        {-}
    public
    // public properties
      property ReadOnly: Bool
        read f_ReadOnly
        write f_ReadOnly
        default false;
        {* - поток только для чтения? }
       property Size: Int64
         read pm_GetSize;
         {* - размер потока. }
       property Pos: Int64
         read f_StreamPos;
         {* - текущая позиция потока. }
       property Stream: TStream
         read f_Stream
         write pm_SetStream;
         {* - собственно поток. }
       property COMStream: IStream
         read pm_GetCOMStream
         write pm_SetCOMStream;
         {* - поток для COM. }
       property Opened: Bool
         read pm_GetOpened;
         {* - поток открыт? }
      property NeedProcessMessages: Bool
        read f_NeedProcessMessages
        write f_NeedProcessMessages
        default false;
        {* - надо ли отдавать управление во время длительных операций? }
      property AbortedLoad: Bool
        read f_AbortedLoad
        write f_AbortedLoad;
        {* - прервана загрузка? }
      property Handle: Long
        read f_Handle
        write pm_SetHandle;
        {* - целочисленный идентификатор потока. }
      property EOF: Bool
        read f_EOF;
        {* - достигнут конец потока? }
      property Mode: Tl3FileMode
        read f_Mode
        write pm_SetMode;
        {* - режим работы с потоком. }
      property CodePage: Long
        read pm_GetCodePage
        write f_CodePage
        default CP_ANSI;
        {* - кодовая страница данных потока. }
      property NotSeekStream: Bool
        read f_NotSeekStream;
      property SoftEnterAsEOL: Boolean
        read f_SoftEnterAsEOL
        write f_SoftEnterAsEOL;
        {-}
    public
    {events}
      property OnGetFilePath: Tl3GetFilePath
        read f_OnGetFilePath
        write f_OnGetFilePath;
        {* - Событие для получения пути к файлу. }
      property OnCheckAbortedLoad: Tl3CheckAbortedLoadEvent
        read f_OnCheckAbortedLoad
        write f_OnCheckAbortedLoad;
        {* - событие для проверки необходимости прервать операцию чтения. }
  end;{Tl3CustomFiler}

  Il3FilerSource = interface(Il3Base)
    ['{94E711B9-E159-4CC9-B3A4-80612AC0A12E}']
    {property methods}
      function  pm_GetFiler: Tl3CustomFiler;
      procedure pm_SetFiler(Value: Tl3CustomFiler);
        {-}
    {public properties}
      property Filer: Tl3CustomFiler
        read pm_GetFiler
        write pm_SetFiler;
        {-}
  end;//Il3FilerSource

  Tl3FilerStream = class(Tl3Stream, Il3FilerSource, Il3Rollback)
   {* Класс для преобразования обертки обратно в поток. }
    private
    {internal fields}
      f_Filer    : Tl3CustomFiler;
    protected
    // interface methods
      function  pm_GetFiler: Tl3CustomFiler;
      procedure pm_SetFiler(Value: Tl3CustomFiler);
        {-}
    protected
    {internal methods}
      procedure Cleanup;
        override;
      function GetSize: Int64; override;
        {-}
    public
    {public methods}
      constructor Create(anOwner: Tl3CustomFiler);
        reintroduce;
        {-}
   procedure Rollback;
     {* Откатить данные }
      function  COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
      function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
        override;
        {-}
    public
    // public properties
      property Filer: Tl3CustomFiler
        read f_Filer;
        {-}
  end;{Tl3FilerStream}

  Tl3OutExtLongEvent = procedure(Sender: TObject; Handle: Long; Filer: Tl3CustomFiler) of object;
   {* - событие для записи целочисленного параметра в поток. }

  Tl3CustomDOSFiler = class(Tl3CustomFiler)
   {* Обертка вокруг потока, который работает с файлом на диске. }
    private
      { Private declarations }
       f_FileName : TFileName;
       f_TimeOut  : Longword;
    protected
    {property methods}
      procedure pm_SetFileName(const Value: TFileName);
        {-}
      procedure pm_SetTimeOut(Value: Longword);
        {-}
    protected
    {internal methods}
      function DoOpen: Boolean;
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    //public methods
      constructor Make(const aFileName     : String;
                       anOpenMode          : Tl3FileMode = l3_fmRead;
                       NeedAnalizeCodePage : Bool = true;
                       aTimeOut            : Longword = Cl3FileStreamDefaultTimeOut);
        {* - создает Filer. }
      function  Identifier: String;
        override;
        {-}
    public
    // public properties
      property FileName: TFileName
        read f_FileName
        write pm_SetFileName;
        {* - имя файла. }
      property TimeOut: Longword
        read f_TimeOut
        write pm_SetTimeOut;
        {* - время таймаута (измеряется в тиках). }
  end;//Tl3CustomDOSFiler

  Tl3DOSFiler = class(Tl3CustomDOSFiler)
   {*! Обертка вокруг потока, который работает с файлом на диске. Для конечного использования на форме. }
    published
    // properties
      property ReadOnly;
        {-}
      property FileName;
        {-}
      property TimeOut default Cl3FileStreamDefaultTimeOut;
        {-}
      property NeedProcessMessages;
        {-}
      property Indicator;
        {-}
      property CodePage;
        {-}
    published
    // events
      property OnCheckAbortedLoad;
        {-}
  end;//Tl3DOSFiler

  TevDOSFiler = class(Tl3DOSFiler);

  Tl3FilerAction = function(aFiler: Tl3CustomFiler): Bool;
    {-}

function l3FileMode2SysUtilsFileMode(l3FileMode: Tl3FileMode): Cardinal;
 {* - преобразовать Tl3FileMode в режим работы с файлом из модуля SysUtils. }
function  l3L2FilerAction(Action: Pointer): Tl3FilerAction;
  {* - делает заглушку для локальной процедуры. }
procedure l3FreeFilerAction(var Stub: Tl3FilerAction);
  {* - освобождает заглушку для локальной процедуры. }

implementation

uses
  ComObj,
  Messages,
  {$IfDef l3ConsoleApp}
  {$Else  l3ConsoleApp}
  Forms,
  {$EndIf l3ConsoleApp}

  l3InternalInterfaces,
  l3MinMax,
  l3Const,
  l3Except,
  l3InterfacesMisc,
  l3Memory,
  l3IntegerValueMapManager,
  l3String,
  l3StringEx,
  l3FilerRes,

  m2InternalInterfaces,

  afwFacade
  ;

resourcestring
 cFileSizeErrorFmt = 'Ошибка получения размера файла [%s]';
const
  l3FilerBufSize = l3ParseBufSize
                   //{$IfDef XE} * 2 {$EndIf}
                   {$IfDef Nemesis}
                   {* 2}
                   {$EndIf Nemesis}
                   ;

function l3StreamSize(aStream : TStream): Int64;
var
 l_SS : Im2StoreStat;
begin
 if Supports(aStream, Im2StoreStat, l_SS) then
  try
   Result := l_SS.Size
  finally
   l_SS := nil;
  end//try..finally
 else
  Result := aStream.Size;
end;

function l3StreamPos(aStream : TStream): Int64;
var
 l_SS : Im2StoreStat;
begin
 if Supports(aStream, Im2StoreStat, l_SS) then
  try
   Result := l_SS.Position
  finally
   l_SS := nil;
  end//try..finally
 else
  Result := aStream.Position;
end;

function l3FileMode2SysUtilsFileMode(l3FileMode: Tl3FileMode): Cardinal;
begin
 Case l3FileMode of
  l3_fmRead      : Result := fmOpenRead;
  l3_fmWrite,
  l3_fmExclusiveWrite  : Result := fmOpenWrite;
  l3_fmAppend,
  l3_fmExclusiveAppend : Result := fmOpenWrite;
  l3_fmExclusiveReadWrite,
  l3_fmReadWrite : Result := fmOpenReadWrite;
  else
  begin
   Result := fmOpenRead;
   Assert(false);
  end;//else
 end;{Case l3FileMode}
end;

procedure Tl3CustomFiler.Cleanup;
  {override;}
  {-}
begin
 // http://mdp.garant.ru/pages/viewpage.action?pageId=508445329
 if HasIndicator then
  Indicator.Finish;
 f_OnCheckAbortedLoad := nil;
 FreeAndNil(f_Line);
 if Opened then
 begin
  fl_OpenCount := 1;
  Close;
 end;//Opened
 FreeBuffer(true);
 f_StreamPos := 0;
 f_EOF := false;
 f_AbortedLoad := false;
 f_StreamType := l3_stUnknown;
 f_Mode := Low(f_Mode);
 fl_OpenCount := 0;
 f_SoftEnterAsEOL := false;
 f_NotSeekStream := false;
 f_CodePage := 0;
 f_NeedProcessMessages := false;
 fl_WndToClose := 0;
 f_ReadOnly := false;
 inherited;
end;

procedure Tl3CustomFiler.AbortLoad;
  {-}
var
 l_Wnd : hWnd;
begin
 f_AbortedLoad := false;
 if (fl_WndToClose <> 0) then begin
  l_Wnd := fl_WndToClose;
  fl_WndToClose := 0;
  PostMessage(l_Wnd, WM_Close, 0, 0);
 end;//fl_WndToClose <> 0
 raise El3AbortLoad.Create(l3_excAbortLoad);
end;

procedure Tl3CustomFiler.CheckAbortedLoad;
  {-}
var
 AL : Bool;
begin
 if Assigned(f_OnCheckAbortedLoad) then
  f_OnCheckAbortedLoad(Self, AL)
 else
  AL := false;
 if AL OR f_AbortedLoad then AbortLoad;
end;

procedure Tl3CustomFiler.ProcessMessages;
  {override;}
  {-}
begin
 {$IfDef l3ConsoleApp}
 {$Else  l3ConsoleApp}
 if f_NeedProcessMessages then afw.ProcessMessages;
 {&ProcessMessages&}
 {$EndIf l3ConsoleApp}
end;

function Tl3CustomFiler.pm_GetSize: Int64;
  {-}
begin
 if (f_Stream <> nil) then
  Result := l3StreamSize(f_Stream)
 else
  Result := 0;
end;

function Tl3CustomFiler.pm_GetOpened: Bool;
  {-}
begin
 Result := (f_Stream <> nil);
end;

procedure Tl3CustomFiler.pm_SetStream(Value: TStream);
  {-}
begin
 if l3Set(f_Stream, Value) then
 begin
  f_StreamType := l3_stUnknown;
  if (f_Stream = nil) then
  begin
   FreeBuffer(false);
   if IsWriteMode(Mode) then
    Indicator.ChangeIO(false)
   else
    Indicator.FinishEx(true);
  end//f_Stream = nil
  else
  begin
   f_NotSeekStream := false;
   if IsWriteMode(Mode) then
   begin
    f_EOF := true;
    f_StreamPos := 0;
   end//IsWriteMode(Mode)
   else
   begin
    try
     f_StreamPos := l3StreamPos(f_Stream);
    except
     on E: EOleSysError do
      if (E.ErrorCode = E_NOTIMPL) OR (E.ErrorCode = STG_E_INVALIDFUNCTION) OR (E.ErrorCode = E_UNEXPECTED) then
      begin
       f_StreamPos := 0;
       f_NotSeekStream := true;
      end//E.ErrorCode = E_NOTIMPL..
      else
       raise;
    end;//try..except
    try
     f_EOF := (f_StreamPos = l3StreamSize(f_Stream));
    except
     on E: EOleSysError do
      if (E.ErrorCode = E_NOTIMPL) OR (E.ErrorCode = STG_E_INVALIDFUNCTION) OR (E.ErrorCode = E_UNEXPECTED) then
      begin
       f_EOF := false;
       f_NotSeekStream := true;
      end//E.ErrorCode = E_NOTIMPL)
      else
       raise;
    end;//try..except
   end;//if IsWriteMode(Mode)
   if (Mode = l3_fmRead) then
   begin
    StartIndicator;
    LoadBuffer;
   end;//Mode = l3_fmRead
  end;//f_Stream = nil
 end;//l3Set(f_Stream, Value)
end;

function  Tl3CustomFiler.pm_GetCOMStream: IStream;
  {-}
begin
 Result := l3Stream2IStream(Stream);
end;

procedure Tl3CustomFiler.pm_SetCOMStream(const Value: IStream);
  {-}
var
 l_Stream : TStream;
begin
 if (Value = nil) then
  Stream := nil
 else
 begin
  l3IStream2Stream(Value, l_Stream);
  try
   Stream := l_Stream;
  finally
   FreeAndNil(l_Stream);
  end;//try..finally
 end;//Value = nil
end;

procedure Tl3CustomFiler.pm_SetMode(Value: Tl3FileMode);
  {-}
begin
 if (Self <> nil) then begin
  f_Mode := Value;
 end;
end;

procedure Tl3CustomFiler.pm_SetHandle(Value: Long);
  {-}
begin
 {if (f_Handle <> Value) then }begin
  f_StreamPos := 0;
  if Opened then
   DoClose;
  f_Handle := Value;
  if (fl_OpenCount > 0) AND not Opened then
   InternalOpen(Mode);
 end;
end;

function Tl3CustomFiler.pm_GetCodePage: Long;
  {-}
begin
 Case f_StreamType of
  l3_stUnknown:
  begin
   if (f_Stream Is Tl3StringStream) then
   begin
    Result := Tl3StringStream(f_Stream)._String.CodePage;
    f_StreamType := l3_stString;
   end//f_Stream Is Tl3StringStream
   else
   begin
    Result := f_CodePage;
    f_StreamType := l3_stOther;
   end;//f_Stream Is Tl3StringStream
  end;//l3_stUnknown
  l3_stString:
   Result := Tl3StringStream(f_Stream)._String.CodePage
  else
   Result := f_CodePage;
 end;//Case f_StreamType
end;

function Tl3CustomFiler.InternalOpen(aMode: Tl3FileMode): Boolean;
  {-}
begin
 Result := DoOpen;
 if Opened then begin
  Case aMode of
   l3_fmRead   :
    //if Result then
     LoadBuffer;
   l3_fmAppend :
    f_StreamPos := Stream.Seek(0, soEnd);
  end;{Case aMode}
 end;{Opened}
end;

function Tl3CustomFiler.DoOpen: Boolean;
  {virtual;}
  {-}
begin
 Result := true;
end;

function Tl3CustomFiler.IsWriteMode(Mode: Tl3FileMode): Bool;
  {-}
begin
 Result := Mode in l3_fmWriteMode;
end;

constructor Tl3CustomFiler.Create(anOwner: Tl3FilerOwner = nil);
  {override;}
  {-}
begin
 inherited Create{$IfDef l3FilerIsComponent}(anOwner){$EndIf};
 f_EOF := true;
 f_SoftEnterAsEOL := False;
end;

procedure Tl3CustomFiler.Open;
  {-}
var
 l_Start : Boolean;  
begin
 if (Self <> nil) then begin
  if (fl_OpenCount = 0) then begin
   if not Opened then begin
    f_EOF := false;
    try
     l_Start := InternalOpen(Mode);
    except
     Stream := nil;
     raise;
    end;//try..except
    if Opened AND l_Start then
    begin
     if IsWriteMode(Mode) then
     begin
      if ReadOnly then Exit;
      Indicator.ChangeIO(true);
      //IsWriteMode(Mode)
     end
     else
      StartIndicator;
    end;//Opened  
   end;{not Opened}
   {f_EOF := false;}
  end;{fl_OpenCount = 0}
  Inc(fl_OpenCount);
 end;
end;

procedure Tl3CustomFiler.StartIndicator;
  {-}
var
 l_Size  : Int64;
 l_Ident : String;
begin
 try
  l_Size := Size;
 except
  on E: EOleSysError do
  begin
   if (E.ErrorCode = E_NOTIMPL) OR (E.ErrorCode = E_UNEXPECTED) then
    l_Size := 2048 // - например такой размер
   else
    raise;
  end//on E: EOleSysError
  else
  begin
   l3System.Msg2Log(Format(cFileSizeErrorFmt, [Identifier]));
   l_Size := 2048; // - например такой размер
  end;//on E: EOleSysError
 end;//try..except
 l_Ident := Identifier;
 if (l_Ident = '') OR (l_Ident = '0') then
  Indicator.StartEx(l_Size, str_l3mmFileOp.AsCStr, true)
 else
  Indicator.StartEx(l_Size, l3Fmt(str_l3mmFileOpFmt.AsCStr, [l_Ident]), true);
end;

{$IfNDef l3FilerIsComponent}
class function Tl3CustomFiler.IsCacheable : Boolean;
begin
 Result := true;
end;
{$EndIf  l3FilerIsComponent}

procedure Tl3CustomFiler.DoClose;
  {virtual;}
  {-}
begin
 FreeAndNil(f_Stream);
 Handle := 0;
end;

procedure Tl3CustomFiler.Close;
begin
 if (Self <> nil) then begin
  if (fl_OpenCount = 0) then begin
   FreeBuffer(false);
   Exit;
  end;//fl_OpenCount = 0
  Dec(fl_OpenCount);
  if (fl_OpenCount = 0) then begin
   if Opened then begin
    f_EOF := true;
    f_StreamPos := 0;
    DoClose;
    if IsWriteMode(Mode) then
     Indicator.ChangeIO(false)
    else
     Indicator.FinishEx(true);
   end;{Opened}
   FreeBuffer(false);
  end;{fl_OpenCount = 0}
 end;
end;

function Tl3CustomFiler.GetFilePath: AnsiString;
begin
 Result := '';
 if Assigned(f_OnGetFilePath) then
  Result := f_OnGetFilePath;
end;

procedure Tl3CustomFiler.Rollback;
  {* Откатить данные }
var
 l_RB : Il3Rollback;  
begin
 if Supports(f_Stream, Il3Rollback, l_RB) then
  try
   l_RB.Rollback;
  finally
   l_RB := nil;
  end;//try..finally
end;

procedure Tl3CustomFiler.FreeBuffer(aFullClean : Boolean);
  {-}
begin
 {$IfNDef l3NoObjectCache}
 if aFullClean then
 {$EndIf  l3NoObjectCache}
 begin
  f_BufSize := 0;
  FreeAndNil(f_Buffer);
  FreeAndNil(f_PrevBuffer);
 end//aFullClean
 {$IfNDef l3NoObjectCache}
 else
 begin
  try
   if (f_Buffer <> nil) then
   begin
    f_Buffer.BeforeAddToCache;
    f_BufSize := f_Buffer.StSize;
   end;//f_Buffer <> nil
   if (f_PrevBuffer <> nil) then
    f_PrevBuffer.BeforeAddToCache;
  except
   on E: Exception do
   begin
    f_Buffer := nil;
    f_PrevBuffer := nil;
    f_BufSize := 0;
    try
     l3System.Msg2Log('Проблемы при освобождении буфера');
     l3System.Exception2Log(E);
    except
     // - давим, осознанно
    end;//try..except
   end;//on E
  end;//try..except
 end//aFullClean
 {$EndIf  l3NoObjectCache}
 ;//aFullClean
 f_BufferOffset := 0;
 f_StreamPos := 0;
 f_EOF := true;
 l3FillChar(f_BufS, SizeOf(f_BufS), 0);
end;

function Tl3CustomFiler.LoadBuffer: Bool;
var
 OddsSize : Long;
 Count    : Long;
begin
 if (f_Stream = nil) then
 begin
  Result := false;
  l3FillChar(f_BufS, SizeOf(f_BufS), 0);
 end//f_Stream = nil
 else
 begin
  if (f_Buffer = nil) then
  begin
   f_Buffer := Tl3FilerBuffer.Create;
   f_Buffer._CodePage := CP_ANSI{Self.CodePage};
   // - Здесь ТОЛЬКО CP_ANSI, т.к. иначе начинается чехарда с Len, StSize и Count
   //   т.к. они перестают совпадать
   f_Buffer.StSize := l3FilerBufSize;
   f_BufSize := f_Buffer.StSize;
   Assert(f_Buffer.StSize >= l3FilerBufSize);
   CheckAbortedLoad;
   ProcessMessages;
   f_BufS := f_Buffer.AsWStr;
   Assert(f_BufS.S = f_Buffer.St);
   if (Self.CodePage = CP_Unicode) then
    Count := f_Stream.Read(f_BufS.S^, f_BufSize - 2)
   else
    Count := f_Stream.Read(f_BufS.S^, Pred(f_BufSize));
   Assert(f_BufS.S = f_Buffer.St);
   Assert(f_Buffer.StSize >= l3FilerBufSize);
   f_Buffer.Len := Count;
   f_BufS.SLen := Count;
   Assert(f_BufS.S = f_Buffer.St);
  end//f_Buffer = nil
  else
  begin
   if (f_PrevBuffer <> nil) AND (f_PrevBuffer.StSize > l3FilerBufSize * 4) then
    FreeAndNil(f_PrevBuffer);
   if (f_PrevBuffer = nil) then
   begin
    f_PrevBuffer := Tl3FilerBuffer.Create;
    f_PrevBuffer._CodePage := CP_ANSI{Self.CodePage};
    f_PrevBuffer.StSize := l3FilerBufSize;
   end//f_PrevBuffer = nil
   else
   if (f_PrevBuffer.StSize < l3FilerBufSize)  then
    f_PrevBuffer.StSize := l3FilerBufSize;
   Assert(f_PrevBuffer.StSize >= l3FilerBufSize);
   l3Swap(Pointer(f_Buffer), Pointer(f_PrevBuffer));
   OddsSize := f_PrevBuffer.Len  - f_BufferOffset;
   f_BufS := f_Buffer.AsWStr;
   f_BufSize := f_Buffer.StSize;
   if (OddsSize <> 0) then
   begin
    //Assert(OddsSize <= f_BufSize);
    // - это проверка того, что буфер переполнится
    if (OddsSize > f_BufSize) then
    begin
     f_Buffer.StSize := OddsSize + 1; // +1 - учитываем конечный 0
     // - а этим мы можем исправить ситуацию с переполнением буфера
     f_BufS := f_Buffer.AsWStr;
     f_BufSize := f_Buffer.StSize;
    end;//OddsSize > f_BufSize
    l3Move(f_PrevBuffer.St[f_BufferOffset], f_BufS.S^, OddsSize);
    // - копируем хвост предыдущего буфера в текущий
    f_PrevBuffer.Delete(f_BufferOffset, OddsSize);
    // - это нужно, чтобы при RollBack (Seek назад) не дублировались данные
   end;//OddsSize <> 0
   CheckAbortedLoad;
   ProcessMessages;
   Assert(f_Buffer.StSize >= l3FilerBufSize);
   if (Self.CodePage = CP_Unicode) then
   begin
    Assert(f_BufSize - 2 - OddsSize >= 0);
    Count := f_Stream.Read(f_BufS.S[OddsSize], f_BufSize - 2 - OddsSize)
   end
   else
   begin
    Assert(Pred(f_BufSize) - OddsSize >= 0);
    Count := f_Stream.Read(f_BufS.S[OddsSize], Pred(f_BufSize) - OddsSize);
   end;
   Assert(f_BufS.S = f_Buffer.St);
   Assert(f_Buffer.StSize >= l3FilerBufSize);
   f_Buffer.Len := Count + OddsSize;
   if (f_BufS.SLen <> Count + OddsSize) then
    f_BufS := f_Buffer.AsWStr;
   Assert(f_BufS.S = f_Buffer.St);
   Assert(f_Buffer.StSize >= l3FilerBufSize);
  end;//f_Buffer = nil
  f_BufferOffset := 0;
  Result := (f_BufS.SLen > 0);
 end;//f_Stream = nil
 f_EOF := not Result;
end;

{$IfOpt R+}
 {$R-}
 {$Define _Range_}
{$EndIf}

procedure Tl3CustomFiler.Read(aBuf: PAnsiChar; aCount: Long);
  {-}
var
 Cnt : Long;
begin
 if (aCount = 0) then
  Exit;
 Cnt := f_BufS.SLen - f_BufferOffset;
 while true do
 begin
  if (Cnt > aCount) then
  // - у нас в буфере данные с запасом
  begin
   //Cnt := aCount;
   l3Move(f_BufS.S[f_BufferOffset], aBuf^, aCount);
   //Inc(aBuf, Cnt);
   Inc(f_BufferOffset, aCount);
   Inc(f_StreamPos, aCount);
   Exit;
  end//Cnt > aCount
  else
  begin
   l3Move(f_BufS.S[f_BufferOffset], aBuf^, Cnt);
   Inc(aBuf, Cnt);
   Inc(f_BufferOffset, Cnt);
   Inc(f_StreamPos, Cnt);

   Dec(aCount, Cnt);

   if (aCount = 0) then
   // - считали сколько просили, больше читать не нужно
   begin
    if LoadBuffer then
    // - грузим буфер - чтобы правильно конец файла выставился
     Indicator.Progress(Pos);
    Exit;
   end//aCount = 0
   else
   begin
   // - у нас ничего не осталось
    //Cnt := 0;
    if LoadBuffer then
    begin
     Indicator.Progress(Pos);
     Cnt := f_BufS.SLen{ - f_BufferOffset};
                       //  ^ после загрузки буфера смещение равно 0
    end//LoadBuffer;
    else
     raise El3ReadError.CreateFmt('Невозможно считать требуемое число байт %d', [aCount]);
   end;//aCount = 0
  end;//Cnt > aCount
 end;//while true

end;

function Tl3CustomFiler.SizedRead(aBuf: PAnsiChar; aCount: Long): Long;
  {* - считать буфер из потока. }
var
 Cnt : Long;
begin
 Result := 0;
 if (aCount = 0) then
  Exit;
 Cnt := f_BufS.SLen - f_BufferOffset;
 while true do
 begin
  if (Cnt > aCount) then
  // - у нас в буфере данные с запасом
  begin
   //Cnt := aCount;
   l3Move(f_BufS.S[f_BufferOffset], aBuf^, aCount);
   //Inc(aBuf, Cnt);
   Inc(f_BufferOffset, aCount);
   Inc(Result, aCount);
   Inc(f_StreamPos, aCount);
   Exit;
  end//Cnt > aCount
  else
  begin
   l3Move(f_BufS.S[f_BufferOffset], aBuf^, Cnt);
   Inc(aBuf, Cnt);
   Inc(f_BufferOffset, Cnt);
   Inc(Result, Cnt);
   Inc(f_StreamPos, Cnt);

   Dec(aCount, Cnt);

   if (aCount = 0) then
   // - считали сколько просили, больше читать не нужно
   begin
    if LoadBuffer then
    // - грузим буфер - чтобы правильно конец файла выставился
     Indicator.Progress(Pos);
    Exit;
   end//aCount = 0
   else
   begin
   // - у нас ничего не осталось
    //Cnt := 0;
    if LoadBuffer then
    begin
     Indicator.Progress(Pos);
     Cnt := f_BufS.SLen{ - f_BufferOffset};
                       //  ^ после загрузки буфера смещение равно 0
    end//LoadBuffer
    else
     break;
   end;//aCount = 0
  end;//Cnt > aCount
 end;//while true

end;

{$IfDef _Range_}
 {$R+}
 {$Undef _Range_}
{$EndIf _Range_}

function Tl3CustomFiler.ReadWord: Word;
  {-}
begin
 Read(@Result, SizeOf(Result));
end;

function Tl3CustomFiler.ReadLong: Long;
  {-}
begin
 Read(@Result, SizeOf(Result));
end;

function Tl3CustomFiler.ReadByte: Byte;
  {-}
begin
 Read(@Result, SizeOf(Result));
end;

function Tl3CustomFiler.Seek(const aOffset: Int64; aOrigin: TSeekOrigin): Int64;
  {-}

 procedure SeekFromBeginning;
 begin{SeekFromBeginning}
  FreeBuffer(false);
  f_StreamPos := Stream.Seek(aOffset, soBeginning);
 end;{SeekFromBeginning}

 procedure JoinBuffers;
 begin{JoinBuffers}
  f_PrevBuffer.JoinWith(f_Buffer);
  if (f_Buffer <> nil) then
  begin
   f_Buffer.BeforeAddToCache;
   f_BufSize := 0;
   l3FillChar(f_BufS, SizeOf(f_BufS), 0);
  end;//f_Buffer <> nil
  //FreeAndNil(f_Buffer);
  l3Swap(Pointer(f_Buffer), Pointer(f_PrevBuffer));
  if (f_Buffer <> nil) then
  begin
   f_BufSize := f_Buffer.StSize;
   f_BufS := f_Buffer.AsWStr;
  end;//f_Buffer <> nil
 end;{JoinBuffers}

var
 l_Offset    : Int64;
 l_NegOffset : Int64;
begin
 try
  Case aOrigin of
   soBeginning:
   begin
    if (aOffset >= 0) then
    begin
     if l3IsNil(f_BufS) then
      if (Stream = nil) then
      begin
       f_StreamPos := 0;
       Assert(aOffset = 0);
      end
      else
       f_StreamPos := Stream.Seek(aOffset, soBeginning)
     else
     begin
      Inc(f_BufferOffset, aOffset);
      Dec(f_BufferOffset, Pos);
      f_StreamPos := aOffset;
      if (f_BufferOffset >= f_BufS.SLen) then
       SeekFromBeginning
      else
      if (f_BufferOffset < 0) then
      begin
       if f_PrevBuffer.Empty then
        SeekFromBeginning
       else
       begin
        Inc(f_BufferOffset, f_PrevBuffer.Len);
        if (f_BufferOffset >= 0) then
         JoinBuffers
        else
         SeekFromBeginning;
       end;//f_PrevBuffer.Empty
      end;//f_BufferOffset < 0
     end;//l3IsNil(f_BufS)
    end//aOffset >= 0
    else
     raise EStreamError.Create(l3ErrSeekPastEOF);
   end;//soFromBeginning
   soCurrent:
   begin
    if (aOffset > 0) then
    begin
     if l3IsNil(f_BufS) OR (f_BufferOffset + aOffset >= f_BufS.SLen) then
     begin
      l_Offset := Pos + aOffset - l3StreamPos(Stream);
      FreeBuffer(false);
      f_StreamPos := Stream.Seek(l_Offset, soCurrent);
     end//l3IsNil(f_BufS)..
     else
     begin
      Inc(f_BufferOffset, aOffset);
      Inc(f_StreamPos, aOffset);
     end;//l3IsNil(f_BufS)..
    end//aOffset > 0
    else
    if (aOffset < 0) then
    begin
     l_NegOffset := -aOffset;
     Dec(f_StreamPos, l_NegOffset);
     if (f_BufferOffset >= l_NegOffset) then
      Dec(f_BufferOffset, l_NegOffset)
     else
     if f_PrevBuffer.Empty OR (f_BufferOffset + f_PrevBuffer.Len < l_NegOffset) then
     begin
      l_Offset := Pos - l3StreamPos(Stream);
      FreeBuffer(false);
      f_StreamPos := Stream.Seek(l_Offset, soCurrent);
     end//f_PrevBuffer.Empty
     else
     begin
      Inc(f_BufferOffset, f_PrevBuffer.Len);
      Dec(f_BufferOffset, l_NegOffset);
      JoinBuffers;
     end;//f_PrevBuffer.Empty
    end;//aOffset < 0
   end;//soFromCurrent
   soEnd:
   begin
    if (aOffset <= 0) then
    begin
     Result := Stream.Seek(aOffset, soEnd);
     if not l3IsNil(f_BufS) then
     begin
      Dec(f_BufferOffset, Pos);
      Inc(f_BufferOffset, Result);
      if (f_BufferOffset >= f_BufS.SLen) then
       FreeBuffer(false)
      else
      if (f_BufferOffset < 0) then
      begin
       if f_PrevBuffer.Empty then
        FreeBuffer(false)
       else
       begin
        Inc(f_BufferOffset, f_PrevBuffer.Len);
        if (f_BufferOffset >= 0) then
         JoinBuffers
        else
         FreeBuffer(false);
       end;//f_PrevBuffer.Empty
      end;//f_BufferOffset < 0
     end;//not l3IsNil(f_BufS)
     f_StreamPos := Result;
    end//aOffset <= 0
    else
     raise EStreamError.Create(l3ErrSeekPastEOF);
   end;{soFromEnd}
   else
     raise EStreamError.Create(l3ErrInvalidOrigin);
  end;{Case aOrigin}
 except
  on E: EOleSysError do
   if (E.ErrorCode = E_NOTIMPL) OR (E.ErrorCode = E_UNEXPECTED) then
   begin
    if (aOffset <> 0) OR (aOrigin <> soBeginning) OR (Pos <> 0) then
     raise;
   end//E.ErrorCode = E_NOTIMPL
   else
    raise;
 end;//try..except
 if (Mode = l3_fmRead) AND (l3IsNil(f_BufS) OR (f_BufferOffset >= f_BufS.SLen)) then
  LoadBuffer
  {-на самом деле это сделано для правильного выставления EOF}
 else
  f_EOF := false;
 Result := f_StreamPos;
end;

function Tl3CustomFiler.ReadLn: Tl3WString;
  {-}

 procedure ReadUnicode;

 var
  l_Rest : Integer;

  procedure DecPtr;
  begin
   Dec(f_BufferOffset, 2);
   Inc(l_Rest, 2);
   Dec(Result.SLen);
  end;

  procedure DoLoad;
  var
   l_Cnt : Integer;
   l_SaveOffset : Integer;
  begin
   if (l_Rest <= 0) then
   begin
    Assert(l_Rest >= 0);
    FreeAndNil(f_PrevBuffer);
    if (Result.SLen > 0) then
    // - остался кусок строки
    begin
     if (Result.SLen * SizeOf(WideChar) >= (f_BufSize * 3) div 4) then
     begin
      l_SaveOffset := Result.S - f_BufS.S;
      f_Buffer.StSize := f_Buffer.StSize + l3FilerBufSize;
      f_BufSize := f_Buffer.StSize;
      f_BufS := f_Buffer.AsWStr;
      Result.S := f_BufS.S + l_SaveOffset;
     end;//Result.SLen * SizeOf(WideChar) >= (f_BufSize * 3) div 4
     l3Move(Result.S^, f_BufS.S^, Result.SLen * SizeOf(WideChar));
    end;//Result.SLen > 0
    f_BufferOffset := Result.SLen * SizeOf(WideChar);
    l_Cnt := f_Stream.Read(f_BufS.S[f_BufferOffset], f_BufSize - 2 - f_BufferOffset);
    Inc(f_StreamPos, l_Cnt);
    Indicator.Progress(Pos);
    f_Buffer.Len := l_Cnt + f_BufferOffset;
    if (f_BufS.SLen <> l_Cnt + f_BufferOffset) then
     f_BufS := f_Buffer.AsWStr;
    Result.S := f_BufS.S;
    l_Rest := f_BufS.SLen - f_BufferOffset;
    f_EOF := (l_Rest <= 0)
   end;//l_Rest <= 0
  end;

  procedure IncPtr;
  begin
   Inc(f_BufferOffset, 2);
   Dec(l_Rest, 2);
   Inc(Result.SLen);
   DoLoad;
  end;

 var
  l_C : WideChar;
 begin
  Result.S := f_BufS.S + f_BufferOffset;
  Result.SLen := 0;
  Result.SCodePage := CodePage;
  l_Rest := f_BufS.SLen - f_BufferOffset;
  DoLoad;
  while not EOF do
  begin
   try
   l_C := PWideChar(f_BufS.S + f_BufferOffset)^;
   except
   l_C := PWideChar(f_BufS.S + f_BufferOffset)^;
   end;
   IncPtr;
   Case l_C of
    cc_Null:
     if EOF then
      Exit
     else
      PWideChar(f_BufS.S + f_BufferOffset - 2)^ := cc_HardSpace;
    cc_SoftEnter:
     if SoftEnterAsEOL then
     begin
      Dec(Result.SLen);
      exit;
     end;
    cc_HardEnter:
    begin
     Dec(Result.SLen);
     // - выкидываем из конечной строки cc_HardEnter
     if EOF then
      Exit
     else
     begin
      if (PWideChar(f_BufS.S + f_BufferOffset)^ = cc_SoftEnter) then
      begin
       IncPtr;
       Dec(Result.SLen);
       // - выкидываем из конечной строки cc_SoftEnter
       if EOF then
        f_EOF := false;
       Exit;
      end//f_BufS.S[f_BufferOffset] = cc_SoftEnter
      else
      begin
       Exit;
      end;//f_BufS.S[f_BufferOffset] = cc_SoftEnter
     end;//EOF
    end;//cc_HardEnter
    cc_EOP:
    begin
     Assert(Result.SLen > 0);
     if (Result.SLen <= 1) then
      Result := cc_EOPStr
     else
      DecPtr;
     Exit;
    end;//cc_EOP
    else
     // - ничего не делаем;
   end;//Case l_C
  end;//while not EOF
 end;

 procedure ReadANSI;

 var
  l_Rest : Integer;

  procedure DecPtr;
  begin
   Dec(f_BufferOffset);
   Inc(l_Rest);
   Dec(Result.SLen);
  end;

  procedure DoLoad;
  var
   l_Cnt : Integer;
   l_SaveOffset : Integer;
  begin
   if (l_Rest <= 0) then
   begin
    FreeAndNil(f_PrevBuffer);
    if (Result.SLen > 0) then
    // - остался кусок строки
    begin
     if (Result.SLen >= (f_BufSize * 3) div 4) then
     begin
      l_SaveOffset := Result.S - f_BufS.S;
      f_Buffer.StSize := f_Buffer.StSize + l3FilerBufSize;
      f_BufSize := f_Buffer.StSize;
      f_BufS := f_Buffer.AsWStr;
      Result.S := f_BufS.S + l_SaveOffset;
     end;//Result.SLen >= (f_BufSize * 3) div 4
     l3Move(Result.S^, f_BufS.S^, Result.SLen);
    end;//Result.SLen > 0
    f_BufferOffset := Result.SLen;
    l_Cnt := f_Stream.Read(f_BufS.S[f_BufferOffset], Pred(f_BufSize) - f_BufferOffset);
    Inc(f_StreamPos, l_Cnt);
    Indicator.Progress(Pos);
    f_Buffer.Len := l_Cnt + f_BufferOffset;
    if (f_BufS.SLen <> l_Cnt + f_BufferOffset) then
     f_BufS := f_Buffer.AsWStr;
    Result.S := f_BufS.S;
    l_Rest := f_BufS.SLen - f_BufferOffset;
    f_EOF := (l_Rest <= 0)
   end;//l_Rest <= 0
  end;

  procedure IncPtr;
  begin
   Inc(f_BufferOffset);
   Dec(l_Rest);
   Inc(Result.SLen);
   DoLoad;
  end;

 var
  l_C : AnsiChar;
 begin
  Result.S := f_BufS.S + f_BufferOffset;
  Result.SLen := 0;
  Result.SCodePage := CodePage;
  l_Rest := f_BufS.SLen - f_BufferOffset;
  DoLoad;
  while not EOF do
  begin
   l_C := f_BufS.S[f_BufferOffset];
   IncPtr;
   Case l_C of
    cc_Null:
     if EOF then
      Exit
     else
      f_BufS.S[f_BufferOffset - 1] := cc_HardSpace;
    cc_SoftEnter:
     if SoftEnterAsEOL then
     begin
      Dec(Result.SLen);
      exit;
     end;
    cc_HardEnter:
    begin
     Dec(Result.SLen);
     // - выкидываем из конечной строки cc_HardEnter
     if EOF then
      Exit
     else
     begin
      if (f_BufS.S[f_BufferOffset] = cc_SoftEnter) then
      begin
       IncPtr;
       Dec(Result.SLen);
       // - выкидываем из конечной строки cc_SoftEnter
       if EOF then
        f_EOF := false;
       Exit;
      end//f_BufS.S[f_BufferOffset] = cc_SoftEnter
      else
      begin
       Exit;
      end;//f_BufS.S[f_BufferOffset] = cc_SoftEnter
     end;//EOF
    end;//cc_HardEnter
    cc_EOP:
    begin
     Assert(Result.SLen > 0);
     if (Result.SLen <= 1) then
      Result := cc_EOPStr
     else
      DecPtr;
     Exit;
    end;//cc_EOP
    else
     // - ничего не делаем;
   end;//Case l_C
  end;//while not EOF
 end;

begin
 if (f_Stream = nil) then
 begin
  l3AssignNil(Result);
  f_EOF := true;
 end//f_Stream = nil
 else 
 if (CodePage <> CP_Unicode) then
  ReadANSI
 else
  ReadUnicode;
end;

function Tl3CustomFiler.ReadHexLn(const aLineChars: TCharSet; aFinishChar: AnsiChar): Tl3WString;
{* - Считать строку с данными в шестнадцатиричном виде. В качестве параметра - допустимые символы. }

 procedure lp_ReadLine;
 var
  l_Rest : Integer;

  procedure DecPtr;
  begin
   Dec(f_BufferOffset);
   Inc(l_Rest);
   Dec(Result.SLen);
  end;

  procedure DoLoad;
  var
   l_Cnt : Integer;
   l_SaveOffset : Integer;
  begin
   if (l_Rest <= 0) then
   begin
    FreeAndNil(f_PrevBuffer);
    if (Result.SLen > 0) then
    // - остался кусок строки
    begin
     if (Result.SLen >= (f_BufSize * 3) div 4) then
     begin
      l_SaveOffset := Result.S - f_BufS.S;
      f_Buffer.StSize := f_Buffer.StSize + l3FilerBufSize;
      f_BufSize := f_Buffer.StSize;
      f_BufS := f_Buffer.AsWStr;
      Result.S := f_BufS.S + l_SaveOffset;
     end;//Result.SLen >= (f_BufSize * 3) div 4
     l3Move(Result.S^, f_BufS.S^, Result.SLen);
    end;//Result.SLen > 0
    f_BufferOffset := Result.SLen;
    l_Cnt := f_Stream.Read(f_BufS.S[f_BufferOffset], Pred(f_BufSize) - f_BufferOffset);
    Inc(f_StreamPos, l_Cnt);
    Indicator.Progress(Pos);
    f_Buffer.Len := l_Cnt + f_BufferOffset;
    if (f_BufS.SLen <> l_Cnt + f_BufferOffset) then
     f_BufS := f_Buffer.AsWStr;
    Result.S := f_BufS.S;
    l_Rest := f_BufS.SLen - f_BufferOffset;
    f_EOF := (l_Rest <= 0)
   end;//l_Rest <= 0
  end;

  procedure IncPtr;
  begin
   Inc(f_BufferOffset);
   Dec(l_Rest);
   Inc(Result.SLen);
   DoLoad;
  end;

 var
  l_C : AnsiChar;
 begin
  Result.S := f_BufS.S + f_BufferOffset;
  Result.SLen := 0;
  Result.SCodePage := CodePage;
  l_Rest := f_BufS.SLen - f_BufferOffset;
  DoLoad;
  while not EOF do
  begin
   l_C := f_BufS.S[f_BufferOffset];
   IncPtr;
   case l_C of
    cc_Null:
     if EOF then Exit;
    cc_EOP:
    begin
     Assert(Result.SLen > 0);
     if (Result.SLen <= 1) then
      Result := cc_EOPStr
     else
      DecPtr;
     Exit;
    end;//cc_EOP
    else
     if not (l_C in aLineChars) then
     begin
      if l_C = aFinishChar then
      begin
       DecPtr;
       Exit;
      end; // if l_C in aFinishChars then
     end; // if not (l_C in aLineChars) then
   end;//Case l_C
  end;//while not EOF
 end;

begin
 if (f_Stream = nil) then
 begin
  l3AssignNil(Result);
  f_EOF := True;
 end//f_Stream = nil
 else
  lp_ReadLine;
end;

function Tl3CustomFiler.MakeReadString(aLen      : Long;
                                       aCodePage : Long): Tl3String;
  {* - считать строку. }
var
 l_S : Tl3WString;
begin
 Result := Tl3String.Make(aCodePage);
 Result.Len := aLen;
 l_S := Result.AsWStr;
 if (l_S.SCodePage = CP_Unicode) then
  Read(l_S.S, aLen * SizeOf(WideChar))
 else
  Read(l_S.S, aLen * SizeOf(AnsiChar));
end;

function Tl3CustomFiler.GetC: Tl3Char;
  {-}
begin
 Result.rCodePage := CodePage;
 if (Result.rCodePage = CP_Unicode) then
 begin
  try
   Read(@Result.rWC, SizeOf(Result.rWC));
  except
   on El3ReadError do
    Result.rWC := cc_Null;
  end;//try..except
 end//Result.rCodePage = CP_Unicode
 else
 begin
  try
   Read(@Result.rAC, SizeOf(Result.rAC));
  except
   on El3ReadError do
    Result.rAC := cc_Null;
  end;//try..except
 end;//Result.rCodePage = CP_Unicode
end;

procedure Tl3CustomFiler.UngetC;
  {-}
begin
 if (CodePage = CP_Unicode) then
  Seek(-SizeOf(WideChar), soCurrent)
 else
  Seek(-SizeOf(ANSIChar), soCurrent);
end;

procedure Tl3CustomFiler.UngetChars(aCount: Integer);
begin
 if (CodePage = CP_Unicode) then
  Seek(-SizeOf(WideChar) * aCount, soCurrent)
 else
  Seek(-SizeOf(ANSIChar)* aCount, soCurrent);
end;

function Tl3CustomFiler.Write(C: Char): Long;
  {overload;}
  {-}
begin
 Result := Write(@C, SizeOf(C));
end;

function Tl3CustomFiler.Write(Buf: PAnsiChar; Count: Long): Long;
  {overload;}
  {-}
begin
 //if not Opened then
 // l3System.Stack2Log('Tl3CustomFiler.Write: Попытка писать в неоткрытый поток!');
 if Opened and (not ReadOnly) AND (Buf <> nil) then
 begin
  // старый код, не поднимающий exception'а
  //Result := f_Stream.Write(Buf^, Count);
  //Inc(f_StreamPos, Result);
  f_Stream.WriteBuffer(Buf^, Count);
  Result := Count;
  Inc(f_StreamPos, Count);
  Indicator.Progress(Pos);
 end//f_Stream <> nil..
 else
  Result := 0;
end;

function Tl3CustomFiler.Write(const S: AnsiString): Long;
  {overload;}
  {-}
begin
 Result := Write(PAnsiChar(S), Length(S));
end;

function Tl3CustomFiler.Write(const S: Tl3WString): Long;
  {overload;}
  {-}
var
 l_S : Tl3Str;
begin
 if (S.SCodePage = Self.CodePage) then
  Result := Self.Write(S.S, S.SLen)
 else
 begin
  l_S.Init(S, Self.CodePage);
  try
   Result := Self.Write(l_S.S, l_S.SLen);
  finally
   l_S.Clear;
  end;//try..finally
 end;//CodePage = Self.CodePage
end;

function Tl3CustomFiler.WriteLn(const S: Tl3WString): Long;
  //overload;
  {-}
begin
 Result := Write(S);
 Inc(Result, OutEOL);
end;

function Tl3CustomFiler.Write(S: Tl3PrimString): Long;
  {overload;}
  {-}
begin
 Result := Write(S.AsWStr);
end;

function Tl3CustomFiler.WriteLn(S: Tl3PrimString): Long;
  //overload;
  {-}
begin
 Result := Write(S);
 Inc(Result, OutEOL);
end;

function Tl3CustomFiler.WriteLn(const S: AnsiString): Long;
  //overload;
  {-}
begin
 Result := Write(S);
 Inc(Result, OutEOL);
end;

function Tl3CustomFiler.CloseQuery(Wnd: hWnd): Bool;
  {-запрос на закрытие}
begin
 if Indicator.InIO then
 begin
  fl_WndToClose := Wnd;
  AbortedLoad := true;
  Result := false;
 end//Indicator.InIO
 else
  Result := true;
end;

function Tl3CustomFiler.GetCodePage: Long;
  {-}
begin
 Mode := l3_fmRead;
 Open;
 try
  try
   if f_Buffer.Empty then
    if not LoadBuffer then
    begin
     Result := CP_ANSI;
     Exit;
    end;//not LoadBuffer
   Result := l3AnalizeCodePageExEx(f_Buffer.St, f_Buffer.St + f_Buffer.Len);
  finally
   Seek(0, soBeginning);
  end;{try..finally}
 finally
  Close;
 end;{try..finally}
end;{Analize}

procedure Tl3CustomFiler.AnalizeCodePage;
  {-}
begin
 CodePage := GetCodePage;
end;
  
procedure Tl3CustomFiler.Analize(var OEMCount, ANSICount: Long);
  {-}
begin
 Mode := l3_fmRead;
 Open;
 try
  try
   l3AnalizeCodePage(f_Buffer.St, f_Buffer.St + f_Buffer.Len, OEMCount, ANSICount);
  finally
   Seek(0, soBeginning);
  end;{try..finally}
 finally
  Close;
 end;{try..finally}
end;{Analize}

procedure Tl3CustomFiler.SkipEOL;
  {-}
begin
 if (GetC.rAC <> cc_HardEnter) then
  UngetC
 else if (GetC.rAC <> cc_SoftEnter) then
  UngetC;
end;

function Tl3CustomFiler.OutEOL: Long;
  {-}
begin
 if (CodePage = CP_Unicode) then
  Result := Write(PAnsiChar(PWideChar(cc_EOLW)), cc_EOLW_Size)
 else
  Result := Write(cc_EOL, cc_EOL_Len);
end;

function Tl3CustomFiler.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {override;}
  {-}
var
 l_FilerStream: Tl3FilerStream;
begin
 if IID.EQ(IStream) then
 begin
  l_FilerStream := Tl3FilerStream.Create(Self);
  try
   if not Opened then Open;
   if not Opened then
    Result.SetNoInterface
   else
    Result := Tl3HResult_C(l_FilerStream.QueryInterface(IStream, Obj));
  finally
   FreeAndNil(l_FilerStream);
  end;{try..finally}
 end//IID.EQ(IStream)
 else
 if IID.EQ(Im2StoreStat) then
 begin
  if Supports(f_Stream, IID.IID, Obj) then
   Result.SetOk
  else
   Result.SetNoInterface;
 end//IID.EQ(Im2StoreStat)
 else
  Result := inherited COMQueryInterface(IID, Obj);
end;

function Tl3CustomFiler.CheckLine(NeedChangeCodePage: Boolean = true): Tl3String;
  {-}
begin
 if (f_Line = nil) OR (f_Line.RefCount > 1) then
 begin
  FreeAndNil(f_Line);
  f_Line := Tl3String.Make(CodePage);
 end//f_Line = nil..
 else
 if NeedChangeCodePage then
  f_Line._CodePage := CodePage;
 Result := f_Line;
end;

function Tl3CustomFiler.Identifier: String;
  //virtual;
  {-}
begin
 if (f_Stream Is Tl3NamedTextStream) then
  Result := Tl3NamedTextStream(f_Stream).FileName
 else
 if (f_Stream Is Tl3NamedFileStream) then
  Result := Tl3NamedFileStream(f_Stream).FileName
 else
  Result := IntToStr(Handle);
end;

procedure Tl3CustomFiler.Flush;
  {-}
var
 l_Flush : Il3Flush;
begin
 if (Self <> nil) AND l3BQueryInterface(f_Stream, Il3Flush, l_Flush) then
  try
   l_Flush.Flush;
  finally
   l_Flush := nil;
  end;//try..finally
end;
  
{ Tl3CustomDOSFiler }

constructor Tl3CustomDOSFiler.Make(const aFileName     : String;
                                   anOpenMode          : Tl3FileMode = l3_fmRead;
                                   NeedAnalizeCodePage : Bool = true;
                                   aTimeOut            : Longword = Cl3FileStreamDefaultTimeOut);
  {* - создает Filer. }
begin
 Create;
 FileName := aFileName;
 TimeOut := aTimeOut;
 if (anOpenMode in [l3_fmRead, l3_fmReadWrite]) AND NeedAnalizeCodePage then AnalizeCodePage;
 Mode := anOpenMode;
end;

procedure Tl3CustomDOSFiler.pm_SetFileName(const Value: TFileName);
  {-}
begin
 if (f_FileName <> Value) then
 begin
  f_FileName := Value;
  Handle := 0; {-переоткрываем файл}
 end;//f_FileName <> Value
end;

procedure Tl3CustomDOSFiler.pm_SetTimeOut(Value: Longword);
  {-}
begin
 if (f_TimeOut <> Value) then
  f_TimeOut := Value;
 //f_TimeOut <> Value
end;

function Tl3CustomDOSFiler.DoOpen: Boolean;
begin
 Result := true;
 if (Mode = l3_fmRead) then
  f_Stream := Tl3NamedFileStream.Create(f_FileName, Mode, TimeOut)
 else
  f_Stream := Tl3NamedTextStream.Create(f_FileName, Mode, TimeOut);
end;

procedure Tl3CustomDOSFiler.Cleanup;
  //override;
  {-}
begin
 inherited;
 f_TimeOut := 0;
 f_FileName := '';
end;

function Tl3CustomDOSFiler.Identifier: String;
  //override;
  {-}
begin
 Result := FileName;
end;

// start class Tl3FilerStream

constructor Tl3FilerStream.Create(anOwner: Tl3CustomFiler);
  {reintroduce;}
  {-}
begin
 inherited Create;
 l3Set(f_Filer, anOwner);
end;

procedure Tl3FilerStream.Rollback;
  {* Откатить данные }
begin
 if (f_Filer <> nil) then
  f_Filer.Rollback;
end;

procedure Tl3FilerStream.Cleanup;
  {override;}
  {-}
begin
 FreeAndNil(f_Filer);
 inherited;
end;

function Tl3FilerStream.pm_GetFiler: Tl3CustomFiler;
  {-}
begin
 Result := f_Filer;
end;

procedure Tl3FilerStream.pm_SetFiler(Value: Tl3CustomFiler);
  {-}
begin
 l3Set(f_Filer, Value);
end;

function Tl3FilerStream.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  //override;
  {-}
begin
 Result.SetOk;
 if IID.EQ(Im2StoreStat) then
 begin
  if not Supports(f_Filer, IID.IID, Obj) then
   Result.SetNoInterface;
 end//IID.EQ(Im2StoreStat)
 else
  Result := inherited COMQueryInterface(IID, Obj);
end;

function Tl3FilerStream.GetSize: Int64;
begin
 Result := f_Filer.Size;
end;

function Tl3FilerStream.Read(var Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 Result := f_Filer.SizedRead(@Buffer, Count);
end;

function Tl3FilerStream.Write(const Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 Result := f_Filer.Write(@Buffer, Count);
end;

function Tl3FilerStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
  {override;}
  {-}
begin
 Result := f_Filer.Seek(Offset, Origin);
end;

function  l3L2FilerAction(Action: Pointer): Tl3FilerAction;
  {* - делает заглушку для локальной процедуры. }
  register;
  {-}
asm
          jmp  l3LocalStub
end;{asm}

procedure l3FreeFilerAction(var Stub: Tl3FilerAction);
  {* - освобождает заглушку для локальной процедуры. }
  register;
  {-}
asm
          jmp  l3FreeLocalStub
end;{asm}

end.
