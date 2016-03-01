{$IfNDef vcmDefine}
{ Библиотека "vcm"        }
{ Автор: Люлин А.В. ©     }
{ Модуль: vcmDefine.inc - }
{ Начат: 24.02.2003 13:36 }
{ $Id: vcmDefine.inc,v 1.37 2015/04/24 14:51:43 lulin Exp $ }

// $Log: vcmDefine.inc,v $
// Revision 1.37  2015/04/24 14:51:43  lulin
// - правильный define.
//
// Revision 1.36  2015/03/31 17:32:34  lulin
// - перетряхиваем зависимости.
//
// Revision 1.35  2012/03/23 15:56:39  lulin
// - выпиливаем настройки.
//
// Revision 1.34  2012/03/22 19:07:56  lulin
// - определены дефайны.
//
// Revision 1.33  2012/03/22 06:39:59  lulin
// - чистим код от мусора.
//
// Revision 1.32  2012/03/21 18:08:37  lulin
// {RequestLink:349116364}
//
// Revision 1.31  2011/05/06 14:28:04  lulin
// - правим IfDef'ы.
//
// Revision 1.30  2010/09/22 10:27:04  oman
// - new: {RequestLink:234366672}
//
// Revision 1.29  2010/09/13 17:43:55  lulin
// {RequestLink:235047275}.
//
// Revision 1.28  2010/03/02 10:23:50  lulin
// {RequestLink:193823544}.
// - bug fix: не собиралась библиотека конвертации.
//
// Revision 1.27  2009/12/22 16:46:45  lulin
// - удалось запустить тест создающий форму.
//
// Revision 1.26  2009/10/01 15:08:22  lulin
// - чистка кода.
//
// Revision 1.25  2009/08/18 08:47:32  lulin
// {ReqestLink:158795592}. №2.
//
// Revision 1.24  2009/01/23 09:48:46  lulin
// - bug fix: не собиралась библиотека.
//
// Revision 1.23  2008/07/02 10:51:03  lulin
// - <K>: 95486333.
//
// Revision 1.22  2008/03/20 11:31:39  lulin
// - bug fix: не открывался StdRes.
//
// Revision 1.21  2008/03/19 17:09:10  lulin
// - <K>: 87589523.
//
// Revision 1.20  2007/08/13 17:23:26  lulin
// - cleanup.
//
// Revision 1.19  2006/12/15 12:57:29  mmorozov
// - new behaviour: Встраивание панелей навигатора под основной тулбар (CQ: OIT5-21250). Положение главного тулбара определяется директивой vcmUseMainToolbarPanel;
//
// Revision 1.18  2006/06/23 10:42:23  mmorozov
// - new: профайлеры в библиотеке VCM;
//
// Revision 1.17  2005/09/22 12:13:46  demon
// - new behavior: не выводим информацию о временах в лог
//
// Revision 1.16  2005/07/19 15:07:36  mmorozov
// - вывод в лог времени созания форм;
//
// Revision 1.15  2005/07/13 15:12:44  mmorozov
// - изменения связанные с измерением загрузки документа;
//
// Revision 1.14  2005/07/12 07:26:55  mmorozov
// - bugfix;
//
// Revision 1.13  2005/07/08 12:31:01  mmorozov
// new: defines;
//
// Revision 1.12  2004/09/08 11:22:35  lulin
// - new define: _l3NoTrace.
// - new define: l3TraceObjects.
//
// Revision 1.11  2004/08/17 10:48:30  law
// - define'ы для Немезиса прописаны в inc-файлах.
//
// Revision 1.10  2004/08/02 14:05:33  law
// - открутил VCM от тесной интеграции с моделью Немезиса.
//
// Revision 1.9  2004/03/24 14:45:55  law
// - new define: vcmGetToolbarPosesFromContainer - включен для Немезиса.
//
// Revision 1.8  2004/02/27 15:55:05  nikitin75
// + OvcController для поддержки shortcuts;
//
// Revision 1.7  2003/12/18 17:19:53  law
// - борьба с мерцанием.
//
// Revision 1.6  2003/12/17 13:02:16  law
// - bug fix: неправильно отображалит стандартные Toolbar'ы.
//
// Revision 1.5  2003/11/28 16:36:15  law
// - new behavior: используем Combo-Tree в VCM.
//
// Revision 1.4  2003/09/30 10:38:58  law
// - new define: vcmNotExportHelp.
//
// Revision 1.3  2003/09/26 15:23:55  law
// - new behavior: начал делать слитие строковых ресурсов.
//
// Revision 1.2  2003/07/24 16:04:07  law
// - new behavior: набираем список доступных операций.
//
// Revision 1.1  2003/04/01 12:54:39  law
// - переименовываем MVC в VCM.
//
// Revision 1.2  2003/03/14 12:20:51  law
// - change: отвязываем vcm от l3.
//
// Revision 1.1  2003/02/24 10:41:08  law
// - new file: vcmDefine.inc.
//

{$Define vcmDefine}

{$IfDef Nemesis}
 {$IfNDef DesignTimeLibrary}
  {.$Define vcmUseProfile}
  {$IfOpt D+}
  {$EndIf}
  {$Define vcmExportHelp}
  {$Define vcmUseComboTree}
  {$Define vcmNeedEverest}
  {$Define vcmGetToolbarPosesFromContainer}
  {$Define vcmNeedElPack}
  {$If not Defined(nsTest) OR Defined(InsiderTest)}
   {$IfNDef Monitorings}
    {.$IfNDef NewGen}
     {$Define vcmUseSettings}
    {.$EndIf NewGen} 
   {$EndIf Monitorings}
  {$IfEnd}
  {$Define vcmNotUseElCombo}
  {$IfNDef DesignTimeLibrary}
  {$Define vcmUseProfilers}
  {$EndIf DesignTimeLibrary}
  {$IfNDef NoVCM}
   {$Define IsVCMProject}
  {$EndIf NoVCM}
 {$EndIf DesignTimeLibrary}
{$EndIf Nemesis}

{.$Define vcmUseMainToolbarPanel}
 // - наличие директивы определяет положение главной панели инструментов,
 //   которая будет расположена в зоне главной формы с Align = alClient;

{$If (not Defined(Nemesis) OR Defined(nsTest)) AND not Defined(DisignTimeLibrary) AND not Defined(InsiderTest)}
 {$Define vcmStandAloneDispatcher}
{$IfEnd}

{$IfNDef vcmNotNeedL3}
 {$Define vcmNeedL3}
 {$Include l3Define.inc}
{$EndIf  vcmNotNeedL3}

{$IfNDef vcmNeedL3}
 {$Undef vcmExportHelp}
{$EndIf  vcmNeedL3}

{$IfDef vcmNotExportHelp}
 {$Undef vcmExportHelp}
{$EndIf vcmNotExportHelp}

{$IfDef vcmUseComboTree}
 {$IfNDef vtDefine}
  {$Include vtDefine.inc}
 {$EndIf vtDefine} 
{$EndIf vcmUseComboTree}

{$If Defined(Nemesis)}
 {$If Defined(Admin) OR Defined(Monitorings)}
  {$Define NoTabs}
 {$IfEnd}
{$Else}
 {$Define NoTabs}
{$IfEnd}

{$EndIf vcmDefine}
