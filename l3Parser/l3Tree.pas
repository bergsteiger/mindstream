unit l3Tree;
{* Реализация структуры данных "дерева". }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Бабанин В.Б. ©   }
{ Модуль: l3Tree -        }
{ Начат: 17.03.1999 11:20 }
{ $Id: l3Tree.pas,v 1.110 2015/08/13 11:13:56 lukyanets Exp $ }

// $Log: l3Tree.pas,v $
// Revision 1.110  2015/08/13 11:13:56  lukyanets
// Читаем из полей
//
// Revision 1.109  2015/02/10 15:45:47  kostitsin
// ChangingChanged
//
// Revision 1.108  2014/03/18 09:59:14  lulin
// - перетряхиваем работу с тегами.
//
// Revision 1.107  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.106  2012/06/15 12:27:43  kostitsin
// [$371631792]
//
// Revision 1.105  2011/06/20 15:22:24  lulin
// {RequestLink:269083814}
//
// Revision 1.104  2011/06/20 12:48:20  dinishev
// [$269078366]
//
// Revision 1.103  2011/05/17 15:53:33  lulin
// {RequestLink:266409354}.
//
// Revision 1.102  2011/05/13 12:59:17  lulin
// {RequestLink:177537862}.
//
// Revision 1.101  2011/04/18 13:44:47  voba
// - k : 236721575
//
// Revision 1.100  2010/11/29 07:41:49  voba
// - K : 236721575
//
// Revision 1.99  2010/10/04 14:08:28  fireton
// - const перед Tl3WString и Il3CString
//
// Revision 1.98  2010/09/21 11:06:56  fireton
// - переводим деревья с PAnsiChar на Tl3WString
//
// Revision 1.97  2009/12/11 14:14:53  lulin
// {RequestLink:172984520}.
//
// Revision 1.96  2009/02/03 10:25:52  oman
// Warning fix
//
// Revision 1.95  2009/01/23 13:58:39  lulin
// - <K>: 135605086.
//
// Revision 1.94  2008/11/24 15:30:22  lulin
// - <K>: 121831507.
//
// Revision 1.93  2008/10/17 18:45:00  lulin
// - контроль типов.
//
// Revision 1.92  2008/10/09 14:23:51  dinishev
// <K> : 84640081
//
// Revision 1.91  2008/08/13 09:14:33  mmorozov
// - bugfix: сброс выбранных в списке фильтров (K<96484569>);
//
// Revision 1.90  2008/04/07 06:01:59  lulin
// - <K>: 88641266.
//
// Revision 1.89  2008/03/25 14:19:51  fireton
// - реализуем Empty на дереве
//
// Revision 1.88  2008/03/20 11:44:33  lulin
// - <K>: 87589884.
//
// Revision 1.87  2008/03/20 10:59:48  lulin
// - cleanup.
//
// Revision 1.86  2008/03/20 09:48:40  lulin
// - cleanup.
//
// Revision 1.85  2008/02/21 13:59:46  mmorozov
// - bugfix: перед допросом узла проверяем его наличие (в рамках работы над CQ: OIT5-28331);
//
// Revision 1.84  2008/02/21 08:47:44  mmorozov
// - new: поддержка приёма объектов на уровне данных дерева + поддержка операций копирования\вставки визульным деревом (в рамках CQ: OIT5-28331);
//
// Revision 1.83  2008/02/19 13:08:27  lulin
// - добавлены методы для поддержки DnD.
//
// Revision 1.82  2008/02/08 12:19:35  mmorozov
// - new: возможность приёма перетаскиваемых объектов узлами дерева + новый формат в буфере обмена для перемещния нескольких узлов (CQ: OIT5-28331);
//
// Revision 1.81  2008/02/07 14:44:45  lulin
// - класс _Tl3LongintList переехал в собственный модуль.
//
// Revision 1.80  2008/02/04 08:51:38  lulin
// - класс _Tl3InterfaceList выделен в отдельный модуль.
//
// Revision 1.79  2008/01/31 18:53:43  lulin
// - избавляемся от излишней универсальности списков.
//
// Revision 1.78  2007/12/26 14:10:37  lulin
// - модуль l3Interfaces полностью переведен на модель.
//
// Revision 1.77  2007/12/25 23:55:57  lulin
// - модуль l3Tree_TLB полностью перенесен на модель.
//
// Revision 1.76  2007/12/25 12:11:02  lulin
// - удален ненужный интерфейс.
//
// Revision 1.75  2007/12/25 11:34:45  mmorozov
// - change: правильно уведомляем о смене корня, иначе производились лишние вызовы + чистим методы AddRootSpy, DelRootSpy, достаточно методов Subscribe\Unsubscribe (CQ: OIT5-27823);
//
// Revision 1.74  2007/09/07 12:53:28  lulin
// - удален ненужный параметр.
//
// Revision 1.73  2007/09/06 16:01:16  lulin
// - cleanup.
//
// Revision 1.72  2007/08/21 11:39:52  lulin
// - избавляемся от предупреждений компилятора.
//
// Revision 1.71  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.70  2007/07/24 10:23:51  lulin
// - cleanup.
//
// Revision 1.69  2007/07/12 17:53:13  lulin
// - закончил описывать классы, реализующие теги.
//
// Revision 1.68  2006/12/27 13:25:53  lulin
// - cleanup.
//
// Revision 1.67  2006/12/27 09:46:41  lulin
// - два метода, вычисляющие уровень ноды объединены в один.
//
// Revision 1.66  2006/12/22 15:06:43  lulin
// - текст ноды - теперь структура с длиной и кодовой страницей.
//
// Revision 1.65  2006/12/08 15:22:15  voba
// - remove type FourByte
//
// Revision 1.64  2006/09/25 14:23:16  lulin
// - cleanup.
//
// Revision 1.63  2006/09/25 14:05:35  mmorozov
// - change: объявление Create;
//
// Revision 1.62  2006/09/12 14:02:39  oman
// - new beh: Поддержка свернуть/развернуть для новых деревьях (cq22540)
//
// Revision 1.61  2005/12/14 09:47:41  voba
// - enh. procedure Tl3Tree.SetFlagMaskPrim оптимизация вызова Changiing/Changed
//
// Revision 1.60  2005/11/18 13:26:35  lulin
// - в процедуру конца модификации теперь можно подавать пачку операций.
//
// Revision 1.59  2005/10/21 13:35:00  voba
// - доделал процедуру SelectInterval
//
// Revision 1.58  2005/10/20 06:32:25  lulin
// - объекты с владельцами выделены в шаблоны.
//
// Revision 1.57  2005/09/26 06:27:47  lulin
// - перетаскиваем обработку мыши в общие модули.
//
// Revision 1.56  2005/09/12 15:07:21  voba
// - improve использовали реализацию нотификации изменений из l3Notifier.int
//
// Revision 1.55  2005/08/15 11:53:59  voba
// - bug fix  с нотификаторами
//
// Revision 1.54  2005/08/02 11:55:21  voba
// - bug fix дополнительная подписка на Il3ChangeRecipient в связи с переделками нотификатора
//
// Revision 1.53  2005/07/28 15:07:54  voba
// - improve : l3ItemStorages_TLB перетащили  в l3Interfaces
// - improve : AddNotifiedObj/DelNotifiedObj переименовли в Subscribe/Unsubscribe для поддержки интерфейса Il3ChangeNotifier
// - improve : Il3ItemNotifyRecipient._Notify добавили параметр aNotifier : Il3ChangeNotifier
//
// Revision 1.52  2005/05/27 12:06:04  lulin
// - убраны лишние зависимости.
//
// Revision 1.51  2005/04/20 08:25:45  demon
// - fix: в опреации SelectInterval скобка Changing перенесена в самое начало (иначе получалось два вызова Changing-Changed).
//
// Revision 1.50  2005/01/18 06:11:30  mmorozov
// bugfix: в Tl3Tree.GetNodeFlags вставлена проверка на aNode = nil;
//
// Revision 1.49  2004/10/15 13:16:39  lulin
// - new behavior: оглавление теперь синхронизируется с изменением текста документа (CQ OIT5-9792).
//
// Revision 1.48  2004/10/15 12:53:50  lulin
// - new interface: _Il3Window.
//
// Revision 1.47  2004/09/20 12:42:58  lulin
// - оптимизация - путем перемещения части объектов в пул, время загрузки ГК (до показа оглавления) уменьшено с 3.5 сек до 2.6 сек.
//
// Revision 1.46  2004/07/23 10:54:37  demon
// - new behavior: операция Wake стала virtual
//
// Revision 1.45  2004/07/22 10:36:01  voba
// - bug fix
//
// Revision 1.44  2004/07/01 08:57:03  voba
// - bug fix : навигация с учетом Hidden элементов неправильно работала
//
// Revision 1.43  2004/06/03 17:15:51  law
// - new interface: _Ik2Base.
//
// Revision 1.42  2004/06/02 14:00:05  demon
// - new: операция MakeNodeVisible теперь возвращает видимый индекс.
//
// Revision 1.41  2004/06/02 10:20:54  law
// - удален конструктор Tl3VList.MakeIUnknown - пользуйтесь _Tl3InterfaceList.Make.
//
// Revision 1.40  2004/06/01 14:23:13  law
// - удалены конструкторы Tl3VList.MakeLongint, MakeLongintSorted - пользуйтесь _Tl3LongintList.
//
// Revision 1.39  2004/06/01 13:48:19  law
// - используем _Tl3LongintList.
//
// Revision 1.38  2004/06/01 08:21:42  demon
// - new behavior: на _Il3SimpleTree добавлен простой итератор, а на _Il3SimpleNode - SetFlag
//
// Revision 1.37  2004/05/28 13:47:43  demon
// - fix: не сбрасывалось количество выделенных при изменении Root на  дереве.
//
// Revision 1.36  2004/05/28 12:43:12  demon
// - new behavior: реализована операция SelectInterval
//
// Revision 1.35  2004/05/27 16:23:25  voba
// - bug fix: неправильно корректировался Countview в ChangeExpand
//
// Revision 1.34  2004/05/27 10:22:10  narry
// - update
//
// Revision 1.33  2004/05/27 08:59:13  law
// - change: исбавился от лишнего метода IsMyIntf - вместо нео теперь всегда используется IsSame.
//
// Revision 1.32  2004/05/27 07:33:06  demon
// - fix: при снятии последнего выделенного элемента прогружалось все дерево.
//
// Revision 1.31  2004/05/26 19:27:34  law
// - new behavior: TvtCustomOutliner теперь знает только про интерфейсы _Il3SimpleTree и Il3Tree, а не про объект Tl3Tree. Сделаны изменения, чтобы собирался Архивариус.
//
// Revision 1.30  2004/05/26 18:17:26  law
// - change: Il3Node теперь наследуется от _Il3SimpleNode.
//
// Revision 1.29  2004/05/26 16:59:13  law
// - new behavior: TvtCustomOutliner теперь знает только про интерфейсы _Il3SimpleTree и Il3Tree, а не про объект Tl3Tree.
//
// Revision 1.28  2004/05/26 14:22:06  law
// - change: скестил "ежа с ужом" (старые деревья с новыми).
//
// Revision 1.27  2004/05/26 11:09:22  narry
// - update: обрамление DeleteselectedNodes вызовами Changing-Changed;
//
// Revision 1.26  2004/05/26 11:05:51  narry
// - new method: DeleteSelectedNodes - удаление выделенных узлов
//
// Revision 1.25  2004/05/25 13:29:31  voba
// - update: исправление перемещения выделенных узлов влево
//
// Revision 1.24  2004/05/25 09:15:49  narry
// - new function: MoveSelectedNodes
//
// Revision 1.23  2004/05/19 14:13:17  voba
// -add _notify after delete node
//
// Revision 1.22  2004/04/28 15:25:33  voba
// - bug fix : при вставке в нотификации курсорный элемент съезжает
//
// Revision 1.21  2004/04/22 09:50:46  law
// - bug fix: исправил то, что не компилировалось.
//
// Revision 1.20  2004/04/22 09:21:25  law
// - выделил интерфейс Il3Tree.
//
// Revision 1.19  2004/04/16 15:01:43  law
// - optimization: убрана лишняя ветка в GetAbsIndex.
//
// Revision 1.18  2004/04/16 14:02:41  law
// - optimization: используем HasChild вместо ChildNode <> nil.
//
// Revision 1.17  2004/04/16 09:59:14  law
// - optimization: в GetAbsIndex проверяем - не Root ли это.
//
// Revision 1.16  2004/04/15 16:25:16  voba
// - optimize : GetAbsIndex поиск от якорного вверх (По заказу Крылова)
//
// Revision 1.15  2004/04/13 15:28:34  law
// - optimiztion: в Tl3Tree.HasVisibleChildren сначала спрашиваем Il3Node.HasChild - как "более дешевую" операцию.
//
// Revision 1.14  2004/04/13 13:49:37  law
// - cleanup.
//
// Revision 1.13  2004/04/13 13:29:42  law
// - cleanup: убрано лишнее приведение через As к Il3Node.
//
// Revision 1.12  2004/04/13 12:05:13  law
// - optimization: метод IsMyIntf перенесен на Il3Node.
//
// Revision 1.11  2004/04/09 08:31:29  law
// - bug fix: более корректно обрабатываем в _ChangedEx необходимось не перерасчета CountView.
//
// Revision 1.10  2004/04/08 17:17:25  law
// - optimization: не вызываем CursorTop когда CountView не меняется.
//
// Revision 1.9  2004/04/02 14:54:56  vasonik
// Задавлен перерасчет CountView, если изменяемые флаги не приводят к изменению fCountView
//
// Revision 1.8  2004/03/10 11:41:01  demon
// - new behavior: при изменении SelectCount всем подписчикам поддерживающим Il3SelectCountChangedRecipient рассылается сообщение.
//
// Revision 1.7  2004/03/09 15:10:46  am
// new: используем imNoHidden (Вован)
//
// Revision 1.6  2004/03/05 15:53:56  demon
// - improvement: убрал лишний перерасчет CountView
//
// Revision 1.5  2004/03/05 13:40:47  law
// - new interface: Il3CountViewChangeRecipient.
//
// Revision 1.4  2004/03/05 13:30:52  demon
// - fix: нотификация дереву посылается до обработки нотификации в ноде
//
// Revision 1.3  2004/03/05 12:21:08  law
// - new behavior: дерево теперь рассылает нотификацию для Il3NodeNotifyRecipient.
//
// Revision 1.2  2004/03/05 11:56:02  law
// - добавлены префиксы l3.
//
// Revision 1.1  2004/03/03 18:04:05  law
// - rename unit: l3Tree2 -> l3Tree.
//
// Revision 1.159  2004/03/03 17:40:06  law
// - cleanup.
// - new unit: l3TreeUtils.
//
// Revision 1.158  2004/03/03 17:14:20  law
// - cleanup.
// - new method: Tl3Tree.MarkNeedCountView.
//
// Revision 1.157  2004/03/03 16:31:27  law
// - cleanup: убраны события Tl3Tree.OnTreeClear, OnNodeMove.
// - bug fix: учитываем, что дерево может быть привязано к нескольким визуальным элементам.
// - bug fix: вызываем OnRootChanged уже ПОСЛЕ того как Root действительно изменился.
//
// Revision 1.156  2004/03/03 12:46:50  demon
// - fix: при присвоении того же самого RootNode происходил сброс всех флагов и т.д, Теперь ничего не происходит.
//
// Revision 1.155  2004/02/27 15:53:12  vasonik
// -bug fix GetNode неправильно вычислял ноду
//
// Revision 1.154  2004/02/26 15:12:34  demon
// - new behavior: function GetRootNode стала virtual
//
// Revision 1.153  2004/02/18 08:34:02  voba
// -new behavior взвожу флажок Modified на некоторые операции в _Notify
//
// Revision 1.152  2004/02/11 15:29:56  voba
// -add  function TestFlagMask по Node
//
// Revision 1.151  2004/02/09 13:41:48  voba
// -new behavior Flags стала длиной 4 байта
//
// Revision 1.150  2004/02/06 13:28:38  voba
// -new behavior: SplitFlags - Первые 2 байта в дерево, остальные в ноду
//
// Revision 1.149  2003/12/30 13:02:03  fireton
// -bugfix: в Tl3Tree.Iterate не использовался aFromNode
//
// Revision 1.148  2003/12/29 15:49:23  law
// - change: fCountView для удобства отладки теперь property - так что можно ставить breakpoint на pm_SetfContView.
//
// Revision 1.147  2003/12/24 15:47:41  voba
// -new behavior: при вычислении HasChild учитываются скрытые элементы
//
// Revision 1.146  2003/12/17 15:24:43  voba
// - bug fix: ExpandSubDir при наличии hidden элементов неправильно вычислял CountView
//
// Revision 1.145  2003/12/16 13:14:04  voba
// - bug fix: procedure split fnd concat flags
//
// Revision 1.144  2003/12/11 14:58:39  law
// - new param: IeeTree.Changed(aCountView: Integer = ee_NeedCountView).
//
// Revision 1.143  2003/12/11 12:50:14  law
// - rename: все упоминания ChildsCount переименованы в AllChildrenCount.
//
// Revision 1.142  2003/12/10 10:55:16  law
// - new behavior: Tl3Tree поддерживает интерфейс Il3TreeSource.
//
// Revision 1.141  2003/12/10 09:54:18  migel
// - fix: в качестве текущей ноды выставляем ноду, которую нашли в дереве, а не ту, которую нам подали для поиска.
//
// Revision 1.140  2003/12/09 14:27:17  voba
// - add function TestFlagMask
//
// Revision 1.139  2003/12/08 12:43:01  demon
// - new behavior: optimised functions Set_NodeFlags и MakeNodeVisible
//
// Revision 1.138  2003/12/05 17:00:38  voba
// - add procedure SetFlagMask
//
// Revision 1.137  2003/12/05 14:59:55  law
// - bug fix: поборолся с Current в "спящем" дереве.
//
// Revision 1.136  2003/12/05 13:57:17  law
// - bug fix: учитываем _ShowRoot.
//
// Revision 1.135  2003/12/05 13:42:57  law
// - cleanup.
//
// Revision 1.134  2003/12/05 13:30:38  law
// - cleanup: переходим на константы.
//
// Revision 1.133  2003/12/05 11:55:02  law
// - new behavior: сделана "отложенная" загрузка списков.
//
// Revision 1.132  2003/12/04 18:34:22  law
// - change: сделан отложенный подсчет CountView, пока сильно не помогло, но и хуже вроде не стало.
//
// Revision 1.131  2003/12/01 13:14:56  demon
// - optimize SetAllFlag
//
// Revision 1.130  2003/12/01 12:25:39  demon
// - optimize GetNextSelect
//
// Revision 1.129  2003/12/01 10:02:12  demon
// - bug fix: Неправильно корректировался SelectedCount при удалении
// - bug fix: Неправильно корректировалось количество элементов в списке fFlagsList при удалении
//
// Revision 1.128  2003/11/28 12:27:19  am
// bugfix: GetNodeByAbsIndex
//
// Revision 1.127  2003/11/26 16:05:43  voba
// -bug fix
//
// Revision 1.126  2003/11/26 15:58:04  voba
// -add method SetFlagsByAbsIndex
//
// Revision 1.125  2003/11/26 12:51:10  voba
// -add method GetFlagsByAbsIndex, GetNodeByAbsIndex
//
// Revision 1.124  2003/11/25 14:32:46  voba
// -optimized: GetAbsIndex
//
// Revision 1.123  2003/11/25 13:24:01  nikitin75
// fix: AV при удалении единственного узла дерева;
//
// Revision 1.122  2003/11/17 12:49:38  am
// - bugfix:
//
// Revision 1.121  2003/11/11 10:16:45  voba
// -bug fix : неправильно пересчитывалос количество видимых элементов
//
// Revision 1.120  2003/11/10 14:03:06  voba
// -new behavior оптимизировал процедуру SetAllFlag
//
// Revision 1.119  2003/10/28 10:10:21  demon
// - bug fix: неправильно определялся SelectedCount после операции "Выделить все"
//
// Revision 1.118  2003/10/23 14:13:52  voba
// - enlarge select speedl
//
// Revision 1.117  2003/10/14 13:05:31  demon
// - bug fix: не правильно выставлялся CursorTop при скрытом первом элементе
//
// Revision 1.116  2003/09/12 11:11:26  law
// - bug fix: у метода IsLastVis именено возвращаемое значение для Node = nil на true, что по словам Вована более логично.
//
// Revision 1.115  2003/09/12 11:04:06  law
// - bug fix: AV когда ноду (видимо) уже выдернули из дерева, а оно про нее помнит.
//
// Revision 1.114  2003/09/01 09:54:55  demon
// - add: comment
//
// Revision 1.113  2003/08/21 13:05:21  demon
// - bug fix: усилена защита при возникновении граничных условий
//
// Revision 1.112  2003/08/19 15:24:36  voba
// - bug fix: GetLines неправильно работал
//
// Revision 1.110  2003/08/19 11:29:30  voba
// - bug fix: отрисовка линий объединяющих уровень не учитытывала скрытые элементы
//
// Revision 1.109  2003/08/18 11:55:24  voba
// - bug fix: неправильно рисовалось дерево, если были скрытые ноды и тыкали мышью за область отрисованных нод
//
// Revision 1.108  2003/08/14 16:38:09  demon
// - fix: неправильно получался элемент по номеру при части элементов в дереве Hidden.
//
// Revision 1.107  2003/08/05 08:42:09  voba
// -bug fix: GetNode из-за оптимизации некорректно отрабатывала скрытые элементы
//
// Revision 1.106  2003/08/01 12:05:38  voba
// -enhancement: увеличил скорость получения ноды по визуальному индексу
//
// Revision 1.105  2003/07/29 09:05:01  voba
// - bug fix: не инициализировал Result в подитеративной функции
//
// Revision 1.104  2003/07/28 16:51:36  voba
// -code clean
//
// Revision 1.103  2003/07/28 15:00:58  demon
// - bug fix
//
// Revision 1.102  2003/07/28 09:50:37  demon
// - bug fix : неправильно работал итератор при невозвращении Result
//
// Revision 1.101  2003/07/11 16:21:00  demon
// - bug fix: При удалении элемента не корректировался счетчик видимых (не доделано до конца)
//
// Revision 1.100  2003/07/07 10:55:14  law
// - bug fix: был AV видимо при отсутствии Root'а.
//
// Revision 1.99  2003/07/04 15:50:03  demon
// - fix: При выставлении current сбрасывался CountView
//
// Revision 1.98  2003/07/04 15:08:43  voba
// - improvement : ноды-на-листе следят за удалением из листа
//
// Revision 1.97  2003/07/02 17:27:40  law
// - bug fix: неправильно удалялся элемент списка (TnsListChild). Проблемы остались, но мячик на стороне сервера.
//
// Revision 1.96  2003/06/25 15:15:18  voba
// - speed improvement SelectAllNodes
//
// Revision 1.95  2003/06/19 09:02:10  voba
// - formattig
//
// Revision 1.94  2003/06/11 15:50:19  voba
// - speed improvement
//
// Revision 1.93  2003/06/11 15:46:01  voba
// - improvement
//
// Revision 1.92  2003/06/06 12:26:17  voba
// - improvement _expand all tree
//
// Revision 1.91  2003/06/05 12:47:53  demon
// - add: добавлен метод SetRootAndCountView, позволяющий присваивать
// количество видимых элементов, одновременно с присваиванием root
//
// Revision 1.90  2003/06/03 15:35:49  voba
// - bug fix
//
// Revision 1.89  2003/06/02 15:10:53  law
// - cleanup: перед интерфейсными параметрами поставлен модификатор const.
//
// Revision 1.88  2003/06/02 14:54:54  law
// - new property: IeeTreeView.NodeFlags.
//
// Revision 1.87  2003/05/30 17:10:31  voba
// - rename l3*Flag to l3*Mask
//
// Revision 1.86  2003/05/30 16:58:35  nikitin75
// - bug fix
//
// Revision 1.85  2003/04/16 09:25:44  voba
// - bug fix
//
// Revision 1.84  2003/02/10 16:06:20  law
// - cleanup: удалена процедура l3NodeActionL2FA - надо вместо нее использовать l3L2NA.
//
// Revision 1.83  2002/11/11 13:47:52  law
// - bug fix: AV при (_fRootNode = nil).
//
// Revision 1.82  2002/11/11 13:29:18  voba
// - bug fix
//
// Revision 1.81  2002/11/10 16:38:25  voba
// - new behavior: добавил поддержку скрытых нод
//
// Revision 1.80  2002/07/29 16:01:58  law
// - new behavior: возможность удаления атрибутов меток.
//
// Revision 1.79  2002/07/23 12:11:59  law
// - bug fix: иногда GetNode возвращала nil.
//
// Revision 1.78  2002/07/23 11:57:31  voba
// -bu fix : ошибка при отрисовке
//
// Revision 1.77  2002/07/22 16:11:56  voba
// - bug fix.
//
// Revision 1.76  2002/07/22 15:55:01  law
// - new prop: Il3Tree._ShowRoot.
//
// Revision 1.75  2002/07/22 13:54:58  law
// - rename type: TSetBitType -> Tl3SetBitType.
//
// Revision 1.74  2002/07/19 08:33:17  law
// - new prop: IevSub.Tree.
//
// Revision 1.73  2002/07/19 07:16:03  law
// - new prop: Il3Tree.RootNode.
//
// Revision 1.72  2002/07/18 12:34:56  voba
// no message
//
// Revision 1.71  2002/07/11 11:53:11  law
// - new behavior: исправляем несинхронизированный счетчик обновлений.
//
// Revision 1.70  2002/07/09 16:08:55  law
// no message
//
// Revision 1.69  2002/06/18 15:50:04  voba
// -new behavior : remove property LevelIndent
//
// Revision 1.68  2002/05/29 14:05:04  voba
// - bug fix: защищаем изменение времени ожидания.
//
// Revision 1.67  2002/03/14 17:09:40  voba
// -add NodeMove Event
//
// Revision 1.66  2002/03/01 09:05:59  voba
// no message
//
// Revision 1.65  2001/12/27 15:32:27  law
// - rename proc: l3GetStrLen -> l3StrLen.
//
// Revision 1.64  2001/12/27 15:03:33  law
// - new constructors: добавлены два конструктора Tl3String.Make.
//
// Revision 1.63  2001/11/21 12:12:06  voba
// no message
//
// Revision 1.62  2001/08/31 11:38:45  law
// - cleanup & comments.
//
// Revision 1.61  2001/08/30 09:58:07  law
// - rename type: TDirection -> Tl3Direction.
//
// Revision 1.60  2001/06/27 11:59:30  law
// - cleanup: удалены директивы safecall.
//
// Revision 1.59  2001/06/26 16:28:37  law
// - comments & cleanup.
//
// Revision 1.58  2001/06/26 13:33:53  law
// - comments & cleanup.
//
// Revision 1.57  2001/05/07 06:53:25  law
// - cleanup.
//
// Revision 1.56  2001/04/23 11:42:31  voba
// bug fix
//
// Revision 1.55  2001/04/05 08:53:51  law
// - _move: функции l3TestFlag & Co переехали в модуль l3Bits.
//
// Revision 1.54  2001/02/21 13:17:10  voba
// no message
//
// Revision 1.53  2000/12/20 10:30:13  voba
// Заменил кое-где подитеративную функцию на процедуру что бы компилятор не ругался
//
// Revision 1.52  2000/12/19 15:06:27  law
// - #13#10 -> cc_EOL.
//
// Revision 1.51  2000/12/15 15:19:02  law
// - вставлены директивы Log.
//

