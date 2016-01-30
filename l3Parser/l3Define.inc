{$IfNDef l3Define}
{$Define l3Define}
{ Библиотека "Эверест"    }
{ Автор: Люлин А.В. ©     }
{ Модуль: l3Define -      }
{ Начат: 12.04.1998 11:28 }
{ $Id: l3Define.inc,v 1.155 2015/09/23 15:46:19 lulin Exp $ }

// $Log: l3Define.inc,v $
// Revision 1.155  2015/09/23 15:46:19  lulin
// - оптимизируем.
//
// Revision 1.154  2015/08/07 12:15:55  lulin
// - делаем консольную запускалку.
//
// Revision 1.153  2015/08/07 11:53:38  lulin
// - делаем консольную запускалку.
//
// Revision 1.152  2015/08/07 11:43:07  lulin
// - делаем консольную запускалку.
//
// Revision 1.151  2015/08/07 11:25:50  lulin
// - делаем консольную запускалку.
//
// Revision 1.150  2015/06/03 12:29:28  lulin
// - пытаемся разрулить зависимости.
//
// Revision 1.149  2015/06/02 17:05:54  lulin
// - рисуем на модели.
//
// Revision 1.148  2015/06/02 16:54:35  lulin
// - рисуем на модели.
//
// Revision 1.147  2015/06/02 12:33:54  lulin
// - bug fix: не собирались утилиты.
//
// Revision 1.146  2015/05/28 09:56:13  lulin
// - чистим код.
//
// Revision 1.145  2015/04/13 10:22:35  lulin
// - перегенерация.
//
// Revision 1.144  2015/02/26 13:35:27  lulin
// - правильнее определяем, что у нас оболочка F1.
//
// Revision 1.143  2014/12/11 09:55:24  morozov
// {RequestLink: 580710291}
//
// Revision 1.142  2014/11/27 13:16:15  morozov
// {RequestLink: 578891817} - убрал l3UseSSE для D+ чтоб не смазывать картину лишними exception'ами
//
// Revision 1.141  2014/11/06 11:53:37  lulin
// - перетряхиваем код.
//
// Revision 1.140  2014/11/05 16:59:29  lulin
// - перетряхиваем код.
//
// Revision 1.139  2014/09/22 14:34:44  lulin
// - аккуратнее работаем с логом.
//
// Revision 1.138  2014/04/08 14:17:07  lulin
// - переходим от интерфейсов к объектам.
//
// Revision 1.137  2013/12/25 15:10:36  lulin
// {RequestLink:509706011}
// - перетрясаем модель.
//
// Revision 1.136  2013/07/10 16:34:22  lulin
// - включаем коробочные битовые массивы для XE.
//
// Revision 1.135  2013/07/01 07:18:02  lulin
// - пытаемся включить кеш объектов (пока неудачно).
//
// Revision 1.134  2013/07/01 06:12:21  lulin
// - чистка кода.
//
// Revision 1.133  2013/05/29 16:13:25  lulin
// - портируем под XE4.
//
// Revision 1.132  2013/05/24 15:59:50  lulin
// - пытаемся портироваться под XE4.
//
// Revision 1.131  2013/04/09 17:40:34  lulin
// - пытаемся отладиться под XE.
//
// Revision 1.130  2013/04/08 18:10:29  lulin
// - пытаемся отладиться под XE.
//
// Revision 1.129  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.128  2013/04/04 11:22:01  lulin
// - портируем.
//
// Revision 1.127  2013/04/03 15:03:20  lulin
// - портируем.
//
// Revision 1.126  2013/02/26 08:57:32  dinishev
// {Requestlink:431386215}. Не запускались.
//
// Revision 1.125  2012/11/02 07:55:21  lulin
// - оказывается, что это было не лишнее.
//
// Revision 1.124  2012/11/02 07:48:08  lulin
// - не цепляем лишние файлы.
//
// Revision 1.123  2012/10/29 13:29:04  lulin
// - вычищаем поддержку ветки редактора.
//
// Revision 1.122  2012/10/26 19:12:54  lulin
// - вычищаем поддержку ветки редактора.
//
// Revision 1.121  2012/06/05 13:10:49  voba
// no message
//
// Revision 1.120  2012/02/24 12:15:22  dinishev
// Bug fix: не запускался тестовый Архивариус.
//                                              
// Revision 1.119  2012/02/24 07:40:21  lulin
// - кешируем парсер.
//
// Revision 1.118  2011/09/19 10:49:58  lulin
// - делаем Filer'ам возможность быть не компонентами и кешируемыми.
//
// Revision 1.117  2011/09/19 10:12:47  lulin
// - делаем Filer'ам возможность быть не компонентами и кешируемыми.
//
// Revision 1.116  2011/09/19 09:35:07  lulin
// - делаем возможность выключить.
//
// Revision 1.115  2011/05/06 14:28:16  lulin
// - правим IfDef'ы.
//
// Revision 1.114  2011/01/21 15:35:39  dinishev
// [$185830965]
//
// Revision 1.113  2010/12/10 12:31:30  lulin
// - bug fix: не собирались с директивой _nsTool.
//
// Revision 1.112  2010/10/01 09:38:56  lulin
// {RequestLink:235062187}.
// - включаем проверки.
//
// Revision 1.111  2010/01/22 17:39:43  lulin
// - делаем тест для "бубны".
//
// Revision 1.110  2009/12/23 16:13:08  lulin
// - делаем тест загрузкии скроллирования ГК.
//
// Revision 1.109  2009/12/14 14:24:04  lulin
// - чистка кода.
//
// Revision 1.108  2009/07/23 08:15:07  lulin
// - вычищаем ненужное использование процессора операций.
//
// Revision 1.107  2009/02/25 12:04:16  lulin
// - <K>: 90441983. Чистка кода для переноса на модель.
//
// Revision 1.106  2008/08/26 09:34:45  lulin
// - чистка кода.
//
// Revision 1.105  2008/08/11 13:28:30  lulin
// - <K>: 96484293.
//
// Revision 1.104  2008/08/01 14:43:47  dinishev
// <K> : 77235623
//
// Revision 1.103  2008/04/15 09:57:21  lulin
// - из-за дубликатов Архивариус не собирался.
//
// Revision 1.102  2008/04/15 09:03:25  lulin
// - правим название директив - чтобы соответствовали смыслу.
//
// Revision 1.101  2008/04/15 08:58:48  lulin
// - восстанавливаем компилируемость Немезиса.
//
// Revision 1.100  2008/02/13 20:20:15  lulin
// - <TDN>: 73.
//
// Revision 1.99  2007/12/05 12:35:11  lulin
// - вычищен условный код, составлявший разницу ветки и Head'а.
//
// Revision 1.98  2007/09/05 12:28:28  lulin
// - директивы перенесены в файл с директивами.
//
// Revision 1.97  2007/09/05 11:57:57  lulin
// - сделана возможность определять проектные директивы в специально отведенном файле.
//
// Revision 1.96  2007/08/30 18:05:07  lulin
// - избавляемся от лишнего кода по очистке строк.
//
// Revision 1.95  2007/08/30 15:00:45  lulin
// - bug fix: не проверяли конец файла.
//
// Revision 1.94  2007/08/30 10:09:23  lulin
// - убираем ненужную функцию поиска.
//
// Revision 1.93  2007/08/29 16:16:59  lulin
// - cleanup.
//
// Revision 1.92  2007/08/29 15:33:23  lulin
// - cleanup.
//
// Revision 1.91  2007/08/21 13:02:52  lulin
// - избавляемся от предупреждений компилятора.
//
// Revision 1.90  2007/08/21 11:39:52  lulin
// - избавляемся от предупреждений компилятора.
//
// Revision 1.89  2007/08/14 10:48:00  lulin
// - без отладочной информации отключаем трассировку объектов и памяти для всех проектов.
//
// Revision 1.88  2007/08/13 17:23:34  lulin
// - cleanup.
//
// Revision 1.87  2007/07/24 10:23:51  lulin
// - cleanup.
//
// Revision 1.86  2007/01/17 11:28:52  lulin
// - для "парня" не сортиреум кеш объектов.
//
// Revision 1.85  2006/12/18 09:40:27  lulin
// - cleanup.
//
// Revision 1.84  2006/12/11 12:02:49  lulin
// - cleanup.
//
// Revision 1.83  2006/12/07 09:55:38  lulin
// - не выключаем насильно сбор статистики.
//
// Revision 1.82  2006/11/30 14:47:26  lulin
// - cleanup.
//
// Revision 1.81  2006/08/29 11:46:18  lulin
// - bug fix: лог не разделял файл между процессами.
//
// Revision 1.80  2006/06/06 10:38:14  lulin
// - по-другому отключаем нотификацию о смене масштаба - в Design-time.
//
// Revision 1.79  2006/04/19 10:48:32  lulin
// - выключаем всякую трассировку в Design-Time.
//
// Revision 1.78  2006/03/06 12:02:29  oman
// - new behavior: контроль провисания ресурсов при добавлении объектов в кэш
//
// Revision 1.77  2006/02/21 09:13:24  lulin
// - new behavior: рассчитываем новый Top при смене положения курсора, без перепривязывания параграфа к новому View.
//
// Revision 1.76  2006/02/08 15:35:40  lulin
// - делаем в Эвересте "настоящее" выделение.
//
// Revision 1.75  2006/01/18 10:38:23  lulin
// - bug fix: не компилировалось тестовое приложение.
//
// Revision 1.74  2006/01/10 10:22:56  lulin
// - bug fix: отвалилась перерисовка при смене масштаба.
//
// Revision 1.73  2005/11/16 06:52:55  lulin
// - bug fix: не компилировалась библиотека в HEAD.
//
// Revision 1.72  2005/11/09 15:28:41  lulin
// - базовые интерфейсы перенесены в правильный модуль.
//
// Revision 1.71  2005/10/11 10:34:29  lulin
// - bug fix: не собиралась библиотека.
// - панель Preview переехала в библиотеку VT.
//
// Revision 1.70  2005/09/08 08:40:01  narry
// - update: изменение define для _ALCU
//
// Revision 1.69  2005/08/04 09:20:45  migel
// - change: перетащили `DebugStackTrace` из `m0define.inc` в `l3define.inc`.
//
// Revision 1.68  2005/05/27 12:24:41  lulin
// - системные модули, не имеющие отношения к Эвересту переехали в L3.
//
// Revision 1.67  2005/05/26 16:29:57  lulin
// - директивы, настраивающие канву вывода перемещены в библиотеку L3.
//
// Revision 1.66  2005/05/24 09:22:46  lulin
// - удалены ненужные директивы.
//
// Revision 1.65  2005/05/19 11:37:09  lulin
// - для _nsTool включаем l3ConsoleApp.
//
// Revision 1.64  2005/05/18 17:45:36  lulin
// - bug fix: директивы были вне скобок.
//
// Revision 1.63  2005/04/28 15:04:11  lulin
// - переложил ветку B_Tag_Box в HEAD.
//
// Revision 1.62  2005/04/22 12:53:05  vaso
// new define: ARM
//
// Revision 1.61.2.2  2005/04/26 10:51:12  lulin
// - new define: _l3SortedCache.
//
// Revision 1.61.2.1  2005/04/25 09:03:48  lulin
// - объединил с HEAD.
//
// Revision 1.62  2005/04/22 12:53:05  vaso
// new define: ARM
//
// Revision 1.61  2005/04/19 12:51:40  lulin
// - заточки для тестирования.
//
// Revision 1.60  2005/04/19 10:19:40  lulin
// - для тестовых приложений под Define _nsTest добавлены "правильные" директивы компиляции.
//
// Revision 1.59  2005/04/18 15:04:05  lulin
// - учитываем опцию D+ и только для нее включаем "все".
//
// Revision 1.58  2005/04/16 10:41:10  lulin
// - для опции D- выключаем всякую трассировку.
//
// Revision 1.57  2005/04/15 08:59:59  lulin
// - теперь держим ссылку на тег, а не собственно тег.
//
// Revision 1.56  2005/03/15 10:30:31  lulin
// - от Tk2AtomR переходим к _Ik2Tag.
//
// Revision 1.55  2004/11/10 08:02:41  lulin
// - выключены "лишние" директивы.
//
// Revision 1.54  2004/10/08 08:18:46  lulin
// - для Немезиса отключена директива l3TraceMemAllocStat.
//
// Revision 1.53  2004/10/08 08:16:01  lulin
// - new define: l3NotTraceMemAllocStat.
//
// Revision 1.52  2004/10/08 06:36:38  lulin
// - bug fix: для Design-Time не подкладываем свой менеджер памяти.
//
// Revision 1.51  2004/10/07 09:21:21  lulin
// - new directive: l3TraceMemAllocStat.
//
// Revision 1.50  2004/10/07 07:27:43  lulin
// - new: сделана возможность следить за выделением/освобождением памяти стандартными средствами.
//
// Revision 1.49  2004/09/15 09:51:47  lulin
// - перевел реализацию IUnknown на "шаблонную" реализацию.
//
// Revision 1.48  2004/09/08 11:22:55  lulin
// - new define: _l3NoTrace.
// - new define: l3TraceObjects.
//
// Revision 1.47  2004/09/02 11:57:03  law
// - cleanup.
//
// Revision 1.46  2004/08/05 11:31:22  demon
// - fix: показ Warning'ов для проекта Немезис
//
// Revision 1.45  2004/08/03 07:52:40  voba
// - add _ARCHI define
//
// Revision 1.44  2004/06/01 07:48:41  law
// - new defines: l3AssertSimpleMMCanFreeBlocks, _ALCU.
//
// Revision 1.43  2004/05/31 10:02:55  law
// - включен define _l3BoxedBitArray - так вроде с ним все заработало.
//
// Revision 1.42  2004/05/28 18:03:35  law
// - new define: _l3BoxedBitArray - пока выключен.
//
// Revision 1.41  2004/05/28 12:25:46  law
// - new build.
//
// Revision 1.40  2004/05/28 10:51:15  law
// - new behavior: включена директива _l3StoreAllCacheableInPool.
//
// Revision 1.39  2004/05/28 10:42:31  law
// - bug fix: неправильно распеределялись объекты в пуле.
//
// Revision 1.38  2004/05/27 15:48:22  law
// - new behavior: Pool памяти перетащен в класс _Tl3Base.
// - new behavior: память под класс Tl3String теперь распределяется из Pool'а.
//
// Revision 1.37  2004/04/09 12:47:51  law
// - new behavior: для Немезиса в сборке _Debug следим за заглушками локальных процедур.
//
// Revision 1.36  2004/03/17 13:13:18  law
// - change: для Немезиса включена директива l3NotUseW95Meter.
//
// Revision 1.35  2003/12/29 15:49:23  law
// - change: fCountView для удобства отладки теперь property - так что можно ставить breakpoint на pm_SetfContView.
//
// Revision 1.34  2003/12/09 18:03:40  law
// - new directive: l3Alone.
//
// Revision 1.33  2003/04/19 12:58:24  law
// - новая сборка библиотек ee.dll и eeGen.dll.
//
// Revision 1.32  2003/04/19 11:24:50  law
// - new file: vtDefine.inc.
//
// Revision 1.31  2003/04/17 13:20:53  law
// - cleanup.
//
// Revision 1.30  2003/04/15 13:26:49  law
// - new unit: evUnits.
//
// Revision 1.29  2003/02/18 18:05:53  law
// - new directive: l3NotLexUseStdIn.
//
// Revision 1.28  2002/12/26 17:13:56  law
// - optimiztion: в режиме evOnlyForPrinting выключаем директиву evUseOleClipboard.
//
// Revision 1.27  2002/09/23 12:16:47  law
// - new directives: Warn UNSAFE_*.
//
// Revision 1.26  2002/09/11 15:43:03  law
// - change: адаптация к Delphi 7.0.
//
// Revision 1.25  2001/12/24 13:20:41  law
// - cleanup.
//
// Revision 1.24  2001/12/14 16:39:17  law
// - new unit: m4SearchFormula.
//
// Revision 1.23  2001/10/29 13:03:46  law
// - new directive: l3NotTraceClasses.
//
// Revision 1.22  2001/10/12 17:52:01  law
// - new behavior: работа с буфером обмена через _OleSetClipboard.
//
// Revision 1.21  2001/08/29 07:01:10  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.20  2001/04/04 14:26:35  law
// - new: добавлены директивы компиляции.
//
// Revision 1.19  2000/12/15 15:19:00  law
// - вставлены директивы Log.
//

