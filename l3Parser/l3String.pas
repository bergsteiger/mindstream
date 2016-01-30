unit l3String;
{* Утилитные функции для работы со строками. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: evString - методы для работы со строками}
{ Начат: 12.12.1996                   }
{ $Id: l3String.pas,v 1.330 2015/10/12 10:59:18 lulin Exp $ }

// $Log: l3String.pas,v $
// Revision 1.330  2015/10/12 10:59:18  lulin
// - переводим искомую строку в верхний регистр.
//
// Revision 1.328  2015/09/21 13:52:13  lulin
// {RequestLink:607532796}
//
// Revision 1.327  2015/09/21 13:48:14  lulin
// {RequestLink:607532796}
//
// Revision 1.326  2015/09/21 11:23:32  lulin
// {RequestLink:607532057}
//
// Revision 1.325  2015/09/02 15:50:43  lulin
// - теперь можно заменять строку на другую, которая содержит искомую строку в качестве подстроки.
//
// Revision 1.324  2015/09/02 15:43:20  lulin
// - правим работу с Unicode.
//
// Revision 1.323  2015/09/02 15:38:59  lulin
// - правим работу с Unicode.
//
// Revision 1.322  2015/09/02 15:23:01  lulin
// - правим работу с Unicode.
//
// Revision 1.321  2015/09/02 15:12:54  lulin
// - правим работу с Unicode.
//
// Revision 1.320  2015/09/02 14:34:19  lulin
// - правим работу с Unicode.
//
// Revision 1.319  2015/08/24 16:56:28  lulin
// {RequestLink:606118757}. Так правильнее вообще-то. Через Unicode.
//
// Revision 1.318  2015/08/24 16:35:22  lulin
// {RequestLink:606118757}.
//
// Revision 1.316  2015/08/04 10:12:41  fireton
// - bug fix
//
// Revision 1.315  2015/05/29 14:36:33  lulin
// - рисуем на модели с улучшенной документацией.
//
// Revision 1.314  2015/03/16 15:04:42  lulin
// - делаем стереотипы Service и ServiceImplementation.
//
// Revision 1.313  2015/01/26 20:02:04  kostitsin
// рисуем Tl3CustomString
//
// Revision 1.312  2014/10/31 17:42:57  lulin
// - перетряхиваем код.
//
// Revision 1.311  2014/10/31 14:13:17  voba
//  k:570533875
//
// Revision 1.310  2014/09/26 09:50:33  fireton
// - упрощаем l3CharSetPresentExR
//
// Revision 1.309  2014/02/05 12:05:50  dinishev
// {Requestlink:515840797}
//
// Revision 1.308  2013/12/20 17:52:23  kostitsin
// [$508436306]
//
// Revision 1.307  2013/10/16 16:19:51  voba
// no message
//
// Revision 1.306  2013/07/31 10:31:39  fireton
// - копипаста в l3CharEx
//
// Revision 1.305  2013/07/08 16:43:15  lulin
// - выделяем работу с размером куска памяти.
//
// Revision 1.304  2013/04/25 13:20:27  morozov
// {$RequestLink:363571639}
//
// Revision 1.303  2013/04/19 13:08:17  lulin
// - портируем.
//
// Revision 1.302  2013/04/05 16:45:00  lulin
// - портируем.
//
// Revision 1.301  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.300  2013/03/28 17:25:04  lulin
// - портируем.
//
// Revision 1.299  2013/03/28 16:13:50  lulin
// - портируем.
//
// Revision 1.298  2013/03/28 14:03:17  lulin
// - портируем.
//
// Revision 1.297  2013/03/20 08:45:45  kostitsin
// [$439425018] - PosEx
//
// Revision 1.296  2013/01/25 05:35:38  narry
// Функция l3IntToRoman
//
// Revision 1.295  2012/11/22 10:33:36  dinishev
// {Requestlink:409757935}
//
// Revision 1.294  2012/11/19 11:39:00  voba
// - add function l3RTrim overload
//
// Revision 1.293  2012/11/08 13:07:40  voba
// - поправил K:407762188
//
// Revision 1.292  2012/11/07 09:44:44  voba
// - add overload function l3ReplaceNonReadable
//
// Revision 1.291  2012/07/16 11:18:17  voba
// no message
//
// Revision 1.290  2012/05/23 11:32:52  kostitsin
// эхо копипасты
//
// Revision 1.289  2012/02/08 09:17:25  lulin
// {RequestLink:333549305}
//
// Revision 1.288  2012/01/24 10:08:19  fireton
// - формы l3Upper и l3Lower, принимающие Tl3WString
//
// Revision 1.287  2011/12/20 13:33:11  fireton
// - l3Pos без учёта регистра
// - l3PosEx
//
// Revision 1.286  2011/11/28 11:29:57  fireton
// - l3GetSuffix
//
// Revision 1.285  2011/11/03 16:06:35  lulin
// {RequestLink:296622673}
//
// Revision 1.284  2011/09/07 12:47:02  fireton
// - Min64 и Max64
//
// Revision 1.283  2011/08/08 10:03:14  voba
// - Refact. l3Dup
//
// Revision 1.282  2011/06/29 14:38:46  lulin
// {RequestLink:254944102}.
//
// Revision 1.281  2011/05/16 08:52:40  lulin
// {RequestLink:265406789}.
// - подготавливаем инфраструктуру.
//
// Revision 1.280  2011/03/25 10:30:12  voba
// - add function l3ArrayToPCharLen
//
// Revision 1.279  2011/03/10 15:29:49  lulin
// {RequestLink:228688510}.
// - впихиваем ТС в специально подготовленный контейнер.
//
// Revision 1.278  2010/12/07 15:55:11  lulin
// {RequestLink:228688602}.
// - что-то задышало.
//
// Revision 1.277  2010/10/15 12:59:34  lulin
// {RequestLink:236716751}.
//
// Revision 1.276  2010/10/04 14:08:28  fireton
// - const перед Tl3WString и Il3CString
//
// Revision 1.275  2010/09/28 13:06:11  fireton
// - Распределяем память для PAnsiChar своими средствами
//
// Revision 1.274  2010/09/21 11:06:56  fireton
// - переводим деревья с PAnsiChar на Tl3WString
//
// Revision 1.273  2010/09/16 11:36:42  lulin
// {RequestLink:235048829}.
//
// Revision 1.272  2010/09/15 10:07:25  fireton
// - l3StrToIntDef
//
// Revision 1.271  2010/06/23 18:06:14  lulin
// {RequestLink:219124975}.
//
// Revision 1.270  2010/05/26 16:38:39  lulin
// {RequestLink:216073642}.
//
// Revision 1.269  2010/05/14 10:34:27  lulin
// {RequestLink:211879983}.
// - сделана ещё одна версия l3Pos.
// - поправлены Антошины ошибки.
//
// Revision 1.268  2010/05/07 14:01:05  fireton
// - неправильно считалась длина строки
//
// Revision 1.267  2010/05/06 14:43:18  lulin
// {RequestLink:210043160}.
//
// Revision 1.266  2010/04/26 11:33:17  lulin
// {RequestLink:206504616}.
// - информируем об удалении символов, при удалении двойных пробелов.
//
// Revision 1.265  2010/04/26 11:21:06  lulin
// {RequestLink:206504616}.
// - информируем об удалении символов, при удалении двойных пробелов.
//
// Revision 1.264  2010/04/02 09:53:53  fireton
// - _l3Copy для Tl3WString
//
// Revision 1.263  2010/03/16 18:18:16  lulin
// {RequestLink:197494962}.
// - bug fix: не передавали список разделителей.
//
// Revision 1.262  2010/03/16 18:13:39  lulin
// {RequestLink:197494962}.
// - избегаем ненужного перераспределения памяти.
//
// Revision 1.261  2010/03/16 17:07:02  lulin
// {RequestLink:197494962}.
// - используем "кошерный" метод разделения строкина две.
//
// Revision 1.260  2010/03/11 13:23:45  voba
// - add function l3IsUpper
//
// Revision 1.259  2010/01/27 14:34:29  fireton
// - l3RomanToInt
//
// Revision 1.258  2010/01/22 10:31:54  narry
// - Обновление
//
// Revision 1.257  2009/12/23 12:23:54  lulin
// [$175539070].
//
// Revision 1.256  2009/12/21 17:35:18  lulin
// - читаем предыдущие замеры времени из К и выводим их обратно.
//
// Revision 1.255  2009/12/18 15:01:24  lulin
// - пробуем поправить l3Starts с разными кодировками.
//
// Revision 1.254  2009/12/04 09:00:51  fireton
// - l3Ends
//
// Revision 1.253  2009/11/16 15:46:14  voba
// - add overload function l3CharSetPresentEx
//
// Revision 1.252  2009/09/28 08:54:55  voba
// - add procedure l3PCharLenToArray
//
// Revision 1.251  2009/09/25 10:33:28  voba
// - add function l3StrToInt
//
// Revision 1.250  2009/09/17 16:06:24  lulin
// {RequestLink:163067150}.
//
// Revision 1.249  2009/09/17 12:40:26  voba
// - bug fix function l3Starts
//
// Revision 1.248  2009/07/21 13:03:52  lulin
// - более правильно приводим к константным строкам.
//
// Revision 1.247  2009/07/21 12:43:11  lulin
// - убираем ненужные приведения типов.
//
// Revision 1.246  2009/07/20 16:44:09  lulin
// - убираем из некоторых листьевых параграфов хранение типа конкретного тега, вместо этого "плодим" под каждый тип тега свой тип класса.
//
// Revision 1.245  2009/07/02 06:51:47  dinishev
// [$152408421]
//
// Revision 1.244  2009/06/08 16:46:29  lulin
// - типа если текст блока уже есть в самом параграфе, то не выводим его.
//
// Revision 1.243  2009/06/03 13:34:32  dinishev
// Не наделяем лишней функциональнюстью l3IsWhiteSpace
//
// Revision 1.242  2009/06/03 13:02:45  dinishev
// Bug fix: помним про Unicode и Win 2000.
//
// Revision 1.241  2009/06/03 10:48:55  dinishev
// Bug fix: не всегда правильно позиционировались
//
// Revision 1.240  2009/05/12 12:37:45  voba
// - function l3MakeUpperCase, l3MakeLowerCase сделал aCodePage по умолчанию
//
// Revision 1.239  2009/04/28 06:50:55  voba
// - function l3IsWordDelim переехали в l3String
//
// Revision 1.238  2009/04/22 12:05:24  lulin
// [$124453728]. Делаем проверку на то что ссылка находится в домене Гаранта.
//
// Revision 1.237  2009/02/05 13:28:53  lulin
// - <K>: 125895391. Используем уже посчитанные длины, а не считаем их заново.
//
// Revision 1.236  2009/01/21 09:14:04  lulin
// - не возвращали результат.
//
// Revision 1.235  2009/01/16 10:03:00  voba
// - ADD function  l3ArrayToCString
//
// Revision 1.234  2009/01/15 09:14:18  lulin
// - переделываем на case.
//
// Revision 1.233  2009/01/15 09:10:11  lulin
// - поддерживаем преобразование регистра символов в Юникоде.
//
// Revision 1.232  2009/01/15 09:07:47  lulin
// - поддерживаем преобразование регистра символов в татарском.
//
// Revision 1.231  2009/01/14 07:12:00  voba
// - bug fix
//
// Revision 1.230  2008/12/29 10:30:08  voba
// - add function l3StringRPos
//
// Revision 1.229  2008/12/18 13:45:10  lulin
// - <K>: 132222370. Поддерживаем работу с кодировкой TatarOEM.
//
// Revision 1.228  2008/12/15 16:06:19  lulin
// - <K>: 131137753.
//
// Revision 1.227  2008/12/15 14:24:02  lulin
// - <K>: 130744814.
//
// Revision 1.226  2008/08/25 11:34:43  lulin
// - не добавляем точку к наклонным пробелам. <K>: 109904354.
//
// Revision 1.225  2008/08/12 11:09:06  lulin
// - <K>: 104433592.
//
// Revision 1.224  2008/08/01 14:43:47  dinishev
// <K> : 77235623
//
// Revision 1.223  2008/06/24 12:10:17  dinishev
// Поддержка преобразования к верхнему регистру в TevEdit при вставке из буфера
//
// Revision 1.222  2008/05/06 13:10:42  dinishev
// Bug fix: недолечили учет DrawSpecial
//
// Revision 1.221  2008/04/23 12:15:58  oman
// - fix: Не учитывали CaseInsensitive (cq28936)
//
// Revision 1.220  2008/03/11 11:29:13  lulin
// - <K>: 85721297.
//
// Revision 1.219  2008/01/31 10:53:08  oman
// - fix: Для Unicode работали как с PAnsiChar
//
// Revision 1.218  2007/10/04 16:30:13  lulin
// - определяем количество параметров.
//
// Revision 1.217  2007/10/04 15:47:01  lulin
// - добавлены параметры команд.
//
// Revision 1.216  2007/08/30 11:37:00  voba
// no message
//
// Revision 1.213.2.2  2007/08/20 06:33:02  voba
// no message
//
// Revision 1.213.2.1  2007/07/26 12:09:44  voba
// - add function l3NativeAllocPChar
//
// Revision 1.215  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.214  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.213  2007/07/11 13:24:40  fireton
// - в l3StringToArray теперь можно указать символ для padding'а
//
// Revision 1.212  2007/06/01 08:57:23  lulin
// - добавлена функция определения того равна строка одному из заданных значений из списка.
//
// Revision 1.211  2007/05/16 13:06:51  oman
// - fix: _l3Split начинала копировать не с той позиции, но правильной длины
//
// Revision 1.210  2007/04/17 11:57:22  lulin
// - добавлены функции преобразования строки с кодировкой к имени файла.
//
// Revision 1.209  2007/04/10 13:20:13  lulin
// - используем строки с кодировкой.
//
// Revision 1.208  2007/04/05 13:35:28  oman
// - fix: Неправильно удаляли дублирующиеся символы (cq24876)
//
// Revision 1.207  2007/04/05 11:41:03  lulin
// - теперь по-умолчанию у списка строк более правильное свойство.
//
// Revision 1.206  2007/03/30 07:46:17  lulin
// - избавляемся от ассерта (CQ OIT5-24834).
//
// Revision 1.205  2007/03/29 18:17:23  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.204  2007/03/29 15:54:38  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.203  2007/03/29 13:04:09  lulin
// - добавлена функция удаления подстроки.
//
// Revision 1.202  2007/03/29 12:49:02  lulin
// - вроде упрощаем проверку.
//
// Revision 1.201  2007/03/29 12:35:19  lulin
// - избегаем копирования.
//
// Revision 1.200  2007/03/28 15:03:43  lulin
// - переводим ЭлПаковские параграфы на строки с кодировкой.
//
// Revision 1.199  2007/03/28 13:20:15  lulin
// - добавлены функции распиливания строки на две по заданному разделителю.
//
// Revision 1.198  2007/03/28 13:07:05  lulin
// - bug fix: падали при форматировании строки с вещественными числами (CQ OIT5-24719).
//
// Revision 1.197  2007/03/23 15:35:40  voba
// - bug fix
//
// Revision 1.196  2007/03/21 12:41:47  lulin
// - правильнее отрезаем строку по концу строки.
//
// Revision 1.195  2007/03/19 12:44:51  lulin
// - избавляемся от копирования данных.
//
// Revision 1.194  2007/03/19 11:43:33  lulin
// - при установке нулевой длины возвращаем нулевой указатель, а не пустой объект.
//
// Revision 1.193  2007/03/19 09:33:24  lulin
// - bug fix: неправильно получали доступ к данным объекта, в результате - AV (CQ OIT5-24696).
//
// Revision 1.192  2007/03/16 09:55:44  lulin
// - добавлена функция обрезания строки справа и функция установке строке длины.
//
// Revision 1.191  2007/03/15 14:48:21  lulin
// - используем свою реализацию функции форматирования строки.
//
// Revision 1.190  2007/03/15 14:37:24  lulin
// - используем параметры переменного типа.
//
// Revision 1.189  2007/03/15 13:57:48  lulin
// - сделана заготовка функции форматирования строк.
//
// Revision 1.188  2007/03/15 13:16:35  lulin
// - добавлено еще два метода сложения строк.
//
// Revision 1.186  2007/03/15 12:51:31  lulin
// - cleanup.
//
// Revision 1.185  2007/03/15 12:40:17  lulin
// - добавлены еще два метода преобразования строк и один для сравнения.
//
// Revision 1.184  2007/03/14 18:27:35  lulin
// - cleanup.
//
// Revision 1.183  2007/03/14 16:52:26  lulin
// - добавлена процедура поиска символа в константной строке.
//
// Revision 1.182  2007/03/12 09:01:12  lulin
// - bug fix: неправильно проверяли юникодные символы.
//
// Revision 1.181  2007/03/09 15:55:11  lulin
// - не копируем строки, определенные, как константы.
//
// Revision 1.180  2007/03/07 13:53:11  lulin
// - cleanup.
//
// Revision 1.179  2007/03/05 14:58:22  lulin
// - добавлены еще несколько версий функций отрезания набора символа с начала строки.
//
// Revision 1.178  2007/03/05 14:26:40  lulin
// - удалена КРАЙНЕ вредная функция.
//
// Revision 1.177  2007/03/05 13:45:57  lulin
// - добавлена функция замены символа на подстроку.
//
// Revision 1.176  2007/03/05 11:31:33  lulin
// - для работы с колонтитулами используем строки с кодировкой.
//
// Revision 1.175  2007/03/05 10:15:31  lulin
// - добавлена функция замены подстроки.
//
// Revision 1.174  2007/03/05 09:42:56  lulin
// - cleanup.
//
// Revision 1.173  2007/03/02 12:11:45  lulin
// - теперь родные метки работают со строками с кодировками.
//
// Revision 1.172  2007/03/01 13:08:48  lulin
// - используем модификаторы константности и отложенно грузим ресурсные строки.
//
// Revision 1.171  2007/02/28 15:23:04  lulin
// - добавлена еще одна версия функции отрезания набора символов в начале и конце строки.
//
// Revision 1.170  2007/02/21 13:09:59  oman
// - fix: Если строки указывали на одно и то же, но отличались
//  длиной (SLen), то они считались равными. Что неверно.
//
// Revision 1.169  2007/02/16 17:17:28  lulin
// - избавляемся от стандартного строкового типа.
//
// Revision 1.168  2007/02/16 15:36:11  lulin
// - cleanup.
//
// Revision 1.167  2007/02/16 15:17:06  lulin
// - cleanup.
//
// Revision 1.166  2007/02/16 14:53:03  lulin
// - bug fix: исправлена ошибка потери строки и бесконечной рекурсии.
//
// Revision 1.165  2007/02/16 13:28:43  lulin
// - добавлены процедуры удаления символов.
//
// Revision 1.164  2007/02/16 12:38:24  lulin
// - правильнее проверяем симол на вхождение в набор.
//
// Revision 1.163  2007/02/16 12:19:14  lulin
// - cleanup.
//
// Revision 1.162  2007/02/14 16:15:44  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.161  2007/02/14 14:24:22  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.160  2007/02/13 17:32:59  lulin
// - избавляемся от использования стандартной функции поиска подстроки в строке.
//
// Revision 1.159  2007/02/13 17:15:05  lulin
// - добавлены функции обрабокти строк с кодировкой.
//
// Revision 1.158  2007/02/13 16:36:47  lulin
// - используем более простые функции сравнения.
//
// Revision 1.157  2007/02/13 16:17:08  lulin
// - наводим порядок с кодироваками.
//
// Revision 1.156  2007/02/13 15:48:14  lulin
// - избавляемся от лишнего копирования.
//
// Revision 1.155  2007/02/13 15:42:10  lulin
// - избавляемся от лишних преобразований строк - добавлены функции сложения строк, обладающих кодировкой.
//
// Revision 1.154  2007/02/13 14:46:11  lulin
// - cleanup.
//
// Revision 1.153  2007/02/13 08:35:22  lulin
// - метод переименован в соответствии с его функциональность.
//
// Revision 1.152  2007/02/12 18:45:06  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.151  2007/02/12 16:40:36  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.150  2007/02/09 14:40:01  voba
// - buf fix (Шура чото наменял)
//
// Revision 1.149  2007/02/08 15:01:38  lulin
// - функции работы с форматкой выделены в модуль работы со строками.
//
// Revision 1.148  2007/02/08 13:55:48  lulin
// - bug fix: падали с Assert при проверке информации о пользователе (CQ OIT5-24388).
//
// Revision 1.147  2007/02/08 11:38:29  lulin
// - упрощаем сравнение строк.
//
// Revision 1.146  2007/02/07 17:48:48  lulin
// - избавляемся от копирования строк при чтении из настроек.
//
// Revision 1.145  2007/02/07 14:30:38  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.144  2007/02/06 15:21:20  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.143  2007/02/05 12:30:00  lulin
// - добавлена еще один комплект функций отрезания "пробелов".
//
// Revision 1.142  2007/02/05 12:13:40  lulin
// - избвляемся от функций отрезания пробелов, которые копировали данные.
//
// Revision 1.141  2007/02/02 13:59:21  lulin
// - выделен интерфейс константной строки.
//
// Revision 1.140  2007/02/02 13:35:31  lulin
// - bug fix: неправильно определяли - пустое значение или нет.
//
// Revision 1.139  2007/02/02 08:39:24  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.138  2007/01/30 15:24:25  lulin
// - текст ноды - теперь более простого типа.
//
// Revision 1.137  2007/01/24 14:14:48  lulin
// - в подменю, основного меню не жили ссылки на операции модуля.
//
// Revision 1.136  2007/01/10 15:31:46  lulin
// - cleanup.
//
// Revision 1.135  2007/01/09 10:05:24  voba
// - rename function l3StringToPCharAlloc to l3PCharAlloc
//
// Revision 1.134  2006/12/01 16:00:31  lulin
// - cleanup.
//
// Revision 1.133  2006/12/01 15:51:04  lulin
// - cleanup.
//
// Revision 1.132  2006/11/27 10:06:54  lulin
// - cleanup.
//
// Revision 1.131  2006/11/27 09:02:16  lulin
// - cleanup.
//
// Revision 1.130  2006/11/27 08:43:26  lulin
// - cleanup.
//
// Revision 1.129  2006/11/25 14:53:55  lulin
// - bug fix: не компилировалось.
//
// Revision 1.128  2006/11/25 14:36:23  lulin
// - cleanup.
//
// Revision 1.127  2006/11/25 14:31:53  lulin
// - корректнее записываем текст, который в кодировке, отличной от кодировки записываемого файла.
//
// Revision 1.126  2006/05/04 11:01:26  lulin
// - поправлен тип длины строки.
// - вычищены "старые" методы работы с памятью и строками.
//
// Revision 1.125  2006/05/02 12:55:10  lulin
// - cleanup.
//
// Revision 1.124  2006/04/03 08:47:56  voba
// - add function l3CountOfChar
//
// Revision 1.123  2006/03/24 09:08:29  lulin
// - new behavior: не выливаем не русские заголовки.
//
// Revision 1.122  2005/11/16 07:48:26  voba
// - odd overload function ev_lpDeleteDoubleSpace(const S: Tl3PCharLen): Tl3PCharLen;
//
// Revision 1.121  2005/10/06 11:43:20  voba
// - add proc. l3ConcatText
//
// Revision 1.120  2005/09/08 15:23:14  lulin
// - bug fix: Unicode-строки неправильно разгонялись по ширине.
//
// Revision 1.119  2005/08/03 16:18:22  vaso
// - bug fix: В функции l3PCharLen2String явно инициализируем Result
//
// Revision 1.118  2005/08/03 15:44:17  vaso
// - bug fix: В функции l3PCharLen2String явно инициализируем Result
//
// Revision 1.117  2005/06/21 16:27:29  lulin
// - new proc version: _l3PCharLen.
//
// Revision 1.116  2005/05/31 13:26:13  fireton
// - add: добавлена функция _l3ExtractWord
//
// Revision 1.115  2005/05/28 10:39:59  dinishev
// Новая процедура: l3ReplaceChar
//
// Revision 1.114  2005/04/01 14:16:37  mmorozov
// new behaviour: при сортировке исполльзуем LCID_RUSSIAN (раньше использовалась страница по умолчанию и на не русской локали сортировка была не верной);
//
// Revision 1.113  2005/04/01 10:48:34  fireton
// - форматирование кода
//
// Revision 1.112  2005/03/18 12:44:34  voba
// - bug fix l3ArrayToPChar
//
// Revision 1.111  2005/03/03 14:06:00  fireton
// - add: новая функция - ev_lpCharset2Indent
//
// Revision 1.110  2005/01/24 11:43:23  lulin
// - new behavior: при освобождении заглушки очищаем указатель на нее.
//
// Revision 1.109  2005/01/19 13:52:56  fireton
// - add: новая функция l3RTrimCharset
//
// Revision 1.108  2004/12/09 13:50:18  lulin
// - bug fix: функция подсчета числа символов не учитывала Unicode.
//
// Revision 1.107  2004/12/09 12:49:53  lulin
// - bug fix: в Unicode-строках не учитывались Enter'ы.
//
// Revision 1.106  2004/09/14 15:58:18  lulin
// - удален модуль Str_Man - используйте вместо него - l3String.
//
// Revision 1.105  2004/08/06 15:03:28  law
// - избавился от части Warnings/Hints.
//
// Revision 1.104  2004/08/06 09:01:34  voba
// - add
//      function l3TrimAll(St: PAnsiChar; var StLen: Long) : PAnsiChar;
//      function l3ReplaceNonReadable(St: PAnsiChar; StLen: Long = -1) : PAnsiChar;
//      function l3ReplaceNonReadable(const St: AnsiString) : AnsiString;
//      function l3ReplaceNonReadable(const S: Tl3PCharLen): Tl3PCharLen;
//      function  l3Trim(const S: Tl3PCharLen): Tl3PCharLen;
//      function  l3TrimAll(const S: Tl3PCharLen): Tl3PCharLen;
//
// Revision 1.103  2004/08/05 13:52:40  law
// - new proc: l3HasChar.
//
// Revision 1.102  2004/06/18 10:15:46  law
// - класс _TevTextPara стал крайне аскетичным.
//
// Revision 1.101  2004/05/25 14:39:55  law
// - new procs: l3String.l3ParseWordsEx, l3ParseWordsExF.
//
// Revision 1.100  2004/05/25 07:59:05  voba
// - bug fix
//
// Revision 1.99  2004/05/13 11:28:07  narry
// - bug fix
//
// Revision 1.98  2004/05/12 13:46:27  law
// - bug fix: поправлена недоделка с удалением пробелов в начале Unicode-строк.
//
// Revision 1.97  2004/05/12 13:03:27  law
// - rename proc: ev_lpLTrim -> _l3LTrim.
//
// Revision 1.96  2004/05/12 12:50:38  law
// - bug fix: поправлена недоделка с удалением пробедов в конце Unicode-строк.
//
// Revision 1.95  2004/05/12 12:39:04  law
// - rename proc: ev_lpRTrimLen -> l3RTrimLen.
//
// Revision 1.94  2004/04/29 15:37:17  law
// - new proc: l3IsWhiteSpaceS.
//
// Revision 1.93  2004/04/29 15:25:59  law
// - bug fix: забыл букву "W".
//
// Revision 1.92  2004/04/29 15:20:09  law
// - bug fix: инструкция JCXZ заменнена на более правильную JECXZ.
// - bug fix: l3HasWhiteSpace теперь должна нормально работать и для Unicode строк.
//
// Revision 1.91  2004/04/29 15:05:19  law
// - rename proc: evWhiteSpace -> l3IsWhiteSpace.
//
// Revision 1.90  2004/04/29 14:09:18  law
// - bug fix: функция l3FindChar должна корректно обрабатывать Unicode.
//
// Revision 1.89  2004/04/21 14:23:22  law
// - вернул функцию ev_lpRTrimLen.
//
// Revision 1.88  2004/04/21 12:26:55  law
// - new behavior: заглушки для Unicode.
//
// Revision 1.87  2004/04/21 11:14:07  law
// - change: используем _l3RTrim вместо ev_lpRTrimLen.
//
// Revision 1.86  2004/04/20 15:03:19  law
// - cleanup: из l3String вычистил все, что относилось к Win16.
//
// Revision 1.85  2004/04/20 14:53:43  law
// - new method: Tl3PCharLen.InitPart.
// - remove proc: ev_plAssign.
//
// Revision 1.84  2004/04/19 16:08:23  law
// - new type: _Tl3PCharLenConst.
//
// Revision 1.83  2004/04/19 14:12:00  law
// - bug fix: боремся с неправильным форматированием Unicode-строк.
//
// Revision 1.82  2004/04/19 13:23:19  voba
// - impruvement l3CharSetPresentEx если длина строки = -1 то обрабатываем как оканчивающуюся на ноль
//
// Revision 1.81  2004/04/14 14:59:18  law
// - rename proc: ev_lpCharSetPresent -> l3CharSetPresent.
//
// Revision 1.80  2004/04/14 14:29:44  law
// - new proc version: function l3KeyToUnicode(aMsg: TWMKeyDown): _WideString.
//
// Revision 1.79  2004/04/14 08:51:04  law
// - new procs: l3KeyboardCodePage, l3KeyToUnicode.
//
// Revision 1.78  2004/03/31 16:24:25  law
// -  наведено подобие порядка с StringToPCharAlloc.
//
// Revision 1.77  2004/01/22 13:18:05  law
// - new procs: l3L2WA, l3FreeWA, l3ParseWordsF.
// - new proc version: l3ParseWords.
//
// Revision 1.76  2004/01/09 12:24:43  law
// - new procs: l3OEM2ANSI, l3ANSI2OEM.
//
// Revision 1.75  2003/12/02 08:18:52  voba
// no message
//
// Revision 1.74  2003/09/29 15:10:42  law
// - new proc: _l3Cat.
//
// Revision 1.73  2003/09/23 08:38:02  law
// - new prop: IevHyperlink.Hint.
// - rename proc: ev_plAssignNil -> l3AssignNil.
//
// Revision 1.72  2003/08/20 14:23:40  step
// Исправлена таблица транслитерации для l3Transliterate
//
// Revision 1.71  2003/08/19 18:04:12  step
// Добавлена function l3Transliterate
//
// Revision 1.70  2003/07/24 15:35:01  narry
// - new: функции дополнения строки слева символами (l3LeftPadChar и l3LeftPad)
//
// Revision 1.69  2003/05/13 07:59:06  law
// - rename proc: ev_plHasWhiteSpace -> l3HasWhiteSpace.
//
// Revision 1.68  2003/05/12 12:51:27  law
// - new behavior: в режиме отображения спецсимволов сделана отрисовка табуляции в виде стрелочки.
//
// Revision 1.67  2003/05/12 09:20:25  law
// - rename proc: ev_plIsNil -> l3IsNil.
//
// Revision 1.66  2003/04/15 15:09:15  law
// - bug fix: валился линкер с опцией Include TD32 Debug Info.
//
// Revision 1.64  2003/03/13 16:37:21  law
// - change: попытка портировать на Builder.
//
// Revision 1.63  2002/09/09 13:25:05  law
// - cleanup.
//
// Revision 1.62  2002/09/04 12:45:56  law
// - new proc: l3MaskNormalize, l3MaskCompare.
//
// Revision 1.61  2002/07/23 11:04:39  law
// - rename proc: ev_lpCharSetPresentEx -> l3CharSetPresentEx.
//
// Revision 1.60  2002/07/10 10:05:43  law
// - new param: anExcept.
//
// Revision 1.59  2002/07/03 11:07:50  law
// - new proc: l3AddBackSlashL.
//
// Revision 1.58  2002/06/03 13:19:39  law
// - new behavior: сделана вставка в "резиновые" псевдотаблицы в режиме рисования линий.
//
// Revision 1.57  2002/06/03 12:31:51  law
// - new func: l3CharSetPresentExR.
//
// Revision 1.56  2002/05/13 12:32:57  law
// - new behavior: сбор информации о словах с переносами.
//
// Revision 1.55  2002/04/19 16:22:48  law
// - change: Tl3WordAction - теперь функция. Должна возвращать true для продолжения перебора слов.
//
// Revision 1.54  2002/04/19 12:55:15  law
// - new proc: l3ParseWords.
//
// Revision 1.53  2002/04/05 14:11:18  law
// - bug fix.
//
// Revision 1.52  2002/03/25 14:39:23  law
// - cleanup: избавляемся от ненужных регулярных выражений.
//
// Revision 1.51  2002/03/22 14:52:17  law
// - rename proc.
//
// Revision 1.50  2002/03/21 12:09:04  law
// - new procs.
//
// Revision 1.49  2002/03/12 09:31:41  law
// - bug fix: неправильно сравнивались строки без #0 в конце -> в хранилище могли появиться дублирующиеся элементы.
//
// Revision 1.48  2002/03/04 12:11:40  voba
// no message
//
// Revision 1.47  2002/02/27 17:06:24  law
// - optimization: попытка оптимизации путем применения менеджера памяти, выделяющего большие блоки.
//
// Revision 1.46  2002/02/26 15:48:08  law
// - optimization: попытка оптимизации путем уменьшения фрагментации выделяемой памяти.
//
// Revision 1.45  2002/02/11 16:24:10  law
// - rename proc: evIsWordDelim -> l3IsWordDelim.
//
// Revision 1.44  2002/02/11 13:40:03  law
// - new behavior: изменен алгоритм перенесения слов по слогам.
//
// Revision 1.43  2002/02/06 11:36:43  law
// - bug fix: не всегда учитывалась кодировка исходной строки.
//
// Revision 1.42  2002/02/05 08:18:14  law
// - remove proc: ev_plPas (остался ее аналог l3PCharLen2String).
//
// Revision 1.41  2002/02/05 08:09:51  law
// - comments: xHelpGen.
//
// Revision 1.40  2002/02/05 08:05:15  law
// - bug fix: неправильно переносились не ANSI-строки.
//
// Revision 1.39  2002/01/10 08:26:20  law
// - new proc version: _l3PCharLen.
//
// Revision 1.38  2002/01/09 13:06:36  law
// - bug fix: не сравнивались две строки с CP_Unicode.
//
// Revision 1.37  2001/12/27 15:51:57  law
// - new proc version: версии _l3StrLen и _l3PCharLen для Unicode.
//
// Revision 1.36  2001/12/27 15:32:27  law
// - rename proc: l3GetStrLen -> _l3StrLen.
//
// Revision 1.35  2001/12/25 13:08:48  law
// - new unit: m4SearchExEx.
//
// Revision 1.34  2001/12/24 13:20:41  law
// - cleanup.
//
// Revision 1.33  2001/12/19 15:37:56  law
// - new behavior: сделаны поисковые операции ИЛИ и И.
//
// Revision 1.32  2001/10/01 14:07:23  law
// - new unit: l3XLatTables.
//
// Revision 1.31  2001/09/24 13:17:45  law
// - new proc: l3PCharLen2String.
//
// Revision 1.30  2001/09/21 16:49:05  law
// - new proc: from RX.
//
// Revision 1.29  2001/09/21 11:41:36  narry
// - change: часть функций перетащено из RX.
//
// Revision 1.28  2001/09/11 17:46:36  law
// - some new features.
//
// Revision 1.27  2001/08/31 11:38:45  law
// - cleanup & comments.
//
// Revision 1.26  2001/08/30 16:34:38  law
// - new version: портировал на Delphi 6.
//
// Revision 1.25  2001/08/28 12:55:13  law
// - rename unit: evUtils -> l3Utils.
//
// Revision 1.24  2001/07/27 15:46:04  law
// - comments: xHelpGen.
//
// Revision 1.23  2001/06/28 15:02:42  law
// - cleanup: убраны связи с RX.
//
// Revision 1.22  2001/04/11 17:24:11  law
// - new function: l3StringCase.
//
// Revision 1.21  2001/04/10 16:30:18  law
// - comments: добавлены комментарии для xHelpGen.
//
// Revision 1.20  2001/03/06 12:17:33  narry
// - добавлена еще одна версия функции _l3Compare.
//
// Revision 1.19  2001/01/04 11:27:13  law
// - bug fix: немного изменен метод подсчета табуляций при вычислении левого отступа строки.
//
// Revision 1.18  2000/12/20 14:57:34  law
// - изменен алгоритм вычленения слова.
//
// Revision 1.17  2000/12/18 17:30:32  law
// - добавлен перенос по слогам.
//
// Revision 1.16  2000/12/15 15:19:02  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  SysUtils,

  Windows,
  Messages,

  l3Chars,
  l3Types,
  l3Interfaces,
  ElStrUtils
  ;

