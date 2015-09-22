unit vcmBase;
{* Базовые невизуальные классы библиотеки vcm. }

{ Библиотека "vcm"        }
{ Автор: Люлин А.В. ©     }
{ Модуль: vcmBase -       }
{ Начат: 21.02.2003 16:19 }
{ $Id: vcmBase.pas,v 1.264 2015/08/11 16:23:53 kostitsin Exp $ }

// $Log: vcmBase.pas,v $
// Revision 1.264  2015/08/11 16:23:53  kostitsin
// {requestlink: 605157327 }
//
// Revision 1.263  2015/03/16 16:53:06  lulin
// - делаем стереотипы Service и ServiceImplementation.
//
// Revision 1.262  2015/03/12 11:03:49  lulin
// - перетряхиваем слова.
//
// Revision 1.261  2015/02/25 13:11:45  lulin
// - перегенерация.
//
// Revision 1.260  2014/02/18 13:49:49  lulin
// - избавляемся от ненужного списка.
//
// Revision 1.259  2013/11/15 11:59:32  lulin
// - чистим код.
//
// Revision 1.258  2013/07/01 08:26:33  lulin
// - пытаемся включить кеш объектов (пока неудачно).
//
// Revision 1.257  2013/04/25 14:22:38  lulin
// - портируем.
//
// Revision 1.256  2012/11/01 09:42:19  lulin
// - забыл точку с запятой.
//
// Revision 1.255  2012/11/01 07:44:02  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.254  2012/11/01 07:12:04  lulin
// - вычищаем мусор.
//
// Revision 1.253  2012/10/26 14:14:26  lulin
// {RequestLink:406489593}
//
// Revision 1.252  2012/04/13 18:22:11  lulin
// {RequestLink:237994598}
//
// Revision 1.251  2012/04/11 17:42:03  lulin
// {RequestLink:237994598}
// - продолжаем перенос текстовой формы на модель.
//
// Revision 1.250  2012/03/23 13:03:43  lulin
// - отпиливаем настройки.
//
// Revision 1.249  2011/08/30 11:22:36  dinishev
// [$280010450]. Компилируем Арчи после подключения скриптового движка "по настоящему".
//
// Revision 1.248  2011/05/19 12:20:44  lulin
// {RequestLink:266409354}.
//
// Revision 1.247  2010/03/16 14:50:51  lulin
// {RequestLink:196968958}.
// [$197496457].
// [$197496566].
//
// Revision 1.246  2010/03/11 15:13:37  lulin
// {RequestLink:196969151}.
// - избавляемся от ненужных зависимостей от VCM.
//
// Revision 1.245  2010/03/01 14:24:56  lulin
// {RequestLink:193823544}.
// - не компилировались Эверест и Архивариус.
//
// Revision 1.244  2010/01/12 20:03:00  lulin
// {RequestLink:175965988}.
//
// Revision 1.243  2009/12/30 13:24:12  lulin
// {RequestLink:175540860}. №1.
//
// Revision 1.242  2009/12/28 18:03:10  lulin
// - адаптируем работу с локализованными строками к режиму редактирования форм.
//
// Revision 1.241  2009/12/28 16:23:53  lulin
// - определяем локализуемые строки на модели.
//
// Revision 1.240  2009/12/24 16:10:17  lulin
// {RequestLink:175540480}.
//
// Revision 1.239  2009/12/23 16:12:58  lulin
// - делаем тест загрузкии скроллирования ГК.
//
// Revision 1.238  2009/12/22 16:46:48  lulin
// - удалось запустить тест создающий форму.
//
// Revision 1.237  2009/11/19 12:59:01  oman
// - fix: {RequestLink:171968647}
//
// Revision 1.236  2009/11/12 18:06:59  lulin
// - убираем ненужные возвращаемые значения.
//
// Revision 1.235  2009/11/12 14:31:59  lulin
// - убираем возможность менять список параметров.
//
// Revision 1.234  2009/11/06 13:06:17  lulin
// - избавился от ручной передачи параметров через поле Data.
//
// Revision 1.233  2009/11/05 18:26:42  lulin
// - избавился от переменных списков параметров.
//
// Revision 1.232  2009/10/30 17:11:04  lulin
// - третья волна компании по борьбе со старыми внутренними операциями.
//
// Revision 1.231  2009/10/29 14:35:30  lulin
// - вторая волна компании по борьбе со старыми внутренними операциями.
//
// Revision 1.230  2009/10/28 14:10:02  lulin
// - начинаем компанию по борьбе со старыми внутренними операциями.
//
// Revision 1.229  2009/10/16 17:00:41  lulin
// {RequestLink:159360578}. №52.
//
// Revision 1.228  2009/10/16 15:55:05  lulin
// {RequestLink:159360578}. №52.
//
// Revision 1.227  2009/10/16 15:51:50  lulin
// {RequestLink:159360578}. №52.
//
// Revision 1.226  2009/10/16 15:14:24  lulin
// {RequestLink:159360578}. №52.
//
// Revision 1.225  2009/10/16 11:19:53  lulin
// - вычищаем очередного коня в вакууме.
//
// Revision 1.224  2009/10/15 17:48:35  lulin
// {RequestLink:166856141}. Убираем заточку. С нею только хуже.
//
// Revision 1.223  2009/10/15 17:21:14  lulin
// {RequestLink:166856141}. Попытки ещё что-нибудь полечить.
//
// Revision 1.222  2009/10/05 06:46:05  lulin
// {RequestLink:159360578}. №51.
//
// Revision 1.221  2009/10/02 19:10:07  lulin
// - окончательно избавился от инициализации форм переменными списками параметров. Всё перевёл на фабрики.
//
// Revision 1.220  2009/10/02 13:43:49  lulin
// - теперь формы инициализируются честными параметрами, поданными в фабрику, а не через список переменных параметров.
//
// Revision 1.219  2009/10/01 19:11:38  lulin
// - параметризуем фабрики конечных форм приложения.
//
// Revision 1.218  2009/10/01 16:18:33  lulin
// - убран ненужный метод.
//
// Revision 1.217  2009/09/24 10:13:06  lulin
// - вычищаем ненужный параметр операции.
//
// Revision 1.216  2009/09/23 14:15:40  lulin
// - вычищен ненужный параметр.
//
// Revision 1.215  2009/08/28 17:15:45  lulin
// - начинаем публикацию и описание внутренних операций.
//
// Revision 1.214  2009/08/20 17:19:02  lulin
// {RequestLink:159360595}.
//
// Revision 1.213  2009/08/14 12:11:39  oman
// - fix:  КОнчились модули... - {RequestLink:159356254}
//
// Revision 1.212  2009/08/06 16:08:13  lulin
// {RequestLink:159352843}.
//
// Revision 1.211  2009/07/31 17:56:19  lulin
// {RequestLink:129240934}. №7.
//
// Revision 1.210  2009/07/21 15:10:11  lulin
// - bug fix: не собирался и не работал Архивариус в ветке.
//
// Revision 1.209  2009/07/20 11:22:05  lulin
// - заставляем работать F1 после - {RequestLink:141264340}. №7, 32, 33.
//
// Revision 1.208  2009/02/20 17:57:35  lulin
// - <K>: 136941122. Чистка кода.
//
// Revision 1.207  2009/02/20 17:29:18  lulin
// - чистка комментариев.
//
// Revision 1.206  2009/02/16 13:29:22  lulin
// - "спрятал" локальный интерфейс.
//
// Revision 1.205  2009/02/12 18:22:27  lulin
// - <K>: 135604584. Выделен модуль с интерфейсами тулбаров.
//
// Revision 1.204  2008/12/08 09:32:18  lulin
// - <K>: 128292941.
//
// Revision 1.203  2008/03/21 14:09:17  lulin
// - cleanup.
//
// Revision 1.202  2008/03/20 09:48:17  lulin
// - cleanup.
//
// Revision 1.201  2008/03/19 14:23:42  lulin
// - cleanup.
//
// Revision 1.200  2008/03/18 09:21:22  lulin
// - <K>: 87197434.
//
// Revision 1.199  2008/03/07 13:18:03  lulin
// - <K>: 86477737.
//
// Revision 1.198  2008/03/05 15:09:22  lulin
// - <K>: 86474870.
//
// Revision 1.197  2008/03/04 19:54:47  lulin
// - <K>: 86114496.
//
// Revision 1.196  2008/02/22 15:33:39  lulin
// - избавляемся от виртуальности.
//
// Revision 1.195  2008/02/21 10:55:06  lulin
// - упрощаем наследование.
//
// Revision 1.194  2008/02/15 10:28:34  lulin
// - bug fix: не собиралась библиотека.
//
// Revision 1.193  2008/02/14 17:09:03  lulin
// - cleanup.
//
// Revision 1.192  2008/02/14 14:12:12  lulin
// - <K>: 83920106.
//
// Revision 1.191  2008/02/14 11:09:27  lulin
// - <K>: 84312141.
//
// Revision 1.190  2008/02/13 16:03:04  lulin
// - убраны излишне гибкие методы поиска.
//
// Revision 1.189  2008/02/07 14:44:27  lulin
// - класс _Tl3LongintList переехал в собственный модуль.
//
// Revision 1.188  2008/02/07 08:37:41  lulin
// - каждому базовому объекту по собственному модулю.
//
// Revision 1.187  2008/02/06 15:36:57  lulin
// - каждому базовому объекту по собственному модулю.
//
// Revision 1.186  2008/02/06 09:30:40  lulin
// - базовые списки объектов выделяем в отдельные файлы.
//
// Revision 1.185  2008/02/05 09:57:42  lulin
// - выделяем базовые объекты в отдельные файлы и переносим их на модель.
//
// Revision 1.184  2008/02/04 08:51:31  lulin
// - класс _Tl3InterfaceList выделен в отдельный модуль.
//
// Revision 1.183  2008/02/01 09:29:56  lulin
// - <TDN>: 52. Не собирался VCM.
//
// Revision 1.182  2008/01/31 10:09:18  lulin
// - bug fix: не собирался VCM.
//
// Revision 1.181  2008/01/31 09:13:28  oman
// - fix: Боремся с #13#10 в заголовке окна (cq28330)
//
// Revision 1.180  2008/01/28 07:04:35  oman
// - fix: Не собиралась библиотека
//
// Revision 1.179  2007/12/20 12:46:51  lulin
// - модуль vcmExternalInterfaces теперь полностью генерируется с модели.
//
// Revision 1.178  2007/12/20 08:35:21  lulin
// - подгоняем интерфейсы под модель.
//
// Revision 1.177  2007/12/10 12:44:47  mmorozov
// - new: реализуем шаблон publisher\subscriber при редактировании настроек, замены настроек (переключения конфигураций), настройке панелей инструментов (в рамках CQ: OIT5-27823);
//
// Revision 1.176  2007/09/25 03:55:39  mmorozov
// - new behaviour: для чтения\изменения текущего выбранного значения для операций типа vcm_otDate, vcm_otCombo, vcm_otEditCombo используем свойство параметров _SelectedString, раньше Caption. Тем самым Caption для этих типов операций стал изменяемым (в рамках работы CQ: OIT5-26741);
//
// Revision 1.175  2007/08/14 19:31:38  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.174  2007/08/13 17:23:28  lulin
// - cleanup.
//
// Revision 1.173  2007/08/08 09:33:14  lulin
// - на базовых параметрах разрешаем вызывать операции от контрола.
//
// Revision 1.172  2007/07/24 19:43:39  lulin
// - bug fix: не компилировались библиотеки.
//
// Revision 1.171  2007/07/17 08:27:48  oman
// - fix: При укладывании в кеш оставался мусорный
//  _vcmParams.ItemIndex (cq25684)
//
// Revision 1.170  2007/06/28 14:56:11  lulin
// - cleanup.
//
// Revision 1.169  2007/04/17 14:28:47  lulin
// - добавлена еще одна версия сравнения строк.
//
// Revision 1.168  2007/04/11 13:31:04  lulin
// - используем строки с кодировкой.
//
// Revision 1.167  2007/04/10 13:20:08  lulin
// - используем строки с кодировкой.
//
// Revision 1.166  2007/04/05 12:16:43  lulin
// - убран метод добавления строки в виде структуры - дабы не было соблазна для преобразований туда-сюда.
//
// Revision 1.165  2007/04/05 12:10:12  lulin
// - убран метод добавления стандартной строки - дабы не было соблазна для преобразований туда-сюда.
//
// Revision 1.164  2007/04/05 11:40:59  lulin
// - теперь по-умолчанию у списка строк более правильное свойство.
//
// Revision 1.163  2007/04/05 10:36:25  lulin
// - cleanup.
//
// Revision 1.162  2007/04/04 07:24:37  lulin
// - bug fix: на ХП-темах не обновлялся заголовок окна (CQ OIT5-24880).
//
// Revision 1.161  2007/03/20 07:50:38  lulin
// - теперь у формы заголовок поддерживает различные кодировки (отрисовка пока не изменена).
//
// Revision 1.160  2007/03/19 13:50:37  lulin
// - в списке параметров убран доступ к обычным строкам.
//
// Revision 1.159  2007/03/16 14:17:02  lulin
// - bug fix: падали при форматировании строки.
//
// Revision 1.158  2007/03/16 13:56:52  lulin
// - переходим на собственную функцию форматирования строк.
//
// Revision 1.157  2007/03/12 12:36:18  lulin
// - cleanup.
//
// Revision 1.156  2007/03/12 12:00:39  lulin
// - используем "родные" процедуры преобразования строк.
//
// Revision 1.155  2007/02/28 15:04:00  lulin
// - храним ссылку на строку, а не ее копию.
//
// Revision 1.154  2007/02/28 13:36:18  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.153  2007/02/13 15:42:08  lulin
// - избавляемся от лишних преобразований строк - добавлены функции сложения строк, обладающих кодировкой.
//
// Revision 1.152  2007/02/13 13:28:21  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.151  2007/02/13 12:08:58  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.150  2007/02/12 18:55:38  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.149  2007/02/12 16:40:27  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.148  2007/02/09 13:41:14  lulin
// - в списки теперь можно добавлять интерфейсную строку.
//
// Revision 1.147  2007/02/09 12:37:41  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.146  2007/02/07 17:48:39  lulin
// - избавляемся от копирования строк при чтении из настроек.
//
// Revision 1.145  2007/02/07 14:30:36  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.144  2007/02/06 11:48:44  lulin
// - bug fix: не собиралась библиотека.
//
// Revision 1.143  2007/02/06 11:35:37  oman
// - fix: Не собиралась библиотека
//
// Revision 1.142  2007/02/06 11:19:03  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.141  2007/02/06 07:53:20  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.140  2007/02/02 12:25:37  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.139  2007/02/02 09:11:07  lulin
// - упрощаем преобразование строк.
//
// Revision 1.138  2007/01/23 13:31:34  lulin
// - убран метод установки контейнера.
//
// Revision 1.137  2007/01/22 15:30:05  lulin
// - избавляемся от нефиксированных параметров при выполнении пользовательской операции.
//
// Revision 1.136  2007/01/22 12:22:37  lulin
// - cleanup.
//
// Revision 1.135  2007/01/20 21:06:19  lulin
// - убираем с реализации тестовых и базовых параметров переменный список.
//
// Revision 1.134  2007/01/20 20:35:38  lulin
// - запрещаем изменять параметр относительно сохранения фокуса.
//
// Revision 1.133  2007/01/20 20:28:48  lulin
// - удаляем с параметров операции диспетчера.
//
// Revision 1.132  2007/01/20 19:11:34  lulin
// - запрещаем править поле с данными у параметров.
//
// Revision 1.131  2007/01/20 15:31:07  lulin
// - разделяем параметры операции для выполнения и для тестирования.
//
// Revision 1.130  2007/01/19 11:53:20  lulin
// - данные переехали с общих параметров на более специализированные.
//
// Revision 1.129  2007/01/19 09:47:37  lulin
// - выделяем интерфейс параметров для создания формы.
//
// Revision 1.128  2007/01/18 13:56:26  lulin
// - требуем обязательного задания параметров.
//
// Revision 1.127  2007/01/18 13:39:42  lulin
// - убираем ненужные данные.
//
// Revision 1.126  2007/01/18 13:24:42  lulin
// - разводим в стороны параметры для теста и для выполнения.
//
// Revision 1.125  2007/01/18 13:13:42  lulin
// - разводим в стороны параметры для теста и для выполнения.
//
// Revision 1.124  2007/01/18 12:09:17  lulin
// - разводим в стороны параметры для теста и для выполнения.
//
// Revision 1.123  2007/01/18 09:06:49  lulin
// - с общих параметров убраны тестовые опции.
//
// Revision 1.122  2007/01/17 18:47:31  lulin
// - сужаем список параметров для тестирования операции.
//
// Revision 1.121  2007/01/17 17:53:38  lulin
// - сужаем список параметров для тестирования операции.
//
// Revision 1.120  2007/01/17 14:02:43  lulin
// - вычищены последние нефиксированные параметры в тестах операций.
//
// Revision 1.119  2007/01/17 12:27:29  lulin
// - избавляемся от нефиксированного параметра - расширенной подсказки операции.
//
// Revision 1.118  2007/01/16 14:27:28  lulin
// - избавляемся от нефиксированного параметра - подсказки операции.
//
// Revision 1.117  2007/01/16 14:13:08  lulin
// - избавляемся от нефиксированного параметра - заголовка операции.
//
// Revision 1.116  2007/01/16 13:47:29  lulin
// - избавляемся от нефиксированного параметра - горячей клавиши.
//
// Revision 1.115  2007/01/16 12:06:36  lulin
// - избавляемся от нефиксированного параметра - индекс картинки.
//
// Revision 1.114  2007/01/15 18:00:36  lulin
// - требуем необходимости задания контейнера.
//
// Revision 1.113  2007/01/15 17:34:20  lulin
// - расширяем интерфейс списка нод.
//
// Revision 1.112  2007/01/15 13:26:26  lulin
// - расширен интерфейс элементов операции.
//
// Revision 1.111  2007/01/15 12:47:25  lulin
// - теперь шрифт создаем только по требованию - когда его реально хотят заполнить.
//
// Revision 1.110  2007/01/11 11:15:04  lulin
// - вводим "родные" ноды.
//
// Revision 1.109  2007/01/11 08:53:06  oman
// Не собиралась библиотека
//
// Revision 1.108  2007/01/10 17:58:14  lulin
// - добавлена реализация списка интерфейсов.
//
// Revision 1.107  2007/01/10 17:27:39  lulin
// - теперь список строк создаем только по требованию - когда его реально хотят заполнить.
//
// Revision 1.106  2007/01/10 13:58:44  lulin
// - от параметра по индексу переходим к свойству в параметрах операции.
//
// Revision 1.105  2007/01/10 12:08:22  lulin
// - добавляем параметры операции.
//
// Revision 1.104  2007/01/05 12:45:42  lulin
// - cleanup.
//
// Revision 1.103  2007/01/05 12:35:15  lulin
// - cleanup.
//
// Revision 1.102  2007/01/05 12:13:53  lulin
// - удаляем ненужное поле.
//
// Revision 1.101  2007/01/05 12:05:37  lulin
// - убрано вредное непосредственное приведение к интерфейсу.
//
// Revision 1.100  2006/04/14 13:40:18  lulin
// - запрещаем перекрывать деструктор.
//
// Revision 1.99  2006/04/14 12:11:14  lulin
// - файлу с шаблоном дано более правильное название.
//
// Revision 1.98  2006/03/31 08:07:38  lulin
// - cleanup: вычищены избыточные методы.
//
// Revision 1.97  2006/03/31 07:41:43  lulin
// - изменен тип параметров, подаваемый в Execte операции.
//
// Revision 1.96  2006/03/28 06:25:18  oman
// - change: Более адекватное название vcmS => _vcmConstString
//
// Revision 1.95  2006/03/23 14:30:27  lulin
// - добавлена функция возвращающая строковую константу, по ее идентификатору.
//
// Revision 1.94  2006/03/06 12:03:15  oman
// - new behavior: указание "правильного" провисания ресурсов при добавлении объектов в кэш
//
// Revision 1.93  2005/09/06 14:10:31  lulin
// - bug fix: не компилировалось.
//
// Revision 1.92  2005/08/24 09:28:41  mmorozov
// new: method _IvcmParams._InitData;
//
// Revision 1.91  2005/07/27 10:20:21  lulin
// - теперь в параметрах есть свойство, указывающее, что форма создается из истории.
//
// Revision 1.90  2005/07/15 10:36:54  mmorozov
// change: значение c_GroupStep сниженно до 250;
//
// Revision 1.89  2005/07/01 12:07:48  mmorozov
// - _format code;
//
// Revision 1.88  2005/05/12 14:50:51  lulin
// - удалены рудименты с залочкой изменения размеров контрола от Саши Маркова.
//
// Revision 1.87  2005/05/12 14:33:46  lulin
// - new method: _Tafw.IsObjectLocked.
//
// Revision 1.86  2005/04/28 15:03:52  lulin
// - переложил ветку B_Tag_Box в HEAD.
//
// Revision 1.85.4.1  2005/04/26 14:30:41  lulin
// - ускоряем l3Free и _l3Use.
//
// Revision 1.85  2005/02/14 12:09:57  mmorozov
// bugfix: в TvcmParams._AssignParams не копировалось поле Data;
//
// Revision 1.84  2005/01/20 07:11:28  mmorozov
// new: реализация изменений в интерфейсах _IvcmParams, IvcmParamsPrim;
//
// Revision 1.83  2005/01/17 09:30:33  lulin
// - bug fix: не компилировалось.
//
// Revision 1.82  2005/01/12 14:01:14  lulin
// - new methods: _Tafw.BeginOp/_EndOp.
//
// Revision 1.81  2004/12/29 12:22:25  mmorozov
// new: поддержка property IvcmParamPrim.Data;
//
// Revision 1.80  2004/11/25 09:58:13  lulin
// - new methods: _IvcmParams.SetControlEvent, _CallControl.
// - new behavior: если определен обработчик на форме, то зовем его - если дано отдать обработку контролу можно вызвать aParams._CallControl.
//
// Revision 1.79  2004/11/18 17:33:58  lulin
// - new interface: IvcmParamsPrim.
//
// Revision 1.78  2004/10/20 10:40:40  lulin
// - new behavior: увеличиваем частоту использования пула объектов.
//
// Revision 1.77  2004/10/07 14:16:58  lulin
// - new: теперь у _IvcmParams можно присваивать только свойство DoneStatus - код завершения. На основе этого "по-хитрому" обрабатываем ShortCut'ы для запрещенных операций (CQ OIT5-10123).
//
// Revision 1.76  2004/10/07 12:33:03  lulin
// - new prop: _IvcmParams.DoneStatus.
//
// Revision 1.75  2004/10/06 17:15:05  lulin
// - борьба за кошерность.
//
// Revision 1.74  2004/09/22 13:19:07  lulin
// - DblClick в коллекции форм открывает форму.
//
// Revision 1.73  2004/09/20 12:42:54  lulin
// - оптимизация - путем перемещения части объектов в пул, время загрузки ГК (до показа оглавления) уменьшено с 3.5 сек до 2.6 сек.
//
// Revision 1.72  2004/09/15 13:57:55  lulin
// - new unit: vcmStringList.
//
// Revision 1.71  2004/09/15 12:53:13  mmorozov
// change: в _CheckParam вместо Length используем f_Count;
//
// Revision 1.70  2004/09/15 12:00:27  lulin
// - new behavior: не освобождаем f_Param при попадании TvcmParams в кеш.
//
// Revision 1.69  2004/09/15 10:54:40  mmorozov
// new: у TvcmParams появилась емкость (Capacity), уменьшаем количество вызывов выделения памяти;
//
// Revision 1.68  2004/09/15 10:25:23  lulin
// - _TvcmBase переведен на "шаблон" l3Unknown.
//
// Revision 1.67  2004/09/14 08:03:09  lulin
// - списки сделаны кешируемыми.
//
// Revision 1.66  2004/09/10 16:21:42  lulin
// - оптимизация - кешируем OpDef и передаем ссылку на OperationItem, а не на кучу параметров.
//
// Revision 1.65  2004/09/10 14:04:00  lulin
// - оптимизация - кешируем EntityDef и передаем ссылку на EntityItem, а не на кучу параметров.
//
// Revision 1.64  2004/09/08 11:22:39  lulin
// - new define: _l3NoTrace.
// - new define: l3TraceObjects.
//
// Revision 1.63  2004/09/07 16:19:41  law
// - перевел VCM на кшированные обьекты.
//
// Revision 1.62  2004/09/01 14:46:34  demon
// - new behavior: в _IvcmParams добавлено свойство _FocusMustStored (False по умолчанию). Оно регулирует сохранение фокуса на старом месте при выполнении операций модуля.
//
// Revision 1.61  2004/08/13 09:29:26  law
// - bug fix: увеличил пороговое значение c_GroupStep с 400 до 500 (CQ OIT5-8754). Но вообще-то надо это решать как-то более системно ("в светлом будущем").
//
// Revision 1.60  2004/08/11 14:29:56  law
// - new behavior: сделан вызов Help'а для пунктов меню.
//
// Revision 1.59  2004/08/11 09:30:44  law
// - new proc: _vcmCleanSysParams.
//
// Revision 1.58  2004/08/02 14:05:35  law
// - открутил VCM от тесной интеграции с моделью Немезиса.
//
// Revision 1.57  2004/07/30 14:32:12  am
// new: g_vcmSizeLocked - состояние лока, по снятии которого размеры контрола могут измениться извне
//
// Revision 1.56  2004/07/09 11:19:37  am
// new: в _Dispatcher.Unlock перерисовываем не только формы, но и отдельные контролы.
//
// Revision 1.55  2004/06/03 13:04:43  law
// - remove class: TvcmList.
//
// Revision 1.54  2004/06/03 12:55:29  law
// - bug fix: VCM теперь собирается.
//
// Revision 1.53  2004/06/02 16:42:29  law
// - удален класс Tl3VList.
//
// Revision 1.52  2004/06/02 15:41:43  law
// - bug fix: используем "правильные" списки.
//
// Revision 1.51  2004/06/02 10:30:36  law
// - удален конструктор Tl3VList.MakeIUnknown - пользуйтесь _Tl3InterfaceList.Make.
//
// Revision 1.50  2004/06/02 10:20:37  law
// - удален конструктор Tl3VList.MakeIUnknown - пользуйтесь _Tl3InterfaceList.Make.
//
// Revision 1.49  2004/06/01 17:13:18  law
// - удален конструктор Tl3VList.MakePersistent - пользуйтесь _Tl3ObjectRefList.
//
// Revision 1.48  2004/06/01 15:33:52  law
// - удалены конструкторы Tl3VList.MakeLongint, MakeLongintSorted - пользуйтесь _Tl3LongintList.
// - подчистил VCM, за сегодняшними переделками Маркова.
//
// Revision 1.47  2004/06/01 14:56:31  law
// - удалены конструкторы Tl3VList.MakeLongint, MakeLongintSorted - пользуйтесь _Tl3LongintList.
//
// Revision 1.46  2004/05/27 14:32:03  law
// - new methods: _Tl3_CBase._IsCacheable, _NeedStoreInPool.
//
// Revision 1.45  2004/04/20 05:20:45  demon
// - fix: не компилился VCM
//
// Revision 1.44  2004/04/19 15:51:10  mmorozov
// new: method _TvcmStringList.IsEquals (сравнивает строки и объекты);
//
// Revision 1.43  2004/04/09 11:27:45  law
// - new class: _TvcmStringList.
//
// Revision 1.42  2004/04/08 19:41:50  law
// - optimization: TvcmParams и _TvcmHolder сделаны кешируемыми.
//
// Revision 1.41  2004/03/25 08:56:41  law
// - change: изменен тип параметра anOwner.
//
// Revision 1.40  2003/12/05 10:14:44  nikitin75
// + _IvcmParams.ModalResult;
//
// Revision 1.39  2003/12/02 13:44:29  law
// - bug fix: Stack Overflow без директивы _vcmNeedL3.
//
// Revision 1.38  2003/11/25 10:09:35  law
// - new proc: function vcmEmptyParams: _IvcmParams;
//
// Revision 1.37  2003/11/21 14:05:08  law
// - cleanup.
//
// Revision 1.36  2003/11/14 09:32:19  law
// - bug fix: TvcmParams._ClearParams не возвращала корректного результата.
//
// Revision 1.35  2003/10/22 15:35:38  law
// - new procs: g_vcmStartOp, g_vcmEndOp (в частности для присваивания g_evStartOp, g_evEndOp) (проблема отложенного удаления форм).
//
// Revision 1.34  2003/09/18 08:46:16  law
// - bug fix: поправлено для компиляции пакетов.
//
// Revision 1.33  2003/08/18 11:12:35  demon
// - new: добавлена операция для очистки всех пользовательских параметров _ClearParams.
// - new: добавлено свойство для определения типа параметра, лежащего в anIndex.
//
// Revision 1.32  2003/07/16 16:30:07  law
// - bug fix: список форм для отрисовки не очищался после Unlock.
//
// Revision 1.31  2003/07/03 17:39:57  law
// - new behavior: попытка оптимизировать переформатирование в WebStyle режиме (пока что-то не сильно заметно).
//
// Revision 1.30  2003/06/26 07:00:12  narry
// - update: продолжение документирования
//
// Revision 1.29  2003/06/17 11:37:19  narry
// - update: продолжение документирования
//
// Revision 1.28  2003/06/09 10:08:24  law
// - bug fix: vcm не собирался с опцией vcmNotNeedL3.
//
// Revision 1.27  2003/06/06 13:49:47  nikitin75
// - new proc: vcmCleanParams.
//
// Revision 1.26  2003/06/03 14:08:12  law
// - bug fix: не собиралось с опцией _vcmNeedL3.
// - bug fix: при закрытии приложения не освобождались модули.
//
// Revision 1.25  2003/06/02 15:20:00  narry
// - update: продолжение документирования библиотеки
//
// Revision 1.24  2003/05/28 09:07:57  law
// - bug fix: неправильно копировался элемент типа IUnknown.
//
// Revision 1.23  2003/05/22 11:38:00  law
// - new prop:  IvcmFormDispatcher.MainFormsCount, IvcmFormDispatcher.MainForm.
//
// Revision 1.22  2003/05/22 09:08:01  narry
// - update: начало документирования
//
// Revision 1.21  2003/04/28 13:02:34  law
// - remove const: vcm_opDone.
// - new prop: _IvcmParams.Done.
//
// Revision 1.20  2003/04/28 12:12:43  demon
// - bug fix: при копировании списка параметров лишний раз учитывался vcm_opResult.
//
// Revision 1.19  2003/04/28 09:47:58  law
// - remove method: _IvcmParams.CheckAggregate.
// - new proc: _vcmCheckAggregate.
//
// Revision 1.18  2003/04/28 09:36:09  law
// - cleanup: переделана логика работы с параметрами операций.
//
// Revision 1.17  2003/04/25 16:34:47  law
// - cleanup: _IvcmParams._Dispatcher - теперь Read-Only.
//
// Revision 1.16  2003/04/25 16:09:06  law
// - new prop: _IvcmParams.Owner.
//
// Revision 1.15  2003/04/25 15:56:05  law
// - new behavior: у _IvcmParams теперь нельзя править контейнер - надо создавать копию параметров.
//
// Revision 1.14  2003/04/23 15:05:05  law
// - new behavior: в параметры операции заковыриваем текущий контейнер верхнего уровня.
//
// Revision 1.13  2003/04/22 15:10:57  law
// - new method version: _vcmParams.
//
// Revision 1.12  2003/04/21 16:40:21  law
// - new prop: _IvcmParams.Container.
//
// Revision 1.11  2003/04/09 08:57:33  law
// - экспериментируем с ComboBox в Toolbar'е.
//
// Revision 1.10  2003/04/04 09:47:40  law
// - new: interface _IvcmHolder, class _TvcmHolder - в частности для того, чтобы из _OnGetTarget можно было просто возвращать не только интерфейс, но и объект.
//
// Revision 1.9  2003/04/03 15:43:53  law
// - change: из TvcmMainForm выделил класс TvcmDispatcher.
//
// Revision 1.8  2003/04/03 14:18:28  demon
// - bug fix
//
// Revision 1.7  2003/04/03 13:50:53  law
// - доделана подписка на события.
//
// Revision 1.6  2003/04/03 13:03:32  law
// - new method: IvcmParam.CheckAggregate.
//
// Revision 1.5  2003/04/03 12:54:48  law
// - change: в _IvcmParams.Aggregate теперь можно писать.
//
// Revision 1.4  2003/04/02 13:35:52  law
// - new prop: ImvcParam.Aggregate.
//
// Revision 1.3  2003/04/02 11:41:42  law
// - new method: _TvcmModule._MakeAggregate.
// - new proc: vcmTestParams.
//
// Revision 1.2  2003/04/01 16:10:44  law
// - new behavior: сделана регистрация сущностей от форм в списке у главной формы.
//
// Revision 1.1  2003/04/01 12:54:40  law
// - переименовываем MVC в VCM.
//
// Revision 1.17  2003/03/26 12:13:40  law
// - cleanup.
//
// Revision 1.16  2003/03/24 16:26:03  law
// - cleanup.
//
// Revision 1.15  2003/03/24 15:13:41  law
// - change: продолжаем заковыривать все относящееся к операции в _IvcmParams.
//
// Revision 1.14  2003/03/24 14:52:11  law
// - change: продолжаем заковыривать все относящееся к операции в _IvcmParams.
//
// Revision 1.13  2003/03/24 14:04:04  law
// - change: продолжаем заковыривать все относящееся к операции в _IvcmParams.
//
// Revision 1.12  2003/03/24 13:25:46  law
// - change: продолжаем заковыривать все относящееся к операции в _IvcmParams.
//
// Revision 1.11  2003/03/21 18:30:47  law
// - change: делаем шаги к заковыриванию всего относящегося к операции в _IvcmParams.
//
// Revision 1.10  2003/03/21 18:03:19  law
// - new type: _TvcmOperationParams.
//
// Revision 1.9  2003/03/21 13:40:37  law
// - new class: TvcmParams - реализует _IvcmParams.
// - new method: _vcmParams - создает _IvcmParams.
//
// Revision 1.8  2003/03/17 13:16:53  law
// - new behavior: в пример добавил регистрацию формы enDocument.
//
// Revision 1.7  2003/03/14 18:24:07  law
// - наконец-то родил пример под BCB.
//
// Revision 1.6  2003/03/14 12:44:13  law
// - change: отвязываем vcm от l3.
//
// Revision 1.5  2003/03/14 12:20:52  law
// - change: отвязываем vcm от l3.
//
// Revision 1.4  2003/03/14 09:22:35  law
// - change: отвязываем vcm от l3.
//
// Revision 1.3  2003/02/25 11:08:05  law
// - change: добавлено определение операций модуля.
//
// Revision 1.2  2003/02/24 15:58:09  law
// no message
//
// Revision 1.1  2003/02/24 12:01:13  law
// - new units: vcmBase, vcmBaseModuleDef, vcmModule.
//