{$Include l3Delphi.inc}

{$IfDef NoVCL}
 {$Define NoVGScene}
 {$Define NoVCM}
 {$Define NoEverest}
 {$Define NoTB97}
 {$Define NoImageEn}
{$EndIf NoVCL}

{$IfDef nsTool}
 {.$Define NoVGScene}
 {$IfNDef NeedsScripts}
  {$Define NoScripts}
 {$EndIf NeedsScripts}
 {.$Define NoVCM}
{$EndIf nsTool}

{$IfDef l3ConsoleApp}
 {$Define NoVCM}
{$EndIf l3ConsoleApp}

{$If Defined(Nemesis) or Defined(NsTool)}
 {$If not Defined(nsTest) OR Defined(InsiderTest)}
  {$Define l3NotUseSSE}
 {$IfEnd} 
{$IfEnd}

{$IfDef ARM}
 {$Define l3Alone}
{$EndIf ARM}

{$IfDef l3Alone}
 {$Define l3NotRequires_m0}
{$EndIf l3Alone}

{$If Defined(nsTest) AND not Defined(InsiderTest)}
 {$IfNDef l3Trace}
  {$Define l3NoTrace}
 {$EndIf  l3Trace}
{$IfEnd}

{$IfDef nsTool}
 {.$Define l3ConsoleApp}
{$EndIf nsTool}

