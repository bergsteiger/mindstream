{$IfNDef l3TreeDataObject_imp}
 
{$Define l3TreeDataObject_imp}
 {$Include l3InterfacedDataObject.imp.pas}
 _l3TreeDataObject_ = {mixin} class(_l3InterfacedDataObject_)
  {* Объект данных дерева }
 protected
 // overridden protected methods
   function DoGetData(const aFormatEtcIn: TFormatEtc;
    var medium: Tl3StoragePlace): HResult; override;
 public
 // overridden public methods
   function AcceptableTymed: Integer; override;
 protected
 // protected methods
   function GetFormats: Tl3ClipboardFormats; virtual;
 public
 // public methods
   constructor Create(const aData: _DataType_); reintroduce; virtual;
 end;//_l3TreeDataObject_

{$Else l3TreeDataObject_imp}

{$Include l3InterfacedDataObject.imp.pas}

// start class _l3TreeDataObject_

function _l3TreeDataObject_.GetFormats: Tl3ClipboardFormats;
//#UC START# *48F4B33501DE_4680F8DE02E2_var*
//#UC END# *48F4B33501DE_4680F8DE02E2_var*
begin
//#UC START# *48F4B33501DE_4680F8DE02E2_impl*
 Result := l3FormatArray([CF_TreeNode]);
//#UC END# *48F4B33501DE_4680F8DE02E2_impl*
end;//_l3TreeDataObject_.GetFormats

constructor _l3TreeDataObject_.Create(const aData: _DataType_);
//#UC START# *48F4B34B0192_4680F8DE02E2_var*
//#UC END# *48F4B34B0192_4680F8DE02E2_var*
begin
//#UC START# *48F4B34B0192_4680F8DE02E2_impl*
 inherited Create(aData, GetFormats);
//#UC END# *48F4B34B0192_4680F8DE02E2_impl*
end;//_l3TreeDataObject_.Create

function _l3TreeDataObject_.DoGetData(const aFormatEtcIn: TFormatEtc;
  var medium: Tl3StoragePlace): HResult;
//#UC START# *48F3495D0398_4680F8DE02E2_var*
var
 l_Handle : THandle;
 l_Data   : Pl3TreeData;
 l_Node   : Il3SimpleNode;
//#UC END# *48F3495D0398_4680F8DE02E2_var*
begin
//#UC START# *48F3495D0398_4680F8DE02E2_impl*
 Result := inherited DoGetData(aFormatEtcIn, medium);
 if (Result <> S_Ok) then
 begin
  with aFormatEtcIn do
  begin
   if (cfFormat = CF_TreeNode) then
   begin
    if Supports(Data, Il3SimpleNode, l_Node) then
     try
      if (tymed AND TYMED_HGLOBAL <> 0) then
      begin
       medium.tymed := TYMED_HGLOBAL;
       l_Handle := l3System.GlobalAlloc(GMEM_SHARE, SizeOf(Tl3TreeData));
       try
        l_Data := GlobalLock(l_Handle);
        try
         l3FillChar(l_Data^, SizeOf(l_Data^), 0);
         Pointer(l_Data.rNode) := Pointer(l_Node);
        finally
         GlobalUnlock(l_Handle);
        end;//try..finally
        medium.hGlobal := l3System.ReleaseHandle(l_Handle);
        Result := S_Ok;
       except
        l3System.GlobalFree(l_Handle);
        Result := E_OutOfMemory;
       end;//try..except
      end;//tymed AND TYMED_HGLOBAL <> 0
     finally
      l_Node := nil;
     end;//try..finally
   end;//cfFormat = CF_TreeNode
  end;//with aFormatEtcIn
 end;//Result <> S_Ok
//#UC END# *48F3495D0398_4680F8DE02E2_impl*
end;//_l3TreeDataObject_.DoGetData

function _l3TreeDataObject_.AcceptableTymed: Integer;
//#UC START# *48F351BE0015_4680F8DE02E2_var*
//#UC END# *48F351BE0015_4680F8DE02E2_var*
begin
//#UC START# *48F351BE0015_4680F8DE02E2_impl*
 Result := inherited AcceptableTymed or TYMED_HGLOBAL;
//#UC END# *48F351BE0015_4680F8DE02E2_impl*
end;//_l3TreeDataObject_.AcceptableTymed

{$EndIf l3TreeDataObject_imp}