{$Include vcmDefine.inc }

interface

{$IfNDef NoVCM}
//{$If Defined(IsVCMProject) OR Defined(DesignTimeLibrary)}

uses
  {$IfDef DesignTimeLibrary}
  ToolsAPI,
  {$EndIf DesignTimeLibrary}
  
  Classes,
  Controls, // for TModalResult only

  l3Interfaces,
  l3Base,
  l3InterfaceList,
  l3InterfacedInterfaceList,
  l3CObjectRefList,
  l3CObjectList,
  l3CClassList,
  l3LongintList,
  l3InterfacePtrList,
  l3CacheableBase,
  l3ProtoObject,
  l3ProtoObjectWithCOMQI,
  l3CProtoObject,

  {$IfNDef DesignTimeLibrary}
  afwApplication,
  afwInterfaces,
  // - это нужно, чтобы подключить Application Framework
  {$EndIf  DesignTimeLibrary}

  vcmInterfaces,
  vcmExternalInterfaces,
  vcmToolbarsInterfaces,

  vcmLocalInterfaces,
  l3StringIDEx,
  vcmStringIDExHelper
  ;

type
  TvcmExecuteEvent = procedure(const aParams: IvcmExecuteParams) of object;

  TvcmWString = class(Tl3String, Il3CString)
    public
    // public methods
      constructor Make(const aStr: AnsiString);
        overload;
        {-}
      class function MakeI(const aStr: AnsiString): Il3CString;
        overload;
        {-}
      class function MakeI(const aStr: Tl3WString): Il3CString;
        overload;
        {-}
  end;//TvcmWString

  TvcmBase = class(Tl3ProtoObjectWithCOMQI)
   {* Базовый некешируемый класс библиотеки vcm. }
  end;//TvcmBase

  TvcmCacheableBase = class(Tl3ProtoObjectWithCOMQI)
    public
    // internal methods
      class function IsCacheable: Boolean;
        override;
        {-}
  end;//TvcmCacheableBase

  TvcmLongintList = class(Tl3LongintList)
   {* Список. }
    public
    // internal methods
      class function IsCacheable: Boolean;
        override;
        {-}
  end;//TvcmLongintList

  TvcmObjectList = class(Tl3CObjectList)
   {* Список. }
  end;//TvcmObjectList

  TvcmClassList = class(Tl3CClassList)
   {* Список. }
  end;//TvcmClassList

  TvcmInterfacePtrList = Tl3InterfacePtrList;
  
  TvcmParams = class(TvcmCacheableBase,
                     IvcmParams)
    private
    // internal fields
      f_Control       : TComponent;
      f_Target        : IUnknown;
      f_Container     : IvcmContainer;
      f_Done          : TvcmDoneStatus;
      f_OperationType : TvcmOperationType;
    protected
    // interface methods
      function  Get_Control: TComponent;
      procedure Set_Control(aValue: TComponent);

      function  Get_Target: IUnknown;
      procedure Set_Target(const aValue: IUnknown);

      function  Get_Container: IvcmContainer;

      function Get_HasContainer: Boolean;
        
      function  pm_GetTestPart: IvcmTestParams;
        virtual;
        {-}
      function  pm_GetExecutePart: IvcmExecuteParams;
        virtual;
        {-}
      procedure SetContainerPrim(const aContainer: IvcmContainer; aNeedReplace : Boolean);
        virtual;
        abstract;
        {-}
      function  CallControl: Boolean;
        virtual;
        {-}
      function  Get_Done: Boolean;

      function  Get_DoneStatus: TvcmDoneStatus;
      procedure Set_DoneStatus(aValue: TvcmDoneStatus);

      function  pm_GetOperationType : TvcmOperationType;
      procedure pm_SetOperationType(aValue : TvcmOperationType);
        {-}
    protected
    // internal methods
      procedure Cleanup;
        override;
        { Summary
          Очищает список параметров }
    public
    // public methods
      constructor Create(const aContainer : IvcmContainer);
        reintroduce;
        {-}
  end;//TvcmParams

  TvcmTestParams = class(TvcmParams,
                         IvcmOpParams,
                         IvcmTestParamsPrim,
                         IvcmTestParams)
    private
    // internal fields
      f_ControlEvent   : TvcmControlTestEvent;
      f_SubItems       : IvcmItems;
      f_SubNodes       : IvcmNodes;
      f_Font           : IvcmFont;
      f_ImageIndex     : Integer;
      f_ShortCut       : Integer;
      f_Caption        : IvcmCString;
      f_Hint           : IvcmCString;
      f_LongHint       : IvcmCString;
      f_Flags          : array [TvcmOpFlag] of Boolean;
      f_SelectedString : IvcmCString;
    protected
    // internal methods
      function Get_SelectedString: IvcmCString;
      procedure Set_SelectedString(const aValue: IvcmCString);
        {-}
      function  BasePart: IvcmParams;
        {-}
      function  Get_Op: IvcmOpParams;
        {-}
      function  Get_SubItems: IvcmItems;
      procedure Set_SubItems(const aValue: IvcmItems);
        {-}
      function  HasSubItems: Boolean;
        {-}
      function  Get_SubNodes: IvcmNodes;
      procedure Set_SubNodes(const aValue: IvcmNodes);
        {-}
      function  HasSubNodes: Boolean;
        {-}
      function  Get_Font: IvcmFont;
      procedure Set_Font(const aValue: IvcmFont);
        {-}
      function  HasFont: Boolean;
        {-}
      function  Get_ImageIndex: Integer;
      procedure Set_ImageIndex(aValue: Integer);
        {-}
      function  Get_ShortCut: Integer;
      procedure Set_ShortCut(aValue: Integer);
        {-}
      function  Get_Caption: IvcmCString;
      procedure Set_Caption(const aValue: IvcmCString);
        {-}
      function  Get_Hint: IvcmCString;
      procedure Set_Hint(const aValue: IvcmCString);
        {-}
      function  Get_LongHint: IvcmCString;
      procedure Set_LongHint(const aValue: IvcmCString);
        {-}
      function  Get_Flag(anIndex: TvcmOpFlag): Boolean;
      procedure Set_Flag(anIndex: TvcmOpFlag; aValue: Boolean);
        {-}
      function  pm_GetTestPart: IvcmTestParams;
        override;
        {-}
      procedure SetContainerPrim(const aContainer: IvcmContainer; aNeedReplace : Boolean);
        override;
        {-}
      procedure SetControlEvent(anEvent: TvcmControlTestEvent);
        {-}
      function  CallControl: Boolean;
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      class function Make: IvcmTestParams;
        reintroduce;
        {* - создает список параметров. }
  end;//TvcmTestParams

  TvcmOldSchoolMakeParams = class(TvcmParams, IvcmExecuteParamsPrim)
    private
    // internal fields
      f_Data           : IUnknown;
      f_ItemIndex      : Integer;
      f_CurrentNode    : IvcmNode;
      f_SelectedString : IvcmCString;
    protected
    // interface methods
      function pm_GetData : IUnknown;
        {-}
    protected
    // internal methods
      function  Get_ItemIndex: Integer;
      procedure Set_ItemIndex(aValue: Integer);
        {-}
      function  Get_CurrentNode: IvcmNode;
      procedure Set_CurrentNode(const aValue: IvcmNode);
        {-}
      function  Get_SelectedString: IvcmCString;
      procedure Set_SelectedString(const aValue: IvcmCString);
        {-}
      function  BasePart: IvcmParams;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const aContainer  : IvcmContainer);
        reintroduce;
        {-}
  end;//TvcmOldSchoolMakeParams

  TvcmExecuteParams = class(TvcmOldSchoolMakeParams, IvcmExecuteParams)
    private
    // internal fields
      f_ControlEvent  : TvcmControlEvent;
    protected
    // internal methods
      function  pm_GetExecutePart: IvcmExecuteParams;
        override;
        {-}
      procedure SetControlEvent(anEvent: TvcmControlEvent);
        {-}
      function  CallControl: Boolean;
        override;
        {-}
      procedure SetContainerPrim(const aContainer: IvcmContainer; aNeedReplace : Boolean);
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create;
        reintroduce;
        {-}
      constructor CreateForInternal(const aData : IUnknown);
        reintroduce;
        {-}
      class function Make: IvcmExecuteParams;
        reintroduce;
        {* - создает список параметров. }
      class function MakeForInternal(const aData : IUnknown): IvcmExecuteParams;
        reintroduce;
        {* - создает список параметров. }
  end;//TvcmExecuteParams

  {$IfNDef DesignTimeLibrary}
  TvcmAFW = class(TafwImplementation)
    public
    // public methods
      class procedure BeginOp;
        override;
        {* - начать операцию, внутри которой нельзя убивать контролы. }
      class procedure EndOp;
        override;
        {* - закончить операцию, внутри которой нельзя убивать контролы. }
      class function  IsObjectLocked(aControl : TObject = nil): Boolean;
        override;
        {-}
      class function  IsMenuLocked(const aControl : IafwMenuUnlockedPostBuild): Boolean;
        override;
        {-}
      class procedure ControlDestroying(const aControl : IafwMenuUnlockedPostBuild);
        override;
        {-}
  end;//TvcmAFW
  {$EndIf  DesignTimeLibrary}

  {$IfNDef DesignTimeLibrary}
  TvcmConstString = class(TvcmBase, Il3CString)
    private
    // internal fields
      f_ID: TvcmStringID;
    protected
    // internal methods
      function pm_GetAsWStr: Tl3WString;
        {-}
    public
    // public methods
      constructor Create(const anID: TvcmStringID);
        reintroduce;
        {-}
      class function MakeI(const anID: TvcmStringID): Il3CString;
        {-}
  end;//TvcmConstString
  {$EndIf  DesignTimeLibrary}