{$IfDef Nemesis}
 {$IfOpt D+}
  {$Define l3TraceAllocStub}
 {$EndIf}
{$EndIf Nemesis}

{$IfDef Everest}
 {$IfOpt D+}
  {$Define l3TraceAllocStub}
 {$EndIf}
 {$Define l3UseQuote4Split}
{$EndIf Everest}

{$IfDef EverestLite}
 {$Define l3UseQuote4Split}
{$Endif EverestLite}

{$IfOpt D-}
 {$Define l3NoTrace}
{$EndIf}

{$IfDef DesignTimeLibrary}
 {$Define l3NoTrace}
 {$Define NoScripts}
{$EndIf DesignTimeLibrary}

// moved from `m0define.inc` by migel {
{$IfDef Nemesis}
 {$IfOpt D+}
  {$Define DebugStackTrace}
 {$EndIf}
{$Else  Nemesis}
 {$Define DebugStackTrace}
{$EndIf Nemesis}

{$IfDef notDebugStackTrace}
 {$Undef DebugStackTrace}
{$EndIf notDebugStackTrace}

{$Define l3TraceSysGetMem}
{$IfNDef XE}
 {$Define l3DirectUseSystemMemManager}
{$EndIf  XE}
{.$Define l3TraceMemAllocStat}