{$F+,X+,I-,S-}
{$I l3Define.inc }
{$IfDef ItsVoba}
 {$Warnings On}
 {$Hints On}
{$EndIf ItsVoba}

interface

uses
  Classes,
  SysUtils,

  l3Interfaces,
  l3Units,
  l3Base,
  l3Types,
  l3DatLst,
  l3TreeInterfaces,
  l3Tree_TLB,
  l3Nodes,
  l3InternalInterfaces,
  l3LongintList,
  l3NotifyPtrList
  ;

const
  DefLevelSlash: PAnsiChar ='\';

type
  Tl3Tree = class(Tl3ItemsStorage,
                  Il3SimpleTree,
                  Il3Tree,
                  Il3ObjectWrap,
                  Il3NodeNotifyRecipient,
                  Il3TreeSource,
                  Il3Window)
   {* Структура данных "дерево". Используется как курсор для видимых элементов. }
   private
    f_fCountView    : Longint;
   //protected
    f_RootNode       : Il3RootNode;

    f_CurrentNode    : Il3Node;
    f_CurrentItem    : Longint;
    f_CurrentAbsItem : Longint;
    f_CurrentAbsNode : Il3Node;

    f_ShowRoot       : Boolean;
    f_CommonExpanded : Boolean;
    f_LevelSlash     : Tl3String;

    f_FlagsList      : Tl3LongintList;

    f_MovedIndex     : Integer;

   protected
   // interface methods
      procedure Invalidate;
        {-}
      procedure InvalidateRect(const aRect: Tl3_Rect);
        {-}
   protected
   // property methods
    procedure pm_SetfCountView(aValue: Integer);
      {-}
    function  GetObject: TObject;
     {* - получить объект из обертки. }
    procedure Set_CRootNode(const aNode : Il3RootNode);
    function  Get_CRootNode : Il3RootNode; virtual;
    function  Get_RootNode : Il3SimpleRootNode;
    procedure Set_RootNode(const aValue: Il3SimpleRootNode);
      {-}

    function  SelectCntFix(const aNode : Il3Node; OldFlag,  NewFlag : integer) : Integer;
    function  GetCurrent : Longint;
    function  GetChildSelect(Index: Longint): Boolean;

    function  Get_Strings(Index: Longint) : PAnsiChar; virtual;
    function  GetItemPasStr(Index: Longint) : AnsiString; virtual;
    procedure SetItemString(Index: Longint; Value : PAnsiChar); virtual;

    function  Get_Flags(Index: Longint) : Integer; override;
    procedure SetFlags(Index: Longint; Value : Integer); override;

    function  Get_NodeFlags(const aNode : Il3Node) : Integer; virtual;
    procedure Set_NodeFlags(const aNode : Il3Node; aValue : Integer); virtual;

    procedure SetFlagMaskPrim(aAbsIndex: Longint; Const aNode : Il3Node; aFlagMask : integer; aMode : Tl3SetBitType);
    function  TestFlagMaskPrim(aAbsIndex: Longint; Const aNode : Il3Node; aFlagMask : integer) : Boolean;
    function  Get_CommonExpanded: Boolean;
    procedure Set_CommonExpanded(Value : Boolean);

    function  ChangeExpandPrim(const aNode : Il3Node; Mode : Tl3SetBitType) : Boolean;
    procedure ExpandAllInSubDirPrim(const RNode : Il3Node; Mode : Boolean);
    function  Get_SelectedNode(const aNode : Il3Node): Boolean;
    //procedure Set_SelectedNode(aNode : Il3Node; Value : Boolean);
    function  Get_ShowRoot: Boolean;
    procedure Set_ShowRoot(Value : Boolean);
     {-}
    function  pm_GetCount : Longint; override;
    procedure pm_SetCount(Value : Longint); override;
     {-}
    function  ConcatFlags(aTreeFlag, aNodeFlag : Integer) : Integer;
     {-}
    procedure SplitFlags(aFlags : Integer; var aTreeFlag : Integer; var aNodeFlag : Integer);
     {-}
    procedure RootChanged(const anOldRoot, aNewRoot: Il3SimpleRootNode);
      {-}
      procedure SetLevelSlash(const aSt: AnsiString);
        {-}
    procedure Cleanup; override;
      {-}
   protected
   // interface methods
     // Il3TreeSource
     function  Get_Tree: Il3Tree;
     procedure Set_Tree(const aValue: Il3Tree);
       {-}
   protected
   // protected properties
     property f_CountView: Integer
       read f_fCountView
       write pm_SetfCountView;
       {-}
     property fRootNode: Il3RootNode read f_RootNode; 
   public
    constructor Create;
      reintroduce;
      virtual;
      {-}
    class function Make: Il3SimpleTree;
      {-}
    class function IsCacheable: Bool;
      override;
      {-}
    procedure DoChanged;
      override;
      {-}
    procedure ChangedEx(aCountView: Integer = l3_NeedCountView);
     {-}
    function MakeDataObject(const aData   : Il3SimpleNode;
                            const aBitmap : IUnknown): IDataObject;
     virtual;
      {* объект данных дерева. aData - текущий элемент списка. aBitmap (Il3Bitmap) - картинка для перетаскивания. }
    function DoCanAcceptData(const aTargetNode : Il3SimpleNode;
                             const aData       : Tl3TreeData;
                             var aProcessed    : Boolean): Boolean;
      virtual;
      {-}
    function DoDropData(const aTargetNode : Il3SimpleNode;
                        const aData       : Tl3TreeData;
                        var aProcessed    : Boolean): Boolean;
      virtual;
      {-}
    function CanAcceptData(const aTargetNode : Il3SimpleNode;
                           const aData       : Tl3TreeData): Boolean;
      {-}
    function DropData(const aTargetNode : Il3SimpleNode;
                      const aData       : Tl3TreeData): Boolean;
      {-}
    procedure Notify(aOperation : Integer; const aNode : Il3SimpleNode);
      {-}
    procedure DoNotify(aOperation : Integer; const aNode : Il3SimpleNode);
      virtual;
      {-}
    function DeleteSelectedNodes: Boolean;
    {* Удалить выделенные узлы }
    procedure ClearSelected;
      {-}
    function  MoveNode(const aNode : Il3SimpleNode;
                       aDirection  : Tl3Direction): Boolean;
     overload;
     {* - переместить узел. }
    function  MoveNode(const aNode: Il3Node; aDirection : Tl3Direction) : Boolean;
     overload;
     {* - переместить узел. }
    function MoveSelectedNodes(aDirection : Tl3Direction) : Boolean;
     {* переместить выделенные узлы }
    function  InsertNode(const aParentNode : Il3Node;
                         const aNode       : Il3Node): Il3Node; virtual;
     {* - вставить новый узел. }
    function  InsertNodeBefore(const aNextNode: Il3Node; const aNode : Il3Node) : Il3Node; virtual;
     {* - вставить новый узел перед указанным. }
    procedure ChangeName(const aNode: Il3Node; NewTitle : PAnsiChar); virtual;
     {* - изменить название узла. }
    procedure Clear; override;
     {* - очистить дерево. }
    function  GetLevel(const aNode : Il3SimpleNode) : Integer;
     overload;
     {-}
    function  GetLevel(const aNode : Il3Node) : Integer;
     overload;
     {-}
    function  GetLines(const aNode: Il3SimpleNode): Integer;
     overload;
     {* - маска для рисования линий (надо смотреть реализацию). }
    function  GetLines(const aNode : Il3Node) : Integer;
     overload;
     {-}
    procedure Set_SelectedNode(const aNode : Il3Node; Value : Boolean);
     {-}
    procedure SelectInterval(aFirstIndex, aLastIndex: Longint;
                             aMode: Tl3SetBitType;
                             aCleanOther: Boolean);
      {* - выделяет/развыделяет узлы на указанном интервале. }
    function  IsSelect(const aNode : Il3Node) : Boolean;
     {* - является ли узел отмеченным. }
    function  IsChildSelect (const aNode : Il3Node) : Boolean;
     {-}
    function  IsExpanded(const aNode: Il3Node): Boolean;
     overload;
     {* - раскрыт ли узел. }
    function  IsExpanded(const aNode: Il3SimpleNode): Boolean;
     overload;
     {* - раскрыт ли узел. }

    function  IsAllParentExpanded(const aNode: Il3Node): Boolean;
     overload;
     {* - раскрыты ли родители узела. }

    function  IsVisible(const aNode : Il3Node) : Boolean;
     {* - не скрытый ли узел. }
    function  IsRoot(const aNode: Il3SimpleNode): Boolean;
      overload;
      {* - является ли узел корневым для дерева. }
    function  IsRoot(const aNode : Il3Node) : Boolean;
      overload;
     {* - является ли узел корневым для дерева. }
    function  IsFirstVis(const aNode: Il3Node) : Boolean;
      overload;
     {* - является ли узел первым видимым в ветке. }
    function  IsFirstVis(const aNode: Il3SimpleNode): Boolean;
      overload;
      {* - является ли узел первым видимым в ветке. }
    function  IsLastVis(const aNode: Il3Node) : Boolean;
      overload;
     {* - является ли узел последним видимым в ветке. }
    function  IsLastVis(const aNode: Il3SimpleNode): Boolean;
      overload;
      {* - является ли узел последним видимым в ветке. }

    function  HasVisibleChildren(const aNode : Il3Node) : Boolean;
      overload;
     {* - Есть ли видимые дети у aNode. }
    function  HasVisibleChildren(const aNode: Il3SimpleNode) : Boolean;
      overload;
      {* - есть ли видимые дети у aNode. }

    procedure PrintOutToStream(Const aStream   : TStream;
                                  aWithNumber  : Boolean;
                                  aIterMode    : integer = 0;
                            const aLevelIndent : AnsiString = ' ');

    procedure PrintTreeList(Const aFileName    : TFileName;
                                  aWithNumber  : Boolean;
                                  aIterMode    : integer = 0;
                            const aLevelIndent : AnsiString = ' ');

    function  Iterate(Action             : Tl3NodeAction;
                      IterMode           : integer = 0;
                      const aSubRootNode : Il3Node = nil;
                      const aFromNode    : Il3Node = nil) : Il3Node;
      reintroduce;
     {* - перебрать все узлы. IterMode см. imExpandOnly etc. }
    function  IterateF(Action             : Tl3NodeAction;
                       IterMode           : Integer = 0;
                       const aSubRootNode : Il3Node = nil;
                       const aFromNode    : Il3Node = nil) : Il3Node;
     {* - перебрать все узлы и освободить заглушку для Action. }
    function  SimpleIterateF(Action             : Tl3SimpleNodeAction;
                             IterMode           : integer = 0;
                             const aSubRootNode : Il3SimpleNode = nil): Il3SimpleNode;
     {* - перебрать все узлы и освободить заглушку для Action. IterMode: imCheckResult, imParentNeed}
    {Cursor}
    procedure CursorTop;
     {* - переставить курсор на первый видимый элемент. }

    //function  GetLastOpenIn(const aRootNode : Il3Node) : Il3Node;
    function  GetNext(const aCurNode : Il3Node) : Il3Node;
    function  GetPrev(const aNode: Il3SimpleNode): Il3SimpleNode;
      overload;
      {* - предыдущий узел. Зачем-то используется в CharToItem. }
    function  GetPrev(const aCurNode : Il3Node) : Il3Node;
      overload;
    function  GetIndex(const RNode : Il3SimpleNode; const aSubRootNode : Il3SimpleNode = nil) : Integer;
      overload;
      {-}
    function  GetIndex(const RNode : Il3Node; const aSubRootNode : Il3Node = nil) : Integer;
      overload;
      {-}

    function  Get_CountView : Longint;
    function  GetAbsCurrent : Longint;

    function  CountViewItemsInSubDir(const RNode : Il3Node) : Longint;
      overload;
    function  CountViewItemsInSubDir(const aNode : Il3SimpleNode): Integer;
      overload;
      {* - зачем-то используется визуалкой в ShowMoreChildrenOnScreen. }
    procedure ExpandSubDir(const aNode : Il3SimpleNode = nil;
                           anExpand    : Boolean = true;
                           aDeepLevel  : Byte = 0);
      overload;
      {* - развернуть/свернуть узлы. }
    procedure ExpandSubDir(const RNode : Il3Node = nil;
                           Expand      : Boolean = true;
                           DeepLevel   : Byte = 0);
      overload;
      {* - развернуть/свернуть узлы. }
    procedure ExpandAllLevels(Level : Word; Mode : Boolean);
    procedure SelectAllNodes(aMode : Tl3SetBitType);

    function MakeNodeVisible(const aNode : Il3Node): Integer;
      overload;
    function MakeNodeVisible(const aNode: Il3SimpleNode): Integer;
      overload;
      {* - зачем-то используется визуалкой в CharToItem,
           видимо для перемещения курсора на узел. }
    function  GetByPath(const aPathStr : Tl3WString) : Il3Node;
    function  GetPartPath(var aPathStr : Tl3WString) : Il3Node;
    function  GetPartPathStr(Var aPathStr : AnsiString) : Il3Node;
    function  ChangeExpand(const aNode : Il3SimpleNode;
                           aMode       : Tl3SetBitType;
                           aForceMode  : Boolean = False) : Boolean;
      overload;
      {* - меняет развернутость узла. }
    function  ChangeExpand(const RNode : Il3Node; Mode : Tl3SetBitType; aForceMode : Boolean = False) : Boolean;
      overload;
      {* - меняет развернутость узла. }

    //function  GetFullPathStr(const RNode: Il3Node) : AnsiString;
    //procedure GetFullPath(RNode : Il3Node; aPath : PAnsiChar; Var MaxLen : Word);
    //function  GetFullPathAlloc(const RNode: Il3Node) : PAnsiChar;

    function  SearchByName(const aFirstNode : Il3Node; aNameStr : PAnsiChar; aIterMode : integer) : Il3Node;
    function  SearchNameBegin(const aFirstNode : Il3SimpleNode;
                              aSrchStr         : PAnsiChar;
                              aIterMode        : Integer): Il3SimpleNode;
      overload;
      {* - зачем-то используется визуалкой в CharToItem. }
    function  SearchNameBegin(const aFirstNode : Il3Node; aSrchStr : PAnsiChar; aIterMode : integer) : Il3Node;
      overload;
    function  SearchNameOccur(const aFirstNode : Il3Node; aSrchStr : PAnsiChar; aIterMode : integer) : Il3Node;
      overload;
    function  SearchNameOccur(const aFirstNode : Il3SimpleNode;
                                aSrchStr         : PAnsiChar;
                                aIterMode        : Integer): Il3SimpleNode;
      overload;
      {* - зачем-то используется визуалкой в SearchOccurStr,
             который сейчас никем не используется. }
    function  FindNodeByParam(const Parent : Il3Node; Param : Integer; aIterMode : integer) : Il3Node;
              {FindMode is IterMode f_lags}

    procedure SetFlagMask(aAbsIndex: Longint; aFlagMask : integer; aMode : Tl3SetBitType); overload;
    procedure SetFlagMask(const aRNode : Il3Node; aFlagMask : integer; aMode : Tl3SetBitType); overload;

    function  TestFlagMask(Const aNode : Il3Node; aFlagMask : integer) : Boolean; overload;
    function  TestFlagMask(aAbsIndex: Longint; aFlagMask : integer) : Boolean;    overload;

    procedure SetAllFlag(aMode : Tl3SetBitType; aFlags : Integer); override;
    procedure SetBranchFlag(const aParentNode : Il3SimpleNode;
                            aMode             : Tl3SetBitType;
                            aFlagsMask        : Integer;
                            anIterMode        : Integer);
      overload;
      {* - зачем-то используется визуалкой в ExpandNode. }
    procedure SetBranchFlag(const ParentNode : Il3Node; Mode : Tl3SetBitType; aFlagsMask : integer; IterMode : integer);
      overload;
      {-}

    function  GetNextSetFlag(const aCurNode: Il3Node; aFlag : integer) : Il3Node;  //vvv
    function  GetNextSelect(const aCurNode: Il3Node) : Il3Node;
    function  Get_CNodes(aInd : Integer) : Il3Node;
    function  Get_Nodes(aInd : Integer) : Il3SimpleNode;
    function  GetAbsIndex(const aCurNode: Il3Node) : Integer;

    procedure SetFlagsByAbsIndex(aAbsIndex :Integer; aValue : Integer);
    function  GetFlagsByAbsIndex(aAbsIndex :Integer) : Integer;
    function  GetNodeByAbsIndex(aAbsIndex :Integer) : Il3Node;

    procedure SetRootAndCountView(const aNode : Il3RootNode; aCountView : Longint);

    function  Wake: Boolean; virtual;
      {-}
    procedure MarkNeedCountView;
      {-}
    property  Strings[Index: Longint] : PAnsiChar read Get_Strings write SetItemString;
     {* - строчки узлов. }
    property  PasStr[Index: Longint] : AnsiString read GetItemPasStr;
     {-}
    property  Nodes[Index: Longint]: Il3Node
     read Get_CNodes;
     default;
     {* - узлы по индексу. }
    property  NodeFlags[const Node : Il3Node]: Integer
     read Get_NodeFlags
     write Set_NodeFlags;
     {* - флаги узлов. (см. nfSelected etc}
    property  SelectedNode[const Node : Il3Node]: Boolean
     read Get_SelectedNode
     write Set_SelectedNode;
     {* - выделенные узлы. }
    property  ShowRoot: Boolean
     read f_ShowRoot
     write Set_ShowRoot;
     {* - отображать ли корневой узел. }
    property  CommonExpanded : Boolean
     read f_CommonExpanded
     write Set_CommonExpanded
     default False;
    property  RootNode: Il3RootNode
     read Get_CRootNode
     write Set_CRootNode;
     {* - корневой узел дерева. }
    property  CurrentNode: Il3Node
     read f_CurrentNode;
     {* - текущий узел делева. }
    property  CurrentItem: LongInt
     read GetCurrent;  //write SetCurrent;
     {* - индекс текущего узла. }
    property  CountView: Longint
     read Get_CountView;
     {* - текущее количество показываемых элементов. }
    property  ChildSelected[Ind : Longint]: Boolean
     read GetChildSelect;
     {-}
    property  LevelSlash: Tl3String
     read f_LevelSlash;
     {* - строка для разделения уровней. }
  end;//Tl3Tree

implementation

uses
  l3Chars,
  l3Const,
  l3String,
  l3Bits,
  l3InterfacesMisc,
  l3NodeList
  ;

const
 nfChangeViewCountFlagSet = nfExpanded or nfHidden;

// start class Tl3Tree

procedure Tl3Tree.DoNotify(aOperation : Integer; const aNode : Il3SimpleNode);
var
 lNodeIndex : Integer;
 lSelCnt    : Integer;
 lCnt       : Integer;
 lFlag      : Integer;
 lDelPos    : Integer;
 l_Index    : Integer;
 l_Notify   : Il3NodeNotifyRecipient;
 l_Node     : Il3Node;
begin
 if (NotifiedObjList <> nil) and
    (NotifiedObjList.Count > 0) then
  for l_Index := 0 to Pred(NotifiedObjList.Count) do
   if l3BQueryInterface(IUnknown(NotifiedObjList.Items[l_Index]), Il3NodeNotifyRecipient, l_Notify) then
    try
     l_Notify.Notify(aOperation, aNode);
    finally
     l_Notify := nil;
    end;//try.finally

 if aOperation in [ntInsert, ntDelete, ntDataChange, ntMoveEnd,
                   ntClear, ntClearItem,
                   ntChildClear, ntChildInsert, ntCountChange,
                   ntChangeItemData, ntResortChild] then
  Modified := True;


 if not (aOperation in [ntInsert, {ntRemove,} ntDelete, ntDeleteDone, ntChildInsert,
                        ntChildClear, ntMoveBegin, ntMoveEnd])
    or ((f_MovedIndex >= 0) and (aOperation <> ntMoveEnd)) then
  Exit;

 l_Node := aNode As Il3Node;

 case aOperation of
  ntInsert :
   begin
    CursorTop;
    lNodeIndex := GetAbsIndex(l_Node);
    lCnt := l_Node.AllChildrenCount + 1;
    while lCnt > 0 do
    begin
     if f_CommonExpanded and (lNodeIndex >= f_FlagsList.Count) then
      f_FlagsList.Add(0)
     else
      f_FlagsList.Insert(lNodeIndex, 0);
     Dec(lCnt);
    end;

    MarkNeedCountView;

    ItemChangeNotify;
   end;

  ntChildInsert :
   begin
    lNodeIndex := GetAbsIndex(l_Node);
    lCnt := l_Node.AllChildrenCount;
    While lCnt > 0 do
    begin
     f_FlagsList.Insert(Succ(lNodeIndex), 0);
     Dec(lCnt);
    end;

    ItemChangeNotify;
   end;

  ntDelete :
   begin
    lNodeIndex := GetAbsIndex(l_Node);
    //MarkNeedCountView;
    ItemChangeNotify;

    lSelCnt := 0;
    lCnt := l_Node.AllChildrenCount + 1;
    While lCnt > 0 do
    begin
     If l3TestMask(Integer(f_FlagsList.Items[lNodeIndex]),nfSelected) then Inc(lSelCnt);
     f_FlagsList.Delete(lNodeIndex);
     Dec(lCnt);
    end;

    if {(f_SelectCount > 0) and} (lSelCnt > 0) then
     SetSelectCount(f_SelectCount - lSelCnt);

   end;

  ntChildClear :
   begin
    lNodeIndex := GetAbsIndex(l_Node);
    lCnt := l_Node.AllChildrenCount;
    While lCnt > 0 do
    begin
     f_FlagsList.Delete(Succ(lNodeIndex));
     Dec(lCnt);
    end;

    ItemChangeNotify;
   end;

  ntMoveBegin  :
   begin
    lNodeIndex := GetAbsIndex(l_Node);
    f_MovedIndex := lNodeIndex;
    Changing;
   end;

  ntMoveEnd :
   begin
    CursorTop;
    lNodeIndex := GetAbsIndex(l_Node);
    try
     lCnt := l_Node.AllChildrenCount;
     if lNodeIndex < f_MovedIndex then
     begin
      lDelPos := f_MovedIndex + lCnt;
      While lCnt >= 0 do
      begin
       lFlag := Integer(f_FlagsList.Items[lDelPos]);
       f_FlagsList.Delete(lDelPos);
       f_FlagsList.Insert(lNodeIndex, lFlag);
       Dec(lCnt);
      end;
     end
     else
     begin
      While lCnt >= 0 do
       begin
        lFlag := Integer(f_FlagsList.Items[f_MovedIndex + lCnt]);
        f_FlagsList.Delete(f_MovedIndex + lCnt);
        f_FlagsList.Insert(lNodeIndex + lCnt, lFlag);
        Dec(lCnt);
       end;
      end;
     CursorTop;
    finally
     Changed;
    end;
    f_MovedIndex := -1;
   end;
 end;

 CursorTop;
end;

procedure Tl3Tree.Notify(aOperation : Integer; const aNode : Il3SimpleNode);
begin
 DoNotify(aOperation, aNode);
end;

procedure Tl3Tree.DoChanged;
begin
 ChangedEx;
end;

function Tl3Tree.MakeDataObject(const aData   : Il3SimpleNode;
                                const aBitmap : IUnknown): IDataObject;
  // virtual;
  {* объект данных дерева. aData - текущий элемент списка. aBitmap (Il3Bitmap) - картинка для перетаскивания. }
begin
 Result := nil;
end;

function Tl3Tree.DoCanAcceptData(const aTargetNode : Il3SimpleNode;
                                 const aData       : Tl3TreeData;
                                 var aProcessed    : Boolean): Boolean;
  // virtual;
  {-}
begin
 Result := False;
 aProcessed := False;
end;//DoCanAcceptData

function Tl3Tree.DoDropData(const aTargetNode : Il3SimpleNode;
                            const aData       : Tl3TreeData;
                            var aProcessed    : Boolean): Boolean;
  // virtual;
  {-}
begin
 Result := False;
 aProcessed := False;
end;//DoDropData

function Tl3Tree.CanAcceptData(const aTargetNode : Il3SimpleNode;
                               const aData       : Tl3TreeData): Boolean;
var
 l_Processed: Boolean;
begin
 Result := DoCanAcceptData(aTargetNode, aData, l_Processed);
 if not l_Processed and (aTargetNode <> nil) then
  Result := aTargetNode.CanAcceptData(aData);
end;//CanAcceptData

function Tl3Tree.DropData(const aTargetNode : Il3SimpleNode;
                          const aData       : Tl3TreeData): Boolean;
var
 l_Processed: Boolean;
begin
 Result := DoDropData(aTargetNode, aData, l_Processed);
 if not l_Processed then
  Result := aTargetNode.DropData(aData);
end;//DropData

procedure Tl3Tree.ChangedEx(aCountView: Integer = l3_NeedCountView);
  {-}
begin
 // В некоторых местах вызывается предок дабы избежать лишних рассчетов
 // Нужно быть осторожным при исправлении этой функции
 try
  if (ChangeCount <= 0) then //это работает когда в скобках Changing/_Changed на визуалке подменили дерево
   ChangeCount := 1;
  if (ChangeCount = 1) then
  begin
   if (aCountView <> l3_NotChangeCountView) then
   begin
    f_CountView := aCountView;
    CursorTop;
   end;//aCountView <> l3_NotChangeCountView
  end;//fUpdateCount = 1
 finally
  inherited DoChanged;
 end;//try..finally
end;

function Tl3Tree.GetLevel(const aNode : Il3SimpleNode) : Integer;
 //overload;
 {-}
begin
 Result := aNode.GetLevelFor(Get_RootNode);
end;

function  Tl3Tree.GetLevel(const aNode : Il3Node) : Integer;
 //overload;
 {-}
begin
 Result := aNode.GetLevelFor(f_RootNode);
end;

function Tl3Tree.GetLines(const aNode: Il3SimpleNode): Integer;
 //overload;
 {-}
begin
 Result := GetLines(aNode As Il3Node); 
end;

function  Tl3Tree.GetLines(const aNode : Il3Node) : Integer;
var
 lCNode  : Il3Node;
 //N       : Integer;
begin
 with f_RootNode do
  if IsSame(aNode) then
   Result := 0
  else
  begin
   Result := 1;
   //N := 1;
   lCNode := aNode.ParentNode;
   if (lCNode = nil) then
    Result := 0
   else
   begin
    while not IsSame(lCNode) do
    begin
     Result := Result shl 1;
     If not IsLastVis(lCNode) then l3SetBit(Result, 0);

     lCNode := lCNode.ParentNode;
     If lCNode = nil then Exit;
     //Inc(N);
    end;
   end;//lCNode = nil
  end;//IsSame(aNode)
end;

constructor Tl3Tree.Create;
begin
 inherited Create;
 f_CurrentNode    := nil;
 f_CurrentItem    := -1;
 f_CurrentAbsItem := -1;
 f_CountView      := l3_NeedCountView;
 f_LevelSlash     := Tl3String.Make(l3PCharLen(DefLevelSlash));
 f_FlagsList      := Tl3LongintList.Make;
 f_MovedIndex     := -1;
end;

class function Tl3Tree.Make: Il3SimpleTree;
 {-}
var
 l_Tree : Tl3Tree;
begin
 l_Tree := Create;
 try
  Result := l_Tree;
 finally
  l3Free(l_Tree);
 end;//try..finally
end;

procedure Tl3Tree.Cleanup;
begin
 inherited;
 f_CurrentNode := nil;
 Clear;
 l3Free(f_LevelSlash);
 f_CurrentItem := -1;
 f_CurrentAbsItem := -1;
 MarkNeedCountView;
 l3Free(f_FlagsList);
 f_CurrentAbsNode := nil;
 f_RootNode := nil;
 f_ShowRoot := False;
 f_CommonExpanded := False;
end;

class function Tl3Tree.IsCacheable: Bool;
  //override;
  {-}
begin
 Result := true;
end;

procedure Tl3Tree.Invalidate;
  {-}
var
 l_Index  : Integer;
 l_Window : Il3Window;
begin
 if (NotifiedObjList <> nil) and
    (NotifiedObjList.Count > 0) then
  for l_Index := 0 to Pred(NotifiedObjList.Count) do
   if l3BQueryInterface(IUnknown(NotifiedObjList.Items[l_Index]), Il3Window, l_Window) then
    try
     l_Window.Invalidate;
    finally
     l_Window := nil;
    end;//try.finally
end;

procedure Tl3Tree.InvalidateRect(const aRect: Tl3_Rect);
  {-}
begin
 Invalidate;
end;

procedure Tl3Tree.pm_SetfCountView(aValue: Integer);
  {-}
var
 l_Index  : Integer;
 l_Notify : Il3CountViewChangeRecipient;
begin
 if (f_fCountView <> aValue) then
 begin
  f_fCountView := aValue;
  if (f_fCountView >= 0) then
  begin
   if (NotifiedObjList <> nil) and
      (NotifiedObjList.Count > 0) then
    for l_Index := 0 to Pred(NotifiedObjList.Count) do
     if l3BQueryInterface(IUnknown(NotifiedObjList.Items[l_Index]), Il3CountViewChangeRecipient, l_Notify) then
      try
       l_Notify.CountViewChanged(f_fCountView);
      finally
       l_Notify := nil;
      end;//try.finally
  end;//f_fCountView >= 0
 end;//f_fCountView <> aValue
end;

function Tl3Tree.GetObject: TObject;
  {* - получить объект из обертки. }
begin
 Result := Self;
end;

procedure Tl3Tree.SetRootAndCountView(const aNode : Il3RootNode; aCountView : Longint);
begin
 Changing;
 try
  Set_CRootNode(aNode);
  f_CountView := aCountView;
 finally
  inherited DoChanged;
 end;//try..finally
end;

function Tl3Tree.Wake: Boolean;
  {-}
var
 l_Wake : Il3Wake;
begin
 Result := False;
 if l3BQueryInterface(RootNode, Il3Wake, l_Wake) then
  try
   if l_Wake.Wake then
   begin
    Result := true;
    f_CountView := l3_DelayedCountView;
    f_FlagsList.Count := Count;
   end;//l_Wake.Wake
  finally
   l_Wake := nil;
  end;//try..finally
end;
  
procedure Tl3Tree.RootChanged(const anOldRoot, aNewRoot: Il3SimpleRootNode);
  {-}

 function lp_NeedNotify: Boolean;
 begin
  Result := not l3IEQ(anOldRoot, aNewRoot) and (NotifiedObjList <> nil) and
   (NotifiedObjList.Count > 0);
 end;//lp_NeedNotify

var
 l_Index : Integer;
 l_Spy   : Il3RootSpy;
 l_Item  : IUnknown;
begin
 if lp_NeedNotify then
  with NotifiedObjList do
   for l_Index := 0 to Pred(Count) do
   begin
    l_Item := IUnknown(Items[l_Index]);
    if Supports(l_Item, Il3RootSpy, l_Spy) and (l_Item = l_Spy) then
     l_Spy.RootChanged(anOldRoot, aNewRoot);
   end;//for l_Index := 0 to Pred(Count) do
end;//RootChanged

procedure Tl3Tree.SetLevelSlash(const aSt: AnsiString);
  {-}
begin
 LevelSlash.AsString := aSt;
end;

procedure Tl3Tree.MarkNeedCountView;
  {-}
begin
 f_CountView := l3_NeedCountView;
end;

function Tl3Tree.Get_RootNode : Il3SimpleRootNode;
var
 l_Root : Il3RootNode;
begin
 l_Root := RootNode;
 if (l_Root = nil) then
  Result := nil
 else
  Result := l_Root As Il3SimpleRootNode;
end;

procedure Tl3Tree.Set_RootNode(const aValue: Il3SimpleRootNode);
  {-}
var
 l_Root : Il3RootNode;  
begin
 if Supports(aValue, Il3RootNode, l_Root) then
  try
   RootNode := l_Root;
  finally
   l_Root := nil;
  end//try..finally
 else
  RootNode := nil;
end;

procedure Tl3Tree.Set_CRootNode(const aNode : Il3RootNode);
var
 l_OldRoot : Il3SimpleRootNode;
begin
 if l3IEQ(f_RootNode, aNode) then Exit;
 Changing;
 try
  If f_RootNode <> nil then
  begin
   f_RootNode.As_Il3ChangeNotifier.Unsubscribe(Il3ChangeRecipient(Self));
   f_RootNode.As_Il3ChangeNotifier.Unsubscribe(Il3NodeNotifyRecipient(Self));
   f_FlagsList.Clear;
   f_SelectCount := 0;
  end;

  if (f_RootNode = nil) then
   l_OldRoot := nil
  else
   l_OldRoot := f_RootNode As Il3SimpleRootNode;
  f_RootNode := aNode;

  If f_RootNode <> nil then
  begin
   f_FlagsList.Count := Count;
   f_RootNode.As_Il3ChangeNotifier.Subscribe(Il3ChangeRecipient(Self));
   f_RootNode.As_Il3ChangeNotifier.Subscribe(Il3NodeNotifyRecipient(Self));
   CursorTop;
   ChangeExpandPrim(f_RootNode, sbSelect);
  end;
 finally
  Changed;
 end;//try..finally
 if (f_RootNode = nil) then
  RootChanged(l_OldRoot, nil)
 else
  RootChanged(l_OldRoot, f_RootNode As Il3SimpleRootNode);
end;

function Tl3Tree.Get_CRootNode : Il3RootNode;
begin
 if (f_RootNode = nil) then
 begin
  f_RootNode := MakeNode('*', Tl3RootNode) as Il3RootNode;
  if (f_RootNode <> nil) then
  begin
   f_FlagsList.Count := 1;
   f_RootNode.As_Il3ChangeNotifier.Subscribe(Il3ChangeRecipient(Self));
   f_RootNode.As_Il3ChangeNotifier.Subscribe(Il3NodeNotifyRecipient(Self));
   CursorTop;
   ChangeExpandPrim(f_RootNode, sbSelect);
   RootChanged(nil, f_RootNode As Il3SimpleRootNode);
  end;//fRootNode <> nil
 end;//fRootNode = nil
 Result := f_RootNode;
end;

function Tl3Tree.InsertNode(const aParentNode: Il3Node; const aNode : Il3Node): Il3Node;
begin
 Changing;
 try
  if (aParentNode = nil) then
  begin
   Set_CRootNode(aNode as Il3RootNode);
   Result := aNode;
  end
  else
   Result := aParentNode.InsertChild(aNode);
 finally
  Changed;
 end;
end;

function Tl3Tree.InsertNodeBefore(const aNextNode: Il3Node; const aNode : Il3Node): Il3Node;
begin
 try
  Changing;
  try
   Result := aNextNode.ParentNode.InsertChildBefore(aNextNode, aNode);
  finally
   Changed;
  end;
 except
  Result := nil;
 end;//try..except
end;

function Tl3Tree.MoveNode(const aNode : Il3SimpleNode;
                          aDirection  : Tl3Direction): Boolean;
 //overload;
 {* - переместить узел. }
begin
 Result := MoveNode(aNode As Il3Node, aDirection);
end;

function  Tl3Tree.MoveNode(const aNode: Il3Node; aDirection : Tl3Direction) : Boolean;
var
 lNodeWasLast : Boolean;
begin
 Result := False;
 with f_RootNode do
  if not Assigned(aNode) or
     not Assigned(aNode.ParentNode) or
     IsSame(aNode) or
     ((aDirection = dLeft) and IsSame(aNode.ParentNode)) then
   Exit;

 lNodeWasLast := aNode.IsLast;
 Result := aNode.Move(aDirection);

 if Result then
 begin
  case aDirection of
   dRight :
   begin
    ChangeExpand(aNode.ParentNode, sbSelect);
    //if aNode.HasChild then ChangeExpand(aNode, sbSelect);
   end;
   dLeft :
    if aNode.HasChild and not lNodeWasLast then
     ChangeExpand(aNode, sbSelect);
  end;
  CursorTop;
 end;//Result
end;

function Tl3Tree.MoveSelectedNodes(aDirection : Tl3Direction) : Boolean;
var
 l_Parent, l_Selected: Il3Node;
 l_EnableMove: Boolean;
 l_List: Tl3NodeList;
 i: Integer;
 function IsNestedNode(aParent, aNode: Il3Node): Boolean;
 var
  l_P: Il3Node;
 begin
  l_P:= aNode.ParentNode;
  while (l_P <> nil) and not l_P.IsSame(aParent) do
   l_P:= l_P.ParentNode;
  Result:= l_P <> nil;
 end; // IsNestedNode
begin
 { Двигать можно только те узлы, у которых один и тот же предок или они
   являются вложенными  }
 l_Selected:= GetNextSelect(nil);
 l_Parent:= l_Selected.ParentNode;
 l_EnableMove:= True;
 while l_Selected <> nil do
 begin
  if IsNestedNode(l_Parent, l_Selected) then
   l_Selected:= GetNextSelect(l_Selected)
  else
  begin
   l_EnableMove:= False;
   break
  end;
 end; // while l_Selected <> nil
 if l_EnableMove then
 begin
  Changing;
  try
   l_List:= Tl3NodeList.Make;
   try
    l_Selected:= GetNextSelect(nil);
    while l_Selected <> nil do
    begin
     case aDirection of
      dUp,
      dUpMax,
      dDown,
      dDownMax: ; // по вертикали пока не двигаем
      dLeft  :
       if l_Selected.ParentNode.IsSame(l_Parent) then
        l_List.Add(l_Selected);
      dRight :
       if l_Selected.ParentNode.IsSame(l_Parent) then
        MoveNode(l_Selected, aDirection);
     end; // case aDirection
     l_Selected:= GetNextSelect(l_Selected);
    end; // while l_Selected <> nil
    if aDirection = dLeft then
     for i:= l_List.Hi downto 0 do
      MoveNode(l_List[i], aDirection);
   finally
    l3Free(l_List);
   end;
  finally
   Changed;
  end;
 end; // l_EnableMove
 Result:= l_EnableMove;
end;

 procedure Tl3Tree.ChangeName(const aNode: Il3Node; NewTitle : PAnsiChar);
  begin
   Changing;
   try
    aNode.Text := l3PCharLen(NewTitle);
   finally
    Changed;
   end;
  end;

 procedure Tl3Tree.Clear;
  begin
   Changing;
   try
    If f_RootNode <> Nil then
    begin
     RootNode := Nil;
     f_CountView := 0;
     //FCount     := 0;
    end;
    Inherited Clear;
    Modified:=True;
   finally
    Changed;
   end; 
  end;

 function Tl3Tree.Iterate(Action             : Tl3NodeAction;
                          IterMode           : Integer = 0;
                          const aSubRootNode : Il3Node = nil;
                          const aFromNode    : Il3Node = nil) : Il3Node;
  var
   lAction      : Tl3NodeAction;
   lCheckResult : Boolean;
   lSubRootNode : Il3Node;

  function IterHandler(const CurNode : Il3Node) : Boolean; far;
   begin
    if l3TestMask(IterMode, imNoHidden) and
       l3TestMask(NodeFlags[CurNode], nfHidden) then
     Result := False
    else
     Result := Action(CurNode);
    If not (lCheckResult and Result) and not IsExpanded(CurNode)
     then
     {$IfDef SkipIterByExcept}
      Raise ESkipIterateChilds.Create('');
     {$Else}
      Result := Boolean(2);
     {$EndIf}
   end;

  begin
   If f_RootNode = nil then Exit;
   lCheckResult := l3TestMask(IterMode, imCheckResult);
   if (aSubRootNode = nil) then
    lSubRootNode := f_RootNode
   else
    lSubRootNode := aSubRootNode;

   if l3TestPartMask(IterMode, imExpandOnly or imNoHidden)
    then
     begin
      l3ClearMask(IterMode, imExpandOnly); // можно и не надо
      lAction := l3L2NA(@IterHandler);
      try
       Result := lSubRootNode.Iterate(lAction, IterMode, aFromNode);
      finally
       l3FreeFA(Tl3FreeAction(lAction));
      end;{try..finally}
     end
    else
     Result := lSubRootNode.Iterate(Action, IterMode, aFromNode);
  end;

function Tl3Tree.IterateF(Action             : Tl3NodeAction;
                          IterMode           : integer = 0;
                          const aSubRootNode : Il3Node = nil;
                          const aFromNode    : Il3Node = nil) : Il3Node;
  {-}
begin
 try
  Result := Iterate(Action, IterMode, aSubRootNode, aFromNode);
 finally
  l3FreeFA(Tl3FreeAction(Action));
 end;{try..finally}
end;

function Tl3Tree.SimpleIterateF(Action             : Tl3SimpleNodeAction;
                                IterMode           : integer = 0;
                                const aSubRootNode : Il3SimpleNode = nil): Il3SimpleNode;
  {-}

 function IterHandler(const aNode : Il3Node): Boolean; far;
 begin//IterHandler
  Result := Action(aNode);
 end;//IterHandler

var
 l_RootNode: Il3Node;
begin
 try
  if aSubRootNode = nil then
   Result := IterateF(l3L2NA(@IterHandler), IterMode)
  else
  if Supports(aSubRootNode, Il3Node, l_RootNode) then
   Result := IterateF(l3L2NA(@IterHandler), IterMode, l_RootNode)
  else
   Result := nil;
 finally
  l3FreeFA(Tl3FreeAction(Action));
 end;//try..finally
end;

procedure Tl3Tree.PrintOutToStream(Const aStream   : TStream;
                                  aWithNumber  : Boolean;
                                  aIterMode    : integer = 0;
                            const aLevelIndent : AnsiString = ' ');
 //function IterHandler(const CurNode : Il3Node) : Boolean; far;
 procedure IterHandler(const CurNode : Il3Node); far;
 var
  S : AnsiString;
  LL : Byte;
 begin
  S  := '';
  LL := GetLevel(CurNode);
  If ShowRoot then Dec(LL);
  While LL <> 0 do
   begin
    S := S + aLevelIndent;
    Dec(LL);
   end;
  S := S + l3PCharLen2String(CurNode.Text);
  If aWithNumber
   then
    S := S + ', ' + IntToStr((CurNode as Il3HandleNode).Handle);
  S := S + cc_EOL;
  aStream.Write(S[1], Length(S));
 end;

begin
 IterateF(l3L2NA(@IterHandler), aIterMode);
end;

procedure Tl3Tree.PrintTreeList(Const aFileName : TFileName;
                                      aWithNumber : Boolean;
                                      aIterMode : integer = 0;
                                const aLevelIndent : AnsiString = ' ');
var
 l_FileHandle : Integer;

 //function IterHandler(const CurNode : Il3Node) : Boolean; far;
 procedure IterHandler(const CurNode : Il3Node); far;
 var
  S : AnsiString;
  LL : Byte;
 begin
  S  := '';
  LL := GetLevel(CurNode);
  If ShowRoot then Dec(LL);
  While LL <> 0 do
   begin
    S := S + aLevelIndent;
    Dec(LL);
   end;
  S := S + l3PCharLen2String(CurNode.Text);
  If aWithNumber
   then
    S := S + ', ' + IntToStr((CurNode as Il3HandleNode).Handle);
  S := S + cc_EOL;
  FileWrite(l_FileHandle, S[1], Length(S));
 end;

var
 l_Stream: TStream;

begin
 l_Stream := TFileStream.Create(aFileName, fmCreate);
// l_FileHandle := FileCreate(aFileName);
 try
//  IterateF(l3L2NA(@IterHandler), aIterMode);
  PrintOutToStream(l_Stream, aWithNumber, aIterMode, aLevelIndent);
 finally
//  FileClose(l_FileHandle);
  FreeAndNil(l_Stream);
 end;
end;

function Tl3Tree.IsVisible(const aNode : Il3Node) : Boolean;
var
 lNodeIndex : Integer;
begin
 lNodeIndex := GetAbsIndex(aNode);
 Result := (lNodeIndex = 0) or
           ((f_FlagsList.Count > lNodeIndex) and
            ((lNodeIndex > 0) and not l3TestMask(Integer(f_FlagsList.Items[lNodeIndex]), nfHidden)));
end;

function Tl3Tree.IsAllParentExpanded(const aNode: Il3Node): Boolean;
var
 lNode : Il3Node;
begin
 Result := False;
 if aNode = nil then Exit;

 lNode := aNode;
 repeat
  if lNode.IsSame(RootNode) then
  begin
   Result := True;
   Exit;
  end;

  lNode := lNode.ParentNode;

  if not IsExpanded(lNode) then Exit;

 until False;

end;

function Tl3Tree.IsExpanded(const aNode: Il3SimpleNode): Boolean;
 //overload;
 {* - раскрыт ли узел. }
begin
 Result := IsExpanded(aNode As Il3Node);
end;

 function Tl3Tree.IsExpanded(const aNode : Il3Node) : Boolean;
  var
   lNodeIndex : Integer;
   lFlags     : Integer;
  begin
   try
    Result := (IsRoot(aNode)) and (Not f_ShowRoot);
    If Result then Exit;
    If f_CommonExpanded then
     lFlags := aNode.Flags
    else
    begin
     lNodeIndex := GetAbsIndex(aNode);
     lFlags := Integer(f_FlagsList.Items[lNodeIndex]);
    end;

    Result := l3TestMask(lFlags, nfExpanded);
   except
    Result := False;
   end;
  end;

function Tl3Tree.IsRoot(const aNode: Il3SimpleNode): Boolean;
  //overload;
  {* - является ли узел корневым для дерева. }
begin
 Result := IsRoot(aNode As Il3Node);
end;

function Tl3Tree.IsRoot(const aNode : Il3Node) : Boolean;
begin
 Result := (f_RootNode <> nil) AND (aNode <> nil) AND
           f_RootNode.IsSame(aNode);
end;

function Tl3Tree.IsFirstVis(const aNode: Il3SimpleNode): Boolean;
  //overload;
  {* - является ли узел первым видимым в ветке. }
begin
 Result := IsFirstVis(aNode As Il3Node);
end;

 function Tl3Tree.IsFirstVis (const aNode : Il3Node) : Boolean;
  var
   lNode : Il3Node;
  begin
   Result := aNode.IsFirst;
   If not Result then
   begin
    lNode := aNode.PrevNode;
    While not IsVisible(lNode) do
     If lNode.IsFirst then
     begin
      Result := True;
      Exit;
     end
     else
      lNode := lNode.PrevNode;
   end;
  end;

function Tl3Tree.IsLastVis(const aNode: Il3SimpleNode): Boolean;
  //overload;
  {* - является ли узел последним видимым в ветке. }
begin
 Result := IsLastVis(aNode As Il3Node);
end;

function Tl3Tree.IsLastVis(const aNode : Il3Node) : Boolean;
var
 lNode : Il3Node;
begin
 if (aNode = nil) then
  Result := true
 else
 begin
  Result := aNode.IsLast;
  If not Result then
  begin
   lNode := aNode.NextNode;
   While not IsVisible(lNode) do
    If lNode.IsLast then
    begin
     Result := True;
     Exit;
    end
    else
     lNode := lNode.NextNode;
  end;//not Result
 end;//aNode = nil
end;

function Tl3Tree.HasVisibleChildren(const aNode: Il3SimpleNode) : Boolean;
  //overload;
  {* - есть ли видимые дети у aNode. }
begin
 Result := HasVisibleChildren(aNode As Il3Node);
end;

function Tl3Tree.HasVisibleChildren(const aNode : Il3Node) : Boolean;
var
 lNode : Il3Node;
begin
 Result := False;
 if not aNode.HasChild then
  Exit;
 lNode := aNode.ChildNode;
 if (lNode = nil) then
  Exit;
 repeat
  if IsVisible(lNode) then
  begin
   Result := true;
   Exit;
  end;//IsVisible(lNode)
  lNode := lNode.NextNode;
 until lNode.IsFirst;
end;

 procedure Tl3Tree.SetFlagsByAbsIndex(aAbsIndex :Integer; aValue : Integer);
  var
   lTreeFlag : Integer;
   lNodeFlag : Integer;
   lNode     : Il3Node;
   //Value
  begin
   Changing;
   try
    lNode := GetNodeByAbsIndex(aAbsIndex);
    lTreeFlag := Byte(f_FlagsList.Items[aAbsIndex]);
    lNodeFlag := lNode.Flags;
    aValue := SelectCntFix(lNode, lTreeFlag, aValue);
    SplitFlags(aValue, lTreeFlag, lNodeFlag);
    f_FlagsList.Items[aAbsIndex] := lTreeFlag;
    lNode.Flags := lNodeFlag;
   finally
    Changed;
   end;
  end;

 function Tl3Tree.GetFlagsByAbsIndex(aAbsIndex :Integer) : Integer;
 begin
  Result := ConcatFlags(Integer(f_FlagsList.Items[aAbsIndex]), GetNodeByAbsIndex(aAbsIndex).Flags);
 end;

 function Tl3Tree.GetNodeByAbsIndex(aAbsIndex :Integer) : Il3Node;
 begin
  Result := nil;

  if (aAbsIndex >= Count) or (aAbsIndex < 0) then Exit;

  if (f_CurrentAbsItem > -1) then
  begin
   If (f_CurrentAbsItem  = aAbsIndex) then
    Result := f_CurrentAbsNode
   else
   If (f_CurrentAbsItem + 1  = aAbsIndex) then
    Result := GetNext(f_CurrentAbsNode)
   else
   If (f_CurrentAbsItem  = aAbsIndex + 1) then
    Result := GetPrev(f_CurrentAbsNode);
  end;

  if Result = nil then
   Result := RootNode.GetNodeByNumber(aAbsIndex);

  if Result <> nil then
  begin
   f_CurrentAbsNode := Result;
   f_CurrentAbsItem := aAbsIndex;
  end
  else
   CursorTop;
 end;

function Tl3Tree.GetAbsIndex(const aCurNode: Il3Node) : Integer;
var
 lPNode : Il3Node;
begin
 Result := -1;
 if (aCurNode = nil) then
  Exit;

 if aCurNode.IsSame(f_RootNode) then
  Result := 0
 else 
 if (f_CurrentAbsItem > -1) then
 begin
  if aCurNode.IsSame(f_CurrentAbsNode) then  // если aCurNode = f_CurrentAbsNode
   Result := f_CurrentAbsItem;

  if Result = -1 then
  begin
   lPNode := GetPrev(aCurNode);
   if (lPNode <> nil) and lPNode.IsSame(f_CurrentAbsNode) then // если aCurNode следующая за f_CurrentAbsNode
    Result := Succ(f_CurrentAbsItem);
  end;

  if Result = -1 then
  begin
   if not aCurNode.IsFirst then
   begin
    lPNode := aCurNode.PrevNode; // если aCurNode следующая за f_CurrentAbsNode на одном уровне
    if (lPNode <> nil) and
       lPNode.IsSame(f_CurrentAbsNode) then
     Result := f_CurrentAbsItem + Succ(lPNode.AllChildrenCount);
   end;
  end;

(*  if Result = -1 then
  begin
   lPNode := aCurNode.ChildNode;
   if (lPNode <> nil) and
      lPNode.IsSame(f_CurrentAbsNode) then // если f_CurrentAbsNode первый ребенок aCurNode
    Result := Pred(f_CurrentAbsItem);
  end;*)// - это теперь не нужно, т.к. это частный случай GetNext

  if Result = -1 then
  begin
   lPNode := GetNext(aCurNode);
   if (lPNode <> nil) and lPNode.IsSame(f_CurrentAbsNode) then // если f_CurrentAbsNode следующая за aCurNode
    Result := Pred(f_CurrentAbsItem);
  end;

  if Result = -1 then
  begin
   if not aCurNode.IsLast then
   begin
    lPNode := aCurNode.NextNode; // если f_CurrentAbsNode следующая за aCurNode на одном уровне
    if (lPNode <> nil) and
       lPNode.IsSame(f_CurrentAbsNode) then
     Result := f_CurrentAbsItem - Succ(aCurNode.AllChildrenCount);
   end;
  end;

 end; //if (f_CurrentAbsItem > -1) then

 if Result = -1 then
 begin
  try
   Result := 0;
   lPNode := aCurNode;
   While (lPNode <> nil) AND not IsRoot(lPNode) do
   begin
    Inc(Result, lPNode.GetNumInParent);
    Inc(Result);
    lPNode := lPNode.ParentNode;
   end;
  except
   Result := -1;
  end;
  If (lPNode = nil) then // нода не из дерева
   Result := -1;
 end;

 If Result >= 0 then
 begin
  f_CurrentAbsNode := aCurNode;
  f_CurrentAbsItem := Result;
 end
 else
  CursorTop;
end;

function Tl3Tree.Get_Nodes(aInd : Integer) : Il3SimpleNode;
  //overload;
begin
 Result := Get_CNodes(aInd) As Il3SimpleNode;
end;
  
function Tl3Tree.Get_CNodes(aInd : Integer) : Il3Node;

 function GetNextVis(const aCurNode : Il3Node) : Il3Node;
  var
   //lAbsCurCheck : Integer;
   lSaveAbsItem : Integer;
   lPredNode    : Il3Node;

  begin
   Result := aCurNode;

   //синхронизация с Abs курсором
   If (f_CurrentAbsItem < 0) or not aCurNode.IsSame(f_CurrentAbsNode) then
   begin
    f_CurrentAbsItem := GetAbsIndex(aCurNode);
    f_CurrentAbsNode := aCurNode;
   end;

   repeat
    lPredNode := Result;
    lSaveAbsItem := f_CurrentAbsItem;

    If Result = nil then
    begin
     CursorTop;
     Result := f_CurrentNode;
    end
    else
     If Result.HasChild and IsExpanded(Result) and IsVisible(Result) then
     begin
      Result := Result.ChildNode;

      {
      // Check!!
      lAbsCurCheck := GetAbsIndex(Result);
      if lAbsCurCheck <> Succ(lSaveAbsItem) then
        format('%d <> %d',[lAbsCurCheck, f_CurrentAbsItem]);
      }

      //коррекция Abs курсора
      f_CurrentAbsNode := Result;
      f_CurrentAbsItem := Succ(lSaveAbsItem);
     end
     else
      If Not Result.IsLast then
      begin
       Result := Result.NextNode;

       {
       // Check!!
       lAbsCurCheck := GetAbsIndex(Result);
       if lAbsCurCheck <> lSaveAbsItem + (Succ(aCurNode.AllChildrenCount)) then
        format('%d <> %d',[lAbsCurCheck, f_CurrentAbsItem]);
       }

       //коррекция Abs курсора
       f_CurrentAbsNode := Result;
       f_CurrentAbsItem := lSaveAbsItem + (Succ(lPredNode.AllChildrenCount));

      end
      else
      begin
       Result := Result.ParentNode;
       While (Result <> nil) and Result.IsLast do
        Result := Result.ParentNode;
       If Result <> nil then
        Result := Result.NextNode;

       {
       // Check!!
       lAbsCurCheck := GetAbsIndex(Result);
       if lAbsCurCheck <> lSaveAbsItem + (Succ(aCurNode.AllChildrenCount)) then
        format('%d <> %d',[lAbsCurCheck, f_CurrentAbsItem]);
       }

       //коррекция Abs курсора
       f_CurrentAbsNode := Result;
       f_CurrentAbsItem := lSaveAbsItem + (Succ(lPredNode.AllChildrenCount));

      end;
   until (Result = nil) or IsVisible(Result);
   // вероятно если не будет ни одного видимого, все зациклится
  end;

 function GetPrevVis(const aCurNode : Il3Node) : Il3Node;
  var
    //lAbsCurCheck : Integer;
    lSaveAbsItem : Integer;
    //lPredNode    : Il3Node;

  begin
   Result := aCurNode;

   //синхронизация с Abs курсором
   If (f_CurrentAbsItem < 0) or not aCurNode.IsSame(f_CurrentAbsNode) then
   begin
    f_CurrentAbsItem := GetAbsIndex(aCurNode);
    f_CurrentAbsNode := aCurNode;
   end;

   repeat
    //lPredNode := Result;
    lSaveAbsItem := f_CurrentAbsItem;
    try
     With f_RootNode do
     begin
      If (Result = Nil) or IsSame(Result) then
       Result := Nil
      else
       If Result.IsFirst then
       begin
        Result := Result.ParentNode;
        If Not f_ShowRoot and IsSame(Result) then Result := Nil;

        {
        // Check!!
        lAbsCurCheck := GetAbsIndex(Result);
        if lAbsCurCheck <> Pred(lSaveAbsItem) then
         format('%d <> %d',[lAbsCurCheck, f_CurrentAbsItem]);
        }

        //коррекция Abs курсора
        f_CurrentAbsNode := Result;
        f_CurrentAbsItem := Pred(lSaveAbsItem);

       end
       else
       begin
	Result := Result.PrevNode;

	//if IsVisible(Result) then
	While IsVisible(Result) and Result.HasChild and IsExpanded(Result) do
	 Result := Result.ChildNode.PrevNode;

	{
	// Check!!
	lAbsCurCheck := GetAbsIndex(Result);
	if lAbsCurCheck <> (lSaveAbsItem - (Succ(Result.AllChildrenCount))) then
	 format('%d <> %d',[lAbsCurCheck, f_CurrentAbsItem]);
	}

	//коррекция Abs курсора
	f_CurrentAbsNode := Result;
	f_CurrentAbsItem := lSaveAbsItem - (Succ(Result.AllChildrenCount));

       end;
     end;
    except
     Result := Nil;
    end;
   until (Result = nil) or IsVisible(Result);
  end;

  var
   lRelNum    : Integer;

 begin
  try
   If not f_ShowRoot then Inc(aInd);

   //if aInd = CountView then
   //begin
   // Result := GetLastOpenIn(f_RootNode);
   // exit;
   //end;

   If (f_CurrentItem = -1) or (aInd < f_CurrentItem div 2)
    then CursorTop;

   lRelNum := aInd - f_CurrentItem;
   Result := f_CurrentNode;

   If lRelNum > 0 then
    While (Result <> nil) and (lRelNum > 0) do
    begin
     Result := GetNextVis(Result);
     Dec(lRelNum);
    end
    else
    begin
     lRelNum := - lRelNum;
     While (Result <> nil) and (lRelNum > 0) do
     begin
      Result := GetPrevVis(Result);
      Dec(lRelNum);
     end
    end;
  finally
   If (Result = nil) then
   begin
    CursorTop;
    Result := f_CurrentNode;
   end
   else
   begin
    f_CurrentNode := Result;
    f_CurrentItem := aInd;
    //Inc(f_CurrentAbsItem,lOfsAbsNum);
   end;//Result = nil
  end;
 end;

 function  Tl3Tree.Get_NodeFlags(const aNode : Il3Node) : Integer;
  var
   lNodeIndex : Integer;
  begin
   if (aNode = nil) then
    Result := 0
   else
   begin
    lNodeIndex := GetAbsIndex(aNode);
    // Узел может быть удален из дерева (K<96484569>):
    if lNodeIndex <> -1 then
     Result := ConcatFlags(Integer(f_FlagsList.Items[lNodeIndex]), aNode.Flags)
    else
     Result := 0;
   end;//aNode = nil
  end;

 procedure Tl3Tree.Set_NodeFlags(const aNode : Il3Node; aValue : Integer);
  var
   lNodeIndex : Integer;
   lTreeFlag : Integer;
   lNodeFlag : Integer;

   lTreeNewFlag : Integer;
   lNodeNewFlag : Integer;
  begin
   lNodeIndex := GetAbsIndex(aNode);
   lTreeFlag := Byte(f_FlagsList.Items[lNodeIndex]);
   lNodeFlag := aNode.Flags;

   aValue := SelectCntFix(aNode, lTreeFlag, aValue);
   SplitFlags(aValue, lTreeNewFlag, lNodeNewFlag);

   If (lTreeFlag <> lTreeNewFlag) or (lNodeFlag <> lNodeNewFlag) then
   begin
    Changing;
    try
     f_FlagsList.Items[lNodeIndex] := lTreeNewFlag;
     aNode.Flags := lNodeNewFlag;
    finally
     Changed;
    end;
   end;
  end;

function Tl3Tree.Get_CommonExpanded: Boolean;
begin
 Result := f_CommonExpanded;
end;

 procedure Tl3Tree.Set_CommonExpanded(Value : Boolean);
  begin
   If Value = f_CommonExpanded then Exit;
   f_CommonExpanded := Value;
   CursorTop;
  end;

 function  Tl3Tree.Get_Strings(Index: Longint) : PAnsiChar;
 var
  l_Node : Il3Node;
 begin
  try
   l_Node := Get_CNodes(Index);
   if (l_Node = nil) then
    Result := nil
   else
    Result := l_Node.Text.S;
  except
   Result := nil;
  end;
 end;

 function  Tl3Tree.GetItemPasStr(Index: Longint) : AnsiString;
  begin
   Result := StrPas(Get_Strings(Index));
  end;

 procedure Tl3Tree.SetItemString(Index: Longint; Value : PAnsiChar);
  begin
   ChangeName(Get_CNodes(Index){f_CurrentNode}, Value);
  end;

 function  Tl3Tree.Get_Flags(Index: Longint) : Integer;
  begin
   Result := NodeFlags[Get_CNodes(Index)];
  end;

 procedure Tl3Tree.SetFlags(Index: Longint; Value : Integer);
  begin
   Changing;
   try
    NodeFlags[Get_CNodes(Index)] := Value;
   finally
    Inherited DoChanged;
   end;
  end;

 function  Tl3Tree.pm_GetCount : Longint;
  begin
   if Assigned(f_RootNode) then
    Result := Succ(f_RootNode.AllChildrenCount)
   else
    Result := 0; 
  end;

 procedure Tl3Tree.pm_SetCount(Value : Longint);
  begin
   {override abstract method}
  end;

 function Tl3Tree.IsSelect(const aNode : Il3Node): Boolean;
  var
   lNodeIndex : Integer;
  begin
   lNodeIndex := GetAbsIndex(aNode);
   Result := l3TestMask(Integer(f_FlagsList.Items[lNodeIndex]),nfSelected);
  end;

 function Tl3Tree.IsChildSelect (const aNode : Il3Node): Boolean;
  {var
   I : Integer;}
  begin
   {I := GetAbsIndex(aNode);}
   Result := l3TestMask(NodeFlags[aNode], nfChildSelected) and aNode.HasChild;
   //Result := (I >= 0) and l3TestMask(Integer(f_FlagsList.Items[I]),nfChildSelected) and aNode.HasChild;
  end;

 function Tl3Tree.Get_SelectedNode(const aNode : Il3Node): Boolean;
  begin
   Result := IsSelect(aNode);
  end;

 procedure Tl3Tree.Set_SelectedNode(const aNode : Il3Node; Value : Boolean);
  begin
  //Sel!!
   If (aNode = nil) or ((NodeFlags[aNode] and nfSelected <> 0) = Value) then Exit;
   Changing;
   try
    If Value then
     NodeFlags[aNode] := NodeFlags[aNode] or nfSelected{ xor nfSelModified}
    else
     NodeFlags[aNode] := NodeFlags[aNode] and not nfSelected{ xor nfSelModified};
   finally
    Changed;
   end;
  end;

procedure Tl3Tree.SelectInterval(aFirstIndex, aLastIndex: Longint;
                                 aMode: Tl3SetBitType;
                                 aCleanOther: Boolean);
  {* - выделяет/развыделяет узлы на указанном интервале. }
var
 I: Longint;
 l_Node: Il3Node;
begin
 Changing;
 try
  if aCleanOther then
   SelectAllNodes(sbDeselect);

  for I := aFirstIndex to aLastIndex do
  begin
   l_Node := Get_CNodes(I);
   case aMode of
    sbSelect :
     NodeFlags[l_Node] := NodeFlags[l_Node] or nfSelected;

    sbDeselect :
     NodeFlags[l_Node] := NodeFlags[l_Node] and not nfSelected;

    sbInvert :
     NodeFlags[l_Node] := NodeFlags[l_Node] xor nfSelected;
   end;
  end;
 finally
  ChangedEx(l3_NotChangeCountView);
 end;
end;

function Tl3Tree.SelectCntFix(const aNode : Il3Node; OldFlag, NewFlag : Integer) : Integer;

 function IsChildSelectedWONode(const PN : Il3Node) : Boolean;
  var
   CN     : Il3Node;
  begin
   if f_SelectCount < 1 then
   begin
    Result := False;
    exit;
   end;

   Result := True;
   CN:=PN.ChildNode;
   With aNode do
   Repeat
    If IsChildSelect(CN) or (not (IsSame(CN)) and IsSelect(CN)) then Exit;
    CN := CN.NextNode;
   until CN.IsFirst;
   Result:=False;
  end;

 var
  CN      : Il3Node;

 begin
  If OldFlag = NewFlag then
   begin
    Result := NewFlag;
    exit;
   end;
  Result := Inherited SelectCntFix(OldFlag, NewFlag);
  If l3TestMask(Result, nfChildSelected) and Not aNode.HasChild
   then l3ClearMask(Result, nfChildSelected);
  If ((NewFlag and nfSelected) = (OldFlag and nfSelected)) then Exit;

  CN := aNode.ParentNode;
  If l3TestMask(Result, nfSelected) then
  begin
   With RootNode do
    While (CN <> nil) {and not IsSame(CN)}
          and (NodeFlags[CN] and nfChildSelected = 0) do
    begin
     NodeFlags[CN] := NodeFlags[CN] or nfChildSelected;
     If IsSame(CN) then Break;
     CN := CN.ParentNode;
    end;
  end
  else
  begin
   With RootNode do
    While (CN <> Nil) {and not IsSame(CN)}
          and (NodeFlags[CN] and nfChildSelected <> 0)
          and not IsChildSelectedWONode(CN) do
    begin
     NodeFlags[CN] := NodeFlags[CN] and Not nfChildSelected;
     If IsSame(CN) then Break;
     CN := CN.ParentNode;
    end;
  end;

 end;

function Tl3Tree.Get_ShowRoot: Boolean;
begin
 Result := f_ShowRoot;
end;

procedure Tl3Tree.Set_ShowRoot(Value : Boolean);
var
 l_SaveCountView : Integer;
begin
 if (f_ShowRoot = Value) then Exit;
 LockModified := true;
 l_SaveCountView := f_CountView;
 Changing;
 Try
  f_ShowRoot := Value;
  if (l_SaveCountView > l3_NeedCountView) then
  begin
   if f_ShowRoot then
    Inc(l_SaveCountView)
   else
    Dec(l_SaveCountView);
  end;//l_SaveCountView > l3_NeedCountView
 finally
  f_CountView := l_SaveCountView;
  inherited DoChanged;
  LockModified := False;
 end;//try..finally
end;

function  Tl3Tree.GetChildSelect(Index : Longint): Boolean;
 begin
  Result := IsChildSelect(Get_CNodes(Index));
 end;

procedure Tl3Tree.SetAllFlag(aMode : Tl3SetBitType; aFlags : Integer);
 var
  I : Integer;
  lNeedSelModifiedInvert : Boolean;
  lCurFlags : Integer;

 begin
  If f_CommonExpanded or (aMode = sbInvert) then
   SetBranchFlag(f_RootNode, aMode, aFlags, 0)

  else
  begin
   Changing;
   try
    If l3TestMask(aFlags, nfSelected) then
     l3SetMask(aFlags, nfChildSelected);

    for I := 0 to pred(f_FlagsList.Count) do
    begin
     lCurFlags := Integer(f_FlagsList.Items[I]);

     If l3TestMask(aFlags, nfSelected) then
     begin
      lNeedSelModifiedInvert := l3TestMask(lCurFlags, nfSelected);

      If aMode = sbSelect then lNeedSelModifiedInvert := not lNeedSelModifiedInvert;

      if (f_LockSelModify = 0) and lNeedSelModifiedInvert then
       l3InvertMask(lCurFlags, nfSelModified);
     end;

     If aMode = sbSelect then
      l3SetMask(lCurFlags, aFlags)
     else
      l3ClearMask(lCurFlags, aFlags);

     f_FlagsList.Items[I] := lCurFlags;
    end;

    If l3TestMask(aFlags, nfSelected) then
    begin
     If aMode = sbSelect then
     begin
      if not ShowRoot then
       SetSelectCount(Pred(f_FlagsList.Count))
      else
       SetSelectCount(f_FlagsList.Count);
     end
     else
      SetSelectCount(0);
    end;

   finally
    if l3TestPartMask(aFlags, nfChangeViewCountFlagSet) then
     Changed
    else
     ChangedEx(l3_NotChangeCountView);
   end;
  end;
 end;

procedure Tl3Tree.SelectAllNodes(aMode : Tl3SetBitType);
begin
 SetAllFlag(aMode, nfSelected);
end;

procedure Tl3Tree.SetBranchFlag(const aParentNode : Il3SimpleNode;
                                aMode             : Tl3SetBitType;
                                aFlagsMask        : Integer;
                                anIterMode        : Integer);
  //overload;
  {* - зачем-то используется визуалкой в ExpandNode. }
begin
 SetBranchFlag(aParentNode As Il3Node, aMode, aFlagsMask, anIterMode);
end;

procedure Tl3Tree.SetBranchFlag(const ParentNode: Il3Node; Mode : Tl3SetBitType; aFlagsMask : integer; IterMode : integer);

 procedure IterHandlerSelect(const CurNode : Il3Node); far;
  begin
   NodeFlags[CurNode] := NodeFlags[CurNode] or aFlagsMask;
  end;

 procedure IterHandlerDeselect(const CurNode : Il3Node); far;
  begin
   NodeFlags[CurNode] := NodeFlags[CurNode] and not aFlagsMask;
  end;

 procedure IterHandlerInvert(const CurNode : Il3Node); far;
  begin
   NodeFlags[CurNode] := NodeFlags[CurNode] xor aFlagsMask;
  end;

 begin
  Changing;
  Try
   if l3TestMask(aFlagsMask, nfSelected) then
    l3SetMask(aFlagsMask, nfChildSelected);
   Case Mode of
    sbSelect :
     begin
      if l3TestMask(aFlagsMask, nfSelected) then
       l3SetMask(aFlagsMask, nfChildSelected);
      IterateF(l3L2NA(@IterHandlerSelect), IterMode, ParentNode);
     end;

    sbDeselect :
     begin
      if l3TestMask(aFlagsMask, nfSelected) then
       l3SetMask(aFlagsMask, nfChildSelected);
      IterateF(l3L2NA(@IterHandlerDeselect), IterMode, ParentNode);
     end;

    sbInvert   :
     begin
      IterateF(l3L2NA(@IterHandlerInvert), IterMode, ParentNode);
     end;
   end;

  finally
   if l3TestPartMask(aFlagsMask, nfChangeViewCountFlagSet) then
    Changed
   else
    ChangedEx(l3_NotChangeCountView);
  end;
 end;

function Tl3Tree.GetNextSetFlag(const aCurNode: Il3Node; aFlag : integer) : Il3Node;
 var
  lInd : Integer;
  lCnt : Integer;
 begin
  If aFlag = nfSelected
   then
    Result := GetNextSelect(aCurNode)
   else
    If ((not f_CommonExpanded) and (aFlag and $ff = aFlag)) or
       ((f_CommonExpanded) and (aFlag and ($ff and not nfExpanded) = aFlag)) then
    begin
     If aCurNode = nil then
      lInd := 0
     else
      lInd := Succ(GetAbsIndex(aCurNode));
     lCnt := f_FlagsList.Count;
     While (lInd < lCnt) and not l3TestMask(Integer(f_FlagsList.Items[lInd]),aFlag)
      do Inc(lInd);
     If (lInd < lCnt) then
      Result := f_RootNode.GetNodeByNumber(lInd)
     else
      Result := nil;
    end
    else
    begin
     Result := aCurNode;
     Repeat
      Result := GetNext(Result);
     until (Result = Nil) or (NodeFlags[Result] and aFlag = aFlag);
    end;
 end;

function Tl3Tree.GetNextSelect(const aCurNode: Il3Node) : Il3Node;
 begin
  If f_SelectCount = 0 then
  begin
   Result := nil;
   exit;
  end;

  Result := aCurNode;
  If Result = nil then
  begin
   CursorTop;
   Result := f_CurrentNode;
   If IsSelect(Result) then exit;
  end;

  repeat
   if IsChildSelect(Result) and Result.HasChild then
    Result := Result.ChildNode
   else
    repeat
     If IsRoot(Result) then
     begin
      Result := nil;
      break;
     end
     else
      If Not Result.IsLast then
      begin
       Result := Result.NextNode;
       break;
      end
      else
      begin
       Result := Result.ParentNode;
       //Continue;
      end;
     until False;
  until (Result = nil) or IsSelect(Result);
 end;

procedure Tl3Tree.SetFlagMaskPrim(aAbsIndex: Longint; Const aNode : Il3Node; aFlagMask : integer; aMode : Tl3SetBitType);
var
 lTreeMask : Integer;
 lNodeMask : Integer;

 lTreeFlag : Integer;
 lNodeFlag : Integer;

 lSaveTreeFlag : Integer;
 lSaveNodeFlag : Integer;

 lOldFlag  : Integer;
 lNewFlag  : Integer;
 lNode     : Il3Node;
 lNeedSelFix : Boolean;

 function SetMask(aFlags : Integer; aMask : Integer; aMode : Tl3SetBitType) : Integer;
 begin
  case aMode of
   sbSelect   : l3SetMask(aFlags,aMask);
   sbDeselect : l3ClearMask(aFlags,aMask);
   sbInvert   : l3InvertMask(aFlags,aMask);
  end;
  Result := aFlags;
 end;

begin
 if aFlagMask = 0 then exit;

 lNeedSelFix := l3TestMask(aFlagMask, nfSelected {or nfChildSelected});

 SplitFlags(aFlagMask, lTreeMask, lNodeMask);

 lNodeFlag := 0;
 lTreeFlag := 0;

 if lNeedSelFix or (lNodeMask <> 0) then
 begin
  If aNode = nil then
   lNode := GetNodeByAbsIndex(aAbsIndex)
  else
   lNode := aNode;
  lNodeFlag := lNode.Flags;
 end;

 if (lTreeMask <> 0) then
 begin
  if aAbsIndex < 0 then aAbsIndex := GetAbsIndex(aNode);
  lTreeFlag := Integer(f_FlagsList.Items[aAbsIndex]);
 end;

 // сохраняем исходные значения флагов
 lSaveNodeFlag := lNodeFlag;
 lSaveTreeFlag := lTreeFlag;

 if lNeedSelFix then
 begin
  lOldFlag := ConcatFlags(lTreeFlag,lNodeFlag);
  lNewFlag := SetMask(lOldFlag, lTreeMask, aMode);

  aFlagMask := SelectCntFix(lNode, lOldFlag, lNewFlag);
  SplitFlags(aFlagMask, lTreeFlag, lNodeFlag);
 end
 else
 begin
  lNodeFlag := SetMask(lNodeFlag, lTreeMask, aMode);
  lTreeFlag := SetMask(lTreeFlag, lTreeMask, aMode);
 end;

 //если исходные значения не меняются, то делать ничего не будем
 if  (lSaveNodeFlag = lNodeFlag) and
     (lSaveTreeFlag = lTreeFlag) then Exit;

 Changing;
 try
  if lTreeMask <> 0 then
   f_FlagsList.Items[aAbsIndex] := lTreeFlag;

  if lNodeMask <> 0 then
   lNode.Flags := lNodeMask;
 finally
  Changed;
 end;
end;

procedure Tl3Tree.SetFlagMask(aAbsIndex: Longint; aFlagMask : integer; aMode : Tl3SetBitType);
begin
 SetFlagMaskPrim(aAbsIndex, nil, aFlagMask, aMode);
end;

procedure Tl3Tree.SetFlagMask(const aRNode : Il3Node; aFlagMask : integer; aMode : Tl3SetBitType);
begin
 SetFlagMaskPrim(-1, aRNode, aFlagMask, aMode);
end;

function Tl3Tree.TestFlagMaskPrim(aAbsIndex: Longint; Const aNode : Il3Node; aFlagMask : integer) : Boolean;
var
 lTreeMask : Integer;
 lNodeMask : Integer;

 lTreeFlag : Integer;
 lNodeFlag : Integer;
 lNode     : Il3Node;
begin
 Result := True;
 if aFlagMask = 0 then exit;

 SplitFlags(aFlagMask, lTreeMask, lNodeMask);

 lTreeFlag := 0;
 lNodeFlag := 0;

 if (lTreeMask <> 0) then
 begin
  if aAbsIndex < 0 then aAbsIndex := GetAbsIndex(aNode);
  lTreeFlag := Integer(f_FlagsList.Items[aAbsIndex]);
 end;

 if (lNodeMask <> 0) then
 begin
  if aNode = nil then
   lNode := GetNodeByAbsIndex(aAbsIndex)
  else
   lNode := aNode;
  lNodeFlag := lNode.Flags;
 end;

 Result := l3TestMask(ConcatFlags(lTreeFlag, lNodeFlag), aFlagMask);
end;

function Tl3Tree.TestFlagMask(Const aNode : Il3Node; aFlagMask : integer) : Boolean;
begin
 Result := TestFlagMaskPrim(-1, aNode, aFlagMask);
end;

function Tl3Tree.TestFlagMask(aAbsIndex: Longint; aFlagMask : integer) : Boolean;
begin
 Result := TestFlagMaskPrim(aAbsIndex, nil, aFlagMask);
end;

function Tl3Tree.GetNext(const aCurNode : Il3Node) : Il3Node;
 {Don't use this function to cursor navigation becouse
  this not account some nfXXXX f_lags
  This function may used as Iterator}
begin
 If aCurNode = nil then
 begin
  CursorTop;
  Result := f_CurrentNode;
 end
 else
  if aCurNode.HasChild then
   Result := aCurNode.ChildNode
  else
   If Not aCurNode.IsLast then
    Result := aCurNode.NextNode
   else
   begin
    Result := aCurNode.ParentNode;
    While (Result <> nil) and Result.IsLast do
     Result := Result.ParentNode;
    If Result <> nil then Result := Result.NextNode;
   end;
end;

function Tl3Tree.GetPrev(const aNode: Il3SimpleNode): Il3SimpleNode;
  //overload;
  {* - предыдущий узел. Зачем-то используется в CharToItem. }
begin
 Result := GetPrev(aNode As Il3Node) As Il3SimpleNode;
end;

function Tl3Tree.GetPrev(const aCurNode : Il3Node) : Il3Node;
begin
 Result := Nil;
 If f_RootNode = nil then Exit;
 Try
  With f_RootNode do
  begin
   If (aCurNode = Nil) or IsSame(aCurNode) then Exit;
   If aCurNode.IsFirst then
   begin
    Result := aCurNode.ParentNode;
    If (Not f_ShowRoot and IsSame(Result)) then Result := nil;
   end
   else
   begin
    Result := aCurNode.PrevNode;
    while (Result <> nil) AND Result.HasChild do
     Result := Result.ChildNode.PrevNode;
   end;
  end;
 except
  Result := Nil;
 end;//try..except
end;

function  Tl3Tree.GetCurrent : Longint;
begin
 If f_CurrentItem = -1 then CursorTop;
 Result := f_CurrentItem;
 If not f_ShowRoot then Dec(Result);
end;

function Tl3Tree.GetAbsCurrent : Longint;
begin
 Result := f_CurrentAbsItem;
 //If not f_ShowRoot then Dec(Result);
end;

procedure Tl3Tree.CursorTop;
begin
 f_CurrentNode := f_RootNode;
 f_CurrentItem := 0;
 f_CurrentAbsNode := f_CurrentNode;
 f_CurrentAbsItem := 0;
 If (Not f_ShowRoot) and (Assigned(f_RootNode)) then
 begin
  f_CurrentNode := f_RootNode.ChildNode;
  While (f_CurrentNode <> nil) and not IsVisible(f_CurrentNode) do
   If f_CurrentNode.IsLast then
    f_CurrentNode := nil
   else
    f_CurrentNode := f_CurrentNode.NextNode;
     
  Inc(f_CurrentItem);
  //Inc(f_CurrentAbsItem);
 end;
end;

function  Tl3Tree.Get_CountView : Longint;
  {-}
begin
 If f_RootNode = nil then
  Result := 0
 else
 begin
  if (f_CountView = l3_DelayedCountView) then
   MarkNeedCountView;
  if (f_CountView = l3_NeedCountView) then
  begin
   f_CountView := CountViewItemsInSubDir(f_RootNode);
   If f_ShowRoot then
    f_CountView := f_CountView + 1;
  end;
  Result := f_CountView;
 end;
end;

function Tl3Tree.CountViewItemsInSubDir(const aNode : Il3SimpleNode): Integer;
  //overload;
  {* - зачем-то используется визуалкой в ShowMoreChildrenOnScreen. }
begin
 Result := CountViewItemsInSubDir(aNode As Il3Node);
end;

function Tl3Tree.CountViewItemsInSubDir(const RNode : Il3Node) : longint;
var
 lCount : Longint;

 function IterHandler(const CurNode : Il3Node) : Boolean; far;
 begin//IterHandler
  If IsVisible(CurNode) then
  begin
   Inc(lCount);
   Result := False;
  end
  else
   Byte(Result) := 2;
 end;//IterHandler

begin
 lCount := 0;
 IterateF(l3L2NA(@IterHandler), imExpandOnly or imParentNeed or imCheckResult, RNode);
 Result := lCount - 1; //минус SubRoot, отказаться итерировать по нему нельзя
 //CursorTop;
end;

procedure Tl3Tree.ExpandSubDir(const aNode : Il3SimpleNode = nil;
                               anExpand    : Boolean = true;
                               aDeepLevel  : Byte = 0);
  //overload;
  {* - развернуть/свернуть узлы. }
var
 l_RootNode: Il3SimpleRootNode;
begin
 l_RootNode := Get_RootNode;
 if (aDeepLevel = 0) and Assigned(l_RootNode) and l_RootNode.IsSame(aNode) and
  l_RootNode.CanExpandCollapseAll then
  l_RootNode.ExpandCollapseAll(anExpand)
 else
  ExpandSubDir(aNode As Il3Node, anExpand, aDeepLevel);
end;

procedure Tl3Tree.ExpandSubDir(const RNode : Il3Node; Expand : Boolean; DeepLevel : Byte);

 procedure IterHandlerExpandAll(const CurNode : Il3Node); far;
 //function IterHandlerExpandAll(const CurNode : Il3Node) : Boolean; far;
  begin
   If Expand then
    ChangeExpand(CurNode, sbSelect)
   else
    If not IsRoot(CurNode) then
     ChangeExpandPrim(CurNode, sbDeselect);
  end;

{$IfDef SkipIterByExcept}
 procedure IterHandlerLevelExpand(const CurNode : Il3Node); far;
{$Else}
 function IterHandlerLevelExpand(const CurNode : Il3Node) : Boolean; far;
{$EndIf}
  begin
   If not IsExpanded(CurNode)
    then
   {$IfDef SkipIterByExcept}
     begin
      ChangeExpand(CurNode, sbSelect);
       Raise ESkipIterateChilds.Create('');
     end;
   {$Else}
     begin
      ChangeExpand(CurNode, sbSelect);
      Result := Boolean(2);
     end
    else
     Result := False;
   {$EndIf}
  end;

{$IfDef SkipIterByExcept}
 procedure IterHandlerLevelCollapse(const CurNode : Il3Node); far;
{$Else}
 function IterHandlerLevelCollapse(const CurNode : Il3Node) : Boolean; far;
{$EndIf}
  var
   lCurChild       : Il3Node;
   lHasExpandChild : Boolean;

   begin
    lHasExpandChild := False;
    lCurChild := CurNode.ChildNode;
    If lCurChild <> nil then
     repeat
      lHasExpandChild := IsExpanded(lCurChild);
      If lHasExpandChild or lCurChild.IsLast then break;
      lCurChild := lCurChild.NextNode;
     until False;

   //If not IsExpanded(CurNode) and CurNode.HasChild
   // then

   If not IsRoot(CurNode) and not lHasExpandChild then
  {$IfDef SkipIterByExcept}
   begin
    ChangeExpandPrim(CurNode, sbDeselect);
    Raise ESkipIterateChilds.Create('');
   end;
  {$Else}
   begin
    ChangeExpandPrim(CurNode, sbDeselect);
    Result := Boolean(2);
   end
   else
    Result := False;
  {$EndIf}
  end;

 var
  I : Integer;
  lHasHidden : boolean;
  lItemFlag  : Integer;

begin
 LockModified := True;
 try

  //Оптимизация при работе со всем деревом
  if (DeepLevel = 0) and not f_CommonExpanded and RootNode.IsSame(RNode) then
  begin
   if Expand then
   begin
    lHasHidden := False;
    Changing;
    try
     for I := 0 to pred(f_FlagsList.Count) do
     begin
      lItemFlag := Integer(f_FlagsList.Items[I]);
      f_FlagsList.Items[I] := lItemFlag or nfExpanded;
      lHasHidden := lHasHidden or l3TestMask(lItemFlag, nfHidden);
     end;
     If not lHasHidden then
     begin
      f_CountView := f_FlagsList.Count;
      If not f_ShowRoot then
       f_CountView := f_CountView - 1;
     end;
    finally
     if not lHasHidden then
      inherited DoChanged
     else
      Changed;
    end;//try..finally
   end
   else
   begin
    Changing;
    try
     for I := 1 to pred(f_FlagsList.Count) do
      f_FlagsList.Items[I] := Integer(f_FlagsList.Items[I]) and not nfExpanded;
     //fCountView := f_FlagsList.Count;
     //If not f_ShowRoot then Dec(f_CountView);
    finally
     Changed;
    end;
   end

  end
  else
  begin
   Changing;
   Try
    If DeepLevel = 0 then
      IterateF(l3L2NA(@IterHandlerExpandAll), imParentNeed or imChildsBefore, RNode)
    else
     If Expand then
      While DeepLevel > 0 do
      begin
       IterateF(l3L2NA(@IterHandlerLevelExpand), imParentNeed {or imExpandOnly or imChildsBefore}, RNode);
       Dec(DeepLevel);
      end
      else
      While DeepLevel > 0 do
      begin
       IterateF(l3L2NA(@IterHandlerLevelCollapse), imParentNeed or imExpandOnly {or imChildsBefore}, RNode);
       Dec(DeepLevel);
      end;

    MarkNeedCountView;
    {SetNumOfItem;}
   finally
    Changed;
   end;
  end;
 finally
  LockModified := False;
 end;

end;

 procedure Tl3Tree.ExpandAllInSubDirPrim(const RNode : Il3Node; Mode : Boolean);

  procedure IterHandler(const CurNode : Il3Node); far;
  //function IterHandler(const CurNode : Il3Node) : Boolean; far;
   begin
    If Mode
     then
      begin
       ChangeExpand(CurNode, sbSelect);
      end
     else
      ChangeExpandPrim(CurNode, sbDeselect);
     //NodeFlags[CurNode] := NodeFlags[CurNode] and Not nfExpanded;
   end;

  begin
   Changing;
   LockModified := True;
   Try
    IterateF(l3L2NA(@IterHandler),imParentNeed, RNode);
   finally
    Changed;
    LockModified := False;
   end;
  end;

function Tl3Tree.MakeNodeVisible(const aNode: Il3SimpleNode): Integer;
  //overload;
  {* - зачем-то используется визуалкой в CharToItem,
       видимо для перемещения курсора на узел. }
begin
 Result := MakeNodeVisible(aNode As Il3Node);
end;

 function Tl3Tree.MakeNodeVisible(const aNode : Il3Node): Integer;
  var
   lNode : Il3Node;
  begin
   Result := -1;
   lNode := aNode;
   If lNode = nil then Exit;
   with RootNode do
    While not IsSame(lNode) and (lNode.ParentNode <> Nil) do
    begin
     lNode := lNode.ParentNode;
     ChangeExpand(lNode, sbSelect);
    end;
   Result := GetIndex(aNode);
  end;

 procedure Tl3Tree.ExpandAllLevels(Level : Word; Mode : Boolean);
  Var
   CNode : Il3Node;

  function GetNextS(const CurNode : Il3Node) : Il3Node;
   begin
    If CurNode.HasChild and (GetLevel(CurNode) < Level)
     then Result:=CurNode.ChildNode
     else
      If Not CurNode.IsLast
       then Result:=CurNode.NextNode
       else
        begin
         Result:=CurNode.ParentNode;
         While (Result<>nil) and Result.IsLast do
          Result:=Result.ParentNode;
         If Result<>nil then Result:=Result.NextNode;
        end;
   end;

  begin
   Changing;
   LockModified := True;
   Try
    Dec(Level);
    CNode := f_RootNode;
    ChangeExpand(CNode, sbSelect);

    While CNode <> Nil do
     begin
      CNode := GetNextS(CNode);
      ChangeExpand(CNode, sbSelect);
     end;
    MarkNeedCountView;
   finally
    Changed;
    LockModified := False;
   end;
  end;

function Tl3Tree.GetIndex(const RNode: Il3SimpleNode; const aSubRootNode: Il3SimpleNode = nil) : Integer;
  //overload;
  {-}
begin
 Result := GetIndex(RNode As Il3Node, aSubRootNode As Il3Node);
end;

function Tl3Tree.GetIndex(const RNode : Il3Node; const aSubRootNode : Il3Node = nil) : Integer;
  //overload;
  {-}
  var
   lCount     : Integer;
   lRNodeWrap : Il3Node;
   lResNode   : Il3Node;

  function IterHandler(const CurNode : Il3Node) : Boolean; far;
   begin
    Result := lRNodeWrap.IsSame(CurNode);
    If Result or IsVisible(CurNode) then
     Inc(lCount)
    else
     Byte(Result) := 2;
   end;

  begin
   Result := -1;
   try
    If not IsVisible(RNode) then Exit;
    lRNodeWrap := RNode;
    if lRNodeWrap = nil then Exit;
    if (aSubRootNode = nil) and lRNodeWrap.IsSame(f_CurrentNode)
     then Result := CurrentItem
     else
      begin
       lCount  := -1;
       lResNode := IterateF(l3L2NA(@IterHandler),
                                 imExpandOnly or imCheckResult or imParentNeed, aSubRootNode);
       If lResNode = nil then Exit;
       Result := lCount;

       If (aSubRootNode = nil) then
        begin
         If Not f_ShowRoot then Dec(Result);
         If lCount >= 0
          then
           begin
            f_CurrentNode := lResNode;
            f_CurrentItem := lCount;
           end
          else
           CursorTop;
        end;
      end;
   except
    Result := -1;
   end;
  end;

 function Tl3Tree.FindNodeByParam(const Parent: Il3Node; Param : Integer; aIterMode : integer) : Il3Node;
  var
   lWithOutHidden : boolean;

  function IterHandler(const aCurNode : Il3Node) : Boolean;far;
   begin
    If lWithOutHidden and not IsVisible(aCurNode) then
     Result := False
    else
     Result := (Param = (aCurNode as Il3HandleNode).Handle);
   end;

  begin
   lWithOutHidden := aIterMode and imNoHidden <> 0;
   Result:=IterateF(l3L2NA(@IterHandler), imCheckResult or aIterMode, Parent);
  end;

 function Tl3Tree.SearchByName(const aFirstNode : Il3Node; aNameStr : PAnsiChar; aIterMode : integer) : Il3Node;
  var
   lWithOutHidden : boolean;

  function IterHandler(const aCurNode : Il3Node) : Boolean;far;
   begin
    If lWithOutHidden and not IsVisible(aCurNode) then
     Result := False
    else
     Result := l3AnsiStrLICompExt(aNameStr, aCurNode.Text.S, High(Cardinal)) = 0;
   end;

  begin
   lWithOutHidden := aIterMode and imNoHidden <> 0;
   Result := IterateF(l3L2NA(@IterHandler), aIterMode or imCheckResult, aFirstNode);
  end;

function Tl3Tree.SearchNameBegin(const aFirstNode : Il3SimpleNode;
                                 aSrchStr         : PAnsiChar;
                                 aIterMode        : Integer): Il3SimpleNode;
  //overload;
  {* - зачем-то используется визуалкой в CharToItem. }
begin
 Result := SearchNameBegin(aFirstNode As Il3Node, aSrchStr, aIterMode) As Il3SimpleNode;
end;

function Tl3Tree.SearchNameBegin(const aFirstNode : Il3Node;
                                 aSrchStr         : PAnsiChar;
                                 aIterMode        : integer) : Il3Node;
 var
  Len            : Word;
  lWithOutHidden : Boolean;

 function IterHandler(const aCurNode : Il3Node) : Boolean;far;
 begin//IterHandler
  if lWithOutHidden and not IsVisible(aCurNode) then
   Result := False
  else
   Result := l3AnsiStrLICompExt(aSrchStr, aCurNode.Text.S, Len) = 0;
 end;//IterHandler

begin
 lWithOutHidden := aIterMode and imNoHidden <> 0;
 Len:= l3StrLen(aSrchStr);
 if not l3TestMask(aIterMode,imNoSubRoot) then
  Result := IterateF(l3L2NA(@IterHandler), aIterMode or imCheckResult, RootNode, nil)
 else
  Result := IterateF(l3L2NA(@IterHandler), aIterMode or imCheckResult, RootNode, aFirstNode);
end;

function Tl3Tree.SearchNameOccur(const aFirstNode : Il3SimpleNode;
                                 aSrchStr         : PAnsiChar;
                                 aIterMode        : Integer): Il3SimpleNode;
  //overload;
  {* - зачем-то используется визуалкой в SearchOccurStr,
       который сейчас никем не используется. }
begin
 Result := SearchNameOccur(aFirstNode As Il3Node, aSrchStr, aIterMode) As Il3SimpleNode;
end;

function Tl3Tree.SearchNameOccur(const aFirstNode : Il3Node; aSrchStr : PAnsiChar; aIterMode : integer) : Il3Node;
var
 BT             : Tl3BMTable;
 S              : Tl3String;
 lWithOutHidden : Boolean;

 function IterHandler(const aCurNode : Il3Node) : Boolean;
 var
  Pos : Cardinal;
 begin//IterHandler
  if lWithOutHidden and not IsVisible(aCurNode) then
   Result := False
  else
   Result := S.BMSearchUC((aCurNode as Il3NodeWrap).GetSelf, BT, Pos);
 end;//IterHandler

begin
 lWithOutHidden := aIterMode and imNoHidden <> 0;
 S := Tl3String.Make(l3PCharLen(aSrchStr));
 try
  S.MakeUpper;
  S.MakeBMTable(BT);
  Result := l3IterateSubTreeF(RootNode, l3L2NA(@IterHandler), aIterMode or imCheckResult, aFirstNode);
 finally
  l3Free(S);
 end;{try..finally}
end;

function Tl3Tree.GetByPath(const aPathStr : Tl3WString) : Il3Node;
var
 l_Str: Tl3WString;
begin
 if l3IsNil(aPathStr) then
  Result := nil
 else
 begin
  l_Str := aPathStr;
  Result := GetPartPath(l_Str);
  if not l3IsNil(l_Str) then
   Result := nil;
 end;
end;

function Tl3Tree.GetPartPath(var aPathStr : Tl3WString) : Il3Node;
begin
 Result := l3GetPartPath(f_RootNode, aPathStr, f_LevelSlash.St);
end;

function Tl3Tree.GetPartPathStr(Var aPathStr : AnsiString) : Il3Node;
var
 lPartPath : Tl3WString;
begin
 lPartPath := l3PCharLen(aPathStr);
 Result := GetPartPath(lPartPath);
 aPathStr := l3PCharLen2String(lPartPath);
end;

 function Tl3Tree.ChangeExpandPrim(const aNode : Il3Node; Mode : Tl3SetBitType) : Boolean;
  var
   lNodeIndex : Integer;
   lFlags     : Integer;

  begin
   Result := True;
   If f_CommonExpanded
    then
     begin
      lFlags := aNode.Flags;
      Case Mode of
       sbSelect   : lFlags := lFlags or nfExpanded;
       sbDeselect : lFlags := lFlags and not nfExpanded;
       sbInvert   : lFlags := lFlags xor nfExpanded;
      end;
      aNode.Flags := lFlags;
     end
    else
     begin
      lNodeIndex := GetAbsIndex(aNode);
      try
       lFlags := Integer(f_FlagsList.Items[lNodeIndex]);
      except
       Result := False;
       Exit;
      end;
      Case Mode of
       sbSelect   : lFlags := lFlags or nfExpanded;
       sbDeselect : lFlags := lFlags and not nfExpanded;
       sbInvert   : lFlags := lFlags xor nfExpanded;
      end;

      f_FlagsList.Items[lNodeIndex] := lFlags;
     end; 
  end;

function Tl3Tree.ChangeExpand(const aNode : Il3SimpleNode;
                              aMode       : Tl3SetBitType;
                              aForceMode  : Boolean = False) : Boolean;
  //overload;
  {* - меняет развернутость узла. }
begin
 Result := ChangeExpand(aNode As Il3Node, aMode, aForceMode);
end;

function Tl3Tree.ChangeExpand(const RNode : Il3Node; Mode : Tl3SetBitType; aForceMode : Boolean = False) : boolean;
var
 lExpLog             : Boolean;
 lCntInExpNodeBefore : Integer;
 lCntInExpNodeAfter  : Integer;
 lCountView          : Integer;
 lNeedCountViewCalc  : Boolean;

begin
 If Not aForceMode then
 begin
  If (RNode = nil) or IsRoot(RNode) or not RNode.MaybeChild then
  begin
   Result := False;
   Exit;
  end;
 end;

 Result := True;
 lExpLog := IsExpanded(RNode);
 If (lExpLog and (Mode = sbSelect)) or (Not lExpLog and (Mode = sbDeselect)) then Exit;
 Changing;
 LockModified := True;
 Try
  Case Mode of
   sbSelect   : lExpLog := True;
   sbDeselect : lExpLog := False;
   sbInvert   : lExpLog := Not lExpLog;
  end;

  lNeedCountViewCalc := IsAllParentExpanded(RNode);

  if lNeedCountViewCalc then
   lCntInExpNodeBefore := CountViewItemsInSubDir(RNode)
  else
   lCntInExpNodeBefore := High(lCntInExpNodeBefore);
   // - это чтобы компилятор не выебывался

  //GetIndex(RNode); //?? Возможно это лишнее
  lCountView := f_CountView;

  if lExpLog then
   ChangeExpandPrim(RNode, sbSelect)
  else
   ExpandAllInSubDirPrim((RNode as Il3NodeWrap).GetSelf, False);

  if lNeedCountViewCalc then
  begin
   lCntInExpNodeAfter := CountViewItemsInSubDir(RNode);
   If f_CountView > l3_NeedCountView then
    f_CountView := lCountView + lCntInExpNodeAfter - lCntInExpNodeBefore;
  end;//lNeedCountViewCalc

  Result := True;
 finally
  LockModified := False;
  CursorTop;
  inherited DoChanged;
 end;
end;

function Tl3Tree.ConcatFlags(aTreeFlag, aNodeFlag : Integer) : Integer;
var
 lTreeMask : integer;
begin
 //Первые 2 байта в дерево, остальные в ноду
 lTreeMask := $FFFF;
 If f_CommonExpanded then l3ClearMask(lTreeMask, nfExpanded);

 Result := l3GetByMask(aTreeFlag, lTreeMask) or l3GetByMask(aNodeFlag, not lTreeMask);
end;

function Tl3Tree.DeleteSelectedNodes: Boolean;
var
 l_Selected, l_PrevSelected: Il3Node;
begin
 l_PrevSelected:= nil;
 l_Selected:= GetNextSelect(l_PrevSelected);
 if l_Selected <> nil then
 begin
  Result := True;
  Changing;
  try
   while l_Selected <> nil do
   begin
    l_PrevSelected:= l_Selected;
    l_Selected:= GetNextSelect(l_PrevSelected);
    l_PrevSelected.Delete;
   end; // l_Selected <> nil
  finally
   Changed;
  end;
 end
 else
  Result:= False;
end;

procedure Tl3Tree.ClearSelected;

 function IterHandler(const aNode: Il3Node): Boolean; far;
 var
  l_Flags: Integer;
 begin
  Result := True;
  l_Flags := Get_NodeFlags(aNode);
  Set_NodeFlags(aNode, l_Flags and not nfSelected);
 end;

begin
 IterateF(l3L2NA(@IterHandler));
end;

procedure Tl3Tree.SplitFlags(aFlags : Integer; var aTreeFlag : Integer; var aNodeFlag : Integer);
var
 lTreeMask : integer;
begin
 //Первые 2 байта в дерево, остальные в ноду
 lTreeMask := $FFFF;

 If f_CommonExpanded then l3ClearMask(lTreeMask, nfExpanded);

 aTreeFlag := l3GetByMask(aFlags, lTreeMask);
 aNodeFlag := l3GetByMask(aFlags, not lTreeMask);
end;

function Tl3Tree.Get_Tree: Il3Tree;
  {-}
begin
 Result := Self;
end;

procedure Tl3Tree.Set_Tree(const aValue: Il3Tree);
  {-}
begin
 if (aValue = nil) then
  RootNode := nil
 else
  RootNode := aValue.CRootNode; 
end;

end.