type
  Tl3WordAction = function(const aStr : Tl3PCharLen;
                           IsLast     : Bool): Bool;
  Tl3WordEvent = function(const aStr : Tl3PCharLen;
                          IsLast     : Bool): Bool of object;
  Tl3CheckSimbolProc = function (aSimbol: AnsiChar): Boolean;

function  l3Dup(const aStr: AnsiString; aCount: Integer; aSep: AnsiChar): AnsiString;
  {-}
procedure l3ParseWordsEx(const aStr   : Tl3WString;
                         anAction     : Tl3WordAction;
                         const aDelim : TCharSet);
  overload;
  {* - разбирает строку на слова. }
procedure l3ParseWordsEx(const aStr   : Tl3WString;
                         anAction     : Tl3WordEvent;
                         const aDelim : TCharSet);
  overload;
  {* - разбирает строку на слова. }
procedure l3ParseWordsExF(const aStr   : Tl3WString;
                          anAction     : Tl3WordAction;
                          const aDelim : TCharSet);
  {* - разбирает строку на слова. }

procedure l3ParseWords(const aStr     : Tl3WString;
                       anAction       : Tl3WordAction;
                       const anExcept : TCharSet = []);
  overload;
  {* - разбирает строку на слова. }
procedure l3ParseWordsF(const aStr     : Tl3WString;
                        anAction       : Tl3WordAction;
                        const anExcept : TCharSet = []);
  {* - разбирает строку на слова. }
procedure l3ParseWords(const aStr     : Tl3WString;
                       anAction       : Tl3WordEvent;
                       const anExcept : TCharSet = []);
  overload;
  {* - разбирает строку на слова. }
function l3StringOfString(const aString : AnsiString;
                          aCount        : Long): AnsiString;
  {* - собирает строку из повторений aString. }
function l3PCharLen2String(const aString : Tl3PCharLenPrim;
                           aCodePage     : Long = CP_ANSI;
                           aBuff         : PPointer = nil): AnsiString;
  {* - преобразует к строке типа AnsiString. }
function l3StrToInt(const aString : Tl3WString) : Integer;
function l3StrToIntDef(const aString : Tl3WString; aDefault: Integer = 0) : Integer;

function l3RomanToInt(const aString: Tl3WString): Integer;

function l3Str(const aString : Tl3DString): AnsiString;
  overload;
function l3Str(const aString : Tl3PCharLenPrim;
               aCodePage     : Long = CP_ANSI): AnsiString;
  overload;
function l3Str(const aString : Il3CString;
               aCodePage     : Long = CP_ANSI): AnsiString;
  overload;
  {* - преобразует к строке типа AnsiString. }
function l3PStr(const aString : Tl3PCharLenPrim): TFileName;
  overload;
function l3PStr(const aString : Il3CString): TFileName;
  overload;
  {* - преобразует к строке для имени файла. }
function l3DStr(const aStr: AnsiString): Tl3DString;
  overload;
function l3DStr(const aStr: Tl3WString): Tl3DString;
  overload;
function l3DStr(const aStr: Il3CString): Tl3DString;
  overload;
  {-}
function l3ChangeCodePage(const aString: AnsiString; anOldCodePage, aNewCodePage: Long): AnsiString;
  {* - изменяет кодировку символов в строке. }
procedure l3Replace(St            : PAnsiChar;
                    aReplaceChars : TChars;
                    aReplaceChar  : AnsiChar;
                    StLen         : Long = -1);
  overload;
procedure l3Replace(var aString   : AnsiString;
                     aReplaceChar : AnsiChar;
                     aNewChar     : AnsiChar;
                     aStartPos    : Integer = 1);
  overload;
  {* - заменяет символ на заданный. }
procedure l3Replace(var aString   : AnsiString;
                    aReplaceChars : TChars;
                    aReplaceChar  : AnsiChar);
  overload;
  {* - заменяет символы из множества на заданный. }
procedure l3Replace(const aString : Tl3WString;
                    aReplaceChars : TChars;
                    aReplaceChar  : AnsiChar);
  overload;
procedure l3Replace(var aString    : Il3CString;
                    aChar          : AnsiChar;
                    const aReplace : Tl3WString);
  overload;
procedure l3Replace(var aString   : Il3CString;
                    aReplaceChars : TChars;
                    aReplaceChar  : AnsiChar);
  overload;
  {* - заменяет символы из множества на заданный. }
procedure l3MReplace(var aString : Il3CString;
                     const aFrom : array of AnsiChar;
                     const aTo   : array of AnsiString);
  {* - заменяет символы из множества на заданный. }
procedure l3DeleteChars(var aString  : Il3CString;
                        aDeleteChars : TChars);
  {* - удаляет заданные символы. }
procedure l3Delete(var aString  : Il3CString;
                   aPos         : Integer;
                   aCount       : Integer);
  {* - удаляет заданную подстроку. }
procedure l3Insert(var aString  : Il3CString;
                   aPos         : Integer;
                   aChar        : AnsiChar);
  overload;
procedure l3Insert(var aString  : Il3CString;
                   aPos         : Integer;
                   aSt          : WideString);
  overload;
  {* - вставляет заданную подстроку. }
function l3StringCase(const aString  : AnsiString;
                      const aStrings : array of AnsiString;
                      aSortIndex     : Tl3SortIndex = l3_siNative): Long;
  {* - преобразует строку в ее позицию в массиве строк (аналог оператора Case). }
function l3SomeOf(const aStr : Il3CString;
                  const aVal : array of AnsiString): Boolean;
  {-}
type
  Tl3SplitStatus = (l3_ssNo, l3_ssYes, l3_ssHyphen);
  {* Результат переноса по слогам. }
function l3SplitBySlog(const aStr: Tl3PCharLen; var SplitPos : Long; aUseExtCharSet: Boolean = False): Tl3SplitStatus;
  {* - разбивает слово на позиции SplitPos по слогам}
procedure l3SplitWord(const FullWord : AnsiString; var SplitPos : Long);
  {* - разбивает слово по слогам. }