{$IfDef Delphi7}
 {$Warn UNSAFE_Type Off}
 {$Warn UNSAFE_Code Off}
 {$Warn UNSAFE_Cast Off}
 {$Warn SYMBOL_PLATFORM Off}
 {$Warn SYMBOL_LIBRARY Off}
 {$Warn SYMBOL_DEPRECATED Off}
 {$Warn UNIT_DEPRECATED Off}
 {$Warn UNIT_PLATFORM Off}
{$EndIf Delphi7}

{$BoolEval Off}
{$SafeDivide Off}
{$StackFrames Off}
{$TypedAddress Off}
{$WriteableConst Off}
{$LongStrings On}
{$ExtendedSyntax On}
{$VarStringChecks On}

{$IfDef EverestRelease}
 {$Define l3Release}
 {$Define l3UseQuote4Split} 
{$EndIf EverestRelease}

{$IfDef evMyEditor}
 {$Define l3Release}
 {$Define l3NotTraceClasses}
{$EndIf evMyEditor}

{$IfDef l3Release}
 {$OverflowChecks Off}
 {$IOChecks Off}
 {$RangeChecks Off}
 {$DebugInfo Off}
 {$Assertions Off}
 {$DefinitionInfo Off}
 {$LocalSymbols Off}
{$Else  l3Release}
 //{$If not Defined(Nemesis) AND not Defined(nsTest)}
 {$If not Defined(Nemesis) OR Defined(nsTest)}
  {$IfOpt D+}
   {$OverflowChecks On}
   {$IOChecks On}
   {$RangeChecks On}
   {$DebugInfo On}
   {$Assertions On}
   {$DefinitionInfo On}
   {$LocalSymbols On}
  {$Else  D+}
   {$OverflowChecks On}
   {$IOChecks On}
   {$RangeChecks On}
   {.$DebugInfo On}
   {$Assertions Off}
   {.$DefinitionInfo On}
   {.$LocalSymbols On}
  {$EndIf D+}
 {$IfEnd}
{$EndIf l3Release}