procedure vcmSet(var theStr: TvcmWString; const aStr: AnsiString);
  overload;
procedure vcmSet(var theStr: TvcmWString; const aStr: Tl3WString);
  overload;
procedure vcmSet(var theStr: TvcmWString; const aStr: Il3CString);
  overload;
  {-}
function  vcmSet(var F; V: TObject): Boolean;
  overload;
  {* - присваивает переменной F объект со счетчиком ссылок V. }
procedure vcmFree(var anObject);
  { Освобождает память, выделенную под объект. }  
function  vcmIEQ(const I1, I2: IUnknown): Boolean;
  {* - проверить эквивалентность интерфейсов. }
function  vcmParams: IvcmExecuteParams;
function  vcmMakeParams(const anAggregate : IvcmAggregate = nil;
                    const aContainer  : IvcmContainer = nil;
                    const anOwner     : TComponent = nil): IvcmMakeParams;
  { Создает структуру с заданными параметрами. }

function  vcmSetAggregate(const anAggregate : IvcmAggregate;
                          const aParams     : IvcmMakeParams): IvcmMakeParams;
  { Замещает агрегацию в структуре параметров.
    
    Description
    
    
    Note
    Если переданная структура равна nil, создается новая. }
function  vcmCheckAggregate(const aParams: IvcmMakeParams): IvcmMakeParams;
  {-}