function l3ConcatText(const aStr1, aStr2 : AnsiString; const aDelim : AnsiChar = #32) : AnsiString;
  {* - объединяет две строки добавляя между ними пробел если его там не было. }
function l3Same(const S1: WideString; const S2: WideString; IgnoreCase: Boolean = false): Boolean;
  overload;
function l3Same(const S1: Il3CString; const S2: WideString; IgnoreCase: Boolean = false): Boolean;
  overload;
function l3Same(const S1: Il3CString; const S2: Il3CString; IgnoreCase: Boolean = false): Boolean;
  overload;
function l3Same(const S1: Il3CString; const S2: AnsiString; IgnoreCase: Boolean = false): Boolean;
  overload;
function l3Same(const S1: AnsiString; const S2: Il3CString; IgnoreCase: Boolean = false): Boolean;
  overload;
function l3Same(const S1: Il3CString; const S2: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  overload;
function l3Same(const S1: Tl3WString; const S2: Il3CString; IgnoreCase: Boolean = false): Boolean;
  overload;
function l3Same(const S1: Tl3WString; const S2: AnsiString; IgnoreCase: Boolean = false): Boolean;
  overload;
  {-}
function l3Same(const S1: Tl3WString; const S2: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  overload;
  {-}
function l3Compare(const S1: Tl3PCharLenPrim; const S2: AnsiString; aSortIndex: Tl3SortIndex = l3_siNative): Long;
  overload;
  {* - сравнивает строки. }
function l3Compare(const S1, S2: Tl3PCharLenPrim; aSortIndex: Tl3SortIndex = l3_siNative): Long;
  overload;
  {* - сравнивает строки. }
function l3Compare(const S1, S2: PAnsiChar; aSortIndex: Tl3SortIndex = l3_siNative): Long;
  overload;
  {* - сравнивает строки. }
function l3Compare(const S1, S2: AnsiString; aSortIndex: Tl3SortIndex = l3_siNative): Long;
  overload;
  {* - сравнивает строки. }
function l3PCharLenPart(aSt       : PAnsiChar;
                        aStart    : Long;
                        aFinish   : Long;
                        aCodePage : Long): Tl3PCharLen;
  overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
function l3PCharLen(const S: Il3CString): Tl3PCharLen;
  overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
function l3PCharLen(S: PAnsiChar = nil; Len: Long = -1; aCodePage: Long = CP_ANSI): Tl3PCharLen;
  overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
function l3PCharLen(const S: AnsiString; aCodePage: Long = CP_ANSI): Tl3PCharLen;
  overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
function l3PCharLen(const S: WideString): Tl3PCharLen;
  overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
function l3PCharLen(const S: PWideChar; aLength : Long = -1): Tl3PCharLen;
  overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
function l3IsWhiteSpace(C : AnsiChar) : Boolean;
  {* - Return True if C is a white space character. }
function l3IsHiddenWhiteSpace(C : AnsiChar) : Boolean;
  {* - Return True if C is a white space character. }
function l3IsWhiteSpaceW(C : WideChar) : Boolean;
  {* - Return True if C is a white space character. }
function l3IsWhiteSpaceS(const aSt : Tl3WString; anIndex: Integer) : Boolean;
  {* - Return True if C is a white space character. }

function l3RTrimLen(S : PAnsiChar; Len : Long): Long;
  {* - возвращает длину строки без учета конечных пробелов. }
function l3RTrimLenW(S : PWideChar; Len : Long): Long;
  {* - возвращает длину строки без учета конечных пробелов. }
procedure l3ReplaceNonReadable(St: PAnsiChar; StLen: Long = -1);
  overload;
 {* - заменяет нечитаемые символы пробелами. }
function l3ReplaceNonReadable(const St: AnsiString) : AnsiString;
  overload;
 {* - заменяет нечитаемые символы пробелами. }
function l3ReplaceNonReadable(const S: Tl3WString): Tl3PCharLen;
  overload;
 {* - заменяет нечитаемые символы пробелами. }
(*procedure l3DeleteDoubleSpace(St: PAnsiChar; var StLen: Long);
  overload;*)
(*procedure l3DeleteDoubleSpace(St: PWideChar; var StLen: Long);
  overload;*)
function l3DeleteDoubleSpace(const AStr: AnsiString): AnsiString;
  overload;
function l3DeleteDoubleSpace(const aStr: Il3CString): Il3CString;
  overload;
function l3ReplaceNonReadable(const S: Il3CString): Il3CString;
  overload;
  {* - удаляет двойные пробелы. }
function l3DeleteSerias(const aStr: Il3CString; aChar: AnsiChar): Il3CString;
  {-}
function ev_lpIndent(St: PAnsiChar; StLen: Long): Long;
  {* - возвращает отступ строки с учетом табуляций. }
function ev_lpIndentPrim(St: PAnsiChar; StLen: Long): Long;
  {* - возвращает отступ строки без учета табуляций. }
function ev_lpCharset2Indent(St: PAnsiChar; StLen: Long; aCharset: TCharSet): Long;
  {-возвращает отступ строки, состоящий из символов из набора}
function l3AllCharsInCharSet(St: PWideChar; StLen: Long; const CS: TChars): Bool;
  overload;
function l3AllCharsInCharSet(St: PAnsiChar; StLen: Long; const CS: TChars): Bool;
  overload;
function l3AllCharsInCharSet(const aSt: Tl3WString; const CS: TChars): Bool;
  overload;
function l3AllCharsInCharSet(const aSt: Il3CString; const CS: TChars): Bool;
  overload;
  {* - определяет все ли символы в строке принадлежат множеству. }
function l3EmptyOrAllCharsInCharSet(const aSt: Tl3WString; const CS: TChars): Bool;
  {* - определяет пустая ли строка или все ли символы в строке принадлежат множеству. }
function l3CharSetPresent(St       : PAnsiChar;
                          StLen    : Long;
                          const CS : TChars): Bool;
  overload;
function l3CharSetPresent(St       : PWideChar;
                          StLen    : Long;
                          const CS : TChars): Bool;
  overload;
function l3CharSetPresent(const aSt : Tl3WString;
                          const CS  : TChars): Bool;
  overload;
function l3CharSetPresent(const aSt : Il3CString;
                          const CS  : TChars): Bool;
  overload;
  {* - определяет есть ли хотя бы один символ из множества в строке. }
function l3CharSetPresentEx(St        : PAnsiChar;
                            StLen     : Long;
                            const CS  : TChars;
                            aCodePage : Long = CP_ANSI): Long; overload;
  {* - определяет есть ли хотя бы один символ из множества в строке и
       возвращает его позицию или -1. }
function l3CharSetPresentEx(const S: Tl3WString;
                            const CS  : TChars): Long; overload;

function l3CharSetPresentExR(aSt: PAnsiChar; aPos: Long; const aCS: TChars): Long;
  {* - определяет есть ли хотя бы один символ из множества в строке и
       возвращает его позицию или -1. Движется с конца строки. }
function ev_lpIsTableLine(St: PAnsiChar; StLen, SepWidth: Long; var SepPos, SepLen, SepCount: Long): Bool;
  {* - строка таблицы с пробелами? }

function ev_psRTrim(const S : AnsiString): AnsiString;
  {* - отрезает у строки конечные пробелы. }
function ev_psLTrim(const S : AnsiString): AnsiString;
  {* - отрезает у строки начальные пробелы. }
function ev_psTrim(const S : AnsiString): AnsiString;
  {* - отрезает у строки начальные и конечные пробелы. }
function ev_psPrefix(const S: AnsiString; C: AnsiChar): AnsiString;
  {* - возвращает префикс строки. C - разделитель. }
function ev_psSuffix(const S: AnsiString; C: AnsiChar): AnsiString;
  overload;
  {* - возвращает суффикс строки. C - разделитель. }
function ev_psSuffix(const S: AnsiString; const C: AnsiString): AnsiString;
  overload;
  {* - возвращает суффикс строки. C - разделитель. }
function ev_psFixLen(const S: String255; Len: Long; C: AnsiChar): String255;
  {* - возвращает строку добитую до длины Len символом C. }
function l3LeftPad(const S: AnsiString; Len: Long): AnsiString;
  {* - возвращает строку, добитую слева пробелами до длины Len }
function l3LeftPadChar(const S: AnsiString; Len: Long; C: AnsiChar): AnsiString;
  {* - возвращает строку, добитую слева символом C до длины Len }

function l3CountOfChar(C: AnsiChar; const S: PAnsiChar): Long;
  overload;
  {* - возвращает количество символов C в строке S}
function l3CountOfChar(C: AnsiChar; const S: AnsiString): Long;
  overload;
  {* - возвращает количество символов C в строке S}
procedure l3AssignNil(var S: Tl3PCharLenPrim);
  {* - инициализирует строку пустыми значениями. }
function  l3RTrim(const S: Tl3WString): Tl3PCharLen;
  overload;
  {* - отрезает у строки конечные пробелы. }
function  l3Trim(const S: Il3CString): Il3CString;
  overload;
function  l3Trim(const S: Il3CString; aWhite: TCharSet): Il3CString;
  overload;
function  l3Trim(const S: Tl3WString): Tl3WString;
  overload;
function l3Trim(const S: AnsiString; aWhite: TCharSet = cc_WhiteSpace): AnsiString;
  overload;
function  l3RTrimHiddenWS(const S: Tl3WString): Tl3WString;
  {* - отрезает у строки начальные и конечные пробелы. }
function l3LTrim(const aSt : Tl3WString) : Tl3WString;
  overload;
function l3LTrim(const aSt : Tl3WString; aWhite: TCharSet) : Tl3WString;
  overload;
function l3LTrim(const aSt : Il3CString) : Il3CString;
  overload;
function l3LTrim(const aSt : Il3CString; aWhite: TCharSet) : Il3CString;
  overload;
  {* - отрезает у строки начальные пробелы. }
function l3RTrim(const S: AnsiString; aWhite: TCharSet = cc_WhiteSpace): AnsiString;
  overload;
function l3RTrim(const aSt : Il3CString; aWhite: TCharSet) : Il3CString;
  overload;
function  l3RTrim(const S: Tl3WString; aWhite: TCharSet): Tl3WString;
  overload;
  {* - отрезает у строки конечные пробелы. }
function  l3Trim(const S: Tl3WString; aWhite: TCharSet): Tl3PCharLen;
  overload;
  {* - отрезает у строки начальные и конечные пробелы. }
function  l3IsNil(const S: AnsiString): Boolean;
  overload;
function  l3IsNil(const S: Tl3PCharLenPrim): LongBool;
  overload;
function  l3IsNil(const aStr: Il3CString): Boolean;
  overload;
  {* - проверяет пустая строка или нет. }
function  l3CountOfChar(C: AnsiChar; const S: Tl3PCharLenPrim): Long;
  overload;
  {* - считает количество вхождений символа C в строку S. }
function  l3HasWhiteSpace(const S: Tl3PCharLen): Bool;
  {* - возвращает содержит ли строка пробелы и т.п. }
function  ev_lpEntryCount(C: AnsiChar; S: PAnsiChar; L: Long): Long;
  {* - считает количество вхождений символа C в строку S. }
function  ev_lpCharIndex(C: AnsiChar; const S: Tl3WString): Long;
  {* - возвращает индекс символа C или l3NotFound. }
function  ev_lpScan(C: AnsiChar; S: PAnsiChar; Len: Long): PAnsiChar;
  overload;
  {* - ищет вхождение символа C в строку S длины Len возвращает указатель или nil
       (в прямом направлении). }
function  ev_lpScan(C: WideChar; S: PWideChar; Len: Long): PAnsiChar;
  overload;
  {* - ищет вхождение символа C в строку S длины Len возвращает указатель или nil
       (в прямом направлении). }
function  l3_ssTestChar(const P: ShortString; C: AnsiChar): Boolean;
  { - }
function  ev_lpRScan(C: AnsiChar; S: PAnsiChar; Len: Long): PAnsiChar;
  {* - ищет вхождение символа C в строку S длины Len возвращает указатель или nil
       (в обратном направлении). }
function l3FindChar(aChar: AnsiChar; var S: Tl3PCharLenPrim): Tl3PCharLen;
  {* - ищет вхождение символа. }
function l3HasChar(aChar: AnsiChar; const S: Tl3PCharLenPrim): Boolean;
  {* - ищет вхождение символа. }
function l3StrLen(Str: PAnsiChar) : Cardinal;
  overload;
  {* - возвращает длину строки или 0 если строка = nil. }
function l3StrLen(Str: PWideChar) : Cardinal;
  overload;
  {* - возвращает длину строки или 0 если строка = nil. }
function l3AnsiStrLICompExt(S1, S2: PAnsiChar; MaxLen: Cardinal): Integer;
  {* - сравнивает без учета регистра. }
function l3GetStrPas(Str: PAnsiChar; aStrLen : Integer = 0) : AnsiString; overload;
  {* - преобразует к строке типа AnsiString. }
function l3GetStrPas(Str: PWideChar; aStrLen : Integer = 0) : WideString; overload;
  {* - преобразует к строке типа WideString. }

function l3Hex2Dec(const S: AnsiString): Longint;
  {* - преобразует шестнадцатиричное число в десятичное. }

function l3StripDoubleQuotes(const aFileName : AnsiString) : AnsiString;
  {* - удаляет кавычки из имени файла. }

function l3StringPos(const aSubStr, aStr: AnsiString; aBeginPos : Cardinal = 1): Cardinal;
  {* - возвращает позицию подстроки или 0. }

function l3StringRPos(const aSubStr, aStr: AnsiString; aStrLen : Cardinal = 0): Cardinal; overload;
  {* - возвращает позицию подстроки или 0. Поиск с конца}
function l3StringRPos(const aSubStr, aStr: PAnsiChar; aStrLen : Cardinal = 0): Integer; overload;

function IsEmptyStr(const S: AnsiString; const EmptyChars: TChars): Boolean;
{* EmptyStr returns true if the given AnsiString contains only character
   from the EmptyChars. }

function l3PCharAlloc(aStr: PAnsiChar; aLen : Longint): PAnsiChar; overload;
{* - распределяет буфер для строки и возвращает указатель на него или nil
  если строка пустая. }
function l3PCharAlloc(const aStr : Tl3PCharLen): PAnsiChar; overload;
function l3PCharAlloc(const aStr: AnsiString): PAnsiChar; overload;

function l3AddBackSlashL(const DirName : AnsiString) : AnsiString;
  {* - Add a default backslash to a directory name}

function l3MakeUpperCase(aStr: PAnsiChar; aLen : Long; aCodePage: Long = CP_ANSI): Boolean;
function l3MakeLowerCase(aStr: PAnsiChar; aLen : Long; aCodePage: Long = CP_ANSI): Boolean;

{$IFNDEF Delphi6}
function WideUpperCase(const S: WideString): WideString;
{$EndIF  Delphi6}

function l3MaskNormalize(const aMask : AnsiString ) : AnsiString;
  overload;
  {-}
function l3MaskCompare(const aString, Mask : AnsiString) : boolean;
  overload;
  {-}
function l3MaskNormalize(const aMask : WideString ) : WideString;
  overload;
  {-}
function l3MaskCompare(const aString, Mask : WideString) : boolean;
  overload;
  {-}

function l3Transliterate(const aStr: AnsiString): AnsiString;
  {* - выполняет транслитерацию строки. }

function  l3Cat(const S: array of Il3CString): Il3CString;
  overload;
function  l3Cat(const S1: Il3CString; const S2: Tl3WString): Il3CString;
  overload;
function  l3Cat(const S1: Tl3DString; const S2: Il3CString): Il3CString;
  overload;
function  l3Cat(const S1: AnsiString; const S2: Il3CString): Il3CString;
  overload;
function  l3Cat(const S1: Il3CString; const S2: Tl3DString): Il3CString;
  overload;
function  l3Cat(const S1: Il3CString; const S2: Tl3Char): Il3CString;
  overload;
function  l3Cat(const S1: Il3CString; const S2: AnsiString): Il3CString;
  overload;
function  l3Cat(const S1: Il3CString; const S2: array of AnsiString): Il3CString;
  overload;
  {-}
function  l3Upper(const S: Il3CString): Il3CString; overload;
function  l3Upper(const S: Tl3WString): Il3CString; overload;
  {-}
function  l3Lower(const S: Il3CString): Il3CString; overload;
function  l3Lower(const S: Tl3WString): Il3CString; overload;
  {-}

// ВНИМАНИЕ! Для успешного поиска с aCaseSensitive = False подстрока (aSubStr) должна быть в ВЕРХНЕМ РЕГИСТРЕ!
function  l3Pos(const aStr: Il3CString; const aSubStr: Tl3WString; aCaseSensitive: Boolean = True): Integer;
  overload;
function  l3Pos(const aStr: Tl3WString; const aSubStr: Tl3WString; aCaseSensitive: Boolean = True): Integer;
  overload;
function  l3Pos(const aStr: Il3CString; const aSubStr: Il3CString; aCaseSensitive: Boolean = True): Integer;
  overload;
function l3Pos(const aStr: Il3CString; const aSubStr: AnsiString; aCaseSensitive: Boolean = True): Integer;
  overload;
function  l3Pos(const aStr: Il3CString; aChar: AnsiChar): Integer;
  overload;

function l3PosEx(const aStr: Il3CString; const aSubStr: Tl3WString; aFrom: Integer; aCaseSensitive: Boolean = True): Integer;
  overload;
function l3PosEx(const aStr: Il3CString; const aSubStr: Il3CString; aFrom: Integer; aCaseSensitive: Boolean = True): Integer;
  overload;

  {-}
function  l3StringReplace(const S          : Il3CString;
                          const OldPattern : Tl3WString;
                          const NewPattern : Tl3WString;
                          Flags            : TReplaceFlags): Il3CString;
  overload;
function  l3StringReplace(const S          : Il3CString;
                          const OldPattern : Tl3WString;
                          const NewPattern : Il3CString;
                          Flags            : TReplaceFlags): Il3CString;
  overload;
  {-}
function  l3SameChar(const aS1   : Tl3WString;
                     const aS2   : Tl3WString;
                     aPos        : Integer;
                     aIgnoreCase : Boolean = false): Boolean;
  overload;
  {-}
function  l3SameChar(const aS1   : Il3CString;
                     const aS2   : Il3CString;
                     aPos        : Integer;
                     aIgnoreCase : Boolean = false): Boolean;
  overload;
  {-}
function  l3IsChar(const aStr: Tl3WString; aPos: Integer; aSubStr: AnsiChar; aIgnoreCase : Boolean = false): Boolean;
  overload;
function  l3IsChar(const aStr: Il3CString; aPos: Integer; aSubStr: AnsiChar; aIgnoreCase : Boolean = false): Boolean;
  overload;
function  l3IsChar(const aStr: Tl3WString; aPos: Integer; aSubStr: TChars): Boolean;
  overload;
function  l3IsChar(const aStr: Il3CString; aPos: Integer; aSubStr: TChars): Boolean;
  overload;
function  l3IsChar(const aStr: Il3CString; aPos: Integer; aProc: Tl3CheckSimbolProc): Boolean;
  overload;
  {-}
function  l3Char(const aStr: Tl3WString; aPos: Integer): AnsiChar;
  overload;
function  l3Char(const aStr: Il3CString; aPos: Integer): AnsiChar;
  overload;
  {-}
function  l3CharEx(const aStr: Tl3WString; aPos: Integer): Tl3Char;
  overload;
function  l3CharEx(const aStr: Il3CString; aPos: Integer): Tl3Char;
  overload;
  {-}
procedure l3SetChar(var aStr: Il3CString; aPos: Integer; aValue: AnsiChar);
  {-}
function  l3Len(const aStr: Il3CString): Integer;
  {-}
procedure l3SetLen(var aStr: Il3CString; aLen: Integer);
  {-}
function  l3Copy(const aStr: Il3CString; anIndex: Integer; aCount: Integer = MaxInt): Il3CString; overload;
function  l3Copy(const aStr: Tl3WString; anIndex: Integer; aCount: Integer = MaxInt): Tl3WString; overload;
  {-}
procedure l3CatSuff(var S1: AnsiString; const S2: AnsiString);
  {-}
function  l3OEM2ANSI(const S: AnsiString): AnsiString;
  {-}
function  l3ANSI2OEM(const S: AnsiString): AnsiString;
  {-}
function  l3L2WA(Action: Pointer): Tl3WordAction;
  {-}
procedure l3FreeWA(var Stub: Tl3WordAction);
  {-}
function  l3KeyboardCodePage: Integer;
  {-}
function  l3KeyToUnicode(const Key: AnsiString): WideString;
  overload;
  {-}
function  l3KeyToUnicode(aMsg: TWMKeyDown): WideString;
  overload;
  {-}

function  l3ArrayToString(var PArray; ArraySize : Integer): AnsiString;
  {=}
function  l3ArrayToCString(const PArray; ArraySize : Integer; aCodePage : Long = CP_ANSI) : Il3CString;
  {-}
procedure l3StringToArray(Var ChBuff; Len : Word; const aStr : AnsiString; aFillChar: AnsiChar = ' ');
  {-}
procedure l3PCharToArray(Var ChBuff; Len : Integer; aStr : PAnsiChar);
  {-}
procedure l3PCharLenToArray(Var ChBuff; Len : Integer; const aStr : Tl3WString);
  {-}
function l3PCharLenToPCharRec(const aStr: Tl3WString): Tl3PCharRec;
  {-}
procedure l3FreePCharRec(var theRec: Tl3PCharRec);
  {-}
function l3AppendPChar(Dest, Source : PAnsiChar; SourceLen : Word) : PAnsiChar;
  {-}
function l3AllocPChar(Var ChBuff; Len : Longint) : PAnsiChar;
  {-}
function l3NativeAllocPChar(Var ChBuff; Len : Longint) : PAnsiChar;
  {-}
function l3GetFilledArrayLength(ChBuff : PAnsiChar; Len : Longint) : Longint;
  {-}
//function l3SizeOfTextArray(var PArray; ArraySize: Integer) : Integer; overload;
//  {-}
function l3SizeOfTextArray(PArray : PAnsiChar; ArraySize: Integer) : Integer; overload;
  {-}
function l3StringToPCharNil(const aStr : AnsiString) : PAnsiChar;
  {-}
function l3ArrayToPChar(var PArray; ArraySize: Integer; PCh : PAnsiChar) : Word;
  {-}
function l3ArrayToPCharLen(var PArray; ArraySize: Integer; aCodePage : Long = CP_ANSI) : Tl3PCharLen;
  {-}
function l3GetPosCharSet(St: PAnsiChar; const CS: TCharSet; StLen: Long = 0; StBegin : Integer = 0) : Integer;
  {-}
function l3GetSuffix(const aStr: Tl3WString; aSeparator: AnsiChar): Tl3WString;
  {- возвращает часть, отделённую с конца символом aSeparator. Если символ не найден, возвращает всю строку }
function  l3RecToFormatString(var Rec; const Format: ShortString): ShortString {FStr};
procedure l3FormatStringToRec(const FStr: ShortString; var Rec; const Format: ShortString);
                  {'SDS25DD2B' ==> Record
                                  AnsiString[255];
                                  Longint;
                                  AnsiString[25];
                                  Longint;
                                  Word;
                                  Boolean;
                                 end '}

function l3Fmt(const aFmt: Il3CString; const aParams: array of const): Il3CString;
  overload;
function l3Fmt(const aFmt: AnsiString; const aParams: array of const): Il3CString;
  overload;
function l3Fmt(const aFmt: Tl3WString; const aParams: array of const): Il3CString;
  overload;
  {-}
function l3Prefix(const S: Il3CString; C: AnsiChar): Il3CString;
  overload;
function l3Prefix(const S: Il3CString; const C: array of AnsiChar): Il3CString;
  overload;
function l3Prefix(const S: Il3CString; const C: Il3CString): Il3CString;
  overload;
  {* - возвращает префикс строки. C - разделитель. }
procedure l3Split(const aSt: Il3CString; C: AnsiChar; var P, S: Il3CString);
  overload;
function  l3Split(const aSt: Il3CString; C: AnsiChar): Tl3CStringArray;
  overload;
procedure l3Split(const aSt: Il3CString; const C: array of AnsiChar; var P, S: Il3CString);
  overload;
procedure l3Split(const aSt: Il3CString; const C: Il3CString; var P, S: Il3CString);
  overload;
  {* - разделяет сроку на две. C - разделитель. }
function l3IsOEM(aCodePage : Integer): Boolean;
  {-}
function l3IsOEMWithOutLite(aCodePage : Integer): Boolean;
  {-}
function l3IsOEMEx(aCodePage : Integer): Boolean;
  {-}
function l3IsOEMWithOutLiteEX(aCodePage : Integer): Boolean;
  {-}
function l3IsANSI(aCodePage : Integer): Boolean;
  {-}
function l3IsUpper(aChar : AnsiChar): Boolean;
  {-}
function l3InSet(aChar: WideChar; const aSet : TCharSet): Boolean;
  {-}
function l3WideToChar(aChar: WideChar): AnsiChar;
  {-}
function l3StrLength(const S: AnsiString): Longint;
  {-}
function l3StrRefCount(const S: AnsiString): Longint;
  {-}
function l3StrPtrLength(const S: Pointer): Longint;
  {-}
function l3StrPtrRefCount(const S: Pointer): Longint;
  {-}
function l3CommonPartLen(const S1, S2: Tl3WString; IgnoreCase: Boolean = false): integer;
  overload;
  {-}
function l3CommonPartLen(const S1, S2: Il3CString; IgnoreCase: Boolean = false): integer;
  overload;
  {-}
function l3Starts(const ASubText: AnsiString; const AText: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  overload;
  {-}
function l3Starts(const ASubText, AText: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  overload;
  {-}
function l3Starts(const ASubText, AText: Il3CString; IgnoreCase: Boolean = false): Boolean;
  overload;
  {-}

function l3Ends(const ASubText, AText: WideString; IgnoreCase: Boolean = false): Boolean;
  overload;
  {-}
function l3Ends(const ASubText, AText: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  overload;
  {-}
function l3Ends(const ASubText, AText: Il3CString; IgnoreCase: Boolean = false): Boolean;
  overload;
  {-}

function l3WideString(const aStr: Il3CString): WideString;
  {-}

function l3IsWordDelim(Ch             : AnsiChar;
                       CodePage       : Long;
                       const anExcept : TCharSet) : Boolean;
  {-Return True if Ch is a word delimiter}

 overload;
function l3IsWordDelim(Ch             : AnsiChar;
                       CodePage       : Long = CP_ANSI) : Boolean;
  {-Return True if Ch is a word delimiter}
 overload;
function l3IsWordDelim(Ch: WideChar) : Boolean;
 overload;

// Замена родных функций работы с PAnsiChar
function  l3StrAlloc(Size: Cardinal): PAnsiChar;
procedure l3StrDispose(var Str: PAnsiChar);
function  l3StrNew(const Str: PAnsiChar): PAnsiChar;
function  l3StrBufSize(const Str: PAnsiChar): Cardinal;

function ConvertUTF16toUTF8 (const source: WideString;
                              var target: AnsiString;
                              flags: ConversionFlags;
                              BOM: boolean): ConversionResult;

function ConvertUTF8toUTF16(const source: AnsiString;
                             var target: WideString;
                             flags: ConversionFlags;
                             BOM: boolean): ConversionResult;

function l3IntToRoman(aValue: LongInt): AnsiString;


procedure l3MakeSimpleANSI(aStr: PAnsiChar; aLen : Long);
{- преобразует строку (ANSI кодировка) в упрощенный вид, без всяких продвинутых кавычек, неразрывных пробелов и т п}

function l3MakeSimpleANSIStr(aStr: AnsiString) : AnsiString;
{- преобразует строку (ANSI кодировка) в упрощенный вид, без всяких продвинутых кавычек, неразрывных пробелов и т п}


const
  strictConversion = ElStrUtils.strictConversion;

implementation

uses
  {$IfDef l3Requires_m0}
  m2XLtLib,
  {$EndIf l3Requires_m0}
  l3MinMax,
  l3MemorySizeUtils,
  l3Memory,
  l3Utils,
  l3StringEx,
  l3Const,
  l3Base,
  l3Except,
  l3InterfacedString,
  l3BMSearch
  ;

function l3StrLen(Str: PAnsiChar) : Cardinal;
  {-возвращает длину строки или 0 если строка = nil}
begin
 if (Str = nil) then
  Result := 0
 else
  Result := StrLen(Str);
end;

function l3StrLen(Str: PWideChar) : Cardinal;
  register;
  //overload;
  {* - возвращает длину строки или 0 если строка = nil. }
asm
        or      eax, eax
        jz      @@ret
        MOV     EDX,EDI
        MOV     EDI,EAX
        MOV     ECX,0FFFFFFFFH
        XOR     AX,AX
        REPNE   SCASW
        MOV     EAX,0FFFFFFFEH
        SUB     EAX,ECX
        MOV     EDI,EDX
@@ret:
end;

function l3PCharAlloc(aStr: PAnsiChar; aLen : Longint): PAnsiChar;
  {-распределяет буфер для строки и возвращает указатель на него или nil
    если строка пустая}
begin
 if (aLen = 0) then
  Result := nil
 else
 begin
  Result := l3StrAlloc(Succ(aLen));
  l3Move(aStr^, Result^, aLen);
  Result[aLen] := #0;
 end;
end;

function l3PCharAlloc(const aStr: AnsiString): PAnsiChar;
begin
 Result := l3PCharAlloc(PAnsiChar(aStr), Length(aStr));
end;

function l3PCharAlloc(const aStr : Tl3PCharLen): PAnsiChar;
begin
 with aStr do
  Result := l3PCharAlloc(S, SLen);
end;

function AnsiStrLIComp(S1,  S2: PAnsiChar; MaxLen: Cardinal): Integer;
                  { -> eax, edx,       ecx}
                  { <- eax - результат сравнения }
  register;
  {-}
asm
        JECXZ    @@NullLen
        PUSH    EDI
        PUSH    ESI
        PUSH    EBX
        MOV     EDI, EDX
        MOV     ESI, EAX
        MOV     EBX, ECX
        XOR     EAX, EAX
        REPNE   SCASB
        SUB     EBX, ECX
        MOV     ECX, EBX
        MOV     EDI, EDX
        XOR     EDX, EDX
@@1:    REPE    CMPSB
        JE      @@4
        MOV     AL,[ESI-1]
        CMP     AL,'a'
        JB      @@2
        CMP     AL,'z'
        JNA     @@@_1
        CMP     AL,'а'
        JB      @@2
@@@_1:   SUB     AL,20H
@@2:    MOV     DL,[EDI-1]
        CMP     DL,'a'
        JB      @@3
        CMP     DL,'z'
        JNA     @@@_2
        CMP     DL,'а'
        JB      @@3
@@@_2:   SUB     DL,20H
@@3:    SUB     EAX,EDX
        JE      @@1
@@4:    POP     EBX
        POP     ESI
        POP     EDI
        jmp     @@ret
@@NullLen:
        xor     eax, eax
@@ret:
end;

function l3AnsiStrLICompExt(S1, S2: PAnsiChar; MaxLen: Cardinal): Integer;
  {-}
begin
 if (Pointer(S1) = Pointer(S2)) then
  Result := 0
 else
 if (S1 = nil) then
  Result := -1
 else
 if (S2 = nil) then
  Result := 1
 else
  Result := AnsiStrLIComp(S1, S2, MaxLen);
end;

function l3GetStrPas(Str: PAnsiChar; aStrLen : Integer = 0) : AnsiString;
  {-}
begin
 if (Str = nil) then
  Result := EmptyStr
 else
 if aStrLen = 0 then
  Result := StrPas(Str)
 else
 begin
  SetLength(Result, aStrLen);
  l3Move(Str^, PAnsiChar(Result)^, aStrLen);
 end;
end;

function l3GetStrPas(Str: PWideChar; aStrLen : Integer = 0) : WideString;
  {* - преобразует к строке типа WideString. }
begin
 if (Str = nil) then
  Result := EmptyStr
 else
 if (aStrLen = 0) then
 begin
  {$IfDef XE}
  Result := StrPas(Str);
  {$Else  XE}
  aStrLen := l3StrLen(Str);
  SetLength(Result, aStrLen);
  l3Move(Str^, PWideChar(Result)^, aStrLen * 2);
  {$EndIf XE}
 end//aStrLen = 0
 else
 begin
  SetLength(Result, aStrLen);
  l3Move(Str^, PWideChar(Result)^, aStrLen * 2);
 end;//aStrLen = 0
end;

function l3IsHiddenWhiteSpace(C : AnsiChar) : Boolean;
  register;
  {-return True if C is a white space character}
asm
  {Result := C in [' ', #9];}
  cmp    al, cc_HardSpaceSymbol
  je     @@001
  cmp    al, cc_SoftSpaceSymbol
  je     @@001
  cmp    al, cc_Tab
  je     @@001
  xor    eax, eax
  jmp    @@002
@@001:
  mov    eax,01
@@002:
end;

function l3IsWhiteSpace(C : AnsiChar) : Boolean;
  register;
  {-return True if C is a white space character}
asm
  {Result := C in [' ', #9];}
  cmp    al, cc_HardSpace
  je     @@001
  cmp    al, cc_Tab
  je     @@001
  xor    eax, eax
  jmp    @@002
@@001:
  mov    eax,01
@@002:
end;

function l3IsWhiteSpaceW(C : WideChar) : Boolean;
  {* - Return True if C is a white space character. }
asm
  {Result := C in [' ', #9];}
  cmp    ax, cc_HardSpace
  je     @@001
  cmp    ax, cc_Tab
  je     @@001
  xor    eax, eax
  jmp    @@002
@@001:
  mov    eax,01
@@002:
end;

function l3IsHiddenWhiteSpaceW(C : WideChar) : Boolean;
  {* - Return True if C is a white space character. }
asm
  {Result := C in [' ', #9];}
  cmp    ax, cc_HardSpaceSymbol
  je     @@001
  cmp    ax, cc_SoftSpaceSymbol
  je     @@001
  cmp    ax, cc_Tab
  je     @@001
  xor    eax, eax
  jmp    @@002
@@001:
  mov    eax,01
@@002:
end;

function l3IsWhiteSpaceS(const aSt : Tl3WString; anIndex: Integer) : Boolean;
  {* - Return True if C is a white space character. }
begin
 // - здесь специально не делается проверка на принадлежность индекса к диапазону
 //   т.к. в evTextParaPainter используется отрицательный индекс.
 if (aSt.SCodePage = CP_Unicode) then
   Result := l3IsWhiteSpaceW((PWideChar(aSt.S) + anIndex)^)
  {$IFNDEF Nemesis}
  or l3IsHiddenWhiteSpaceW((PWideChar(aSt.S) + anIndex)^)
  {$ENDIF Nemesis}
 else
  Result := l3IsWhiteSpace((aSt.S + anIndex)^)
  {$IFNDEF Nemesis}
  or l3IsHiddenWhiteSpace((aSt.S + anIndex)^)
  {$ENDIF Nemesis}
end;

function l3Same(const S1: WideString; const S2: WideString; IgnoreCase: Boolean = false): Boolean;
  //overload;
begin
 Result := l3Same(l3PCharLen(S1), l3PCharLen(S2), IgnoreCase);
end;

function l3Same(const S1: AnsiString; const S2: Il3CString; IgnoreCase: Boolean = false): Boolean;
  //overload;
begin
 if (S2 = nil) then
  Result := (S1 = '')
 else
  Result := l3Same(l3PCharLen(S1), S2.AsWStr, IgnoreCase);
end;
  
function l3Same(const S1: Il3CString; const S2: WideString; IgnoreCase: Boolean = false): Boolean;
  //overload;
begin
 if (S1 = nil) then
  Result := (S2 = '')
 else
  Result := l3Same(S1.AsWStr, l3PCharLen(S2), IgnoreCase);
end;

function l3Same(const S1: Il3CString; const S2: Il3CString; IgnoreCase: Boolean = false): Boolean;
  //overload;
begin
 if (S1 = S2) then
  Result := true
 else
 if (S1 = nil) then
  Result := l3IsNil(S2)
 else
 if (S2 = nil) then
  Result := l3IsNil(S1)
 else
  Result := l3Same(S1.AsWStr, S2.AsWStr, IgnoreCase);
end;

function l3Same(const S1: Il3CString; const S2: AnsiString; IgnoreCase: Boolean = false): Boolean;
  //overload;
begin
 if (S1 = nil) then
  Result := (S2 = '')
 else
  Result := l3Same(S1.AsWStr, S2, IgnoreCase);
end;

function l3Same(const S1: Il3CString; const S2: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  //overload;
begin
 if (S1 = nil) then
  Result := l3IsNil(S2)
 else
  Result := l3Same(S1.AsWStr, S2, IgnoreCase);
end;

function l3Same(const S1: Tl3WString; const S2: Il3CString; IgnoreCase: Boolean = false): Boolean;
  //overload;
begin
 if (S2 = nil) then
  Result := l3IsNil(S1)
 else
  Result := l3Same(S1, S2.AsWStr, IgnoreCase);
end;

function l3Same(const S1: Tl3WString; const S2: AnsiString; IgnoreCase: Boolean = false): Boolean;
  //overload;
  {-}
begin
 if (S2 = '') then
  Result := l3IsNil(S1)
 else
 if IgnoreCase then
  Result := (l3Compare(S1, S2, l3_siCaseUnsensitive) = 0)
 else
  Result := (l3Compare(S1, S2) = 0);
end;

function l3Same(const S1: Tl3WString; const S2: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  //overload;
  {-}
begin
 if (S1.SLen <> S2.SLen) then
  Result := false
 else 
 if IgnoreCase then
  Result := (l3Compare(S1, S2, l3_siCaseUnsensitive) = 0)
 else
  Result := (l3Compare(S1, S2) = 0);
end;

function l3Compare(const S1: Tl3PCharLenPrim; const S2: AnsiString; aSortIndex: Tl3SortIndex = l3_siNative): Long;
  //overload;
  {* - сравнивает строки. }
begin
 Result := l3Compare(S1, l3PCharLen(S2), aSortIndex);
end;

function l3Compare(const S1, S2: Tl3PCharLenPrim; aSortIndex: Tl3SortIndex = l3_siNative): Long;
  {overload;}
  {-}
var
 l_WS1,  l_WS2  : WideString;
 l_pWS1, l_pWS2 : PWideChar;
 l_Flags        : Cardinal;
 l_CP           : Integer;
begin
 Result := Long(S1.S) - Long(S2.S);
 if (Result <> 0) then
 begin
  if (S1.S = nil) then
  begin
   if (S2.SLen = 0) then
    Result := 0
   else
    Result := -1
  end//S1.S = nil
  else
  if (S2.S = nil) then
  begin
   if (S1.SLen = 0) then
    Result := 0
   else
    Result := 1
  end//S2.S = nil
  else
  if l3IsANSI(S1.SCodePage) AND (S1.SCodePage = S2.SCodePage) then
  begin
   if (aSortIndex = l3_siNative) then
    l_Flags := 0
   else
    l_Flags := NORM_IGNORECASE;
   Result := CompareStringA(LCID_RUSSIAN, l_Flags,
                            S1.S, S1.SLen,
                            S2.S, S2.SLen);
   Win32Check(LongBool(Result));
   Dec(Result, 2);
  end//l3IsANSI(S1.SCodePage)
  else
  begin
   if (S1.SCodePage = CP_Unicode) then
    l_pWS1 := PWideChar(S1.S)
   else
   begin
    SetLength(l_WS1, S1.SLen);
    l_CP := S1.SCodePage;
    if (l_CP = CP_OEMLite) then
     l_CP := CP_OEM;
    SetLength(l_WS1, l3MultiByteToWideChar(l_CP, {0,}
                                         S1.S, S1.SLen,
                                         PWideChar(l_WS1), S1.SLen));
    l_pWS1 := PWideChar(l_WS1);
   end;//S1.SCodePage = CP_Unicode
   if (S2.SCodePage = CP_Unicode) then
    l_pWS2 := PWideChar(S2.S)
   else
   begin
    SetLength(l_WS2, S2.SLen);
    l_CP := S2.SCodePage;
    if (l_CP = CP_OEMLite) then
     l_CP := CP_OEM;
    SetLength(l_WS2, l3MultiByteToWideChar(l_CP, {0,}
                                         S2.S, S2.SLen,
                                         PWideChar(l_WS2), S2.SLen));
    l_pWS2 := PWideChar(l_WS2);
   end;//S2.SCodePage = CP_Unicode
   if (aSortIndex = l3_siNative) then
    l_Flags := 0
   else
    l_Flags := NORM_IGNORECASE;
   if (Win32Platform = VER_PLATFORM_WIN32_NT) then
    Result := CompareStringW(LCID_RUSSIAN, l_Flags,
                             l_pWS1, S1.SLen,
                             l_pWS2, S2.SLen)
   else
    Result := CompareStringA(LCID_RUSSIAN, l_Flags,
                             PANSIChar(ANSIString(l_pWS1)), S1.SLen,
                             PANSIChar(ANSIString(l_pWS2)), S2.SLen);
   Win32Check(LongBool(Result));
   Dec(Result, 2);
  end;//l3IsANSI(S1.SCodePage)
 end
 else//Result <> 0
  Result := S1.SLen - S2.SLen;
end;

function l3Compare(const S1, S2: AnsiString; aSortIndex: Tl3SortIndex = l3_siNative): Long;
  {overload;}
  {-}
begin
 Result := l3Compare(l3PCharLen(S1), l3PCharLen(S2), aSortIndex);
end;

function l3Compare(const S1, S2: PAnsiChar; aSortIndex: Tl3SortIndex = l3_siNative): Long;
  //overload;
  {-}
begin
 Result := l3Compare(l3PCharLen(S1), l3PCharLen(S2), aSortIndex);
end;

function l3PCharLenPart(aSt       : PAnsiChar;
                        aStart    : Long;
                        aFinish   : Long;
                        aCodePage : Long): Tl3PCharLen;
  //overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
begin
 Result.InitPart(aSt, aStart, aFinish, aCodePage);
end;

function l3PCharLen(const S: Il3CString): Tl3PCharLen;
  //overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
begin
 if (S = nil) then
  l3AssignNil(Result)
 else
  Tl3WString(Result) := S.AsWStr;
end;

function l3PCharLen(S: PAnsiChar = nil; Len: Long = -1; aCodePage: Long = CP_ANSI): Tl3PCharLen;
  {overload;}
  {-}
begin
 Result.Init(S, Len, aCodePage);
end;

function l3PCharLen(const S: PWideChar; aLength : Long = -1): Tl3PCharLen;
  //overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
begin
 Result := l3PCharLen(PAnsiChar(S), aLength, CP_Unicode);
end;
  
function l3PCharLen(const S: AnsiString; aCodePage: Long = CP_ANSI): Tl3PCharLen;
  {overload;}
  {-}
begin
 Result.Init(PAnsiChar(S), Length(S), aCodePage);
end;

function l3PCharLen(const S: WideString): Tl3PCharLen;
  //overload;
  {* - формирует структуру Tl3PCharLen из своих параметров. Используется как аналог функции преобразования типов. }
begin
 Result.Init(PAnsiChar(PWideChar(S)), Length(S), CP_Unicode);
end;

function l3RTrimLenEX(S : PAnsiChar; Len : Long): Long;
                   {eax,       edx}
  register;
asm
       or      eax, eax
       jz      @@ret
       mov     ecx, edx
       jecxz   @@nil
       push    esi
       push    edi
       mov     esi, eax
       mov     edi, esi
       add     esi, ecx
       dec     esi
       std
@@lp:
       lodsb
       call    l3IsHiddenWhiteSpace
       or      eax, eax
       jz      @@loopend
       loop    @@lp
       pop     edi
       pop     esi
       cld
       jmp     @@nil
@@loopend:
       mov     eax, esi
       sub     eax, edi
       add     eax, 2
       pop     edi
       pop     esi
       cld
       jmp     @@ret
@@nil:
       xor     eax, eax
@@ret:
end;{asm}

function l3RTrimLen(S : PAnsiChar; Len : Long): Long;
                   {eax,       edx}
  register;
asm
       or      eax, eax
       jz      @@ret
       mov     ecx, edx
       jecxz   @@nil
       push    esi
       push    edi
       mov     esi, eax
       mov     edi, esi
       add     esi, ecx
       dec     esi
       std
@@lp:
       lodsb
       call    l3IsWhiteSpace
       or      eax, eax
       jz      @@loopend
       loop    @@lp
       pop     edi
       pop     esi
       cld
       jmp     @@nil
@@loopend:
       mov     eax, esi
       sub     eax, edi
       add     eax, 2
       pop     edi
       pop     esi
       cld
       jmp     @@ret
@@nil:
       xor     eax, eax
@@ret:
end;{asm}
(* var
  P : PAnsiChar;
 begin
  Result := 0;
  if (S <> nil) AND (Len > 0) then
  begin
   P := S + Len; Dec(P);
   while ((P >= S) AND l3IsWhiteSpace(P^)) do Dec(P);
   Result := Longint(P) - Longint(S);
   Inc(Result);
  end;
 end;*)

function l3RTrimLenWEX(S : PWideChar; Len : Long): Long;
                   {eax,       edx}
var
 P : PWideChar;
begin
 Result := 0;
 if (S <> nil) AND (Len > 0) then
 begin
  P := S + Len; Dec(P);
  while ((P >= S) AND l3IsHiddenWhiteSpaceW(P^)) do Dec(P);
  if (P < S) then
   Result := 0
  else
   Result := Succ((Cardinal(P) - Cardinal(S)) div SizeOf(WideChar));
 end;//S <> nil
end;


function l3RTrimLenW(S : PWideChar; Len : Long): Long;
                   {eax,       edx}
var
 P : PWideChar;
begin
 Result := 0;
 if (S <> nil) AND (Len > 0) then
 begin
  P := S + Len; Dec(P);
  while ((P >= S) AND l3IsWhiteSpaceW(P^)) do Dec(P);
  if (P < S) then
   Result := 0
  else
   Result := Succ((Cardinal(P) - Cardinal(S)) div SizeOf(WideChar));
 end;//S <> nil
end;

procedure l3ReplaceNonReadable(St: PAnsiChar; StLen: Long = -1);
 {* - заменяет нечитаемые символы пробелами. }
begin
 l3Replace(St, cc_NonReadable, cc_HardSpace, StLen);
end;

function l3ReplaceNonReadable(const St: AnsiString) : AnsiString;
 {* - заменяет нечитаемые символы пробелами. }
begin
 Result := St;
 l3ReplaceNonReadable(PAnsiChar(St), Length(St));
end;

function l3ReplaceNonReadable(const S: Tl3WString): Tl3PCharLen;
begin
 Result := Tl3PCharLen(S);
 l3ReplaceNonReadable(S.S, S.SLen);
end;

function l3ReplaceNonReadable(const S: Il3CString): Il3CString;
begin
 Result := l3CStr(S.AsWStr);
 l3ReplaceNonReadable(Result.AsWStr);
end;

(*procedure l3DeleteDoubleSpace(St: PAnsiChar; var StLen: Long);
  {-удаляет двойные пробелы}
var
 I, SI : Long;
begin
 if (St <> nil) AND (StLen > 0) then
 begin
  I:=0;
  while (St[I] <> #0) AND (I < StLen) do
  begin
   if l3IsWhiteSpace(St[I]) then
   begin
    SI:=I;
    repeat
     Inc(I)
    until not l3IsWhiteSpace(St[I]) OR (I = StLen);
    if (I-SI >= 2) then
    begin
     Inc(SI);
     l3Move((St+I)^, (St+SI)^, StLen-I);
     Dec(StLen, I-SI);
     I:=SI;
    end;//I-SI >= 2
   end//l3IsWhiteSpace(St[I])
   else
    Inc(I);
  end;{while..}
 end;//St <> nil
end;*)

(*procedure l3DeleteDoubleSpace(St: PWideChar; var StLen: Long);
  //overload;
var
 I, SI : Long;
begin
 if (St <> nil) AND (StLen > 0) then
 begin
  I:=0;
  while (St[I] <> #0) AND (I < StLen) do
  begin
   if l3IsWhiteSpaceW(St[I]) then
   begin
    SI:=I;
    repeat
     Inc(I)
    until not l3IsWhiteSpaceW(St[I]) OR (I = StLen);
    if (I-SI >= 2) then
    begin
     Inc(SI);
     l3Move((St+I)^, (St+SI)^, (StLen-I)*2);
     Dec(StLen, I-SI);
     I:=SI;
    end;//I-SI >= 2
   end//l3IsWhiteSpace(St[I])
   else
    Inc(I);
  end;{while..}
 end;//St <> nil
end;*)

function l3DeleteDoubleSpace(const aStr: AnsiString): AnsiString;
var
 I,IR    : Integer;
 lStrLen : Integer;
Begin
 I := 1;
 IR := 1;
 lStrLen := Length(AStr);
 SetLength(Result, lStrLen);
 while (I <= lStrLen) do
 begin
  Result[IR] := AStr[I];
  if (l3IsWhiteSpace(AStr[I])) then
  begin
   while (I < lStrLen) and l3IsWhiteSpace(AStr[Succ(I)]) do
    Inc(I);
  end;//l3IsWhiteSpace(AStr[I])
  Inc(IR);
  Inc(I);
 end;//while (I <= lStrLen)
 SetLength(Result, IR-1);
end;

function l3DeleteDoubleSpace(const aStr: Il3CString): Il3CString;
  //overload;
begin
 Result := l3DeleteSerias(aStr, cc_HardSpace);
end;

function l3DeleteSerias(const aStr: Il3CString; aChar: AnsiChar): Il3CString;
  {-}
var
 l_CurrentIndex: Integer;
 l_FirstDuplicateIndex: Integer;
 l_FirstUniqueIndex: Integer;
 l_S: Tl3WString;
 l_St: Tl3InterfacedString;
begin
 if (aStr = nil) then
  Result := nil
 else
 begin
  l_S := aStr.AsWStr;
  if l3IsNil(l_S) then
   Result := nil
  else
  begin
   l_CurrentIndex := 0;
   l_FirstUniqueIndex := 0;
   l_St := nil;
   try
    if (l_S.SCodePage = CP_Unicode) then
    begin
     while (l_CurrentIndex < l_S.SLen) do
     begin
      if (l3WideToChar(PWideChar(l_S.S)[l_CurrentIndex]) = aChar) then
      begin
       l_FirstDuplicateIndex := l_CurrentIndex;
       repeat
        Inc(l_CurrentIndex);
       until not (l3WideToChar(PWideChar(l_S.S)[l_CurrentIndex]) = aChar) OR (l_CurrentIndex = l_S.SLen);
       if (l_CurrentIndex-l_FirstDuplicateIndex >= 2) then
       begin
        if (l_St = nil) then
        // - копируем первый кусок
         l_St := Tl3InterfacedString.Make(l3PCharLenPart(l_S.S, l_FirstUniqueIndex, l_FirstDuplicateIndex + 1, l_S.SCodePage))
        else
         l_St.Append(l3PCharLenPart(l_S.S, l_FirstUniqueIndex, l_FirstDuplicateIndex + 1, l_S.SCodePage));
        l_FirstUniqueIndex := l_CurrentIndex;
        Inc(l_CurrentIndex);
       end;//l_CurrentIndex-SI >= 2
      end//l_S.S[l_CurrentIndex] = aChar
      else
       Inc(l_CurrentIndex);
     end;//while (l_CurrentIndex < l_S.SLen)
    end//l_S.SCodePage = CP_Unicode
    else
    begin
     while (l_CurrentIndex < l_S.SLen) do
     begin
      if (l_S.S[l_CurrentIndex] = aChar) then
      begin
       l_FirstDuplicateIndex := l_CurrentIndex;
       repeat
        Inc(l_CurrentIndex);
       until not (l_S.S[l_CurrentIndex] = aChar) OR (l_CurrentIndex = l_S.SLen);
       if (l_CurrentIndex-l_FirstDuplicateIndex >= 2) then
       begin
        if (l_St = nil) then
        // - копируем первый кусок
         l_St := Tl3InterfacedString.Make(l3PCharLenPart(l_S.S, l_FirstUniqueIndex, l_FirstDuplicateIndex + 1, l_S.SCodePage))
        else
         l_St.Append(l3PCharLenPart(l_S.S, l_FirstUniqueIndex, l_FirstDuplicateIndex + 1, l_S.SCodePage));
        l_FirstUniqueIndex := l_CurrentIndex;
        Inc(l_CurrentIndex);
       end;//l_CurrentIndex-SI >= 2
      end//l_S.S[l_CurrentIndex] = aChar
      else
       Inc(l_CurrentIndex);
     end;//while (l_CurrentIndex < l_S.SLen)
    end;//l_S.SCodePage = CP_Unicode
    if (l_St = nil) then
     Result := aStr
    else
    begin
     l_St.Append(l3PCharLenPart(l_S.S, l_FirstUniqueIndex, l_S.SLen, l_S.SCodePage));
     Result := l_St;
    end;//l_St = nil
   finally
    l3Free(l_St);
   end;//try..finally
  end;//l3IsNil(l_S)
 end;//l3IsNil(aStr)
end;

function ev_lpIndent(St: PAnsiChar; StLen: Long): Long;
  {-возвращает отступ строки}
begin
 Result := 0;
 if (St <> nil) then
  while (StLen > 0) do
  begin
   Case St^ of
    cc_Null      : break;
    cc_HardSpace : Inc(Result);
    cc_Tab       : Inc(Result, 8);
    else break;
   end;//Case St^
   Inc(St);
   Dec(StLen);
  end;//while (StLen > 0)
end;

function ev_lpIndentPrim(St: PAnsiChar; StLen: Long): Long;
  {-возвращает отступ строки}
begin
 Result := 0;
 if (St <> nil) then
  while (StLen > 0) AND l3IsWhiteSpace(St^) do
  begin
   Inc(Result);
   Inc(St);
   Dec(StLen);
  end;//while (StLen > 0)..
end;

function ev_lpCharset2Indent(St: PAnsiChar; StLen: Long; aCharset: TCharSet): Long;
  {-возвращает отступ строки, состоящий из символов из набора}
begin
 Result := 0;
 if (St <> nil) then
  while (StLen > 0) AND (St^ in aCharset) do
  begin
   Inc(Result);
   Inc(St);
   Dec(StLen);
  end;//while (StLen > 0)..
end;

function l3CharSetPresentEx(const S: Tl3WString;
                            const CS  : TChars): Long; overload;
begin
 Result := l3CharSetPresentEx(S.S, S.SLen, CS, S.SCodePage);
end;

function l3CharSetPresentEx(St: PAnsiChar; StLen: Long; const CS: TChars; aCodePage : Long = CP_ANSI): Long;
  {-}
var
 I : Long;
begin
 Result := -1;
 if (St <> nil) then
 begin
  if (aCodePage = CP_Unicode) then
  begin
   if (StLen < 0) then StLen := High(Long);
   I := 0;
   while (PWideChar(St)[I] <> #0) AND (I < StLen) do
    if l3InSet(PWideChar(St)[I], CS) then
    begin
     Result := I;
     Exit;
    end//PWideChar(St)[I] in CS
    else
     Inc(I);
  end
  else
  begin
   if (StLen < 0) then StLen := High(Long);
   I := 0;
   while (St[I] <> #0) AND (I < StLen) do
    if (St[I] in CS) then
    begin
     Result := I;
     Exit;
    end//St[I] in CS
    else
     Inc(I);
  end;//aCodePage = CP_Unicode
 end;//St <> nil
end;

function l3CharSetPresentExR(aSt: PAnsiChar; aPos: Long; const aCS: TChars): Long;
  {* - определяет есть ли хотя бы один символ из множества в строке и
       возвращает его позицию или -1. Движется с конца строки. }
var
 I : Long;
begin
 Result := -1;
 if (aSt <> nil) then
 begin
  I := aPos;
  while I >= 0 do
   if (aSt[I] in aCS) then
   begin
    Result := I;
    Exit;
   end
   else
    Dec(I);
 end;//St <> nil
end;

function l3AllCharsInCharSet(St: PWideChar; StLen: Long; const CS: TChars): Bool;
  //overload;
var
 I : Long;
begin
 Result := false;
 if (St = nil) OR (StLen = 0) then
  Exit;
 I := 0;
 while (St[I] <> #0) AND (I < StLen) do
  if not (AnsiChar(St[I]) in CS) then
   Exit
  else
   Inc(I);
 Result := true;
end;

function l3AllCharsInCharSet(St: PAnsiChar; StLen: Long; const CS: TChars): Bool;
  {* - определяет все ли символы из множества в строке. }
var
 I : Long;
begin
 Result := false;
 if (St = nil) OR (StLen = 0) then
  Exit;
 I := 0;
 while (St[I] <> #0) AND (I < StLen) do
  if not (St[I] in CS) then
   Exit
  else
   Inc(I);
 Result := true;
end;

function l3AllCharsInCharSet(const aSt: Tl3WString; const CS: TChars): Bool;
  //overload;
  {* - определяет все ли символы в строке принадлежат множеству. }
begin
 if (aSt.SCodePage = CP_Unicode) then
  Result := l3AllCharsInCharSet(PWideChar(aSt.S), aSt.SLen, CS)
 else
  Result := l3AllCharsInCharSet(aSt.S, aSt.SLen, CS);
end;

function l3AllCharsInCharSet(const aSt: Il3CString; const CS: TChars): Bool;
  //overload;
begin
 if (aSt = nil) then
  Result := false
 else
  Result := l3AllCharsInCharSet(aSt.AsWStr, CS);
end;

function l3EmptyOrAllCharsInCharSet(const aSt: Tl3WString; const CS: TChars): Bool;
  {* - определяет пустая ли строка или все ли символы в строке принадлежат множеству. }
begin
 Result := l3IsNil(aSt) OR l3AllCharsInCharSet(aSt, CS);
end;

function l3CharSetPresent(St: PAnsiChar; StLen: Long; const CS: TChars): Bool;
  {-}
var
 I : Long;
begin
 Result := false;
 I := 0;
 if (St <> nil) then
  while (St[I] <> #0) AND (I < StLen) do
   if (St[I] in CS) then
   begin
    Result := true;
    Exit;
   end
   else
    Inc(I);
end;

function l3CharSetPresent(St       : PWideChar;
                          StLen    : Long;
                          const CS : TChars): Bool;
  //overload;
var
 I : Long;
begin
 Result := false;
 I := 0;
 if (St <> nil) then
  while (St[I] <> #0) AND (I < StLen) do
   if (AnsiChar(St[I]) in CS) then
   begin
    Result := true;
    Exit;
   end
   else
    Inc(I);
end;

function l3CharSetPresent(const aSt : Tl3WString;
                          const CS  : TChars): Bool;
  //overload;
  {-}
begin
 if (aSt.SCodePage = CP_Unicode) then
  Result := l3CharSetPresent(PWideChar(aSt.S), aSt.SLen, CS)
 else
  Result := l3CharSetPresent(aSt.S, aSt.SLen, CS);
end;
  
function l3CharSetPresent(const aSt : Il3CString;
                          const CS  : TChars): Bool;
  //overload;
begin
 if (aSt = nil) then
  Result := false
 else
  Result := l3CharSetPresent(aSt.AsWStr, CS); 
end;

function ev_lpIsTableLine(St: PAnsiChar; StLen, SepWidth: Long; var SepPos, SepLen, SepCount: Long): Bool;
  {-}
var
 I : Long;
 L : Long;
 S : Long;
begin
 Result := false;
 SepCount := 0;
 if (St <> nil) AND (StLen > 0) then
 begin
  I := ev_lpIndentPrim(St, StLen);
  L := l3RTrimLen(St+I, StLen-I);
  L := L + I;
  S := 0;
  while (I < L) AND (St[I] <> #0) do
  begin
   if l3IsWhiteSpace(St[I]) then
   begin
    if (SepCount = 0) AND (S = 0) then SepPos := I;
    Inc(S);
    if (S >= SepWidth) then
     Result := true;
   end//l3IsWhiteSpace(St[I])
   else
   begin
    if (SepCount = 0) then
     SepLen := S;
    if (S >= SepWidth) then
     Inc(SepCount);
    S := 0;
   end;//l3IsWhiteSpace..
   Inc(I);
  end;//while (I<L)..
 end;//St <> nil..
end;

{--- Паскаль-строки - Pascal strings  ---}

function ev_psRTrim(const S : AnsiString): AnsiString;
  {-отрезает у строки конечные пробелы}
begin
 Result := l3PCharLen2String(l3RTrim(l3PCharLen(S)));
end;

function ev_psLTrim(const S : AnsiString): AnsiString;
  {-отрезает у строки начальные пробелы}
begin
 Result := l3PCharLen2String(l3LTrim(l3PCharLen(S)));
end;

function ev_psTrim(const S : AnsiString): AnsiString;
  {-отрезает у строки начальные и конечные пробелы}
begin
 Result := ev_psLTrim(ev_psRTrim(S));
end;

function l3CountOfChar(C: AnsiChar; const S: PAnsiChar): Long;
  {* - возвращает количество символов C в строке S}
begin
 Result := l3CountOfChar(C, l3PCharLen(S));
end;

function l3CountOfChar(C: AnsiChar; const S: AnsiString): Long;
  {* - возвращает количество символов C в строке S}
begin
 if Length(S) = 0 then
  Result := 0
 else
  Result := l3CountOfChar(C, PAnsiChar(S));
end;

function ev_psPrefix(const S: AnsiString; C: AnsiChar): AnsiString;
var
 P : integer;
begin
 Result := S;
 P := Pos(C, S);
 if (P > 0) then Result := Copy(S, 1, P-1);
end;

function ev_psSuffix(const S: AnsiString; C: AnsiChar): AnsiString;
var
 P : integer;
begin
 Result := '';
 P := Pos(C, S);
 if (P > 0) then Result := Copy(S, P+1, Length(S)-P);
end;

function ev_psSuffix(const S: AnsiString; const C: AnsiString): AnsiString;
  //overload;
  {* - возвращает суффикс строки. C - разделитель. }
var
 P : integer;
begin
 Result := '';
 P := Pos(C, S);
 if (P > 0) then
  Result := Copy(S, P+Length(C), Length(S)-Length(C)+1-P);
end;

function ev_psFixLen(const S: String255; Len: Long; C: AnsiChar): String255;
begin
 Len := Max(Len, Length(S));
 l3FillChar(Result, SizeOf(Result), Ord(C));
 SetLength(Result, Len);
 l3Move(S[1], Result[1], Length(S));
end;

{--- Строки параграфа - Paragraph strings ---}

procedure l3AssignNil(var S: Tl3PCharLenPrim); 
  {-очищает строку параграфа}
begin
 l3FillChar(S, SizeOf(S), 0);
end;

function l3RTrimHiddenWS(const S: Tl3WString): Tl3WString;
begin
 Result := S;
 if not l3IsNil(Result) then
 begin
  if (Result.SCodePage = CP_Unicode) then
   Result.SLen := l3RTrimLenWEX(PWideChar(Result.S), Result.SLen)
  else
   Result.SLen := l3RTrimLenEX(Result.S, Result.SLen);
 end;//not l3IsNil(Result)
end;

function l3RTrim(const S: Tl3WString): Tl3PCharLen;
  {-}
begin
 Result := Tl3PCharLen(S);
 if not l3IsNil(Result) then
 begin
  if (Result.SCodePage = CP_Unicode) then
   Result.SLen := l3RTrimLenW(PWideChar(Result.S), Result.SLen)
  else
   Result.SLen := l3RTrimLen(Result.S, Result.SLen);
 end;//not l3IsNil(Result)
end;

function l3LTrim(const aSt : Tl3WString) : Tl3WString;
  //overload;
  {-}
begin
 Result := aSt;
 if not l3IsNil(Result) then
 begin
  if (Result.SCodePage = CP_Unicode) then
  begin
   while (Result.SLen > 0) do
   begin
    if l3IsWhiteSpaceW(PWideChar(Result.S)^) then
    begin
     Inc(PWideChar(Result.S));
     Dec(Result.SLen);
    end//l3IsWhiteSpaceW..
    else
     break;
   end;//while (Result.SLen > 0)
  end//Result.SCodePage = CP_Unicode
  else
  begin
   while (Result.SLen > 0) do
   begin
    if l3IsWhiteSpace(Result.S^) then
    begin
     Inc(Result.S);
     Dec(Result.SLen);
    end//l3IsWhiteSpaceW..
    else
     break;
   end;//while (Result.SLen > 0)
  end;//Result.SCodePage = CP_Unicode
 end;//not l3IsNil(Result)
end;

function l3Trim(const S: Il3CString): Il3CString;
  //overload;
var
 l_S  : Tl3WString;
 l_S1 : Tl3WString;
begin
 if (S = nil) then
  Result := nil
 else
 begin
  l_S := S.AsWStr;
  if l3IsNil(l_S) then
   Result := nil
  else
  begin
   l_S1 := l3Trim(l_S);
   if (Tl3PCharLen(l_S1).EQ(l_S)) then
    Result := S
   else
    Result := l3CStr(l_S1);
  end;//l3IsNil(l_S)
 end;//l3IsNil(S)
end;

function l3Trim(const S: Il3CString; aWhite: TCharSet): Il3CString;
  //overload;
var
 l_S  : Tl3WString;
 l_S1 : Tl3WString;
begin
 if (S = nil) then
  Result := nil
 else
 begin
  l_S := S.AsWStr;
  if l3IsNil(l_S) then
   Result := nil
  else
  begin
   l_S1 := l3Trim(l_S, aWhite);
   if (Tl3PCharLen(l_S1).EQ(l_S)) then
    Result := S
   else
    Result := l3CStr(l_S1);
  end;//l3IsNil(l_S)
 end;//l3IsNil(S)
end;

function l3Trim(const S: Tl3WString): Tl3WString;
  {-}
begin
 Result := l3LTrim(l3RTrim(S));
end;

function l3Trim(const S: AnsiString; aWhite: TCharSet = cc_WhiteSpace): AnsiString;
  {-}
var
 B, E : Integer;
begin
 E := Length(S);
 if E = 0 then exit;
 while (E > 0) do
 begin
  if (S[E] in aWhite) then
   Dec(E)
  else
   break
 end;//while (E > 0)

 B := 1;
 while (B < E) do
 begin
  if (S[B] in aWhite) then
   Inc(B)
  else
   break
 end;//while (B < E)

 Result := Copy(S, B, E-B+1);
end;

function l3RTrim(const S: AnsiString; aWhite: TCharSet = cc_WhiteSpace): AnsiString;
  {-}
var
 E : Integer;
begin
 E := Length(S);
 if E = 0 then exit;
 while (E > 0) do
 begin
  if (S[E] in aWhite) then
   Dec(E)
  else
   break
 end;//while (E > 0)

 Result := Copy(S, 1, E);
end;

function l3RTrim(const S: Tl3WString; aWhite: TCharSet): Tl3WString;
  {-}
begin
 Result := S;
 if not l3IsNil(Result) then
 begin
  if (Result.SCodePage = CP_Unicode) then
  begin
   while (Result.SLen > 0) do
   begin
    if l3InSet(PWideChar(Result.S)[Result.SLen-1], aWhite) then
     Dec(Result.SLen)
    else
     break
   end;//while (Result.SLen > 0)
  end//Result.SCodePage = CP_Unicode
  else
  begin
   while (Result.SLen > 0) do
   begin
    if (Result.S[Result.SLen-1] in aWhite) then
     Dec(Result.SLen)
    else
     break 
   end;//while (Result.SLen > 0)
  end;//Result.SCodePage = CP_Unicode
 end;//not l3IsNil(Result)
end;

function l3RTrim(const aSt : Il3CString; aWhite: TCharSet) : Il3CString;
  //overload;
var
 l_S  : Tl3WString;
 l_S1 : Tl3WString;
begin
 if (aSt = nil) then
  Result := nil
 else
 begin
  l_S := aSt.AsWStr;
  if l3IsNil(l_S) then
   Result := nil
  else
  begin
   l_S1 := l3RTrim(l_S, aWhite);
   if (Tl3PCharLen(l_S1).EQ(l_S)) then
    Result := aSt
   else
    Result := l3CStr(l_S1);
  end;//l3IsNil(l_S)
 end;//l3IsNil(S)
end;

function l3LTrim(const aSt : Tl3WString; aWhite: TCharSet) : Tl3WString;
  //overload;
  {-}
begin
 Result := aSt;
 if not l3IsNil(Result) then
 begin
  if (Result.SCodePage = CP_Unicode) then
  begin
   while (Result.SLen > 0) do
   begin
    if l3InSet(PWideChar(Result.S)^, aWhite) then
    begin
     Inc(PWideChar(Result.S));
     Dec(Result.SLen);
    end//l3IsWhiteSpaceW..
    else
     break;
   end;//while (Result.SLen > 0)
  end//Result.SCodePage = CP_Unicode
  else
  begin
   while (Result.SLen > 0) do
   begin
    if (Result.S^ in aWhite) then
    begin
     Inc(Result.S);
     Dec(Result.SLen);
    end//l3IsWhiteSpaceW..
    else
     break;
   end;//while (Result.SLen > 0)
  end;//Result.SCodePage = CP_Unicode
 end;//not l3IsNil(Result)
end;

function l3LTrim(const aSt : Il3CString) : Il3CString;
  //overload;
var
 l_S  : Tl3WString;
 l_S1 : Tl3WString;
begin
 if (aSt = nil) then
  Result := nil
 else
 begin
  l_S := aSt.AsWStr;
  if l3IsNil(l_S) then
   Result := nil
  else
  begin
   l_S1 := l3LTrim(l_S);
   if (Tl3PCharLen(l_S1).EQ(l_S)) then
    Result := aSt
   else
    Result := l3CStr(l_S1);
  end;//l3IsNil(l_S)
 end;//l3IsNil(S)
end;

function l3LTrim(const aSt : Il3CString; aWhite: TCharSet) : Il3CString;
  //overload;
var
 l_S  : Tl3WString;
 l_S1 : Tl3WString;
begin
 if (aSt = nil) then
  Result := nil
 else
 begin
  l_S := aSt.AsWStr;
  if l3IsNil(l_S) then
   Result := nil
  else
  begin
   l_S1 := l3LTrim(l_S, aWhite);
   if (Tl3PCharLen(l_S1).EQ(l_S)) then
    Result := aSt
   else
    Result := l3CStr(l_S1);
  end;//l3IsNil(l_S)
 end;//l3IsNil(S)
end;

function l3Trim(const S: Tl3WString; aWhite: TCharSet): Tl3PCharLen;
  {-}
begin
 Tl3WString(Result) := l3LTrim(l3RTrim(S, aWhite), aWhite);
end;

function l3IsNil(const S: Tl3PCharLenPrim): LongBool; register;
  {-}
asm
        mov    EDX, [EAX].Tl3PCharLenPrim.S
        or     EDX, EDX
        JZ     @@1
        mov    ECX, [EAX].Tl3PCharLenPrim.SLen
        JECXZ  @@1
        xor    EAX, EAX
@@1:
end;

function l3IsNil(const S: AnsiString): Boolean;
  //overload;
begin
 Result := (S = '');
end;

function l3IsNil(const aStr: Il3CString): Boolean;
  //overload;
begin
 Result := (aStr = nil) OR l3IsNil(aStr.AsWStr);
end;

function ev_lpScan(C: AnsiChar; S: PAnsiChar; Len: Long): PAnsiChar;
  //overload;
  register;
  {-ищет вхождение символа C в строку S длины Len возвращает указатель или nil}
asm
        PUSH    EDI
        MOV     EDI, EDX
        CLD
        REPNE   SCASB
        MOV     EAX,0
        JNE     @@1
        MOV     EAX,EDI
        DEC     EAX
@@1:    POP     EDI
end;

function  ev_lpScan(C: WideChar; S: PWideChar; Len: Long): PAnsiChar;
  //overload;
  {* - ищет вхождение символа C в строку S длины Len возвращает указатель или nil
       (в прямом направлении). }
  //overload;
  register;
  {-ищет вхождение символа C в строку S длины Len возвращает указатель или nil}
asm
        PUSH    EDI
        MOV     EDI, EDX
        CLD
        REPNE   SCASW
        MOV     EAX,0
        JNE     @@1
        MOV     EAX,EDI
        DEC     EAX
@@1:    POP     EDI
end;

function  l3_ssTestChar(const P: ShortString; C: AnsiChar): Boolean;
  { - }
begin
 Result := ev_lpScan(C, PAnsiChar(@P[1]), Long(P[0])) <> nil;
end;

function ev_lpRScan(C: AnsiChar; S: PAnsiChar; Len: Long): PAnsiChar; register;
  {-ищет вхождение символа C в строку S длины Len возвращает указатель или nil}
asm
        PUSH    EDI
        MOV     EDI, EDX
        ADD     EDI, ECX
        STD
        REPNE   SCASB
        MOV     EAX,0
        JNE     @@1
        MOV     EAX,EDI
        inc     EAX
@@1:
        CLD
        POP     EDI
end;

function ev_lpCharIndex(C: AnsiChar; const S: Tl3WString): Long;
var
 l_P : PAnsiChar;
begin
 if (S.SCodePage = CP_Unicode) then
  l_P := ev_lpScan(WideChar(C), PWideChar(S.S), S.SLen)
 else
  l_P := ev_lpScan(C, S.S, S.SLen);
 if (l_P = nil) then
  Result := l3NotFound
 else
 if (S.SCodePage = CP_Unicode) then
  Result := (l_P - S.S) div 2
 else
  Result := (l_P - S.S);
end;

(*
function ev_lpCharIndex(C: AnsiChar; S: PAnsiChar; Len: Long): Long; register;
  {-возвращает индекс символа C или -1}
asm
        call   ev_lpScan
        OR     EAX, EAX
        JZ     @@1
        SUB    EAX, EDX
        INC    EAX
@@1:    DEC    EAX
end;*)

function _l3HasWhiteSpace(const S: Tl3PCharLen): Bool;
register;
  {-возвращает содержит ли строка пробелы и т.п.}
asm
        PUSH   ESI
        mov    ESI, [EAX].Tl3PCharLen.S
        or     ESI, ESI
        JZ     @@1
        mov    ECX, [EAX].Tl3PCharLen.SLen
        JECXZ  @@1
        CLD
@@2:    lodsb
        call   l3IsWhiteSpace
        or     eax, eax
        jnz    @@3
        LOOP   @@2
@@1:    xor    EAX, EAX
@@3:    POP    ESI
end;

function _l3HasWhiteSpaceW(const S: Tl3PCharLen): Bool;
register;
  {-возвращает содержит ли строка пробелы и т.п.}
asm
        PUSH   ESI
        mov    ESI, [EAX].Tl3PCharLen.S
        or     ESI, ESI
        JZ     @@1
        mov    ECX, [EAX].Tl3PCharLen.SLen
        JECXZ  @@1
        CLD
@@2:    lodsd
        call   l3IsWhiteSpaceW
        or     eax, eax
        jnz    @@3
        LOOP   @@2
@@1:    xor    EAX, EAX
@@3:    POP    ESI
end;

function l3HasWhiteSpace(const S: Tl3PCharLen): Bool;
  {* - возвращает содержит ли строка пробелы и т.п. }
begin
 if (S.SCodePage = CP_Unicode) then
  Result := _l3HasWhiteSpaceW(S)
 else
  Result := _l3HasWhiteSpace(S);
end;

function _plEntryCount(C: AnsiChar; const S: Tl3PCharLenPrim): Long;
register;
  {-считает количество вхождений символа C в строку S}
asm
        PUSH   ESI
        mov    ESI, [EDX].Tl3PCharLenPrim.S
        or     ESI, ESI
        JZ     @@1
        mov    ECX, [EDX].Tl3PCharLenPrim.SLen
        JECXZ  @@1
        xor    EDX, EDX
        mov    AH,  AL
        CLD
@@2:    lodsb
        cmp    AH, AL
        JNE    @@4
        inc    EDX
@@4:    LOOP   @@2
        mov    EAX, EDX
        JMP    @@3
@@1:    xor    EAX, EAX
@@3:    POP    ESI
end;

function _plEntryCountW(C: WideChar; const S: Tl3PCharLenPrim): Long;
var
 l_Index : Integer;
begin
 Result := 0;
 for l_Index := 0 to S.SLen do
  if (PWideChar(S.S)[l_Index] = C) then
   Inc(Result);
end;

function l3CountOfChar(C: AnsiChar; const S: Tl3PCharLenPrim): Long;
begin
 if (S.SCodePage = CP_Unicode) then
  Result := _plEntryCountW(WideChar(C), S)
 else
  Result := _plEntryCount(C, S);
end;

function ev_lpEntryCount(C: AnsiChar; S: PAnsiChar; L: Long): Long;
register;
  {-считает количество вхождений символа C в строку S}
asm
        PUSH   ESI
        JECXZ  @@1
        mov    ESI, EDX
        or     ESI, ESI
        JZ     @@1
        xor    EDX, EDX
        mov    AH,  AL
        CLD
@@2:    lodsb
        cmp    AH, AL
        JNE    @@4
        inc    EDX
@@4:    LOOP   @@2
        mov    EAX, EDX
        JMP    @@3
@@1:    xor    EAX, EAX
@@3:    POP    ESI
end;

function l3FindChar(aChar: AnsiChar; var S: Tl3PCharLenPrim): Tl3PCharLen;
  {-}
var
 l_CharSize : Integer;
 P1         : PAnsiChar;
 NLen       : Long;
begin
 l3AssignNil(Result);
 if not l3IsNil(S) then
 begin
  if (S.SCodePage = CP_Unicode) then
  begin
   P1 := ev_lpScan(WideChar(aChar), PWideChar(S.S), S.SLen);
   l_CharSize := SizeOf(WideChar);
  end//S.SCodePage = CP_Unicode
  else
  begin
   P1 := ev_lpScan(aChar, S.S, S.SLen);
   l_CharSize := SizeOf(ANSIChar);
  end;//S.SCodePage = CP_Unicode
  if (P1 <> nil) then
  begin
   NLen := (LongInt(P1) - LongInt(S.S)) div l_CharSize;
   Inc(NLen);
   Result.SLen := S.SLen - NLen;
   if (Result.SLen <= 0) then
    Result.Init(nil, 0, S.SCodePage)
   else
    Result.Init(S.S + NLen * l_CharSize, Result.SLen, S.SCodePage);
   S.SLen := NLen;
  end;//P1 <> nil
 end;//not l3IsNil(S)..
end;

function l3HasChar(aChar: AnsiChar; const S: Tl3PCharLenPrim): Boolean;
  {* - ищет вхождение символа. }
var
 l_S : Tl3PCharLenPrim;  
begin
 l_S := S;
 Result := not l3IsNil(l3FindChar(aChar, l_S));
end;

procedure l3SplitWord(const FullWord : AnsiString; var SplitPos : Long);
  {* - разбивает слово по слогам. }

 function ValidSlog(const Slog : AnsiString; SlogNum : Byte) : Bool;

  function GlasnPresent(const Slog : AnsiString) : Bool;
  var
   i : Long;
  begin
   Result := false;
   for i := 1 to Length(Slog) do
    if Slog[i] in cc_RusVowels then begin
     Result := true;
     Break;
    end;
  end;

 begin
  if (Length(Slog) > 1) AND
     GlasnPresent(Slog) AND
     ((SlogNum = 1) OR not (Slog[1] in cc_Znaks)) then
   Result := true
  else
   Result := false;
 end;

var
 Len : Long;
begin
 Len := Length(FullWord);
 while (SplitPos > 1) do begin
  if ValidSlog(Copy(FullWord,1,SplitPos),1) AND
     ValidSlog(Copy(FullWord,SplitPos+1,Len),2) AND
     ((FullWord[SplitPos] in cc_RusVowels + cc_Znaks) OR
      not (FullWord[SplitPos+1] in cc_RusVowels)) AND
     (FullWord[Pred(SplitPos)] <> cc_Hyphen)
  then Exit
  else Dec(SplitPos);
 end;//while (SplitPos > 1)
 SplitPos:=0;
end;

function l3SplitBySlog(const aStr: Tl3PCharLen; var SplitPos : Long; aUseExtCharSet: Boolean = False): Tl3SplitStatus;
  {* - разбивает слово на позиции SplitPos по слогам}
const
 cWordDelimExcept = [cc_Hyphen];
 cWordDelimExceptEX = cWordDelimExcept + [cc_DoubleQuote, cc_RTDoubleQuote, cc_Comma, cc_RightBracket];
var
 l_WordStart    : Long;
 l_WordFinish   : Long;
 l_SplitPos     : Long;
 l_Word         : AnsiString;
 l_SplitCharSet : TCharSet;
begin
 Result := l3_ssNo;
{$IFDEF l3UseQuote4Split}
 if aUseExtCharSet then
  l_SplitCharSet := cWordDelimExceptEX
 else
  l_SplitCharSet := cWordDelimExcept;
{$ELSE}
 l_SplitCharSet := cWordDelimExcept;
{$ENDIF l3UseQuote4Split}  
 if (aStr.SCodePage <> CP_Unicode) AND
    (SplitPos > 0) AND
    not l3IsWordDelim(aStr.S[Pred(SplitPos)], aStr.SCodePage, l_SplitCharSet) then
 begin
  l_WordStart := SplitPos;
  while (l_WordStart > 0) do
   if l3IsWordDelim(aStr.S[l_WordStart], aStr.SCodePage, l_SplitCharSet) then
   begin
    Inc(l_WordStart);
    Break;
   end else
    Dec(l_WordStart);
  l_WordFinish := SplitPos;
  while (l_WordFinish < aStr.SLen) AND not l3IsWordDelim(aStr.S[l_WordFinish], aStr.SCodePage, l_SplitCharSet) do
    Inc(l_WordFinish);
  l_Word := l3PCharLen2String(l3PCharLen(aStr.S + l_WordStart,
                                         l_WordFinish - l_WordStart,
                                         aStr.SCodePage),
                              CP_ANSI);
  l_SplitPos := SplitPos - l_WordStart - 1; // - один символ на знак переноса
  l3SplitWord(l_Word, l_SplitPos);
  if (l_SplitPos > 0) then begin
   if (l_Word[l_SplitPos] = cc_Hyphen) then
    Result := l3_ssHyphen
   else if (l_SplitPos < Length(l_Word)) AND
           (l_Word[Succ(l_SplitPos)] = cc_Hyphen) then begin
    Result := l3_ssHyphen;
    Inc(l_SplitPos);
   end else
    Result := l3_ssYes;
   SplitPos := l_SplitPos + l_WordStart;
  end;//l_WordStart > 0
 end;//SplitPos > 0..
end;

function l3ConcatText(const aStr1, aStr2 : AnsiString; const aDelim : AnsiChar = #32) : AnsiString;
  {* - объединяет две строки добавляя между ними пробел если его там не было. }
var
 lLen : Integer;
 lNeedSpace : Boolean;
begin
 lNeedSpace := True;
 lLen := Length(aStr1);
 if (lLen = 0) or (aStr1[lLen] = aDelim) then
  lNeedSpace := False
 else
 begin
  lLen := Length(aStr2);
  if (lLen = 0) or (aStr2[1] = aDelim) then
   lNeedSpace := False;
 end;

 if lNeedSpace then
  Result := aStr1 + aDelim + aStr2
 else
  Result := aStr1 + aStr2;
end;

function l3StringCase(const aString  : AnsiString;
                      const aStrings : array of AnsiString;
                      aSortIndex     : Tl3SortIndex = l3_siNative): Long;
  {* - преобразует строку в ее позицию в массиве строк (аналог оператора Case). }
var
 i : Long;
begin
 Result := -1;
 for i := Low(aStrings) to High(aStrings) do begin
  if (l3Compare(aString, aStrings[i], aSortIndex) = 0) then begin
   Result := i;
   break;
  end;//l3Compare
 end;//for i..
end;
  
function l3SomeOf(const aStr : Il3CString;
                  const aVal : array of AnsiString): Boolean;
  {-}
var
 l_Index : Integer;
begin
 Result := false;
 for l_Index := Low(aVal) to High(aVal) do
  if l3Same(aStr, aVal[l_Index]) then
  begin
   Result := true;
   break;
  end;//l3Same(aStr, aVal[l_Index])
end;

function l3Hex2Dec(const S: AnsiString): Longint;
  {-}
var
  HexStr: AnsiString;
begin
  if Pos('$', S) = 0 then HexStr := '$' + S
  else HexStr := S;
  Result := StrToIntDef(HexStr, 0);
end;

function l3StripDoubleQuotes(const aFileName : AnsiString) : AnsiString;
 var
  lLen : Integer;
 begin
  lLen := Length(aFileName);
  If (lLen > 1) and (aFileName[1] = '"') and (aFileName[lLen] = '"')
   then Result := Copy(aFileName, 2, lLen - 2)
   else Result := aFileName;
 end;

function l3StringPos(const aSubStr, aStr: AnsiString; aBeginPos : Cardinal = 1): Cardinal;
var
 i : PAnsiChar;
begin
 Result := 0;
 if (aBeginPos < 1) or (aBeginPos > Length(aStr)) then
  Exit;

 i := StrPos(PAnsiChar(@aStr[aBeginPos]), @aSubStr[1]);
 if i = nil then
  Result := 0
 else
  Result := succ(i - PAnsiChar(aStr));
end;

function l3StringRPos(const aSubStr, aStr: AnsiString; aStrLen : Cardinal = 0): Cardinal; overload;
{* - возвращает позицию подстроки или 0. Поиск с конца}
begin
 Result := l3StringRPos(PAnsiChar(aSubStr), PAnsiChar(aStr),  aStrLen) + 1;
end;

function l3StringRPos(const aSubStr, aStr: PAnsiChar; aStrLen : Cardinal = 0): Integer; overload;
  {* - возвращает позицию подстроки или 0. Поиск с конца}
var
 lScanPos : Integer;
 lSubStrLen : Integer;

begin
 Result := -1;
 lSubStrLen := StrLen(aSubStr);
 if lSubStrLen = 0 then
  Exit;

 if aStrLen = 0 then
  aStrLen := StrLen(aStr)
 else
  aStrLen := Min(aStrLen, StrLen(aStr));

 lScanPos := aStrLen - lSubStrLen;

 while lScanPos >= 0 do
 begin
  if CompareMem(aSubStr, aStr + lScanPos, lSubStrLen) then
  begin
   Result := lScanPos;
   Break;
  end;
  Dec(lScanPos);
 end;
end;

procedure l3Replace(St            : PAnsiChar;
                    aReplaceChars : TChars;
                    aReplaceChar  : AnsiChar;
                    StLen         : Long = -1);
  //overload;
var
 I : Long;
begin
 if (St = nil) then
  Exit;
 if (StLen < 0) then
  StLen := StrLen(St);
 if (StLen = 0) then
  Exit;
 for I := 0 to Pred(StLen) do
  if (St[I] in aReplaceChars) then
   St[I] := aReplaceChar;
end;

procedure l3Replace(var aString   : AnsiString;
                     aReplaceChar : AnsiChar;
                     aNewChar     : AnsiChar;
                     aStartPos    : Integer = 1);
var
 i : Integer;
begin
 for i := Length(aString) downto aStartPos do
  if (aReplaceChar = aString[i]) then 
   aString[i] := aNewChar;
end;
 
procedure l3Replace(var aString   : AnsiString;
                    aReplaceChars : TChars;
                    aReplaceChar  : AnsiChar);
  {-}
var
 i : Long;
begin
 for i := 1 to Length(aString) do
  if (aString[i] in aReplaceChars) then
   aString[i] := aReplaceChar;
end;

procedure l3Replace(const aString : Tl3WString;
                    aReplaceChars : TChars;
                    aReplaceChar  : AnsiChar);
  //overload;
  {* - заменяет символы из множества на заданный. }
var
 i : Long;
begin
 if not l3IsNil(aString) then
  with aString do
   for i := 0 to Pred(SLen) do
    if (S[i] in aReplaceChars) then
     S[i] := aReplaceChar;
end;

procedure l3Replace(var aString    : Il3CString;
                    aChar          : AnsiChar;
                    const aReplace : Tl3WString);
  //overload;
  {* - заменяет символы из множества на заданный. }
var
 l_P : Il3CString;
 l_S : Il3CString;
begin
 while true do
 begin
  l3Split(aString, aChar, l_P, l_S);
  if l3IsNil(l_S) then
   break;
  aString := l3Cat([l3Cat(l_P, aReplace), l_S]);
 end;//while true
end;

procedure l3Replace(var aString   : Il3CString;
                    aReplaceChars : TChars;
                    aReplaceChar  : AnsiChar);
  //overload;
var
 l_S   : Tl3WString;
 l_St  : Tl3InterfacedString;
 l_I   : Integer;
 l_Str : Tl3Str;
begin
 if (aString <> nil) then
 begin
  l_S := aString.AsWStr;
  l_St := nil;
  try
   if (l_S.SCodePage = CP_Unicode) then
   begin
    for l_I := 0 to Pred(l_S.SLen) do
    begin
     if l3InSet(PWideChar(l_S.S)[l_I], aReplaceChars) then
     begin
      if (l_St = nil) then
       l_St := Tl3InterfacedString.Make(l_S);
      l_St[l_I] := aReplaceChar;
     end;//l3InSet(PWideChar(l_S.S)[l_I], aReplaceChars)
    end;//for l_I
   end//l_S.SCodePage = CP_Unicode
   else
   if (l_S.SCodePage = CP_ANSI) OR (l_S.SCodePage = CP_RussianWin) then
   begin
    for l_I := 0 to Pred(l_S.SLen) do
    begin
     if (l_S.S[l_I] in aReplaceChars) then
     begin
      if (l_St = nil) then
       l_St := Tl3InterfacedString.Make(l_S);
      l_St[l_I] := aReplaceChar;
     end;//l_S.S[l_I] in aReplaceChars
    end;//for l_I
   end//l_S.SCodePage = CP_ANSI..
   else
   begin
    l_Str.Init(l_S, CP_RussianWin);
    try
     for l_I := 0 to Pred(l_S.SLen) do
     begin
      if (l_Str.S[l_I] in aReplaceChars) then
      begin
       if (l_St = nil) then
        l_St := Tl3InterfacedString.Make(l_S);
       l_St[l_I] := aReplaceChar;
      end;//l_Str.S[l_I] in aReplaceChars
     end;//for l_I
    finally
     l_Str.Clear;
    end;//try..finally
   end;//l_S.SCodePage = CP_Unicode
   if (l_St <> nil) then
    aString := l_St;
  finally
   l3Free(l_St);
  end;//try..finally
 end;//aString <> nil
end;

procedure l3MReplace(var aString : Il3CString;
                     const aFrom : array of AnsiChar;
                     const aTo   : array of AnsiString);
  {* - заменяет символы из множества на заданный. }
var
 l_C       : AnsiChar;
 l_WC      : WideChar;
 l_P       : Integer;
 l_Index   : Integer;
 l_Rep     : AnsiString;
 l_S       : Tl3InterfacedString;
 l_Changed : Boolean;
begin
 if not l3IsNil(aString) then
 begin
  l_S := Tl3InterfacedString.Make(aString.AsWStr);
  try
   l_Changed := false;
   l_Index := 0;
   if (l_S.CodePage = CP_Unicode) then
   begin
    while (l_Index < l_S.Len) do
    begin
     l_Rep := '';
     l_WC := PWideChar(l_S.St)[l_Index];
     for l_P := Low(aFrom) to High(aFrom) do
     begin
      if (AnsiChar(l_WC) = aFrom[l_P]) then
      begin
       l_Rep := aTo[l_P];
       break;
      end;//AnsiChar(l_WC) = cFrom[l_P]
     end;//for l_P
     if (l_Rep <> '') then
     begin
      l_Changed := true;
      l_S.Delete(l_Index, 1);
      l_S.Insert(l3PCharLen(l_Rep), l_Index);
      Inc(l_Index, Length(l_Rep));
     end//l_Rep <> ''
     else
      Inc(l_Index);
    end;//while (l_Index < l_S.Len)
   end//l_S.CodePage = CP_Unicode
   else
   begin
    while (l_Index < l_S.Len) do
    begin
     l_Rep := '';
     l_C := l_S.St[l_Index];
     for l_P := Low(aFrom) to High(aFrom) do
     begin
      if (l_C = aFrom[l_P]) then
      begin
       l_Rep := aTo[l_P];
       break;
      end;//l_C = cFrom[l_P]
     end;//for l_P
     if (l_Rep <> '') then
     begin
      l_Changed := true;
      l_S.Delete(l_Index, 1);
      l_S.Insert(l3PCharLen(l_Rep), l_Index);
      Inc(l_Index, Length(l_Rep));
     end//l_Rep <> ''
     else
      Inc(l_Index);
    end;//while (l_Index < l_S.Len)
   end;//l_S.CodePage = CP_Unicode
   if l_Changed then
    aString := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//not l3IsNil(aString)
end;

procedure l3DeleteChars(var aString  : Il3CString;
                        aDeleteChars : TChars);
  {* - удаляет заданные символы. }
var
 l_S  : Tl3WString;
 l_St : Tl3InterfacedString;
 l_I  : Integer;
 l_J  : Integer;
begin
 if (aString <> nil) then
 begin
  l_S := aString.AsWStr;
  l_St := nil;
  try
   l_J := 0;
   if (l_S.SCodePage = CP_Unicode) then
   begin
    for l_I := 0 to Pred(l_S.SLen) do
    begin
     if l3InSet(PWideChar(l_S.S)[l_I], aDeleteChars) then
     begin
      if (l_St = nil) then
       l_St := Tl3InterfacedString.Make(l_S);
      l_St.Delete(l_J, 1);
     end//l3InSet(PWideChar(l_S.S)[l_I], aReplaceChars)
     else
      Inc(l_J);
    end;//for l_I
   end//l_S.SCodePage = CP_Unicode
   else
   begin
    for l_I := 0 to Pred(l_S.SLen) do
    begin
     if (l_S.S[l_I] in aDeleteChars) then
     begin
      if (l_St = nil) then
       l_St := Tl3InterfacedString.Make(l_S);
      l_St.Delete(l_J, 1);
     end//l_S.S[l_I] in aReplaceChars
     else
      Inc(l_J);
    end;//for l_I
   end;//l_S.SCodePage = CP_Unicode
   if (l_St <> nil) then
    aString := l_St;
  finally
   l3Free(l_St);
  end;//try..finally
 end;//aString <> nil
end;

procedure l3Delete(var aString  : Il3CString;
                   aPos         : Integer;
                   aCount       : Integer);
  {* - удаляет заданную подстроку. }
var
 l_S : Tl3InterfacedString;
begin
 if not l3IsNil(aString) AND (aCount > 0) then
 begin
  l_S := Tl3InterfacedString.Make(aString.AsWStr);
  try
   l_S.Delete(aPos, aCount);
   aString := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//aString <> nil
end;

procedure l3Insert(var aString  : Il3CString;
                   aPos         : Integer;
                   aChar        : AnsiChar);
  {* - вставляет заданную подстроку. }
var
 l_S : Tl3InterfacedString;
begin
 l_S := Tl3InterfacedString.Make(l3PCharLen(aString));
 try
  l_S.Insert(aChar, aPos);
  aString := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

procedure l3Insert(var aString  : Il3CString;
                   aPos         : Integer;
                   aSt          : WideString);
  //overload;
var
 l_S : Tl3InterfacedString;
begin
 if (aSt <> '') then
 begin
  l_S := Tl3InterfacedString.Make(l3PCharLen(aString));
  try
   l_S.Insert(l3PCharLen(aSt), aPos);
   aString := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//aSt <> ''
end;

function IsEmptyStr(const S: AnsiString; const EmptyChars: TChars): Boolean;
var
 I, SLen: Integer;
begin
 SLen := Length(S);
 I := 1;
 while I <= SLen do
 begin
  if not (S[I] in EmptyChars) then
  begin
    Result := False;
    Exit;
  end
  else Inc(I);
 end;
 Result := True;
end;

function l3PCharLen2String(const aString : Tl3PCharLenPrim;
                           aCodePage     : Long = CP_ANSI;
                           aBuff         : PPointer = nil): AnsiString;
  {-}
var
 l_Len : Long;
 l_Str : Tl3Str;
 l_CodePage: Long;
begin
 Result := '';
 l_CodePage := aCodePage;
 if not l3IsNil(aString) then
 begin
  with aString do
   if (aCodePage = SCodePage) or (aCodePage = CP_DefaultValue) then
   begin
    l_Len := SLen;
    if (S[Pred(l_Len)] = cc_Null) then Dec(l_Len);
    SetLength(Result, l_Len); // В некоторых случаях тут обрезается aString.s
    l3Move(S^, PAnsiChar(Result)^, l_Len);
   end//SCodePage = aCodePage
   else
   begin
    if (aCodePage = CP_ANSI) and (GetACP <> CP_RussianWin) then
     l_CodePage := CP_RussianWin;
    l_Str.Init(aString, l_CodePage, aBuff);
    try
     Result := l3PCharLen2String(l_Str, l_CodePage);
    finally
     if (aBuff = nil) then
      l_Str.Clear;
    end;//try..finally
   end;//SCodePage = aCodePage
 end;//l3IsNil..
end;

function l3StrToInt(const aString : Tl3WString) : Integer;
var
 I : Integer;
begin
 Result := 0;
 for I := 0 to Pred(aString.SLen) do
  if aString.S[I] in cc_Digits then
   Result := 10 * Result + Ord(aString.S[I]) - Ord('0')

  // обработку отрицательных, шестнадцатеричных и написанных от руки доделывайте кому понадобится
  else
   raise EConvertError.Create('function l3StrToInt: недопустимый символ');
end;

function l3StrToIntDef(const aString : Tl3WString; aDefault: Integer = 0) : Integer;
begin
 try
  Result := l3StrToInt(aString);
 except
  on EConvertError do
   Result := aDefault;
 end;
end;

function l3Str(const aString : Tl3DString): AnsiString;
  //overload;
begin
 Result := aString;
end;

function l3Str(const aString : Tl3PCharLenPrim;
               aCodePage     : Long = CP_ANSI): AnsiString;
  //overload;
  {* - преобразует к строке типа AnsiString. }
begin
 Result := l3PCharLen2String(aString, aCodePage);
end;

function l3Str(const aString : Il3CString;
               aCodePage     : Long = CP_ANSI): AnsiString;
  //overload;
  {* - преобразует к строке типа AnsiString. }
begin
 if (aString = nil) then
  Result := ''
 else
  Result := l3Str(aString.AsWStr, aCodePage);
end;

function l3PStr(const aString : Tl3PCharLenPrim): TFileName;
  //overload;
begin
 Result := l3PCharLen2String(aString);
end;

function l3PStr(const aString : Il3CString): TFileName;
  //overload;
  {* - преобразует к строке для имени файла. }
begin
 if (aString = nil) then
  Result := ''
 else
  Result := l3Str(aString.AsWStr);
end;

function l3DStr(const aStr: AnsiString): Tl3DString;
  //overload;
begin
 Result := aStr;
end;

function l3DStr(const aStr: Tl3WString): Tl3DString;
  //overload;
  {-}
begin
 Result := Tl3Str(aStr).AsWideString;
end;

function l3DStr(const aStr: Il3CString): Tl3DString;
  //overload;
  {-}
begin
 if (aStr = nil) then
  Result := ''
 else
  Result := l3DStr(aStr.AsWStr);
end;

function l3ChangeCodePage(const aString: AnsiString; anOldCodePage, aNewCodePage: Long): AnsiString;
  {-}
begin
 if (anOldCodePage = aNewCodePage) then
  Result := aString
 else
  Result := l3PCharLen2String(l3PCharLen(aString, anOldCodePage), aNewCodePage);
end;

function l3MakeUpperCase(aStr: PAnsiChar; aLen : Long; aCodePage: Long = CP_ANSI): Boolean;
var
 l_S1 : Tl3Str;
 l_S2 : Tl3Str;
begin
 {$IfDef l3Requires_m0}
 if l3IsOEM(aCodePage) then
  m2xltConvertBuff(aStr, aLen, Cm2XLTOEM2Upper)
 else
 if l3IsANSI(aCodePage) then
  m2xltConvertBuff(aStr, aLen, Cm2XLTANSI2Upper)
 else
 Case aCodePage of
  cp_Tatar:
   CharUpperBuffA(aStr, aLen);
  cp_Unicode:
   CharUpperBuffW(PWideChar(aStr), aLen);
(*  cp_TatarOEM:
   ; // - не преобразуем
  CP_Greek,
  932, // - http://mdp.garant.ru/pages/viewpage.action?pageId=607532057
  1252 // - http://mdp.garant.ru/pages/viewpage.action?pageId=607532796
  :*)
  else
  begin
   l_S1.Init(l3PCharLen(aStr, aLen, aCodePage), CP_Unicode);
   try
    CharUpperBuffW(PWideChar(l_S1.S), l_S1.SLen);
    l_S2.Init(l_S1, aCodePage);
    try
     l3Move(l_S2.S^, aStr^, aLen);
    finally
     l_S2.Clear;
    end;//try..finally
   finally
    l_S1.Clear;
   end;//try..finally
   //CharUpperBuffA(aStr, aLen);
   // - преобразуем как Windows решит
   //; // - не преобразуем
  end;//CP_Greek
(*  else
   Assert(false);*)
 end;//Case aCodePage
 {$Else  l3Requires_m0}
 if l3IsANSI(aCodePage) then
  ANSIUpperBuff(aStr, aLen);
 {$EndIf l3Requires_m0}
 Result := True;
end;

function l3MakeLowerCase(aStr: PAnsiChar; aLen : Long; aCodePage: Long = CP_ANSI): Boolean;
begin
 {$IfDef l3Requires_m0}
 if l3IsOEM(aCodePage) then
  m2xltConvertBuff(aStr, aLen, Cm2XLTOEM2Lower)
 else
 if l3IsANSI(aCodePage) then
  m2xltConvertBuff(aStr, aLen, Cm2XLTANSI2Lower)
 else
 Case aCodePage of
  cp_Tatar:
   CharLowerBuffA(aStr, aLen);
  cp_Unicode:
   CharLowerBuffW(PWideChar(aStr), aLen);
  cp_TatarOEM:
   ; // - не преобразуем
  else
   Assert(false);
 end;//Case aCodePage
 {$Else  l3Requires_m0}
 if l3IsANSI(aCodepage) then
  ANSILowerBuff(aStr, aLen);
 {$EndIf l3Requires_m0}
 Result := True;
end;

var
 gSimpleANSITable : Pm2XLTTable08 = nil;

procedure FreegSimpleANSITable;
begin
 l3System.FreeLocalMem(gSimpleANSITable);
end;

function GetSimpleANSIXLatTable : Tm2XLTTable08;
var
 I : byte;
begin
 if (gSimpleANSITable = nil) then
 begin
  l3System.AddExitProc(FreegSimpleANSITable);
  l3System.GetLocalMem(gSimpleANSITable, 255);
  for I := 0 to 255 do
   gSimpleANSITable[I] := I;
  // переопределяем
  gSimpleANSITable[byte(cc_Tab)]            := byte(cc_HardSpace); //#32;
  gSimpleANSITable[byte(cc_SoftSpace)]      := byte(cc_HardSpace);
  gSimpleANSITable[byte(cc_SoftEnter)]      := byte(cc_HardSpace);

  gSimpleANSITable[byte(cc_DoubleQuote)]    := byte(cc_DoubleQuote);
  gSimpleANSITable[byte(cc_LDoubleQuote)]   := byte(cc_DoubleQuote);
  gSimpleANSITable[byte(cc_LDoubleQuote)]   := byte(cc_DoubleQuote);
  gSimpleANSITable[byte(cc_LTDoubleQuote)]  := byte(cc_DoubleQuote);
  gSimpleANSITable[byte(cc_RTDoubleQuote)]  := byte(cc_DoubleQuote);

  gSimpleANSITable[byte(cc_RSingleQuote)]   := byte(cc_SingleQuote);
  gSimpleANSITable[byte(cc_LSingleQuote)]   := byte(cc_SingleQuote);
  gSimpleANSITable[byte(cc_RTSingleQuote)]  := byte(cc_SingleQuote);
  gSimpleANSITable[byte(cc_LTSingleQuote)]  := byte(cc_SingleQuote);

  gSimpleANSITable[byte(cc_LargeDash)]      := byte(cc_Minus);
  gSimpleANSITable[byte(cc_EnDash)]         := byte(cc_Minus);
  gSimpleANSITable[byte(cc_EmDash)]         := byte(cc_Minus);
 end;
 Result := gSimpleANSITable^;
end;

procedure l3MakeSimpleANSI(aStr: PAnsiChar; aLen : Long);
begin
 if aLen > 0 then
  m2xltConvertBuffEx(aStr, aLen, GetSimpleANSIXLatTable);
end;

function l3MakeSimpleANSIStr(aStr: AnsiString) : AnsiString;
begin
 Result := aStr;
 if Length(Result) > 0 then
  l3MakeSimpleANSI(@Result[1], Length(Result));
end;

{$IFNDEF Delphi6}
function WideUpperCase(const S: WideString): WideString;
var
  Len: Integer;
begin
  Len := Length(S);
  SetString(Result, PWideChar(S), Len);
  if Len > 0 then CharUpperBuffW(Pointer(Result), Len);
end;
{$EndIF Delphi6}

function l3StringOfString(const aString : AnsiString;
                          aCount        : Long): AnsiString;
  {* - собирает строку из повторений aString. }                         
var
 l_Index : Long;  
begin
 Result := '';
 for l_Index := 0 to Pred(aCount) do
  Result := Result + aString; 
end;

procedure l3ParseWordsEx(const aStr   : Tl3WString;
                         anAction     : Tl3WordAction;
                         const aDelim : TCharSet);
  {* - разбирает строку на слова. }
var
 l_Offset      : Long;
 l_WordFinish  : Long;
begin
 if not l3IsNil(aStr) then
 begin
  l_Offset := 0;
  while (l_Offset < aStr.SLen) do
  begin
   while (l_Offset < aStr.SLen) AND
         (aStr.S[l_Offset] in aDelim) do
     Inc(l_Offset);
   l_WordFinish := l_Offset;
   while (l_WordFinish < aStr.SLen) AND
         not (aStr.S[l_WordFinish] in aDelim) do
     Inc(l_WordFinish);
   // - здесь добавляем слово
   if (l_WordFinish > l_Offset) then
   begin
    if not anAction(l3PCharLen(aStr.S + l_Offset, l_WordFinish - l_Offset, aStr.SCodePage),
                    l_WordFinish = aStr.SLen) then
     break;
    l_Offset := l_WordFinish;
    // - смещаемся на следующее слово
   end;//l_WordFinish > l_Offset
  end;//l_Offset < l_S.SLen
 end;//not l3IsNil(aStr)
end;

procedure l3ParseWordsEx(const aStr   : Tl3WString;
                         anAction     : Tl3WordEvent;
                         const aDelim : TCharSet);
  //overload;
  {* - разбирает строку на слова. }

 function DoWord(const aStr : Tl3PCharLen;
                 IsLast     : Bool): Bool;
 begin//DoWord
  Result := anAction(aStr, IsLast);
 end;//DoWord

begin
 l3ParseWordsExF(aStr, l3L2WA(@DoWord), aDelim);
end;

procedure l3ParseWordsExF(const aStr   : Tl3WString;
                          anAction     : Tl3WordAction;
                          const aDelim : TCharSet);
  {* - разбирает строку на слова. }
begin
 try
  l3ParseWordsEx(aStr, anAction, aDelim);
 finally
  l3FreeWA(anAction);
 end;//try..finally
end;


procedure l3ParseWords(const aStr     : Tl3WString;
                       anAction       : Tl3WordAction;
                       const anExcept : TCharSet = []);
  {* - разбирает строку на слова. }
var
 l_Offset      : Long;
 l_WordFinish  : Long;
begin
 if not l3IsNil(aStr) then
 begin
  l_Offset := 0;
  while (l_Offset < aStr.SLen) do
  begin
   while (l_Offset < aStr.SLen) AND
         l3IsWordDelim(aStr.S[l_Offset], aStr.SCodePage, anExcept) do
     Inc(l_Offset);
   l_WordFinish := l_Offset;
   while (l_WordFinish < aStr.SLen) AND
         not l3IsWordDelim(aStr.S[l_WordFinish], aStr.SCodePage, anExcept) do
     Inc(l_WordFinish);
   // - здесь добавляем слово
   if (l_WordFinish > l_Offset) then
   begin
    if not anAction(l3PCharLen(aStr.S + l_Offset, l_WordFinish - l_Offset, aStr.SCodePage),
                    l_WordFinish = aStr.SLen) then
     break;
    l_Offset := l_WordFinish;
    // - смещаемся на следующее слово
   end;//l_WordFinish > l_Offset
  end;//l_Offset < l_S.SLen
 end;//not l3IsNil(aStr)
end;

procedure l3ParseWordsF(const aStr     : Tl3WString;
                        anAction       : Tl3WordAction;
                        const anExcept : TCharSet = []);
  {* - разбирает строку на слова. }
begin
 try
  l3ParseWords(aStr, anAction, anExcept);
 finally
  l3FreeWA(anAction);
 end;//try..finally
end;

procedure l3ParseWords(const aStr     : Tl3WString;
                       anAction       : Tl3WordEvent;
                       const anExcept : TCharSet = []);
  //overload;
  {* - разбирает строку на слова. }

 function DoWord(const aStr : Tl3PCharLen;
                 IsLast     : Bool): Bool;
 begin//DoWord
  Result := anAction(aStr, IsLast);
 end;//DoWord

begin
 l3ParseWordsF(aStr, l3L2WA(@DoWord), anExcept);
end;

function l3AddBackSlashL(const DirName : AnsiString) : AnsiString;
  {* - Add a default backslash to a directory name}
begin
  Result := DirName;
  if (Length(Result) = 0) then
    Exit;
  if ((Length(Result) = 2) and (Result[2] = ':')) or
     ((Length(Result) > 2) and (Result[Length(Result)] <> '\')) then
    Result := Result + '\';
end;

const
  wildAnyChar   = '?';
  wildSomeChars = '*';
  WildSet       = [wildSomeChars, wildAnyChar];

function l3MaskNormalize(const aMask : AnsiString ) : AnsiString;
var
 iMask, iRes : integer;
 lMaskLen    : integer;
begin
 lMaskLen := Length(aMask);
 
 if lMaskLen < 2 then
 begin
  Result := aMask;
  Exit;
 end;
 
 SetLength(Result, lMaskLen);
 
 iMask := 1;
 iRes := 1;
 
 while iMask <= lMaskLen do
 begin
  case aMask[iMask] of
   wildSomeChars :
    If (iRes = 1) or (Result[Pred(iRes)] <> wildSomeChars) then
    begin
     Result[iRes] := aMask[iMask];
     Inc(iRes);
    end;

   wildAnyChar :
    begin
     If (iRes > 1) and (Result[Pred(iRes)] = wildSomeChars) then
     begin
      Result[Pred(iRes)] := wildAnyChar;
      Result[iRes] := wildSomeChars;
     end
     else
      Result[iRes] := aMask[iMask];
     Inc(iRes);
    end
 
   else
    begin
     Result[iRes] := aMask[iMask];
     Inc(iRes);
    end;
  end; //case
  Inc(IMask);
 end;  //while
 
 SetLength(Result,Pred(iRes));
end;

function l3MaskCompare(const aString, Mask : AnsiString) : boolean;

 function FirstPos(Search : array of AnsiChar; const InString:AnsiString):integer;
 var i:integer;
     p1:integer;
 begin
  Result:=0;
  for i:=Low(Search) to High(Search) do
  begin
    p1:=Pos(Search[i],InString);
    if (p1<>0) then
     if (p1<Result) or (Result=0) then
      Result:=p1
  end;
 end;

 function DoCompare (const FLine,Mask : AnsiString) : boolean;
 var k     : integer;
     l1,l2 : integer;
     p1    : integer;

 function Different (const FLine,Mask : AnsiString; L1,L2 : integer) : boolean;
 begin
 // Если результат = тру => строки различны
 // фальсе  =>  ничего путного сказать не можем
   if (l1 > 0) and (l2 > 0) then
     Result := not (Mask[1] in WildSet) and (FLine[1]<>Mask[1])
   else
     Result := ((l1 = 0) and (Mask <> wildSomeChars)) or (l2 = 0);
 end;

 begin
  if (Mask = wildSomeChars) or (FLine = Mask) then
  begin
   Result := true;
   exit;
  end;
 
  Result := False;
 
  l1 := Length(FLine);
  l2 := Length(Mask);
 
  if Different(FLine,Mask,l1,l2) then Exit;
 
  if not (Mask[1] in WildSet) then
  begin
   p1:= FirstPos([wildSomeChars, wildAnyChar], Mask);
   if p1 = 0 then
    Result := FLine = Mask
   else
    if (Copy(FLine, 1, p1-1) <> Copy(Mask, 1, p1-1)) then
     Result := False
    else
     Result := DoCompare(Copy(FLine,p1,l1), Copy(Mask,p1,l2));
   Exit;
  end;

  if (Mask[1] = wildSomeChars) then
   for k := 1 to l1 do
    if (FLine[k] = Mask[2]) then
    begin
     Result :=  DoCompare(Copy(FLine, k, l1-k+1), Copy(Mask, 2, l2-1));
     if Result then Exit
    end;
 
  if (Mask[1] <> wildSomeChars) and
     ((FLine[1] = Mask[1]) or
      (Mask[1] = wildAnyChar)) then
   Result := DoCompare(Copy(FLine, 2, l1-1), Copy(Mask, 2, l2-1));
 end;
 
begin //l3MaskCompare
  Result := DoCompare(aString, l3MaskNormalize(Mask));
end;

const
  w_wildAnyChar   = WideChar('?');
  w_wildSomeChars = WideChar('*');

function l3MaskNormalize(const aMask : WideString) : WideString;
var
 iMask, iRes : integer;
 lMaskLen    : integer;
begin
 lMaskLen := Length(aMask);

 if lMaskLen < 2 then
 begin
  Result := aMask;
  Exit;
 end;

 SetLength(Result, lMaskLen);

 iMask := 1;
 iRes := 1;

 while iMask <= lMaskLen do
 begin
  case aMask[iMask] of
   w_wildSomeChars :
    If (iRes = 1) or (Result[Pred(iRes)] <> w_wildSomeChars) then
    begin
     Result[iRes] := aMask[iMask];
     Inc(iRes);
    end;

   w_wildAnyChar :
    begin
     If (iRes > 1) and (Result[Pred(iRes)] = w_wildSomeChars) then
     begin
      Result[Pred(iRes)] := w_wildAnyChar;
      Result[iRes] := w_wildSomeChars;
     end
     else
      Result[iRes] := aMask[iMask];
     Inc(iRes);
    end
 
   else
    begin
     Result[iRes] := aMask[iMask];
     Inc(iRes);
    end;
  end; //case
  Inc(IMask);
 end;  //while
 
 SetLength(Result,Pred(iRes));
end;
 
function l3MaskCompare(const aString, Mask : WideString) : boolean;
 
 function FirstPos(Search : array of WideChar; const InString: WideString):integer;
 var i:integer;
     p1:integer;
 begin
  Result:=0;
  for i:=Low(Search) to High(Search) do
  begin
    p1:=Pos(Search[i],InString);
    if (p1<>0) then
     if (p1<Result) or (Result=0) then
      Result:=p1
  end;
 end;

 function DoCompare (const FLine,Mask : WideString) : boolean;
 var k     : integer;
     l1,l2 : integer;
     p1    : integer;
 
 function Different (const FLine,Mask : WideString; L1,L2 : integer) : boolean;
 begin
 // Если результат = тру => строки различны
 // фальсе  =>  ничего путного сказать не можем
   if (l1 > 0) and (l2 > 0) then
     Result := not (AnsiChar(Mask[1]) in WildSet) and (FLine[1]<>Mask[1])
   else
     Result := ((l1 = 0) and (Mask <> w_wildSomeChars)) or (l2 = 0);
 end;
 
 begin
  if (Mask = w_wildSomeChars) or (FLine = Mask) then
  begin
   Result := true;
   exit;
  end;
 
  Result := False;
 
  l1 := Length(FLine);
  l2 := Length(Mask);
 
  if Different(FLine,Mask,l1,l2) then Exit;
 
  if not (AnsiChar(Mask[1]) in WildSet) then
  begin
   p1:= FirstPos([w_wildSomeChars, w_wildAnyChar], Mask);
   if p1 = 0 then
    Result := FLine = Mask
   else
    if (Copy(FLine, 1, p1-1) <> Copy(Mask, 1, p1-1)) then
     Result := False
    else
     Result := DoCompare(Copy(FLine,p1,l1), Copy(Mask,p1,l2));
   Exit;
  end;
 
  if (Mask[1] = w_wildSomeChars) then
   for k := 1 to l1 do
    if (FLine[k] = Mask[2]) then
    begin
     Result :=  DoCompare(Copy(FLine, k, l1-k+1), Copy(Mask, 2, l2-1));
     if Result then Exit
    end;
 
  if (Mask[1] <> w_wildSomeChars) and
     ((FLine[1] = Mask[1]) or
      (Mask[1] = w_wildAnyChar)) then
   Result := DoCompare(Copy(FLine, 2, l1-1), Copy(Mask, 2, l2-1));
 end;
 
begin //l3MaskCompare
  Result := DoCompare(aString, l3MaskNormalize(Mask));
end;


function l3LeftPad(const S: AnsiString; Len: Long): AnsiString;
  {* - возвращает строку, добитую слева пробелами до длины Len }
begin
 Result:= l3LeftPadChar(S, Len, ' ');
end;

function l3LeftPadChar(const S: AnsiString; Len: Long; C: AnsiChar): AnsiString;
  {* - возвращает строку, добитую слева символами C до длины Len }
begin
 Result:= S;
 while Length(Result) < Len do
  Result:= C + Result;
end;

function l3Transliterate(const aStr: AnsiString): AnsiString;
  {* - выполняет транслитерацию строки. }
var
 I: Integer;
begin
 Result := '';
 for I := 1 to Length(aStr) do
 case aStr[I] of
  'а', 'А': Result := Result + 'A';
  'б', 'Б': Result := Result + 'B';
  'в', 'В': Result := Result + 'V';
  'г', 'Г': Result := Result + 'G';
  'д', 'Д': Result := Result + 'D';
  'е', 'Е': Result := Result + 'E';
  'ё', 'Ё': Result := Result + 'YO';
  'ж', 'Ж': Result := Result + 'ZH';
  'з', 'З': Result := Result + 'Z';
  'и', 'И': Result := Result + 'I';
  'й', 'Й': Result := Result + 'Y';
  'к', 'К': Result := Result + 'K';
  'л', 'Л': Result := Result + 'L';
  'м', 'М': Result := Result + 'M';
  'н', 'Н': Result := Result + 'N';
  'о', 'О': Result := Result + 'O';
  'п', 'П': Result := Result + 'P';
  'р', 'Р': Result := Result + 'R';
  'с', 'С': Result := Result + 'S';
  'т', 'Т': Result := Result + 'T';
  'у', 'У': Result := Result + 'U';
  'ф', 'Ф': Result := Result + 'F';
  'х', 'Х': Result := Result + 'KH';
  'ц', 'Ц': Result := Result + 'TS';
  'ч', 'Ч': Result := Result + 'CH';
  'ш', 'Ш': Result := Result + 'SH';
  'щ', 'Щ': Result := Result + 'SCH';
  'ъ', 'Ъ': Result := Result + '''';
  'ы', 'Ы': Result := Result + 'Y';
  'ь', 'Ь': Result := Result + '''';
  'э', 'Э': Result := Result + 'E';
  'ю', 'Ю': Result := Result + 'YU';
  'я', 'Я': Result := Result + 'YA';
 else
  Result := Result + aStr[I];
 end;
end;

function l3Cat(const S: array of Il3CString): Il3CString;
  {-}
var
 l_S : Tl3InterfacedString;
 l_H : Integer;
 l_L : Integer;
 l_I : Integer;
begin
 l_L := Low(S);
 l_H := High(S);
 if (l_L > l_H) then
  Result := nil
 else
 if (l_L = l_H) then
  Result := S[l_L]
 else
 begin
  l_S := Tl3InterfacedString.Make(l3PCharLen(S[l_L]));
  try
   for l_I := l_L + 1 to l_H do
    l_S.Append(l3PCharLen(S[l_I]));
   Result := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l_L < 0
end;

function l3Cat(const S1: Il3CString; const S2: Tl3WString): Il3CString;
  //overload;
  {-}
var
 l_S : Tl3InterfacedString;
begin
 if l3IsNil(S2) then
  Result := S1
 else
 begin
  l_S := Tl3InterfacedString.Make(l3PCharLen(S1));
  try
   l_S.Append(S2);
   Result := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l3IsNil(S2)
end;

function  l3Cat(const S1: Tl3DString; const S2: Il3CString): Il3CString;
  //overload;
var
 l_S : Tl3InterfacedString;
begin
 if (S1 = '') then
  Result := S2
 else
 begin
  l_S := Tl3InterfacedString.Make(l3PCharLen(S1));
  try
   l_S.Append(l3PCharLen(S2));
   Result := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l3IsNil(S2)
end;

function  l3Cat(const S1: AnsiString; const S2: Il3CString): Il3CString;
  //overload;
var
 l_S : Tl3InterfacedString;
begin
 if (S1 = '') then
  Result := S2
 else
 begin
  l_S := Tl3InterfacedString.Make(l3PCharLen(S1));
  try
   l_S.Append(l3PCharLen(S2));
   Result := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l3IsNil(S2)
end;

function  l3Cat(const S1: Il3CString; const S2: Tl3DString): Il3CString;
  //overload;
var
 l_S : Tl3InterfacedString;
begin
 if (S2 = '') then
  Result := S1
 else
 begin
  l_S := Tl3InterfacedString.Make(l3PCharLen(S1));
  try
   l_S.Append(l3PCharLen(S2));
   Result := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l3IsNil(S2)
end;

function l3Cat(const S1: Il3CString; const S2: Tl3Char): Il3CString;
  //overload;
var
 l_S : Tl3InterfacedString;
begin
 l_S := Tl3InterfacedString.Make(l3PCharLen(S1));
 try
  l_S.Append(S2);
  Result := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

function l3Cat(const S1: Il3CString; const S2: AnsiString): Il3CString;
  //overload;
var
 l_S : Tl3InterfacedString;
begin
 if (S2 = '') then
  Result := S1
 else
 begin
  l_S := Tl3InterfacedString.Make(l3PCharLen(S1));
  try
   l_S.Append(l3PCharLen(S2));
   Result := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l3IsNil(S2)
end;

function  l3Cat(const S1: Il3CString; const S2: array of AnsiString): Il3CString;
  //overload;
var
 l_S : Tl3InterfacedString;
 l_I : Integer;
begin
 l_S := Tl3InterfacedString.Make(l3PCharLen(S1));
 try
  for l_I := Low(S2) to High(S2) do
   l_S.Append(l3PCharLen(S2[l_I]));
  Result := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

function l3Upper(const S: Tl3WString): Il3CString;
  {-}
var
 l_S : Tl3InterfacedString;
begin
 if l3IsNil(S) then
  Result := nil
 else
 begin
  l_S := Tl3InterfacedString.Make(S);
  try
   l_S.MakeUpper;
   Result := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l3IsNil(S)
end;

function l3Upper(const S: Il3CString): Il3CString;
begin
 if l3IsNil(S) then
  Result := nil
 else
  Result := l3Upper(S.AsWStr);
end;

function l3Lower(const S: Il3CString): Il3CString;
  {-}
begin
 if l3IsNil(S) then
  Result := nil
 else
  Result := l3Lower(S.AsWStr);
end;

function l3Lower(const S: Tl3WString): Il3CString;
  {-}
var
 l_S : Tl3InterfacedString;
begin
 if l3IsNil(S) then
  Result := nil
 else
 begin
  l_S := Tl3InterfacedString.Make(S);
  try
   l_S.MakeLower;
   Result := l_S;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l3IsNil(S)
end;

function l3Pos(const aStr: Il3CString; const aSubStr: Tl3WString; aCaseSensitive: Boolean = True): Integer;
  //overload;
begin
 if (aStr = nil) then
  Result := l3NotFound
 else
  Result := l3Pos(aStr.AsWStr, aSubStr, aCaseSensitive);
end;

function  l3Pos(const aStr: Tl3WString; const aSubStr: Tl3WString; aCaseSensitive: Boolean = True): Integer;
  //overload;
var
 l_S   : Tl3CustomString;
 l_SS  : Tl3CustomString;
 l_BT  : Tl3BMTable;
 l_Pos : Cardinal;
 l_Try: Boolean;
begin
 if l3IsNil(aStr) OR l3IsNil(aSubStr) then
  Result := l3NotFound
 else
 begin
  l_S := Tl3ConstString.Make(aStr);
  try
   l_SS := Tl3ConstString.Make(aSubStr);
   try
    l_SS.MakeBMTable(l_BT);
    if aCaseSensitive then
     l_Try := l_SS.BMSearch(l_S, l_BT, l_Pos)
    else
     l_Try := l_SS.BMSearchUC(l_S, l_BT, l_Pos);
    if l_Try then
     Result := l_Pos
    else
     Result := l3NotFound;
   finally
    l3Free(l_SS);
   end;//try..finally
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l3IsNil(aStr)
end;

function l3Pos(const aStr: Il3CString; const aSubStr: Il3CString; aCaseSensitive: Boolean = True): Integer;
  {-}
begin
 if (aSubStr = nil) then
  Result := l3NotFound
 else
  Result := l3Pos(aStr, aSubStr.AsWStr, aCaseSensitive);
end;

function l3Pos(const aStr: Il3CString; const aSubStr: AnsiString; aCaseSensitive: Boolean = True): Integer;
  //overload;
  {-}
begin
 if (aSubStr = '') OR (aStr = nil) then
  Result := l3NotFound
 else
  Result := l3Pos(aStr, l3PCharLen(aSubStr), aCaseSensitive);
end;

function l3Pos(const aStr: Il3CString; aChar: AnsiChar): Integer;
  //overload;
begin
 if (aStr = nil) then
  Result := l3NotFound
 else
  Result := ev_lpCharIndex(aChar, aStr.AsWStr);
end;

function  l3SameChar(const aS1   : Tl3WString;
                     const aS2   : Tl3WString;
                     aPos        : Integer;
                     aIgnoreCase : Boolean = false): Boolean;
  //overload;
  {-}
begin
 Result := l3Same(l3PCharLenPart(aS1.S, aPos, aPos + 1, aS1.SCodePage),
                  l3PCharLenPart(aS2.S, aPos, aPos + 1, aS2.SCodePage), aIgnoreCase);
 // - это на скорую руку, можно сделать правильнее и эффективнее
end;

function l3SameChar(const aS1   : Il3CString;
                    const aS2   : Il3CString;
                    aPos        : Integer;
                    aIgnoreCase : Boolean = false): Boolean;
  {-}
begin
 Result := l3IsChar(aS1, aPos, l3Char(aS2, aPos), aIgnoreCase);
 // - это на скорую руку, можно сделать правильнее и эффективнее
 //   !!! МОЖЕТ НЕ СРАВНИВАТЬ СТРОКИ С РАЗНЫМИ КОДИРОВКАМИ !!!
end;

function l3IsChar(const aStr: Tl3WString; aPos: Integer; aSubStr: AnsiChar; aIgnoreCase : Boolean = false): Boolean;
  //overload;
begin
 if (aPos >= aStr.SLen) then
  Result := false
 else
  Result := l3Same(l3PCharLenPart(aStr.S, aPos, aPos + 1, aStr.SCodePage), aSubStr, aIgnoreCase);
end;

function l3IsChar(const aStr: Il3CString; aPos: Integer; aSubStr: AnsiChar; aIgnoreCase : Boolean = false): Boolean;
  {-}
var
 l_S : Tl3WString;
begin
 if (aStr = nil) then
  Result := false
 else
 begin
  l_S := aStr.AsWStr;
  if (aPos >= l_S.SLen) then
   Result := false
  else
   Result := l3Same(l3PCharLenPart(l_S.S, aPos, aPos + 1, l_S.SCodePage), aSubStr, aIgnoreCase);
 end;//aStr = nil
end;

function l3StringReplace(const S          : Il3CString;
                         const OldPattern : Tl3WString;
                         const NewPattern : Tl3WString;
                         Flags            : TReplaceFlags): Il3CString;
  {-}
const
 cLimit = 30 * 1000;  
type
 SF = function(const aStr : Tl3WString;
               const BT   : Tl3BMTable;
               const aSubStr : Tl3WString;
               var Pos : Cardinal): Boolean;
(* SF = function(S        : Tl3CustomString;
               BT : Tl3BMTable;
               var Pos  : Cardinal) : Boolean of object;*)
var
 l_S   : Tl3CustomString;
 l_SS  : Tl3CustomString;
 l_BT  : Tl3BMTable;
 l_Offset : Cardinal;
 l_Pos : Cardinal;
 l_SF  : SF;
 l_Guard : Integer;
 l_StringToSearchIn : Tl3PCharLen;
begin
 if (S = nil) then
  Result := nil
 else
 begin
  if l3IsNil(OldPattern) OR l3Same(OldPattern, NewPattern) then
   Result := S
(*  else
  if (l3Pos(NewPattern, OldPattern) <> l3NotFound) then
  // - чтобы избежать зацикливания, когда OldPattern входит в NewPattern
  // http://mdp.garant.ru/pages/viewpage.action?pageId=333549305
  // Просят заменить "%DocFullName%" на "%DocFullName% (фрагмент)"
  // - может быть это можно как-то интеллектуальнее заменить
  //   вообще говоря - можно же l_Pos - двигать
   Result := S*)
  else
  begin
   Result := nil;
   l_S := Tl3ConstString.Make(S.AsWStr);
   try
    if (rfIgnoreCase in Flags) then
     l_SS := Tl3String.Make(OldPattern)
    else
     l_SS := Tl3ConstString.Make(OldPattern);
    try
     if (rfIgnoreCase in Flags) then
     begin
      l_SS.MakeUpper;
      l_SF := l3SearchStrUC;
     end//rfIgnoreCase in Flags
     else
      l_SF := l3SearchStr;
(*     if (rfIgnoreCase in Flags) then
      l_SF := l_SS.BMSearchUC
     else
      l_SF := l_SS.BMSearch;*)
     l_SS.MakeBMTable(l_BT);
     l_Guard := 0;
     l_Offset := 0;
     l_Pos := 0;
     while true do
     begin
      Inc(l_Guard);
      Assert(l_Guard < cLimit, 'Есть подозрение, что зацикливаемся при поиске/замене');
      // - думаю, что 30 тыс. замен хватит :-)
      // вообще говоря - можно же l_Pos - двигать
      if (l_Guard >= cLimit) then
      // - это чтобы в релизе всё же не зависало
       break;

      Tl3WString(l_StringToSearchIn) := l_S.AsWStr;
      l_StringToSearchIn.Shift(l_Offset);

      if l_SF(l_StringToSearchIn, l_BT, l_SS.AsWStr, l_Pos) then
      begin
       l_Pos := l_Offset + l_Pos;
       if (Result = nil) then
       begin
        l3Free(l_S);
        l_S := Tl3String.Make(S.AsWStr);
        if not l3IOk(l_S.QueryInterface(Il3CString, Result)) then
         Assert(false);
       end;//Result = nil  
       l_S.Delete(l_Pos, l_SS.AsWStr.SLen);
       l_S.Insert(NewPattern, l_Pos);
       if not (rfReplaceAll in Flags) then
        break;
       l_Offset := l_Pos + NewPattern.SLen;
      end//l_SF
      else
       break;
     end;//while true
    finally
     l3Free(l_SS);
    end;//try..finally
   finally
    l3Free(l_S);
   end;//try..finally
   if (Result = nil) then
    Result := S;
  end;//l3IsNil(OldPattern)
 end;//S = nil
end;
  
function l3StringReplace(const S          : Il3CString;
                         const OldPattern : Tl3WString;
                         const NewPattern : Il3CString;
                         Flags            : TReplaceFlags): Il3CString;
  //overload;
  {-}
begin
 Result := l3StringReplace(S, OldPattern, l3PCharLen(NewPattern), Flags);
end;

function l3IsChar(const aStr: Tl3WString; aPos: Integer; aSubStr: TChars): Boolean;
  //overload;
begin
 if (aPos >= aStr.SLen) then
  Result := false
 else
 if (aStr.SCodePage = CP_Unicode) then
  Result := l3InSet(PWideChar(aStr.S)[aPos], aSubStr)
 else
  Result := (aStr.S[aPos] in aSubStr);
end;

function l3IsChar(const aStr: Il3CString; aPos: Integer; aSubStr: TChars): Boolean;
  //overload;
var
 l_S : Tl3WString;
begin
 if (aStr = nil) then
  Result := false
 else
 begin
  l_S := aStr.AsWStr;
  if (aPos >= l_S.SLen) then
   Result := false
  else
  if (l_S.SCodePage = CP_Unicode) then
   Result := l3InSet(PWideChar(l_S.S)[aPos], aSubStr)
  else
   Result := (l_S.S[aPos] in aSubStr);
 end;//aStr = nil
end;

function  l3IsChar(const aStr : Il3CString;
                   aPos       : Integer;
                   aProc      : Tl3CheckSimbolProc): Boolean;
  //overload;
  {-}
var
 l_S : Tl3WString;
begin
 if (aStr = nil) then
  Result := false
 else
 begin
  l_S := aStr.AsWStr;
  if (aPos >= l_S.SLen) then
   Result := false
  else
  if (l_S.SCodePage = CP_Unicode) then
   Result := aProc(l3WideToChar(PWideChar(l_S.S)[aPos]))
  else
   Result := aProc(l_S.S[aPos]);
 end;//aStr = nil
end;

function l3Char(const aStr: Tl3WString; aPos: Integer): AnsiChar;
  //overload;
begin
 if (aStr.SCodePage = CP_Unicode) then
  Result := l3WideToChar(PWideChar(aStr.S)[aPos])
 else
  Result := aStr.S[aPos];
end;

function l3Char(const aStr: Il3CString; aPos: Integer): AnsiChar;
  {-}
var
 l_S : Tl3WString;
begin
 l_S := aStr.AsWStr;
 if (l_S.SCodePage = CP_Unicode) then
  Result := l3WideToChar(PWideChar(l_S.S)[aPos])
 else
  Result := l_S.S[aPos];
end;

function l3CharEx(const aStr: Tl3WString; aPos: Integer): Tl3Char;
  //overload;
begin
 Result.rCodePage := aStr.SCodePage;
 if (Result.rCodePage = CP_Unicode) then
  Result.rWC := PWideChar(aStr.S)[aPos]
 else
 begin
  l3FillChar(Result.rAC, SizeOf(Result.rAC), 0);
  Result.rAC := aStr.S[aPos];
 end;//Result.rCodePage = CP_Unicode
end;

function l3CharEx(const aStr: Il3CString; aPos: Integer): Tl3Char;
  {-}
var
 l_S : Tl3WString;
begin
 l_S := aStr.AsWStr;
 Result := l3CharEx(l_S, aPos);
 {
 Result.rCodePage := l_S.SCodePage;
 if (Result.rCodePage = CP_Unicode) then
  Result.rWC := PWideChar(l_S.S)[aPos]
 else
 begin
  l3FillChar(Result.rAC, SizeOf(Result.rAC), 0);
  Result.rAC := l_S.S[aPos];
 end;//Result.rCodePage = CP_Unicode
 }
end;

procedure l3SetChar(var aStr: Il3CString; aPos: Integer; aValue: AnsiChar);
  {-}
var
 l_S  : Tl3WString;
 l_St : Tl3InterfacedString;
begin
 if (aStr <> nil) then
 begin
  l_S := aStr.AsWStr;
  if (l_S.SCodePage = CP_Unicode) then
  begin
   if (PWideChar(l_S.S)[aPos] = WideChar(aValue)) then
    Exit;
  end//l_S.SCodePage = CP_Unicode
  else
  begin
   if (l_S.S[aPos] = aValue) then
    Exit;
  end;//l_S.SCodePage = CP_Unicode
  l_St := Tl3InterfacedString.Make(l_S);
  try
   l_St[aPos] := aValue;
   aStr := l_St;
  finally
   l3Free(l_St);
  end;//try..finally
 end;//aStr <> nil
end;

function l3Len(const aStr: Il3CString): Integer;
  {-}
begin
 if (aStr = nil) then
  Result := 0
 else
  Result := aStr.AsWStr.SLen; 
end;

procedure l3SetLen(var aStr: Il3CString; aLen: Integer);
  {-}
var
 l_Len : Integer;
 l_S   : Tl3InterfacedString;
begin
 if (aLen = 0) then
  aStr := nil
 else
 if (aStr = nil) then
 begin
  if (aLen > 0) then
  begin
   l_S := Tl3InterfacedString.Create;
   try
    l_S.Append(cc_HardSpace, aLen);
    aStr := l_S;
   finally
    l3Free(l_S);
   end;//try..finally
  end;//aLen > 0
 end//aStr = nil
 else
 begin
  l_Len := l3Len(aStr);
  if (l_Len > aLen) then
  begin
   l_S := Tl3InterfacedString.Make(l3PCharLen(aStr));
   try
    l_S.Len := aLen;
    aStr := l_S;
   finally
    l3Free(l_S);
   end;//try..finally
  end//l_Len > aLen
  else
  if (l_Len < aLen) then
  begin
   l_S := Tl3InterfacedString.Make(l3PCharLen(aStr));
   try
    l_S.Append(cc_HardSpace, aLen - l_Len);
    aStr := l_S;
   finally
    l3Free(l_S);
   end;//try..finally
  end;//l_Len < aLen
 end;//aStr = nil
end;

function l3Copy(const aStr: Il3CString; anIndex: Integer; aCount: Integer = MaxInt): Il3CString;
  {-}
var
 l_S  : Tl3WString;
 l_St : Tl3InterfacedString;
begin
 if (aStr = nil) OR (aCount <= 0) then
  Result := nil
 else
 if (anIndex < 0) then
  Result := nil
 else
 begin
  l_S := aStr.AsWStr;
  if l3IsNil(l_S) then
   Result := nil
  else
  begin
   if (anIndex = 0) AND (aCount >= l_S.SLen) then
    Result := aStr
   else
   begin
    l_St := Tl3InterfacedString.Make(l3PCharLenPart(l_S.S,
                                          anIndex,
                                          Min64(Int64(anIndex) + Int64(aCount), l_S.SLen),
                                          l_S.SCodePage));
    try
     Result := l_St;
    finally
     l3Free(l_St);
    end;//try..finally
   end;//anIndex = 0
  end;//l3IsNil(l_S)
 end;//anIndex < 0
end;

procedure l3CatSuff(var S1: AnsiString; const S2: AnsiString);
  {-}
begin
 if (S2 <> '') then
 begin
  if (S1 = '') then
   S1 := S2
  else
   S1 := S1 + ' ' + S2;
 end;//S2 <> ''
end;

function l3OEM2ANSI(const S: AnsiString): AnsiString;
  {-}
begin
 Result := l3PCharLen2String(l3PCharLen(S, CP_OEM));
end;

function l3ANSI2OEM(const S: AnsiString): AnsiString;
  {-}
begin
 Result := l3PCharLen2String(l3PCharLen(S), CP_OEM);
end;

function  l3L2WA(Action: Pointer): Tl3WordAction;
  {-}
  register;
  {-}
asm
          jmp  l3LocalStub
end;{asm}

procedure l3FreeWA(var Stub: Tl3WordAction);
  {-}
  register;
  {-}
asm
          jmp  l3FreeLocalStub
end;{asm}

function l3KeyboardCodePage: Integer;
  {-}
var
 l_Buf    : AnsiString;
 l_BufLen : integer;
 l_Locale : LCID;
begin
 l_Locale := GetKeyboardLayout(0) and $FFFF;
 l_BufLen := GetLocaleInfo(l_Locale, LOCALE_IDEFAULTANSICODEPAGE, nil, 0);
 SetLength(l_Buf, l_BufLen);
 GetLocaleInfoA(l_Locale, LOCALE_IDEFAULTANSICODEPAGE, PAnsiChar(l_Buf), l_BufLen);
 Result := StrToIntDef(l_Buf, GetACP);
end;

function l3KeyToUnicode(const Key: AnsiString): WideString;
  {-}
var
 l_KeyboardCodePage : Integer;
 l_ResLen           : integer;
begin
  // Get right locale
  l_KeyboardCodePage := l3KeyboardCodePage;

  // Get length of result AnsiString
  l_ResLen := MultiByteToWideChar(l_KeyboardCodePage, MB_PRECOMPOSED or MB_USEGLYPHCHARS, PAnsiChar(Key), Length(Key), nil, 0);
  SetLength(Result, l_ResLen);
  MultiByteToWideChar(l_KeyboardCodePage, MB_PRECOMPOSED or MB_USEGLYPHCHARS, PAnsiChar(Key), Length(Key), PWideChar(Result), l_ResLen);
end;

function l3KeyToUnicode(aMsg: TWMKeyDown): WideString;
  {-}
var
 l_KeyState : TKeyboardState;
 l_Len      : Integer;
begin
 Result := '';
 if not (aMsg.CharCode in [8, 9, 13, 27]) then
 begin
  SetLength(Result, 5);
  if GetKeyboardState(l_KeyState) and ((l_KeyState[VK_CONTROL] and $80)=0) then
  begin
   l_Len := ToUnicode(aMsg.CharCode, aMsg.KeyData, l_KeyState, PWideChar(Result)^, 5, 0);
   if (l_Len > 1) then
   begin
    SetLength(Result, l_Len);
    Exit;
   end//l_Len > 1
   else
   if (l_Len = 1) AND (PWideChar(Result)^ > #127) then
   begin
    SetLength(Result, l_Len);
    Exit;
   end;//l_Len = 1..
  end;//GetKeyboardState(l_KeyState)
 end;//not (aMsg.CharCode in [8, 9, 13, 27]) 
 SetLength(Result, 0);
end;

function l3ArrayToString(var PArray; ArraySize : Integer) : AnsiString;
Begin
 Result := '';
 While (ArraySize > 0) and (PAnsiChar(@PArray)[Pred(ArraySize)] in [#0,' ']) do Dec(ArraySize);
 If ArraySize = 0 then Exit;
 SetLength(Result, ArraySize);
 l3Move(PArray, Result[1], ArraySize);
end;

function l3ArrayToCString(const PArray; ArraySize : Integer; aCodePage : Long = CP_ANSI) : Il3CString;
begin
 While (ArraySize > 0) and (PAnsiChar(@PArray)[Pred(ArraySize)] in [#0,' ']) do Dec(ArraySize);
 if ArraySize > 0 then
  Result := l3CStr(l3PCharLen(@PArray, ArraySize,  aCodePage))
 else
  Result := nil;
end;

procedure l3StringToArray(Var ChBuff; Len : Word; const aStr : AnsiString; aFillChar: AnsiChar = ' ');
var
 l : integer;
begin
 l3FillChar(ChBuff,Len, Ord(aFillChar));
 l := Length(AStr);
 If l > 0 then l3Move(aStr[1],ChBuff, Min(l, Len));
end;

procedure l3PCharToArray(Var ChBuff; Len : Integer; aStr : PAnsiChar);
Begin
 l3FillChar(ChBuff, Len, Ord(' '));
 l3Move(aStr^, ChBuff, Min(StrLen(aStr), Len));
end;

procedure l3PCharLenToArray(Var ChBuff; Len : Integer; const aStr : Tl3WString);
Begin
 l3FillChar(ChBuff, Len, Ord(' '));
 l3Move(aStr.S^, ChBuff, Min(aStr.SLen, Len));
end;

function l3AppendPChar(Dest, Source : PAnsiChar; SourceLen : Word) : PAnsiChar;
var
 DestBufSize : Word;
 NewLen      : Word;
 PEnd        : PAnsiChar;
begin
 if Dest = Nil then
  DestBufSize := 0
 else
  DestBufSize := l3StrBufSize(Dest);
 NewLen := l3StrLen(Dest) + SourceLen + 1;
 if (DestBufSize < NewLen) then
 begin
  Result := l3StrAlloc(NewLen);
  if (Dest <> Nil) then
  begin
   StrCopy(Result, Dest);
   l3StrDispose(Dest);
  end
  else
   Result[0]:=#0;
  //Dest := Result;
 end
 else
  Result:=Dest;
 PEnd:=StrEnd(Result);
 StrLCopy(PEnd, Source, SourceLen);
 PEnd[SourceLen]:=#0;
end;

function l3AllocPChar(Var ChBuff; Len : Longint) : PAnsiChar;
Begin
 Dec(Len);
 While (Len >= 0) and (PAnsiChar(@ChBuff)[Len] =' ') do Dec(Len);
 If Len<0
  then Result:=Nil
  else
   Begin
    Inc(Len);
    Result := l3StrAlloc(Len+1);
    l3Move(ChBuff,Result^,Len);
    Result[Len]:=#0;
   end;
end;

function l3NativeAllocPChar(Var ChBuff; Len : Longint) : PAnsiChar;
Begin
 Dec(Len);
 While (Len >= 0) and (PAnsiChar(@ChBuff)[Len] =' ') do Dec(Len);
 If Len < 0
  then Result:=Nil
  else
   Begin
    Inc(Len);
    l3System.GetLocalMem(Result, Succ(Len));
    l3Move(ChBuff, Result^, Len);
    Result[Len]:=#0;
   end;
end;

function l3GetFilledArrayLength(ChBuff : PAnsiChar; Len : Longint) : Longint;
begin
 while (Len > 0) and (ChBuff[Pred(Len)] = ' ') do Dec(Len);
 Result := Len;
end;

//function l3SizeOfTextArray(var PArray; ArraySize: Integer) : Integer;
//begin
// Result := Pred(ArraySize);
// while (Result >= 0) and (PAnsiChar(@PArray)[Result] =' ') do Dec(Result);
// Inc(Result);
//end;

function l3SizeOfTextArray(PArray : PAnsiChar; ArraySize: Integer) : Integer;
begin
 Result := Pred(ArraySize);
 while (Result >= 0) and (PArray[Result] =' ') do Dec(Result);
 Inc(Result);
end;

function l3StringToPCharNil(const aStr : AnsiString) : PAnsiChar;
begin
 if Length(aStr) = 0 then
  Result := Nil
 else
  Result := PAnsiChar(aStr);
end;

function l3ArrayToPChar(var PArray; ArraySize: Integer; PCh : PAnsiChar) : Word;
Begin
 Dec(ArraySize);
 While (ArraySize > 0) and (PAnsiChar(@PArray)[ArraySize] =' ')
  do Dec(ArraySize);
 if ArraySize <= 0 then
  PCh[0] := #0
 else
 begin
  Inc(ArraySize, 2);
  l3Move(PArray, PCh^, ArraySize);
  PCh[ArraySize] := #0;
 end;
 Result := ArraySize;
end;

function l3ArrayToPCharLen(var PArray; ArraySize: Integer; aCodePage : Long = CP_ANSI) : Tl3PCharLen;
begin
 Result := l3PCharLen(PAnsiChar(@PArray), l3SizeOfTextArray(PAnsiChar(@PArray), ArraySize), aCodePage);
end;

function l3GetPosCharSet(St: PAnsiChar; const CS: TCharSet; StLen: Long = 0; StBegin : Integer = 0) : Integer;
var
 I : Long;
begin
 Result := -1;
 if StLen = 0 then
  StLen := l3StrLen(St);
 if (St <> nil) and (StBegin > StLen) then
  Exit;
 I := StBegin;
 while (St[I] <> #0) AND (I < StLen) do
  if (St[I] in CS) then
  begin
   Result := I;
   Exit;
  end
  else
   Inc(I);
end;

const
 RecSplitChar = '~';
type 
 ByteBuff = array[1..64000] of Byte;

function l3RecToFormatString(var Rec; const Format: ShortString): ShortString;

var
 I : Integer;

 function GetParamSize(aDefSize: Integer): Integer;
 var
  SL : String[3];
 begin
  SL := '';
  while (I <= Byte(Format[0])) and (Format[I] in ['0'..'9']) do
  begin
   SL := SL + Format[I];
   Inc(I);
  end;
  if SL = '' then
   Result := aDefSize
  else
   Result := StrToInt(SL);
 end;

var
 lFieldSize : Longint;
 RecOfs     : Word;
 lNum       : Int64;
begin
 I := 1;
 RecOfs := 1;
 Result := '';
 while I <= Byte(Format[0]) do
 begin
  case Format[I] of
   'S':
   begin
    Inc(I);
    lFieldSize := GetParamSize(255);
    Result := Result + PShortString( @(ByteBuff(Rec)[RecOfs]))^ + RecSplitChar;
    Inc(RecOfs, lFieldSize);
    Inc(RecOfs);
   end;

   'D': // integer with length
   begin
    Inc(I);
    lFieldSize := GetParamSize(4);
    lNum := 0;
    l3Move((ByteBuff(Rec)[RecOfs]), lNum, lFieldSize);
    Result := Result + IntToStr(lNum) + RecSplitChar;
    Inc(RecOfs, lFieldSize);
   end;

   'B': // boolean
   begin
    Inc(I);
    Result := Result + IntToStr(PByte( @(ByteBuff(Rec)[RecOfs]))^) + RecSplitChar;
    Inc(RecOfs, SizeOf(Boolean));
   end;

   'T': // TDateTime
   begin
    Inc(I);
    Result := Result + FormatDateTime('dd/mm/yyyy hh:nn:ss',
     PDateTime( @(ByteBuff(Rec)[RecOfs]))^) + RecSplitChar;
    Inc(RecOfs, SizeOf(TDateTime));
   end;
   else raise El3ConvertError.Create('Недопустимый тип в форматке "' + Format[I] + '"');
  end;
 end;
end;

procedure l3FormatStringToRec(const FStr: ShortString; var Rec; const Format: ShortString);

var
 I : Integer;

 function GetParamSize(aDefSize: Integer): Integer;
 var
  SL : String[3];
 begin
  SL := '';
  while (I <= Byte(Format[0])) and (Format[I] in ['0'..'9']) do
  begin
   SL := SL + Format[I];
   Inc(I);

  end;
  if SL = '' then
   Result := aDefSize
  else
   Result := StrToInt(SL);

  //??   If D > 255 then D := 255;

 end;

var
 SL                   : String[100];
 lFieldSize           : Longint;
 StrOfs,
 StrOfs2              : Integer;
 RecOfs               : Word;
 FmtLen               : Integer;
 lSaveShortDateFormat : AnsiString;
 lSaveShortTimeFormat : AnsiString;
 l_DateTime           : TDateTime;
 lNum                 : Int64;
begin
 StrOfs := 1;
 RecOfs := 1;
 I := 1;
 FmtLen := Length(Format);
 while I <= FmtLen do
 begin
  if StrOfs > Length(FStr) then
   raise El3ConvertError.Create('Неожиданный конец записи');
  case Format[I] of
   'S':
   begin
    Inc(I);
    lFieldSize := GetParamSize(255);

    StrOfs2 := l3StringPos(RecSplitChar, FStr, StrOfs);
    if StrOfs2 = 0 then
     StrOfs2 := Succ(Length(FStr));

    ByteBuff(Rec)[RecOfs] := StrOfs2 - StrOfs;
    l3Move(FStr[StrOfs], ByteBuff(Rec)[RecOfs + 1], StrOfs2 - StrOfs);

    StrOfs := StrOfs2 + 1; {Length(RecSplitChar)}
    Inc(RecOfs);
    Inc(RecOfs, lFieldSize);
   end;

   'D':
   begin
    Inc(I);
    StrOfs2 := l3StringPos(RecSplitChar, FStr, StrOfs);
    if StrOfs2 = 0 then
     StrOfs2 := Succ(Length(FStr));

    SL[0] := AnsiChar(StrOfs2 - StrOfs);
    l3Move(FStr[StrOfs], SL[1], StrOfs2 - StrOfs);

    lFieldSize := GetParamSize(4);

    try
     lNum := StrToInt64(SL);
    except
     raise El3ConvertError.Create('Невозможно преобразовать в число : ' + SL);
     {Exit;}
    end;
    l3Move(lNum, ByteBuff(Rec)[RecOfs], lFieldSize);

    StrOfs := StrOfs2 + 1; {Length(RecSplitChar)}
    Inc(RecOfs, lFieldSize);
   end;

   'B':
   begin
    Inc(I);
    StrOfs2 := l3StringPos(RecSplitChar, FStr, StrOfs);
    if StrOfs2 = 0 then
     StrOfs2 := Succ(Length(FStr));

    SL[0] := AnsiChar(StrOfs2 - StrOfs);
    l3Move(FStr[StrOfs], SL[1], StrOfs2 - StrOfs);

    try
     lNum := StrToInt64(SL);
    except
     raise El3ConvertError.Create('Невозможно преобразовать в число : ' + SL);
     {Exit;}
    end;
    l3Move(lNum, ByteBuff(Rec)[RecOfs], SizeOf(Boolean));

    StrOfs := StrOfs2 + 1;
    Inc(RecOfs, SizeOf(Boolean));
   end;

   'T':
   begin
    Inc(I);
    StrOfs2 := l3StringPos(RecSplitChar, FStr, StrOfs);
    if StrOfs2 = 0 then
     StrOfs2 := Succ(Length(FStr));

    SL[0] := AnsiChar(StrOfs2 - StrOfs);
    l3Move(FStr[StrOfs], SL[1], StrOfs2 - StrOfs);

    try
     {$IfDef XE2}
     assert(false);
     {$Else}
     lSaveShortDateFormat := ShortDateFormat;
     lSaveShortTimeFormat := ShortTimeFormat;
     ShortDateFormat := 'd/m/y';
     ShortTimeFormat := 'h:n:s';
     {$EndIf}
     try
      l_DateTime := StrToDateTime(SL);
     finally
      {$IfDef XE2}
      assert(false);
      {$Else}
      ShortDateFormat := lSaveShortDateFormat;
      ShortTimeFormat := lSaveShortTimeFormat;
      {$EndIf}
     end;

    except
     raise El3ConvertError.Create('Невозможно преобразовать в дату и время : ' + SL);
     {Exit;}
    end;
    lFieldSize := SizeOf(TDateTime);
    l3Move(l_DateTime, ByteBuff(Rec)[RecOfs], lFieldSize);

    StrOfs := StrOfs2 + 1; {Length(RecSplitChar)}
    Inc(RecOfs, lFieldSize);

   end;
   else raise El3ConvertError.Create('Недопустимый тип в форматке "' + Format[I] + '"');
  end;
 end;
end;

function l3FmtI(const aFmt: Tl3WString; const aParams: array of const): Il3CString;
  {-}

var
 l_S : Tl3InterfacedString;
 l_J : Integer;

 procedure DoAdd;
 var
  l_CS : Il3CString;
 begin//DoAdd
  if (l_J > High(aParams)) then
   Exit;
  case aParams[l_J].VType of
   vtInteger:
    l_S.Append(l3PCharLen(IntToStr(aParams[l_J].VInteger)));
   vtBoolean:
    if aParams[l_J].VBoolean then
     l_S.Append(l3PCharLen('True'))
    else
     l_S.Append(l3PCharLen('False'));
   vtChar:
    l_S.Append(aParams[l_J].VChar);
   vtExtended:
    l_S.Append(l3PCharLen(FloatToStr(aParams[l_J].VExtended^)));
   vtString:
    l_S.Append(l3PCharLen(aParams[l_J].VString^));
   vtPointer:
    Format('%p', [aParams[l_J].VPointer]);
   vtPChar:
    l_S.Append(l3PCharLen(aParams[l_J].VPChar));
   vtClass:
    l_S.Append(l3PCharLen(aParams[l_J].VClass.ClassName));
   vtObject:
    if (aParams[l_J].VObject Is Tl3PrimString) then
     l_S.Append(Tl3PrimString(aParams[l_J].VObject).AsWStr)
    else 
    if Supports(aParams[l_J].VObject, Il3CString, l_CS) then
     l_S.Append(l3PCharLen(l_CS))
    else
     l_S.Append(l3PCharLen(aParams[l_J].VObject.ClassName));
   vtAnsiString:
    l_S.Append(l3PCharLen(AnsiString(aParams[l_J].VAnsiString)));
   vtWideString:
    l_S.Append(l3PCharLen(WideString(aParams[l_J].VWideString)));
   vtWideChar:
    l_S.Append(l3PCharLen(aParams[l_J].VWideChar));
   vtPWideChar:
    l_S.Append(l3PCharLen(aParams[l_J].VPWideChar));
   vtCurrency:
    l_S.Append(l3PCharLen(FloatToStr(aParams[l_J].VCurrency^)));
   vtInt64: 
    l_S.Append(l3PCharLen(IntToStr(aParams[l_J].VInt64^)));
   vtVariant:
    l_S.Append(l3PCharLen(AnsiString(aParams[l_J].VVariant^)));
   vtInterface:
    if (aParams[l_J].VInterface <> nil) then
     l_S.Append(l3PCharLen(IUnknown(aParams[l_J].VInterface) As Il3CString));
   {$IfDef XE}
   vtUnicodeString:
    l_S.Append(l3PCharLen(String(aParams[l_J].VUnicodeString)));
   {$EndIf}
   else
    Assert(false);
  end;//case aParams[l_J].VType
  Inc(l_J);
 end;//DoAdd

const
 cPr = '%';
var
 l_I : Integer;
 l_L : Integer;
 l_C : Tl3Char;
begin
 l_S := Tl3InterfacedString.Create;
 try
  l_J := 0;
  l_I := 0;
  l_L := aFmt.SLen;
  while (l_I < l_L) do
  begin
   if l3IsChar(aFmt, l_I, cPr) then
   begin
    Inc(l_I);
    if l3IsChar(aFmt, l_I, cPr) then
    begin
     ;
    end//l3IsChar(aFmt, l_I, cPr)
    else
    if l3IsChar(aFmt, l_I, ['s', 'S', 'd', 'D']) then
    begin
     DoAdd;
     Inc(l_I);
     continue;
    end//l3IsChar(aFmt, l_I, ['s', 'd'])
    else
    if l3IsChar(aFmt, l_I, '.') then
    begin
     Inc(l_I);
     while l3IsChar(aFmt, l_I, cc_Digits) do
      Inc(l_I);
     if l3IsChar(aFmt, l_I, ['f', 'F']) then
     begin
      DoAdd;
      Inc(l_I);
      continue;
     end;//l3IsChar(aFmt, l_I, ['f', 'F'])
     Assert(false, 'Ooops.. Unknown format: ' + l3Char(aFmt, l_I));
     Inc(l_I);
     continue;
    end//l3IsChar(aFmt, l_I, '.')
    else
    begin
     Assert(false, 'Ooops.. Unknown format: ' + l3Char(aFmt, l_I));
     Inc(l_I);
     continue;
    end;//l3IsChar(aFmt, l_I, ['s', 'd'])
   end;//l3IsChar(aFmt, l_I)
   l_C := l3CharEx(aFmt, l_I);
   l_S.Append(l_C);
   Inc(l_I);
  end;//while (l_I < l_L)
  Result := l_S;
 finally
  l3Free(l_S);
 end;//try..finlly
end;

function l3Fmt(const aFmt: Il3CString; const aParams: array of const): Il3CString;
  {-}
begin
 if (aFmt = nil) then
  Result := nil
 else
  Result := l3FmtI(aFmt.AsWStr, aParams);
 //Result := l3CStr(Format(l3Str(aFmt), aParams));
end;

function l3Fmt(const aFmt: AnsiString; const aParams: array of const): Il3CString;
  //overload;
begin
 Result := l3FmtI(l3PCharLen(aFmt), aParams);
end;

function l3Fmt(const aFmt: Tl3WString; const aParams: array of const): Il3CString;
  //overload;
begin
 Result := l3FmtI(aFmt, aParams);
end;

function l3Prefix(const S: Il3CString; C: AnsiChar): Il3CString;
  {-}
var
 l_P : Integer;  
begin
 Result := S;
 l_P := l3Pos(Result, C);
 if (l_P >= 0) then
  l3SetLen(Result, l_P);
end;

function l3Prefix(const S: Il3CString; const C: array of AnsiChar): Il3CString;
  //overload;
var
 l_I : Integer;
begin
 Result := S;
 for l_I := Low(C) to High(C) do
  Result := l3Prefix(Result, C[l_I]);
end;

function l3Prefix(const S: Il3CString; const C: Il3CString): Il3CString;
  {-}
var
 l_P : Integer;
begin
 Result := S;
 l_P := l3Pos(Result, C);
 if (l_P >= 0) then
  l3SetLen(Result, l_P);
end;

procedure l3Split(const aSt: Il3CString; C: AnsiChar; var P, S: Il3CString);
  //overload;
var
 l_LP : Integer;
 l_LS : Integer;
begin
 P := l3Prefix(aSt, C);
 l_LP := l3Len(P);
 l_LS := l3Len(aSt);
 if (l_LP = l_LS) then
  S := nil
 else
  S := l3Copy(aSt, l_LP + 1, l_LS - l_LP - 1 {Length(C)}); 
end;

function l3Split(const aSt: Il3CString; C: AnsiChar): Tl3CStringArray;
  //overload;
var
 l_S  : Il3CString;
 l_Pr : Il3CString;
 l_Su : Il3CString;
 l_L  : Integer;
begin
 l_L := 0;
 l_S := aSt;
 while true do
 begin
  l3Split(l_S, C, l_Pr, l_Su);
  SetLength(Result, l_L + 1);
  Result[l_L] := l_Pr;
  Inc(l_L);
  if l3IsNil(l_Su) then
   break
  else
   l_S := l_Su;
 end;//while true
end;

procedure l3Split(const aSt: Il3CString; const C: array of AnsiChar; var P, S: Il3CString);
  //overload;
var
 l_LP : Integer;
 l_LS : Integer;
begin
 P := l3Prefix(aSt, C);
 l_LP := l3Len(P);
 l_LS := l3Len(aSt);
 if (l_LP = l_LS) then
  S := nil
 else
  S := l3Copy(aSt, l_LP + 1, l_LS - l_LP - 1 {Length(C)});
end;

procedure l3Split(const aSt: Il3CString; const C: Il3CString; var P, S: Il3CString);
  //overload;
  {* - разделяет сроку на две. C - разделитель. }
var
 l_LP : Integer;
 l_LS : Integer;
begin
 P := l3Prefix(aSt, C);
 l_LP := l3Len(P);
 l_LS := l3Len(aSt);
 if (l_LP = l_LS) then
  S := nil
 else
  S := l3Copy(aSt, l_LP + l3Len(C), l_LS - l_LP - l3Len(C));
end;

function l3IsOEM(aCodePage : Integer): Boolean;
  {-}
begin
 Result := (aCodePage = CP_OEM) OR (aCodePage = CP_OEMLite) OR (aCodePage = CP_RussianDos);
end;

function l3IsOEMWithOutLite(aCodePage : Integer): Boolean;
  {-}
begin
 Result := (aCodePage = CP_OEM) OR (aCodePage = CP_RussianDos);
end;

function l3IsOEMEx(aCodePage : Integer): Boolean;
  {-}
begin
 Result := l3IsOEM(aCodePage) OR (aCodePage = CP_TatarOEM);
end;

function l3IsOEMWithOutLiteEX(aCodePage : Integer): Boolean;
begin
 Result := l3IsOEMWithOutLite(aCodePage) OR (aCodePage = CP_TatarOEM);
end;

function l3IsANSI(aCodePage : Integer): Boolean;
  {-}
begin
 Result := (aCodePage = CP_ANSI) OR (aCodePage = CP_RussianWin);
end;

function l3IsUpper(aChar : AnsiChar): Boolean;
  {-}
begin
 Result := (aChar in cc_UpRussian) or (aChar in cc_UpEnglish);
end;

function l3InSet(aChar: WideChar; const aSet : TCharSet): Boolean;
  {-}
begin
 Result := (l3WideToChar(aChar) in aSet);
end;

function l3WideToChar(aChar: WideChar): AnsiChar;
  {-}
begin
 Result := AnsiString(aChar)[1];
end;

const
 AnsiLnOffset = 4;
 AnsiRfOffset = 8;

function l3StrLength(const S: AnsiString): Longint;
var
  P: Pointer;
begin
  Result := 0;
  if Pointer(S) <> nil then
  begin
    P := Pointer(Integer(Pointer(S)) - AnsiLnOffset);
    Result := Integer(P^) and (not $80000000 shr 1);
  end;
end;

//--------------------------------------------------------------------------------------------------

function l3StrRefCount(const S: AnsiString): Longint;
var
  P: Pointer;
begin
  Result := 0;
  if Pointer(S) <> nil then
  begin
    P := Pointer(Integer(Pointer(S)) - AnsiRfOffset);
    Result := Integer(P^);
  end;
end;

function l3StrPtrLength(const S: Pointer): Longint;
  {-}
var
  P: Pointer;
begin
  Result := 0;
  if (S <> nil) then
  begin
    P := Pointer(Integer(S) - AnsiLnOffset);
    Result := Integer(P^) and (not $80000000 shr 1);
  end;
end;

function l3StrPtrRefCount(const S: Pointer): Longint;
  {-}
var
  P: Pointer;
begin
  Result := 0;
  if (S <> nil) then
  begin
    P := Pointer(Integer(S) - AnsiRfOffset);
    Result := Integer(P^);
  end;
end;

function l3CommonPartLen(const S1, S2: Tl3WString; IgnoreCase: Boolean = false): integer;
  //overload;
  {-}
var
 lMaxCount,
 lCount: integer;
begin
 lMaxCount := min(S1.SLen, S2.SLen);
 for lCount := 0 to lMaxCount - 1 do
 begin
  if not l3SameChar(S1, S2, lCount, IgnoreCase) then
  begin
   Result := lCount;
   exit;
  end;//not l3SameChar
 end;//for lCount
 Result := lMaxCount;
end;

function l3CommonPartLen(const S1, S2: Il3CString; IgnoreCase: Boolean = false): integer;
  {-}
var
 lMaxCount,
 lCount: integer;
begin
 lMaxCount := min(l3Len(S1), l3Len(S2));
 for lCount := 0 to lMaxCount - 1 do
 begin
  if not l3SameChar(S1, S2, lCount, IgnoreCase) then
  begin
   Result := lCount;
   exit;
  end;//not l3SameChar
 end;//for lCount
 Result := lMaxCount;
end;

function l3Starts(const ASubText: AnsiString; const AText: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  //overload;
  {-}
begin
 Result := l3Starts(l3PCharLen(ASubText), AText, IgnoreCase);
end;

function l3Starts(const ASubText, AText: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  //overload;
  {-}
const
 cCase : array [Boolean] of Integer = (0, NORM_IGNORECASE);
begin
 if (ASubText.SLen > AText.SLen) then
  Result := false
 else
 begin
  if (ASubText.SCodePage = AText.SCodePage) then
  begin
   if l3IsANSI(ASubText.SCodePage) then
    Result := (CompareStringA(LCID_RUSSIAN, cCase[IgnoreCase],
       AText.S, ASubText.SLen, ASubText.S, ASubText.SLen) = 2)
   else
   if (ASubText.SCodePage =  CP_Unicode) then
    Result := (CompareStringW(LCID_RUSSIAN, cCase[IgnoreCase],
       PWideChar(AText.S), ASubText.SLen, PWideChar(ASubText.S), ASubText.SLen) = 2)
   else
    Result := l3CommonPartLen(ASubText, AText, IgnoreCase) = aSubText.SLen;
  end//ASubText.SCodePage = AText.SCodePage
  else
   Result := l3CommonPartLen(ASubText, AText, IgnoreCase) = aSubText.SLen;
 end;//ASubText.SLen > AText.SLen
end;

function l3Ends(const ASubText, AText: Il3CString; IgnoreCase: Boolean = false): Boolean;
  //overload;
  {-}
begin
 Result := l3Ends(l3PCharLen(ASubText), l3PCharLen(AText), IgnoreCase);
end;

function l3Ends(const ASubText, AText: WideString; IgnoreCase: Boolean = false): Boolean;
var
 I: Integer;
 T: Integer;
begin
 T := Length(AText) - Length(ASubText);
 if T < 0 then
  Result := False
 else
 if T = 0 then
  Result := l3Same(ASubText, AText, IgnoreCase)
 else
 for I := 1 to Length(ASubText) do
  if not l3Same(AText[T], ASubText[I], IgnoreCase) then
  begin
   Result := False;
   Exit;
  end
  else
   Inc(T);
 Result := True;
end;

function l3Ends(const ASubText, AText: Tl3WString; IgnoreCase: Boolean = false): Boolean;
  //overload;
  {-}
const
 cCase : array [Boolean] of Integer = (0, NORM_IGNORECASE);
begin
 if (ASubText.SLen > AText.SLen) then
  Result := false
 else
 begin
  if (ASubText.SCodePage = AText.SCodePage) then
  begin
   if l3IsANSI(ASubText.SCodePage) then
    Result := (CompareStringA(LCID_RUSSIAN, cCase[IgnoreCase],
       AText.S + AText.SLen - ASubText.SLen, ASubText.SLen, ASubText.S, ASubText.SLen) = 2)
   else
   if (ASubText.SCodePage =  CP_Unicode) then
    Result := (CompareStringW(LCID_RUSSIAN, cCase[IgnoreCase],
       PWideChar(AText.S) + AText.SLen - ASubText.SLen, ASubText.SLen, PWideChar(ASubText.S), ASubText.SLen) = 2)
   else
   if l3IsOEM(ASubText.SCodePage) then
    Result := l3Ends(ASubText.S, AText.S, IgnoreCase)
   else
   begin
    Result := false;
    Assert(False);
    //Result := l3CommonPartLen(ASubText, AText, IgnoreCase) = aSubText.SLen;
   end;//l3IsOEM(ASubText.SCodePage)
  end//ASubText.SCodePage = AText.SCodePage
  else
  begin
   Result := false;
   Assert(False);
   //Result := l3CommonPartLen(ASubText, AText, IgnoreCase) = aSubText.SLen;
  end;//ASubText.SCodePage = AText.SCodePage
 end;//ASubText.SLen > AText.SLen
end;

function l3Starts(const ASubText, AText: Il3CString; IgnoreCase: Boolean = false): Boolean;
  {-}
begin
 Result := l3Starts(l3PCharLen(ASubText), l3PCharLen(AText), IgnoreCase);
end;

function  l3Dup(const aStr: AnsiString; aCount: Integer; aSep: AnsiChar): AnsiString;
  {-}
var
 l_I : Integer;
begin
 // сразу распределим память под строку
 SetLength(Result, aCount * (Length(aStr) + 1{Length(aSep)}) - 1{Length(aSep)});

 Result := aStr;
 for l_I := 1 to Pred(aCount) do
  Result := Result + aSep + aStr;
end;

function l3WideString(const aStr: Il3CString): WideString;
  {-}
var
 l_S : Tl3WString;
begin
 if (aStr = nil) then
  Result := ''
 else
 begin
  l_S := aStr.AsWStr;
  if (l_S.SCodePage = CP_Unicode) then
   Result := PWideChar(l_S.S)
  else
   Result := l3Str(l_S);
 end;
end;

function l3IsWordDelim(Ch             : AnsiChar;
                       CodePage       : Long;
                       const anExcept : TCharSet) : Boolean;
  {-Return True if Ch is a word delimiter}
begin
 if (Ch in anExcept) then
  Result := false
 else
  Result := l3IsWordDelim(Ch, CodePage);
end;

const
  cWordDelim : array [false..true] of TCharSet =
   (
    [#0..#31] + cc_WordDelimANSISet,
    [#0..#31] + cc_WordDelimOEMSet
   );

function l3IsWordDelim(Ch             : AnsiChar;
                       CodePage       : Long = CP_ANSI) : Boolean;
  {-Return True if Ch is a word delimiter}
begin
 Result := Ch in cWordDelim[(CodePage = CP_OEM) OR (CodePage = CP_OEMLite)];
end;

function l3IsWordDelim(Ch: WideChar) : Boolean;
  {-Return True if Ch is a word delimiter}
begin
 Result := l3InSet(Ch, cWordDelim[False]);
end;

function l3RomanToInt(const aString: Tl3WString): Integer;
var
  I, lastValue, curValue: integer;
begin
  Result := 0;
  lastValue := 0;
  for I := aString.SLen-1 downto 0 do
  begin
    case UpCase(l3Char(aString, I)) of
      'C':
        curValue := 100;
      'D':
        curValue := 500;
      'I':
        curValue := 1;
      'L':
        curValue := 50;
      'M':
        curValue := 1000;
      'V':
        curValue := 5;
      'X':
        curValue := 10;
    else
      raise EConvertError.CreateFmt('Invalid character: %s', [l3Char(aString, I)]);
    end;
    if curValue < lastValue then
      Dec(Result, curValue)
    else
      Inc(Result, curValue);
    lastValue := curValue;
  end;
end;

function l3Copy(const aStr: Tl3WString; anIndex: Integer; aCount: Integer = MaxInt): Tl3WString;
begin
 if anIndex < aStr.SLen then
 begin
  if (aCount = MaxInt) or (anIndex + aCount > aStr.SLen) then
   aCount := aStr.SLen - anIndex;
  Result := l3PCharLenPart(aStr.S, anIndex, anIndex+aCount, aStr.SCodePage);
 end
 else
  l3AssignNil(Result);
end;

function l3PCharLenToPCharRec(const aStr: Tl3WString): Tl3PCharRec;
var
 l_Res : Tl3PCharRec;

 procedure DoReallocate;
 begin
  l_Res.rS := l3StrAlloc(aStr.SLen + 1);
  l3Move(aStr.S^, l_Res.rS^, aStr.SLen);
  l_Res.rS[aStr.SLen] := #0;
  l_Res.rAllocated := True;
 end;

begin
 if l3IsNil(aStr) then
 begin
  l_Res.rS := nil;
  l_Res.rAllocated := False;
 end
 else
 begin
  try
   if aStr.S[aStr.SLen] = #0 then
   begin
    l_Res.rS := aStr.S;
    l_Res.rAllocated := False;
   end
   else
    DoReallocate;
  except
   on EAccessViolation do
    DoReallocate;
  end;
 end;
 Result := l_Res;
end;

procedure l3FreePCharRec(var theRec: Tl3PCharRec);
begin
 if theRec.rAllocated then
  l3StrDispose(theRec.rS);
end;

function l3StrAlloc(Size: Cardinal): PAnsiChar;
begin
 l3System.GetLocalMem(Result, Size);
end;

procedure l3StrDispose(var Str: PAnsiChar);
begin
 l3System.FreeLocalMem(Str);
end;

function l3StrNew(const Str: PAnsiChar): PAnsiChar;
var
 l_BufLen: Integer;
begin
 if (Str = nil) or (Str[0] = #0) then
 begin
  Result := nil;
  Exit;
 end;
 l_BufLen := StrLen(Str)+1; // плюс 1 для #0
 Result := l3StrAlloc(l_BufLen);
 l3Move(Str^, Result^, l_BufLen);
end;

function  l3StrBufSize(const Str: PAnsiChar): Cardinal;
begin
 Result := l3MemorySize(Str);
end;

function ConvertUTF16toUTF8 (const source: WideString;
                              var target: AnsiString;
                              flags: ConversionFlags;
                              BOM: boolean): ConversionResult;
begin
 Result := ElStrUtils.ConvertUTF16toUTF8(source, target, flags, BOM);
end;

function ConvertUTF8toUTF16(const source: AnsiString;
                             var target: WideString;
                             flags: ConversionFlags;
                             BOM: boolean): ConversionResult;

begin
 Result := ElStrUtils.ConvertUTF8toUTF16(source, target, flags, BOM);
end;

function l3GetSuffix(const aStr: Tl3WString; aSeparator: AnsiChar): Tl3WString;
var
 l_SepPos: PAnsiChar;
begin
 Assert(aStr.SCodepage <> cp_Unicode, 'l3GetSuffix: Не умеем с юникодом...');
 l_SepPos := ev_lpRScan(aSeparator, aStr.S, aStr.SLen);
 if l_SepPos <> nil then
  Result := l3Copy(aStr, l_SepPos - aStr.S + 1)
 else
  Result := aStr; 
end;

function l3PosEx(const aStr: Il3CString; const aSubStr: Tl3WString; aFrom: Integer; aCaseSensitive: Boolean = True):
    Integer;
  //overload;
var
 l_Part: Tl3WString;
begin
 if l3IsNil(aStr) or (l3Len(aStr) - 1 < aFrom) then
  Result := l3NotFound
 else
 begin
  l_Part := l3Copy(aStr.AsWStr, aFrom, MaxInt);
  Result := l3Pos(l_Part, aSubStr, aCaseSensitive);
  if Result <> l3NotFound then
   Result := Result + aFrom;
 end;
end;

function l3PosEx(const aStr: Il3CString; const aSubStr: Il3CString; aFrom: Integer; aCaseSensitive: Boolean = True): Integer;
//  overload;
begin
 if (aSubStr = nil) then
  Result := l3NotFound
 else
  Result := l3PosEx(aStr, aSubStr.AsWStr, aFrom, aCaseSensitive);
end;

function l3IntToRoman(aValue: LongInt): AnsiString;
const
 Arabics: Array[1..13] of Integer = (1,4,5,9,10,40,50,90,100,400,500,900,1000) ;
 Romans: Array[1..13] of AnsiString = ('I','IV','V','IX','X','XL','L','XC','C','CD','D','CM','M') ;
var
 j: Integer;
begin
 Result:= '';
 for j := 13 downto 1 do
  while (aValue >= Arabics[j]) do
  begin
   aValue := aValue - Arabics[j];
    Result := Result + Romans[j];
  end;
end;

end.