{$IfDef ItsLAW}
 {$IfDef Delphi7}
  {$Undef _Warnings_}
  {$Hints Off}
 {$Else  Delphi7}
  {$Define _Warnings_}
  {$Hints On}
 {$EndIf Delphi7}
{$Else  ItsLAW}
 {$Undef _Warnings_}
 {$Hints Off}
{$EndIf ItsLAW}

{$IfDef Console}
 {.$Define l3ConsoleApp}
{$EndIf Console}

{$IfDef l3NoTrace}
 {$Define l3NotTraceClasses}
 {$Define l3NotTraceObjects}
 {$Undef  l3TraceAllocStub}
 {$Undef  l3TraceSysGetMem}
 {$Undef  l3TraceMemAllocStat}
{$EndIf l3NoTrace}

{$IfDef DesignTimeLibrary}
 {$Undef  l3TraceSysGetMem}
 {$Undef  l3TraceMemAllocStat}
{$EndIf DesignTimeLibrary}

{$IfDef l3NotTraceMemAllocStat}
 {$Undef l3TraceMemAllocStat}
{$EndIf l3NotTraceMemAllocStat}

{$IfOpt D+}
 {$IfNDef l3ConsoleApp}
  {$IfNDef l3NotTraceClasses}
   {$Define l3TraceClasses}
  {$EndIf  l3NotTraceClasses}
 {$EndIf  l3ConsoleApp}
 {$IfNDef l3NotTraceObjects}
  {$Define l3TraceObjects}
 {$EndIf  l3NotTraceObjects}
{$EndIf}