function vcmDispatcher: IvcmDispatcher;
{ Summary
  Возвращает диспетчер форм.

  Description
  _Add a description here...  }

  {* - возвращает диспетчер. }

var
  g_Dispatcher        : IvcmDispatcher = nil;
  g_ToolbarsCustomize : IvcmToolbarsCustomize = nil;

{$IfDef DesignTimeLibrary}
function vcmGetTAModules: IOTAModuleServices;
  {-}
function vcmGetTAModule(const aName: AnsiString): IOTAModule;
  {-}
{$EndIf DesignTimeLibrary}
procedure vcmGetMem(var P; Size: Cardinal);
  {* - получить кусок локальной памяти размером Size. }
function  vcmAllocMem(Size: Cardinal): Pointer;
  {-}
procedure vcmFreeMem(var P);
  {* - освободить кусок локальной памяти. }
procedure vcmInitConstString(var anID: Tl3StringIDEx);
{$IfNDef DesignTimeLibrary}
function  vcmConstString(const anID: TvcmStringID): AnsiString;
  {* - возвращает строковую константу по идентификатору. }
{$EndIf  DesignTimeLibrary}  
function  vcmLen(const aStr: IvcmCString): Integer;
  {-}
procedure vcmSetLen(var aStr: IvcmCString; aLen: Integer);
  {-}
