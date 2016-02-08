
{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3IterMode.inc -            }
{ Начат: 20.06.2003 17:19 }
{ $Id: l3IterMode.inc,v 1.5 2007/12/26 11:14:21 lulin Exp $ }

// $Log: l3IterMode.inc,v $
// Revision 1.5  2007/12/26 11:14:21  lulin
// - cleanup.
//
// Revision 1.4  2006/12/22 12:11:16  lulin
// - cleanup.
//
// Revision 1.3  2003/12/27 16:39:05  law
// - new behavior: не прогружаем список при очистке кеша.
//
// Revision 1.2  2003/07/28 08:46:21  demon
// - comment fix.
//
// Revision 1.1  2003/06/20 13:23:51  law
// - new file: l3IterMode.inc.
//

{$Include l3Define.inc }

const
  {IterMode const}
  imExpandOnly    = $01;
   {* - перебирать только открытые узлы }
  imCheckResult   = $02;
   {* - проверять результат, возвращаемый подитеративной функцией (см. Tl3NodeAction) }
  imOneLevel      = $04;
   {* - перебрать только один уровень }
  imParentNeed    = $08;
   {* - включить RootSubNode в список перебираемых }
  imNoSubRoot     = $10;
   {* - RootSubNode - точка начала, но не корень, так же перебираются узлы расположенные на том же уровне, что и RootSubNode и выше него }
  imChildsBefore  = $20;
   {* - перебрать все дочерние узлы перед их родителем, т.е. дети перебираются вперед }
  imNoChilds      = $40;
   {* - не перебирать дочерние узлы, используется во внутренних процедурах}
  imNoHidden      = $80;
   {* - не перебирать невидимые, поддерживается только процедурами Tl3Tree}

