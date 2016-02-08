(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
{$IfDef m2AllocSize}
 type
        TUnitHelper               = class(TObject)
         private


         protected


         public


                procedure         BeforeDestruction   (
                                                      ); override;


         end;


 var
        GUnitHelper:              TUnitHelper = nil;


// TUnitHelper.private

// TUnitHelper.protected

// TUnitHelper.public

 procedure   TUnitHelper.BeforeDestruction(
                                          );
 begin

  inherited BeforeDestruction();

 end;


// TUnitHelper.end


 initialization GUnitHelper:=TUnitHelper.Create();
 finalization   GUnitHelper.Free();
{$EndIf m2AllocSize}