{$IfNDef XE}
 {$Define l3BorlandMemoryManager}
{$EndIf  XE}

{$IfDef Win32}
 {$IfNDef Delphi4}
  {$Define l3NotRequires_m0}
 {$EndIf  Delphi4}
{$Else  Win32}
{$EndIf Win32}

{$Define l3Requires_m0}

{$IFDEF l3Release}
 {$Define l3Requires_m0}
{$ELSE  l3Release}
{$ENDIF l3Release}

{$IfDef l3Requires_m0}
 {$IfDef l3NotRequires_m0}
  {$Undef l3Requires_m0}
 {$EndIf l3NotRequires_m0}
{$EndIf l3Requires_m0}

{$IfDef _m0LOGSAV1}
 {$IfNDef l3Requires_m0}
  - невозможно использовать механизм Log-файлов без директивы l3Requires_m0
 {$EndIf l3Requires_m0}
{$EndIf _m0LOGSAV1}

{$IfNDef l3ProgressComponentIsNotComponent}
 {$Define l3ProgressComponentIsComponent}
{$EndIf l3ProgressComponentIsNotComponent}

{$Define l3UseOleClipboard}

{$IfDef l3NotUseOleClipboard}
 {$Undef l3UseOleClipboard}
{$EndIf l3NotUseOleClipboard}

{$IfDef l3ConsoleApp}
 {$Undef l3ProgressComponentIsComponent}
 {$Undef l3UseOleClipboard}
 {$Define l3LexUseStdIn}
 {$Define noGDIPlus}
{$EndIf l3ConsoleApp}

{$If Defined(nsTest) AND not Defined(InsiderTest)}
 {.$Undef l3ProgressComponentIsComponent}
{$IfEnd}

{$IfDef l3NotLexUseStdIn}
 {$Undef l3LexUseStdIn}
{$EndIf l3NotLexUseStdIn}

{$IfNDef DesignTimeLibrary}
 {$IfDef XE}
  {$Define l3BoxedBitArray}
 {$Else  XE}
  {$Define l3BoxedBitArray}
 {$EndIf  XE}
{$EndIf DesignTimeLibrary}

{$Define l3AssertSimpleMMCanFreeBlocks}

{$IfDef ALCU}
 {.$Undef l3AssertSimpleMMCanFreeBlocks}
 {$Undef evNeedClipboardSpy}
{$EndIf ALCU}