function  vcmCStr(const anID: TvcmStringID): Il3CString;
  overload;
function  vcmCStr(const anID: AnsiString): Il3CString;
  overload;
function  vcmCStr(const anID: Tl3DString): Il3CString;
  overload;
function  vcmCStr(const anID: Tl3WString): Il3CString;
  overload;
  {* - возвращает строковую константу по идентификатору. }
function  vcmWStr(const aString: AnsiString): Tl3WString;
  overload;
function  vcmWStr(const aString: Tl3DString): Tl3WString;
  overload;
function  vcmWStr(const aString: Il3CString): Tl3WString;
  overload;
  {-}
function  vcmStr(const aString: Il3CString): AnsiString;
  overload;
function  vcmStr(const aString: Tl3WString): AnsiString;
  overload;
  {-}
function  vcmDStr(const aString: Il3CString): Tl3DString;
  {-}
function  vcmIsNil(const aString: Il3CString): Boolean;
  {-}
function  vcmCat(const aS1: IvcmCString; const aS2: AnsiString): IvcmCString;
  overload;
function  vcmCat(const aS1: IvcmCString; const aS2: IvcmCString): IvcmCString;
  overload;
  {-}
function  vcmFmt(const anID: TvcmStringID; const aParams: array of const): IvcmCString;
  overload;
