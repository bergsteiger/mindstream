unit l3SearchNode;
 
{$Include l3Define.inc}

interface

uses
  l3SearchNodePrim,
  l3SearchNodePrimList
  ;

type
 Tl3SearchNode = class(Tl3SearchNodePrim)
 private
 // private fields
   f_Children : Tl3SearchNodePrimList;
 protected
 // property methods
   function pm_GetChildren(anIndex: Integer): Tl3SearchNode;
   procedure pm_SetChildren(anIndex: Integer; aValue: Tl3SearchNode);
   function pm_GetChildrenCount: Integer;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ‘ункци€ очистки полей объекта. }
 public
 // public methods
   procedure AddChild(aChild: Tl3SearchNode);
   procedure Split(aPos: Integer);
     {* раздел€ет ноду на две, раздел€€ текст пополам, хвостик текста переносит в новую ноду, которую добавл€ет себе в дети, в неЄ же уезжают все текущие дети и данные }
   procedure DropChildren;
 public
 // public properties
   property Children[anIndex: Integer]: Tl3SearchNode
     read pm_GetChildren
     write pm_SetChildren;
   property ChildrenCount: Integer
     read pm_GetChildrenCount;
 end;//Tl3SearchNode

implementation

uses
  SysUtils,
  l3String,
  l3Interfaces
  ;

// start class Tl3SearchNode

procedure Tl3SearchNode.AddChild(aChild: Tl3SearchNode);
//#UC START# *4E5CE02103C4_4E5CDF9303B7_var*
//#UC END# *4E5CE02103C4_4E5CDF9303B7_var*
begin
//#UC START# *4E5CE02103C4_4E5CDF9303B7_impl*
 if f_Children = nil then
  f_Children := Tl3SearchNodePrimList.Create;
 f_Children.Add(aChild);
//#UC END# *4E5CE02103C4_4E5CDF9303B7_impl*
end;//Tl3SearchNode.AddChild

procedure Tl3SearchNode.Split(aPos: Integer);
//#UC START# *4E5DDB4401B4_4E5CDF9303B7_var*
var
 l_NewNode: Tl3SearchNode;
 l_NewText: Il3CString;
//#UC END# *4E5DDB4401B4_4E5CDF9303B7_var*
begin
//#UC START# *4E5DDB4401B4_4E5CDF9303B7_impl*
 if (aPos > 0) and (aPos < Text.AsWStr.SLen) then
 begin
  l_NewText := l3Copy(Text, aPos);
  Text := l3Copy(Text, 0, aPos);
  l_NewNode := Tl3SearchNode.Create(l_NewText, Data);
  try
   Data := nil;
   l_NewNode.f_Children := Self.f_Children;
   f_Children := nil;
   AddChild(l_NewNode);
  finally
   FreeAndNil(l_NewNode);
  end;
 end;
//#UC END# *4E5DDB4401B4_4E5CDF9303B7_impl*
end;//Tl3SearchNode.Split

procedure Tl3SearchNode.DropChildren;
//#UC START# *4E672AF8013E_4E5CDF9303B7_var*
//#UC END# *4E672AF8013E_4E5CDF9303B7_var*
begin
//#UC START# *4E672AF8013E_4E5CDF9303B7_impl*
 FreeAndNil(f_Children);
//#UC END# *4E672AF8013E_4E5CDF9303B7_impl*
end;//Tl3SearchNode.DropChildren

function Tl3SearchNode.pm_GetChildren(anIndex: Integer): Tl3SearchNode;
//#UC START# *4E5CDFED0163_4E5CDF9303B7get_var*
//#UC END# *4E5CDFED0163_4E5CDF9303B7get_var*
begin
//#UC START# *4E5CDFED0163_4E5CDF9303B7get_impl*
 Result := Tl3SearchNode(f_Children.Items[anIndex]);
//#UC END# *4E5CDFED0163_4E5CDF9303B7get_impl*
end;//Tl3SearchNode.pm_GetChildren

procedure Tl3SearchNode.pm_SetChildren(anIndex: Integer; aValue: Tl3SearchNode);
//#UC START# *4E5CDFED0163_4E5CDF9303B7set_var*
//#UC END# *4E5CDFED0163_4E5CDF9303B7set_var*
begin
//#UC START# *4E5CDFED0163_4E5CDF9303B7set_impl*
 f_Children.Items[anIndex] := aValue;
//#UC END# *4E5CDFED0163_4E5CDF9303B7set_impl*
end;//Tl3SearchNode.pm_SetChildren

function Tl3SearchNode.pm_GetChildrenCount: Integer;
//#UC START# *4E5CE35201C3_4E5CDF9303B7get_var*
//#UC END# *4E5CE35201C3_4E5CDF9303B7get_var*
begin
//#UC START# *4E5CE35201C3_4E5CDF9303B7get_impl*
 if f_Children = nil then
  Result := 0
 else
  Result := f_Children.Count;
//#UC END# *4E5CE35201C3_4E5CDF9303B7get_impl*
end;//Tl3SearchNode.pm_GetChildrenCount

procedure Tl3SearchNode.Cleanup;
//#UC START# *479731C50290_4E5CDF9303B7_var*
//#UC END# *479731C50290_4E5CDF9303B7_var*
begin
//#UC START# *479731C50290_4E5CDF9303B7_impl*
 DropChildren;
 inherited;
//#UC END# *479731C50290_4E5CDF9303B7_impl*
end;//Tl3SearchNode.Cleanup

end.