{.$Define l3UsePrinterForPreview}
{$Define l3NeedTabbedText}
{$Define l3DrawBitmapsTransparent}

{$IfNDef DesignTimeLibrary}
 {$IfNDef XE}
  {$Define l3HackedVCL}
 {$EndIf} 
{$EndIf  DesignTimeLibrary}

{.$IfDef Archi}
 {.$Include ArchiDefine.inc}
{.$EndIf Archi}

{$IfDef Nemesis}
  {$If Defined(InsiderTest)}
   {$Undef _Warnings_}
   {$Hints Off}
  {$Else}
   {$Define _Warnings_}
   {.$Hints On}
  {$IfEnd}
  {.$Undef l3AssertSimpleMMCanFreeBlocks}
  {.$Undef l3TraceMemAllocStat}
{$EndIf Nemesis}

{$IfDef CheckCode}
 {$Define _Warnings_}
 {.$Hints On}
{$EndIf CheckCode}

{$IfDef _Warnings_}
 {$Warnings On}
{$Else  _Warnings_}
 {$Warnings Off}
{$EndIf _Warnings_}

{$IfDef Nemesis}
 {$Undef l3DrawBitmapsTransparent}
{$EndIf Nemesis}

{$IfDef ARCHI}
 {$Define l3UseQuote4Split}
{$EndIf ARCHI}

{$If Defined(Nemesis) and Defined(Debug)}
 {$IfNDef XE}
  {$Define l3CheckUnfreedResources}
 {$EndIf  XE} 
{$IfEnd}

{$IfDef l3CheckUnfreedResources}
 {$If not (Defined(Delphi7) or Defined(Delphi2006))}
  - Проверка CheckUnfreedResources гарантированно работает только с Delphi7 и Delphi2006
 {$IfEnd}
{$EndIf l3CheckUnfreedResources}

{$Define l3SharedLog}

{.$Define l3TraceFill}

{$IfNDef XE}
 {$Define l3AsmMove}
 {$Define l3UseSSE}
 {$Define l3UseMMX}
 {$Define l3UseFPU}
{$EndIf XE}

{$IfDef Nemesis}
 {$If not Defined(nsTest) OR Defined(InsiderTest)}
  {$IfOpt D+}
   {$Undef l3UseSSE}  
   {.$Undef l3UseMMX}
   {.$Define l3TraceFill}
  {$Else}
   {$Undef l3UseSSE}
  {$EndIf}
 {$IfEnd}
{$EndIf Nemesis}
{$IfDef ARCHI}
 {$Undef l3UseSSE}
{$EndIf ARCHI}

{$IfNDef l3FilerIsNotComponent}
 {$IfDef l3ProgressComponentIsComponent}
  {$Define l3FilerIsComponent}
 {$EndIf l3ProgressComponentIsComponent}
{$EndIf l3FilerIsNotComponent}

{$IfDef Nemesis}
 {$Undef l3FilerIsComponent}
{$EndIf Nemesis}

{$IfDef nsTest}
{$IF not Defined(Archi) and not Defined(EverestLite)}
 {$Undef l3FilerIsComponent}
{$IFEND}
{$EndIf nsTest}

{$IfDef UseProjectDefine}
 {$Include ProjectDefine.inc}
{$Else  UseProjectDefine}
{$EndIf UseProjectDefine}

{$IfDef XE}
 {.$Define l3NoObjectCache}
 {$Align 1}
 {.$OLDTYPELAYOUT ON}
 {$Z1}
{$EndIf XE}

{$IfNDef l3ConsoleApp}
 {$IfNDef notDebugStackTrace}
  {$Define _m0USEFORMS1}
 {$EndIf  notDebugStackTrace}
{$EndIf  l3ConsoleApp}

{$IfOpt D+}
 {$Define _m0LOGSAV1}
{$EndIf D+}

{$Define _m0LANGUAGE_RUS}

{$IfDef l3NotUseSSE}
 {$UnDef l3UseSSE}
{$EndIf}

{$IfNDef Shell}
 {$IfDef Nemesis}
  {$If not Defined(Admin) AND not Defined(Monitorings) AND not Defined(nsTool)}
   {$Define Shell}
  {$IfEnd}
 {$EndIf Nemesis}
{$EndIf Shell}

{$EndIf l3Define}