function  vcmFmt(const anID: AnsiString; const aParams: array of const): IvcmCString;
  overload;
function  vcmFmt(const anID: IvcmCString; const aParams: array of const): IvcmCString;
  overload;
  {-}
function  vcmSame(const S1    : AnsiString;
                  const S2    : IvcmCString;
                  aIgnoreCase : Boolean = false): Boolean;
  overload;
  {-}
function  vcmSame(const S1    : IvcmCString;
                  const S2    : AnsiString;
                  aIgnoreCase : Boolean = false): Boolean;
  overload;
  {-}
function  vcmSame(const S1    : IvcmCString;
                  const S2    : Tl3DString;
                  aIgnoreCase : Boolean = false): Boolean;
  overload;
  {-}
function  vcmSame(const S1    : IvcmCString;
                  const S2    : IvcmCString;
                  aIgnoreCase : Boolean = false): Boolean;
  overload;
  {-}
function  vcmCopy(const aStr: IvcmCString; anIndex: Integer; aCount: Integer): IvcmCString;
  {-}
function vcmReplaceEnters(const aString   : IvcmCString): IvcmCString;
  {-}
function  vcmEnterFactory: Boolean;
  {-}
procedure vcmLeaveFactory;
  {-}

//{$IfEnd}
{$EndIf  NoVCM}

implementation

{$IfNDef NoVCM}
//{$If Defined(IsVCMProject) OR Defined(DesignTimeLibrary)}

uses
  RTLConsts,
  SysUtils

  ,
  l3InterfacesMisc,
  l3String,
  l3Chars

  ,
  afwFacade,
  afwFont,
  
  vcmAggregate,
  vcmBaseMenuManager,
  {$IfDef vcmStandAloneDispatcher}
  vcmMainForm, // - вообще-то надо бы диспетчер оттудова выковырять
  {$EndIf vcmStandAloneDispatcher}

  vcmStringList,
  vcmItems
  ,
  vcmNodes
  ,
  vcmCommandIDsListPrim,
  vcmCommandIDsList,
  vcmMakeParams
  ;

procedure vcmSet(var theStr: TvcmWString; const aStr: AnsiString);
  //overload;
  {-}
begin
 if (theStr = nil) then
  theStr := TvcmWString.Make(aStr)
 else
  theStr.AsString := aStr;
end;

procedure vcmSet(var theStr: TvcmWString; const aStr: Tl3WString);
  //overload;
  {-}
begin
 if (theStr = nil) then
  theStr := TvcmWString.Make(aStr)
 else
  theStr.AsWStr := aStr;
end;

procedure vcmSet(var theStr: TvcmWString; const aStr: Il3CString);
  overload;
  {-}
begin
 if (aStr = nil) then
  vcmFree(theStr)
 else
 if (theStr = nil) then
  theStr := TvcmWString.Make(aStr.AsWStr)
 else
  theStr.AsWStr := aStr.AsWStr;
end;

function  vcmSet(var F; V: TObject): Boolean;
  {* - присваивает переменной F объект со счетчиком ссылок V. }
begin
 Result := l3Set(F, V);
end;

procedure vcmFree(var anObject);
  {* - освобождает объект библиотеки vcm. }
begin
 FreeAndNil(anObject);
end;

function  vcmIEQ(const I1, I2: IUnknown): Boolean;
  {* - проверить эквивалентность интерфейсов. }
begin
 Result := l3IEQ(I1, I2);
end;

// start class TvcmWString

class function TvcmWString.MakeI(const aStr: AnsiString): Il3CString;
  //overload;
  {-}
var
 l_S : TvcmWString;
begin
 l_S := Make(aStr);
 try
  Result := l_S;
 finally
  vcmFree(l_S);
 end;//try..finally
end;

class function TvcmWString.MakeI(const aStr: Tl3WString): Il3CString;
  //overload;
  {-}
var
 l_S : TvcmWString;
begin
 l_S := Make(aStr);
 try
  Result := l_S;
 finally
  vcmFree(l_S);
 end;//try..finally
end;

constructor TvcmWString.Make(const aStr: AnsiString);
  //overload;
  {-}
begin
 inherited Make(l3PCharLen(aStr));
end;

// start class TvcmLongintList

class function TvcmLongintList.IsCacheable: Boolean;
  //override;
  {-}
begin
 Result := True;
end;

class function TvcmCacheableBase.IsCacheable: Boolean;
  //override;
  {-}
begin
 Result := True;
end;

// start class TvcmParams

constructor TvcmParams.Create(const aContainer : IvcmContainer);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_Container  := aContainer;
 f_Done := vcm_dsDone;
end;

procedure TvcmParams.Cleanup;
  //override;
  {-}
begin
 f_Container := nil;
 f_Target := nil;
 f_Control := nil;
 inherited;
end;

function TvcmParams.Get_Control: TComponent;
  {-}
begin
 Result := f_Control;
end;

procedure TvcmParams.Set_Control(aValue: TComponent);
  {-}
begin
 f_Control := aValue;
end;

function TvcmParams.Get_Target: IUnknown;
  {-}
begin
 Result := f_Target;
end;

procedure TvcmParams.Set_Target(const aValue: IUnknown);
  {-}
begin
 f_Target := aValue;
end;

function TvcmParams.Get_Container: IvcmContainer;
  {-}
begin
 Result := f_Container;
end;

function TvcmParams.Get_HasContainer: Boolean;
begin
 Result := (f_Container <> nil);
end;

function TvcmParams.pm_GetTestPart: IvcmTestParams;
  {-}
begin
 Result := nil;
end;

function TvcmParams.pm_GetExecutePart: IvcmExecuteParams;
  {-}
begin
 Result := nil;
end;

function TvcmParams.CallControl: Boolean;
  //virtual;
  {-}
begin
 Result := false;
end;

function TvcmParams.Get_Done: Boolean;
  {-}
begin
 Result := (f_Done = vcm_dsDone);
end;

function TvcmParams.Get_DoneStatus: TvcmDoneStatus;
  {-}
begin
 Result := f_Done;
end;

procedure TvcmParams.Set_DoneStatus(aValue: TvcmDoneStatus);
  {-}
begin
 f_Done := aValue;
end;

function TvcmParams.pm_GetOperationType : TvcmOperationType;
begin
 Result := f_OperationType;
end;

procedure TvcmParams.pm_SetOperationType(aValue : TvcmOperationType);
begin
 f_OperationType := aValue;
end;

function vcmSetAggregate(const anAggregate : IvcmAggregate;
                         const aParams     : IvcmMakeParams): IvcmMakeParams;
  {-}
begin
 if (aParams = nil) then
 begin
  Assert(false);
  Result := vcmBase.vcmMakeParams(anAggregate, nil, nil)
 end
 else
 if vcmIEQ(aParams.Aggregate, anAggregate) then
  Result := aParams
 else
  Result := vcmBase.vcmMakeParams(anAggregate, aParams.Container, aParams.Owner);
end;

function vcmCheckAggregate(const aParams: IvcmMakeParams): IvcmMakeParams;
  {-}
begin
 if (aParams = nil) then
  Result := vcmBase.vcmMakeParams(TvcmAggregate.Make, nil, nil)
 else
 if (aParams.Aggregate <> nil) then
  Result := aParams
 else
  Result := vcmBase.vcmMakeParams(TvcmAggregate.Make, aParams.Container, aParams.Owner);
end;

function  vcmParams: IvcmExecuteParams;
begin
 Result := TvcmExecuteParams.Make;
end;

function vcmMakeParams(const anAggregate : IvcmAggregate = nil;
                   const aContainer  : IvcmContainer = nil;
                   const anOwner     : TComponent = nil): IvcmMakeParams;
  {-}
begin
 Result := TvcmMakeParams.Make(anAggregate, aContainer, anOwner);
end;

{$IfDef vcmStandAloneDispatcher}
procedure FreeDisp;
begin
 g_Dispatcher := nil;
end;
{$EndIf vcmStandAloneDispatcher}

function vcmDispatcher: IvcmDispatcher;
  {* - возвращает диспетчер. }
begin
 {$IfDef vcmStandAloneDispatcher}
 if (g_Dispatcher = nil) then
 begin
  l3System.AddExitProc(FreeDisp);
  g_Dispatcher := TvcmDispatcher.Make;
 end;//g_Dispatcher = nil
 {$EndIf vcmStandAloneDispatcher}
 Result := g_Dispatcher;
