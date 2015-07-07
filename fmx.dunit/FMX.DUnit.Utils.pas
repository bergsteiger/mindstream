unit FMX.DUnit.Utils;

interface

uses
 FMX.TreeView
 ;

type
 TDoSomethingWithNode = reference to procedure(const aItem: TTreeViewItem; var aDone: Boolean);

 procedure TraverseTree(const aTree: TTreeView; aLambda: TDoSomethingWithNode);

implementation

procedure TraverseTree(const aTree: TTreeView;
                       aLambda: TDoSomethingWithNode);

 procedure TraverseNode(const aNode: TTreeViewItem;
                                          var aDone: Boolean;
                                          aLambda: TDoSomethingWithNode);
 var
  l_Index: Integer;
 begin
  for l_Index := 0 to Pred(aNode.Count) do
  begin
   aLambda(aNode.Items[l_Index], aDone);

   if aNode.Count>0 then
    TraverseNode(aNode.Items[l_Index], aDone, aLambda);

   if aDone then Exit;
  end;
 end;

var
 l_Index: Integer;
 l_Done: Boolean;
begin
 l_Done := False;
 for l_Index := 0 to Pred(aTree.Count) do
 begin
  aLambda(aTree.Items[l_Index], l_Done);
  TraverseNode(aTree.Items[l_Index], l_Done, aLambda);
  if l_Done then Exit;
 end;
end;

end.
