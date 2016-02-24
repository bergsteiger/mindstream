{$IfNDef k2Define}
{$Define k2Define}
{ Библиотека "Эверест"  }
{ Автор: Люлин А.В. ©   }
{ Модуль: k2Define - }
{ Начат: 12.04.98 11:28 }
{ $Id: k2Define.inc,v 1.67 2012/10/26 19:41:55 lulin Exp $ }

// $Log: k2Define.inc,v $
// Revision 1.67  2012/10/26 19:41:55  lulin
// - вычищаем поддержку ветки редактора.
//
// Revision 1.66  2012/10/26 19:12:33  lulin
// - вычищаем поддержку ветки редактора.
//
// Revision 1.65  2012/06/05 13:10:46  voba
// no message
//
// Revision 1.64  2012/02/03 17:09:25  lulin
// {RequestLink:333548940}
// - рисуем изменения Жени на модели.
//
// Revision 1.63  2011/09/19 12:21:24  lulin
// - директива k2GeneratorIsNotComponent.
//
// Revision 1.62  2009/07/23 17:28:54  lulin
// - убираем ненужный запрос интерфейса.
// - правим наследование у SomeDataContainer.
//
// Revision 1.61  2009/03/05 16:20:42  lulin
// - <K>: 137470629. Убрана ненужная ссылка на тип по идентификатору.
//
// Revision 1.60  2009/02/25 12:44:16  lulin
// - <K>: 90441983. Чистка кода для переноса на модель.
//
// Revision 1.59  2009/02/25 12:04:14  lulin
// - <K>: 90441983. Чистка кода для переноса на модель.
//
// Revision 1.58  2008/10/09 13:37:42  lulin
// - <K>: 121145547.
//
// Revision 1.57  2008/09/16 12:19:41  lulin
// - переносим TnevParaList на модель.
//
// Revision 1.56  2008/04/15 09:03:23  lulin
// - правим название директив - чтобы соответствовали смыслу.
//
// Revision 1.55  2008/04/15 08:58:47  lulin
// - восстанавливаем компилируемость Немезиса.
//
// Revision 1.54  2007/12/05 12:35:08  lulin
// - вычищен условный код, составлявший разницу ветки и Head'а.
//
// Revision 1.53  2007/09/14 13:26:19  lulin
// - объединил с веткой B_Tag_Clean.
//
// Revision 1.52.2.1  2007/09/13 10:52:04  lulin
// - bug fix: не собирался Немезис.
//
// Revision 1.52  2007/09/05 11:57:55  lulin
// - сделана возможность определять проектные директивы в специально отведенном файле.
//
// Revision 1.51  2007/09/03 10:46:48  lulin
// - уменьшаем число параметров.
//
// Revision 1.50  2007/08/30 10:09:21  lulin
// - убираем ненужную функцию поиска.
//
// Revision 1.49  2007/08/29 15:33:21  lulin
// - cleanup.
//
// Revision 1.48  2007/08/28 15:27:08  lulin
// - cleanup.
//
// Revision 1.47  2007/08/13 17:41:21  lulin
// - вычищена ненужная функциональность по построению дерева тегов.
//
// Revision 1.46  2007/08/13 17:30:59  lulin
// - cleanup.
//
// Revision 1.45  2007/02/20 13:03:43  lulin
// - выключаем ненужную функциональность.
//
// Revision 1.44  2006/11/25 16:50:32  lulin
// - удалена запись,чтение маски заполненных тегов.
//
// Revision 1.43  2006/11/03 11:00:44  lulin
// - объединил с веткой 6.4.
//
// Revision 1.42.14.1  2006/10/26 09:10:21  lulin
// - используем "родную" директиву.
//
// Revision 1.42  2006/01/18 08:54:36  lulin
// - изыскания на тему прямой установки целочисленных атрибутов, без преобразования их к тегам.
//
// Revision 1.41  2006/01/16 17:05:58  lulin
// - отключил использование безоберточных строк.
//
// Revision 1.40  2006/01/16 16:41:44  lulin
// - сделана возможность работать со строками без теговых оберток (почему-то на производительность не повлияло).
//
// Revision 1.39  2005/06/30 16:38:22  lulin
// - выключено кеширование атрибутов тегов, как вредное и приводящее к лишней нотификации и в силу этого к замедлению при загрузке документа.
//
// Revision 1.38  2005/06/23 13:42:57  lulin
// - буфер документа переехал в папку K2.
//
// Revision 1.37  2005/06/22 17:14:57  lulin
// - cleanup.
//
// Revision 1.36  2005/04/28 15:04:09  lulin
// - переложил ветку B_Tag_Box в HEAD.
//
// Revision 1.35  2005/04/22 12:53:27  vaso
// new define: ARM
//
// Revision 1.34.2.1  2005/04/25 09:03:46  lulin
// - объединил с HEAD.
//
// Revision 1.35  2005/04/22 12:53:27  vaso
// new define: ARM
//
// Revision 1.34  2005/04/19 09:34:17  lulin
// - убираем дерево тегов в релизном варианте.
//
// Revision 1.33  2005/04/15 08:59:57  lulin
// - теперь держим ссылку на тег, а не собственно тег.
//
// Revision 1.32  2005/04/01 14:48:52  lulin
// - доточка напильником - чтобы "парень" скомпилировался.
//
// Revision 1.31  2005/03/31 16:13:15  lulin
// - new methods: InevPara.OwnerTag, OwnerPara.
//
// Revision 1.30  2005/03/31 12:34:15  lulin
// - new unit: nevParaList.
//
// Revision 1.29  2004/08/03 07:52:37  voba
// - add ARCHI define
//
// Revision 1.28  2004/06/22 13:47:27  law
// - для DesignTimeLibrary включил директиву _k2NoTagTree.
//
// Revision 1.27  2004/06/01 08:04:08  law
// - расставлены define'ы для _ALCU.
//
// Revision 1.26  2004/05/31 17:26:31  law
// - new define: _k2CacheTagChildren.
//
// Revision 1.25  2004/05/31 10:14:57  law
// - define перенесен в правильное место (evDefine.inc).
//
// Revision 1.24  2004/05/27 12:13:52  law
// - для Немезиса включил директиву _k2CacheTagObject.
//
// Revision 1.23  2004/03/24 09:26:14  law
// - new behavior: пропускаем единичные ссылки с DocID = 0.
//
// Revision 1.22  2004/03/16 18:13:04  law
// - change: для Немезиса выключена директива _k2GeneratorIsComponent - должно в общем жрать поменьше ресурсов.
//
// Revision 1.21  2003/09/23 11:44:14  law
// - new define: _k2CacheTagObject - пока не работает (эксперименты с кешом).
//
// Revision 1.20  2003/07/04 19:39:56  law
// - оптимизация переформатирования текста в фоновом режиме (до конца не доделано, но светлые мысли есть).
//
// Revision 1.19  2003/04/19 12:48:25  law
// - new directive: _evForEEGen.
//
// Revision 1.18  2003/04/19 12:30:39  law
// - new file: ddDefine.inc.
//
// Revision 1.17  2003/04/19 11:24:48  law
// - new file: vtDefine.inc.
//
// Revision 1.16  2003/03/17 16:17:25  law
// - bug fix: new directive evNotNeedAddMask.
//
// Revision 1.15  2002/12/26 15:11:34  law
// - new dll: собрана более легкая версия dll-печати.
//
// Revision 1.14  2002/12/26 14:35:25  law
// - new dll: собрана более легкая версия dll-печати.
//
// Revision 1.13  2002/03/26 16:31:57  law
// - cleanup.
//
// Revision 1.12  2002/03/18 13:12:52  law
// - new directive: _k2NotForEditor.
//
// Revision 1.11  2002/01/08 13:15:52  law
// - new behavior: сделано отключение _k2TagTree для EverestLite.
//
// Revision 1.10  2001/12/24 13:20:40  law
// - cleanup.
//
// Revision 1.9  2001/09/10 09:51:45  law
// - new define: добавлена опция _k2NoTagTree.
//
// Revision 1.8  2001/05/31 08:06:42  law
// - cleanup: убрана запись компонент.
//
// Revision 1.7  2001/04/02 11:45:52  law
// - сделано выключение директивы _k2TagTree при включенной директиве _EverestRelease.
//
// Revision 1.6  2001/02/28 13:15:02  law
// - расширен интерфейс Ik2PropertyBag.
//
// Revision 1.5  2000/12/15 15:18:58  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

{$IfDef ALCU}
 {.$Define k2NotForEditor}
{$EndIf ALCU}

{$IfNDef k2NotForEditor}
 {$Define k2ForEditor}
{$EndIf  k2NotForEditor}

{$IfNDef k2GeneratorIsNotComponent}
 {$Define k2GeneratorIsComponent}
{$EndIf k2GeneratorIsNotComponent}

{$IfDef l3ConsoleApp}
 {$Undef k2ForEditor}
 {$Undef k2GeneratorIsComponent}
{$EndIf l3ConsoleApp}

{$IfDef Nemesis}
 {$Undef k2GeneratorIsComponent}
{$EndIf Nemesis}

{.$IfDef Archi}
 {.$I ArchiDefine.inc}
{.$EndIf Archi}

{$IfDef UseProjectDefine}
 {$I ProjectDefine.inc}
{$EndIf UseProjectDefine}

{$EndIf  k2Define}