end;

{$IfDef DesignTimeLibrary}
function vcmGetTAModules: IOTAModuleServices;
  {-}
begin
 Supports(BorlandIDEServices, IOTAModuleServices, Result);
end;

function vcmGetTAModule(const aName: AnsiString): IOTAModule;
  {-}
var
 l_MS     : IOTAModuleServices;
 l_M      : IOTAModule;
 l_MIndex : Integer;
begin
 Result := nil;
 l_MS := vcmGetTAModules;
 if (l_MS <> nil) then
  try
   for l_MIndex := 0 to Pred(l_MS.ModuleCount) do
   begin
    l_M := l_MS.Modules[l_MIndex];
    if (l_M <> nil) then
    begin
     if ANSISameText(ChangeFileExt(ExtractFileName(l_M.FileName), ''), aName) then
     begin
      Result := l_M;
      break;
     end;//ANSISameText..
    end;//l_M <> nil
   end;//for l_MIndex
  finally
   l_MS := nil;
  end;//try..finally
end;
{$EndIf DesignTimeLibrary}

procedure vcmGetMem(var P; Size: Cardinal);
  {* - получить кусок локальной памяти размером Size. }
begin
 l3System.GetLocalMem(P, Size);
end;

function vcmAllocMem(Size: Cardinal): Pointer;
  {-}
begin
 vcmGetMem(Result, Size);
 l3FillChar(Result^, Size);
end;

procedure vcmFreeMem(var P);
  {* - освободить кусок локальной памяти. }
begin
 l3System.FreeLocalMem(P);
end;

procedure vcmInitConstString(var anID: Tl3StringIDEx);
begin
 _DoInitConstString(anID);
end;

{$IfNDef DesignTimeLibrary}
function vcmConstString(const anID: TvcmStringID): AnsiString;
  {* - возвращает строковую константу по идентификатору. }
begin
 if (g_MenuManager = nil) then
  Result := Format('<< sys message: %d>>', [anID.rS])
 else
  Result := g_MenuManager.Strings.Items[anID.rS].Caption;
end;
{$EndIf  DesignTimeLibrary}

function vcmCStr(const anID: TvcmStringID): Il3CString;
  {* - возвращает строковую константу по идентификатору. }
begin
 {$IfDef DesignTimeLibrary}
 Assert(anID.rS <> -1);
 Result := l3CStr(PString(anID.rS)^);
 {$Else  DesignTimeLibrary}
 if (g_MenuManager = nil) then
  Result := TvcmWString.MakeI(Format('<< sys message: %d>>', [anID.rS]))
 else
  Result := TvcmConstString.MakeI(anID);
 {$EndIf DesignTimeLibrary}
end;

function vcmLen(const aStr: IvcmCString): Integer;
  {-}
begin
 Result := l3Len(aStr);
end;

procedure vcmSetLen(var aStr: IvcmCString; aLen: Integer);
  {-}
begin
 l3SetLen(aStr, aLen);
end;

function vcmCStr(const anID: AnsiString): Il3CString;
  //overload;
begin
 Result := l3CStr(anID);
end;

function vcmCStr(const anID: Tl3DString): Il3CString;
  //overload;
begin
 Result := l3CStr(anID);
end;

function vcmCStr(const anID: Tl3WString): Il3CString;
  //overload;
begin
 Result := l3CStr(anID);
end;

function vcmWStr(const aString: AnsiString): Tl3WString;
  {-}
begin
 Result := l3PCharLen(aString);
end;

function vcmWStr(const aString: Tl3DString): Tl3WString;
  //overload;
begin
 Result := l3PCharLen(aString);
end;

function vcmWStr(const aString: Il3CString): Tl3WString;
  //overload;
begin
 Result := l3PCharLen(aString);
end;

function vcmDStr(const aString: Il3CString): Tl3DString;
  {-}
begin
 Result := l3DStr(aString);
end;

function vcmStr(const aString: Il3CString): AnsiString;
  //overload;
begin
 Result := l3Str(aString);
end;

function vcmStr(const aString: Tl3WString): AnsiString;
  {-}
begin
 Result := l3Str(aString);
end;

function vcmIsNil(const aString: Il3CString): Boolean;
  {-}
begin
 Result := l3IsNil(aString);
end;

function vcmCat(const aS1: IvcmCString; const aS2: AnsiString): IvcmCString;
  {-}
begin
 Result := l3Cat(aS1, aS2);
end;

function vcmCat(const aS1: IvcmCString; const aS2: IvcmCString): IvcmCString;
  //overload;
  {-}
begin
 Result := l3Cat([aS1, aS2]);
end;

function vcmFmt(const anID: TvcmStringID; const aParams: array of const): Il3CString;
  {-}
begin
 Result := vcmFmt(vcmCStr(anID), aParams);
end;

function  vcmFmt(const anID: AnsiString; const aParams: array of const): IvcmCString;
  //overload;
  {-}
begin
 Result := l3Fmt(anID, aParams);
end;

function vcmFmt(const anID: IvcmCString; const aParams: array of const): IvcmCString;
  //overload;
  {-}
begin
 Result := l3Fmt(anID, aParams);
end;

function vcmSame(const S1    : AnsiString;
                 const S2    : IvcmCString;
                 aIgnoreCase : Boolean = false): Boolean;
  //overload;
  {-}
begin
 Result := l3Same(S1, S2, aIgnoreCase);
end;

function  vcmSame(const S1    : IvcmCString;
                  const S2    : AnsiString;
                  aIgnoreCase : Boolean = false): Boolean;
  //overload;
  {-}
begin
 Result := l3Same(S1, S2, aIgnoreCase);
end;

function  vcmSame(const S1    : IvcmCString;
                  const S2    : Tl3DString;
                  aIgnoreCase : Boolean = false): Boolean;
  //overload;
  {-}
begin
 Result := l3Same(S1, S2, aIgnoreCase);
end;

function vcmSame(const S1    : IvcmCString;
                 const S2    : IvcmCString;
                 aIgnoreCase : Boolean = false): Boolean;
  {-}
begin
 Result := l3Same(S1, S2, aIgnoreCase);
end;

function  vcmCopy(const aStr: IvcmCString; anIndex: Integer; aCount: Integer): IvcmCString;
  {-}
begin
 Result := l3Copy(aStr, anIndex, aCount);
end;

function vcmReplaceEnters(const aString   : IvcmCString): IvcmCString;
  {-}
begin
 Result := aString;
 l3Replace(Result, [cc_SoftEnter, cc_HardEnter], cc_HardSpace);
 Result := l3DeleteDoubleSpace(Result);
end;

function vcmEnterFactory: Boolean;
  {-}
var
 l_D : IvcmDispatcher;
begin
 l_D := vcmDispatcher;
 Result := (l_D <> nil);
 if Result then
 begin
  l_D.BeginOp;
  try
   g_MenuManager.BeginOp;
  except
   l_D.EndOp;
   raise;
  end;//try..except
 end;//Result
end;

procedure vcmLeaveFactory;
  {-}
begin
 try
  g_MenuManager.EndOp;
 finally
  vcmDispatcher.EndOp;
 end;//try..finally
end;
  
{$IfNDef DesignTimeLibrary}
class procedure TvcmAFW.BeginOp;
  //override;
  {* - начать операцию, внутри которой нельзя убивать контролы. }
begin
 inherited;
 if (g_Dispatcher <> nil) then
  g_Dispatcher.BeginOp;
end;

class procedure TvcmAFW.EndOp;
  //override;
  {* - закончить операцию, внутри которой нельзя убивать контролы. }
begin
 if (g_Dispatcher <> nil) then
  g_Dispatcher.EndOp;
 inherited;
end;

class function TvcmAFW.IsObjectLocked(aControl : TObject = nil): Boolean;
  //override;
  {-}
begin
 Result := ((g_Dispatcher <> nil) AND g_Dispatcher.FormDispatcher.Locked){ OR
           ((g_MenuManager <> nil) AND g_MenuManager.UnlockInProgress)};
 if Result and (aControl <> nil) then
  g_Dispatcher.FormDispatcher.AddControlForInvalidate(aControl);
end;

class function TvcmAFW.IsMenuLocked(const aControl : IafwMenuUnlockedPostBuild): Boolean;
begin
 Result := (g_MenuManager <> nil) AND (g_MenuManager.GetOpLock or g_MenuManager.UnlockInProgress);
 if Result and (aControl <> nil) then
  g_MenuManager.AddControlForUnlockPostBuild(aControl);
end;

class procedure TvcmAFW.ControlDestroying(const aControl : IafwMenuUnlockedPostBuild);
begin
 if Assigned(g_MenuManager) then
  g_MenuManager.ListenerControlDestroying(aControl);
end;
{$EndIf  DesignTimeLibrary}

// start class TvcmTestParams

class function TvcmTestParams.Make: IvcmTestParams;
  //reintroduce;
  {* - создает список параметров. }
var
 l_Params : TvcmTestParams;
begin
 l_Params := Create(nil);
 try
  Result := l_Params;
 finally
  vcmFree(l_Params);
 end;//try..finally
end;

procedure TvcmTestParams.Cleanup;
  //override;
  {-}
begin
 f_SelectedString := nil;
 f_Caption := nil;
 f_Hint := nil;
 f_LongHint := nil;
 f_SubItems := nil;
 f_SubNodes := nil;
 f_Font := nil;
 f_ControlEvent := nil;
 inherited;
end;

function TvcmTestParams.BasePart: IvcmParams;
  {-}
begin
 Result := Self;
