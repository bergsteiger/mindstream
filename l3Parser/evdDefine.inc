{$IfNDef evdDefine}
{$Define evdDefine}
{ Библиотека "EVD"      }
{ Автор: Люлин А.В. ©   }
{ Модуль: evdDefine - }
{ Начат: 23.06.2005 14:18 }
{ $Id: evdDefine.inc,v 1.12 2015/08/17 11:40:57 lulin Exp $ }

// $Log: evdDefine.inc,v $
// Revision 1.12  2015/08/17 11:40:57  lulin
// {RequestLink:604929313}.
//
// Revision 1.11  2015/05/19 16:16:36  lulin
// - чистим код.
//
// Revision 1.10  2012/06/05 13:10:39  voba
// no message
//
// Revision 1.9  2010/06/10 11:35:31  lulin
// {RequestLink:159355611}.
//
// Revision 1.8  2009/08/20 11:33:21  dinishev
// Bug fix: в Everest'е записывали в старом формате.
//
// Revision 1.7  2008/09/01 13:25:57  lulin
// - собираем "правильный" Эверест - http://mdp.garant.ru/pages/viewpage.action?pageId=111739807&focusedCommentId=112722262#comment-112722262
//
// Revision 1.6  2007/09/05 11:57:53  lulin
// - сделана возможность определять проектные директивы в специально отведенном файле.
//
// Revision 1.5  2007/09/04 16:12:27  lulin
// - включаем директивы проекта.
//
// Revision 1.4  2007/08/29 14:27:02  lulin
// - пакуем EVD-теги - вместо слова, пишем байт.
//
// Revision 1.3  2007/08/29 13:10:24  lulin
// - cleanup.
//
// Revision 1.2  2005/07/21 13:00:42  lulin
// - писатель формата EVD переехал в папку EVD.
//
// Revision 1.1  2005/06/23 10:26:07  lulin
// - добавлены новые модули.
//

{$Include k2Define.inc }

{$Define evdNeedEverestTxt}
{$Define evdNeedNSRCWriter}

{$IfDef EverestLite}
 {$IfNDef evdNeedNSRCWriter}
  {$Undef evdNeedEverestTxt}
 {$EndIf  evdNeedNSRCWriter} 
{$EndIf EverestLite}

{$IfDef evMyEditor}
 {$Undef evdNeedNSRCWriter}
 {$Undef evdNeedEverestTxt}
{$EndIf evMyEditor}

{.$IfDef Archi}
 {.$I ArchiDefine.inc}
{.$EndIf Archi}

{$IfDef UseProjectDefine}
 {$I ProjectDefine.inc}
{$EndIf UseProjectDefine}

{$EndIf  evdDefine}