end;

function TvcmTestParams.Get_SelectedString: IvcmCString;
  {-}
begin
 Result := f_SelectedString;
end;

procedure TvcmTestParams.Set_SelectedString(const aValue: IvcmCString);
  {-}
begin
 f_SelectedString := aValue;
end;

function TvcmTestParams.Get_Op: IvcmOpParams;
  {-}
begin
 Result := Self;
end;

function TvcmTestParams.Get_SubItems: IvcmItems;
  {-}
begin
 if (f_SubItems = nil) then
  f_SubItems := TvcmItems.Make;
 Result := f_SubItems;
end;

procedure TvcmTestParams.Set_SubItems(const aValue: IvcmItems);
  {-}
begin
 f_SubItems := aValue;
end;

function TvcmTestParams.HasSubItems: Boolean;
  {-}
begin
 Result := (f_SubItems <> nil);
end;

function TvcmTestParams.Get_SubNodes: IvcmNodes;
  {-}
begin
 if (f_SubNodes = nil) then
  f_SubNodes := TvcmNodes.MakeI;
 Result := f_SubNodes;
end;

procedure TvcmTestParams.Set_SubNodes(const aValue: IvcmNodes);
  {-}
begin
 f_SubNodes := aValue;
end;

function TvcmTestParams.HasSubNodes: Boolean;
  {-}
begin
 Result := (f_SubNodes <> nil);
end;

function TvcmTestParams.Get_Font: IvcmFont;
  {-}
begin
 if (f_Font = nil) then
  f_Font := TafwFont.Make;
 Result := f_Font;
end;

procedure TvcmTestParams.Set_Font(const aValue: IvcmFont);
  {-}
begin
 f_Font := aValue;
end;

function TvcmTestParams.HasFont: Boolean;
  {-}
begin
 Result := (f_Font <> nil);
end;

function TvcmTestParams.Get_ImageIndex: Integer;
  {-}
begin
 Result := f_ImageIndex;
end;

procedure TvcmTestParams.Set_ImageIndex(aValue: Integer);
  {-}
begin
 f_ImageIndex := aValue;
end;

function TvcmTestParams.Get_ShortCut: Integer;
  {-}
begin
 Result := f_ShortCut;
end;

procedure TvcmTestParams.Set_ShortCut(aValue: Integer);
  {-}
begin
 f_ShortCut := aValue;
end;

function TvcmTestParams.Get_Caption: IvcmCString;
  {-}
begin
 Result := f_Caption;
end;

procedure TvcmTestParams.Set_Caption(const aValue: IvcmCString);
  {-}
begin
 f_Caption := aValue;
end;

function TvcmTestParams.Get_Hint: IvcmCString;
  {-}
begin
 Result := f_Hint;
end;

procedure TvcmTestParams.Set_Hint(const aValue: IvcmCString);
  {-}
begin
 f_Hint := aValue;
end;

function TvcmTestParams.Get_LongHint: IvcmCString;
  {-}
begin
 Result := f_LongHint;
end;

procedure TvcmTestParams.Set_LongHint(const aValue: IvcmCString);
  {-}
begin
 f_LongHint := aValue;
end;

function TvcmTestParams.Get_Flag(anIndex: TvcmOpFlag): Boolean;
  {-}
begin
 Result := f_Flags[anIndex];
end;

procedure TvcmTestParams.Set_Flag(anIndex: TvcmOpFlag; aValue: Boolean);
  {-}
begin
 f_Flags[anIndex] := aValue;
end;

function TvcmTestParams.pm_GetTestPart: IvcmTestParams;
  //override;
  {-}
begin
 Result := Self;
end;

procedure TvcmTestParams.SetContainerPrim(const aContainer: IvcmContainer; aNeedReplace : Boolean);
  //override;
  {-}
begin
 if aNeedReplace OR (f_Container = nil) then
  f_Container := aContainer;
end;

function TvcmTestParams.CallControl: Boolean;
  {-}
begin
 if Assigned(f_ControlEvent) then
 begin
  f_ControlEvent(Self);
  Result := true;
 end//Assigned(f_ControlEvent)
 else
 begin
  Result := false;
  IvcmTestParams(Self).Op.Flag[vcm_ofEnabled] := false;
  // - контрола нету, а на него рассчитывали, значит операцию надо бы запретить
 end;//Assigned(f_ControlEvent)
end;

procedure TvcmTestParams.SetControlEvent(anEvent: TvcmControlTestEvent);
  {-}
begin
 f_ControlEvent := anEvent;
end;

// start class TvcmExecuteParams

constructor TvcmExecuteParams.Create;
  //reintroduce;
  {-}
begin
 inherited Create(nil);
 f_Done := vcm_dsDone;
end;

constructor TvcmExecuteParams.CreateForInternal(const aData : IUnknown);
  //reintroduce;
  //overload;
  {-}
begin
 Create;
 f_Data := aData;
 f_ItemIndex := -1;
 f_CurrentNode := nil;
end;

class function TvcmExecuteParams.Make: IvcmExecuteParams;
  //reintroduce;
  //overload;
  {* - создает список параметров. }
var
 l_Params : TvcmExecuteParams;
begin
 l_Params := Create;
 try
  Result := l_Params;
 finally
  vcmFree(l_Params);
 end;//try..finally
end;

class function TvcmExecuteParams.MakeForInternal(const aData : IUnknown): IvcmExecuteParams;
  //reintroduce;
  //overload;
  {* - создает список параметров. }
var
 l_Params : TvcmExecuteParams;
begin
 l_Params := CreateForInternal(aData);
 try
  Result := l_Params;
 finally
  vcmFree(l_Params);
 end;//try..finally
end;

procedure TvcmExecuteParams.Cleanup;
  //override;
  {-}
begin
 f_ControlEvent := nil;
 inherited;
end;

function TvcmExecuteParams.pm_GetExecutePart: IvcmExecuteParams;
  //override;
  {-}
begin
 Result := Self;
end;

procedure TvcmExecuteParams.SetControlEvent(anEvent: TvcmControlEvent);
  {-}
begin
 f_ControlEvent := anEvent;
end;

function TvcmExecuteParams.CallControl: Boolean;
  {-}
begin
 if Assigned(f_ControlEvent) then
 begin
  f_ControlEvent(Self);
  Result := true;
 end//Assigned(f_ControlEvent)
 else
  Result := false;
end;

procedure TvcmExecuteParams.SetContainerPrim(const aContainer: IvcmContainer; aNeedReplace: Boolean);
  //virtual;
  {-}
begin
 if aNeedReplace OR (f_Container = nil) then
  f_Container := aContainer;
end;

// start class TvcmOldSchoolMakeParams

constructor TvcmOldSchoolMakeParams.Create(const aContainer  : IvcmContainer);
  //reintroduce;
  {-}
begin
 inherited Create(aContainer);
 f_Container   := aContainer;
 f_ItemIndex   := 0;
 f_Done := vcm_dsDone;
end;

procedure TvcmOldSchoolMakeParams.Cleanup;
  //override;
  {-}
begin
 f_SelectedString := nil;
 f_CurrentNode := nil;
 f_Data := nil;
 inherited;
end;

function TvcmOldSchoolMakeParams.BasePart: IvcmParams;
  {-}
begin
 Result := Self;
end;

function TvcmOldSchoolMakeParams.pm_GetData : IUnknown;
  {-}
begin
 Result := f_Data;
end;

function TvcmOldSchoolMakeParams.Get_ItemIndex: Integer;
  {-}
begin
 Result := f_ItemIndex;
end;

procedure TvcmOldSchoolMakeParams.Set_ItemIndex(aValue: Integer);
  {-}
begin
 f_ItemIndex := aValue;
end;

function TvcmOldSchoolMakeParams.Get_CurrentNode: IvcmNode;
  {-}
begin
 Result := f_CurrentNode;
end;

procedure TvcmOldSchoolMakeParams.Set_CurrentNode(const aValue: IvcmNode);
  {-}
begin
 f_CurrentNode := aValue;
end;

function TvcmOldSchoolMakeParams.Get_SelectedString: IvcmCString;
  {-}
begin
 Result := f_SelectedString;
end;

procedure TvcmOldSchoolMakeParams.Set_SelectedString(const aValue: IvcmCString);
  {-}
begin
 f_SelectedString := aValue;
end;

{$IfNDef DesignTimeLibrary}
// start class TvcmConstString

constructor TvcmConstString.Create(const anID: TvcmStringID);
  {-}
begin
 inherited Create;
 f_ID := anID;
end;

class function TvcmConstString.MakeI(const anID: TvcmStringID): Il3CString;
  {-}
var
 l_S : TvcmConstString;
begin
 l_S := Create(anID);
 try
  Result := l_S;
 finally
  vcmFree(l_S);
 end;//try..finally
end;

function TvcmConstString.pm_GetAsWStr: Tl3WString;
  {-}
begin
 Result := vcmWStr(g_MenuManager.Strings.Items[f_ID.rS].Caption);
end;
{$EndIf  DesignTimeLibrary}

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\gui\Garant\VCM\implementation\vcmBase.pas initialization enter'); {$EndIf}

{$IfNDef DesignTimeLibrary}
 afw := TvcmAFW;
{$EndIf  DesignTimeLibrary}

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\gui\Garant\VCM\implementation\vcmBase.pas initialization leave'); {$EndIf}
finalization
 g_ToolbarsCustomize := nil;
 {$IfNDef vcmStandAloneDispatcher}
 g_Dispatcher := nil;
 {$EndIf  vcmStandAloneDispatcher}

//{$IfEnd}
{$EndIf NoVCM}

end.

