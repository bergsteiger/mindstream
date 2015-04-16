unit u_fmGUITestRunner;

interface

uses
 TestFramework
 , System.SysUtils
 , System.Types
 , System.UITypes
 , System.Classes
 , System.Variants
 , System.Generics.Collections
 , System.Actions
 , FMX.Types
 , FMX.Graphics
 , FMX.Controls
 , FMX.Forms
 , FMX.Dialogs
 , FMX.StdCtrls
 , FMX.Layouts
 , FMX.TreeView
 , FMX.ListView.Types
 , FMX.ListView
 , FMX.ActnList
 , FMX.Controls.Presentation
 , FMX.Edit
 , FMX.DUnit.Interfaces
 , FMX.DUnit.Utils
 ;

type
 TfmGUITestRunner = class(TForm, ITestListener, ImsLog)
  ToolBar1: TToolBar;
  btRunAllTest: TSpeedButton;
  pnlMain: TPanel;
  tvTestTree: TTreeView;
  pnlBottom: TPanel;
  lvFailureListView: TListView;
  lblTime: TLabel;
  btnUncheckAll: TSpeedButton;
  lblErros: TLabel;
  lblErrorCount: TLabel;
  lblFailure: TLabel;
  lblFailureCount: TLabel;
  lblTimeCount: TLabel;
  lblRunned: TLabel;
  btnDeleteEtalon: TSpeedButton;
  btnSelectFailed: TSpeedButton;
  btnDiff: TSpeedButton;
  chkIsUseDiffer: TCheckBox;
  actlstMain: TActionList;
  actRunAllTest: TAction;
  actRunDiff: TAction;
  actCheckAll: TAction;
  actUncheckAll: TAction;
  actSelectFailed: TAction;
  actDelEtalons: TAction;
  edtSearch: TEdit;
  btnCheckAll: TSpeedButton;
  btnFind: TSpeedButton;
  actFind: TAction;
  btnFindAndCheck: TSpeedButton;
  actFindAndCheck: TAction;
  btnNextTest: TSpeedButton;
  btnPrevTest: TSpeedButton;
  actNextTest: TAction;
  actPrevTest: TAction;
  btnSave: TSpeedButton;
  actSave: TAction;
  actLoad: TAction;
    btnLoad: TSpeedButton;
  procedure FormCreate(Sender: TObject);
  procedure tvTestTreeChangeCheck(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure chkIsUseDifferChange(Sender: TObject);
  procedure actRunAllTestExecute(Sender: TObject);
  procedure actRunDiffExecute(Sender: TObject);
  procedure actCheckAllExecute(Sender: TObject);
  procedure actUncheckAllExecute(Sender: TObject);
  procedure actSelectFailedExecute(Sender: TObject);
  procedure actDelEtalonsExecute(Sender: TObject);
  procedure actFindExecute(Sender: TObject);
  procedure actFindAndCheckExecute(Sender: TObject);
  procedure actNextTestExecute(Sender: TObject);
  procedure actPrevTestExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actLoadExecute(Sender: TObject);
 protected
  f_Suite: ITest;
  f_Tests: TInterfaceList;
  f_TestResult: TTestResult;
  f_SelectedTests: TInterfaceList;
  f_TotalTime: Int64;
  f_Runned : Integer;
  f_GlobalIndex : integer;

  procedure SetSuite(aValue: ITest);
  procedure InitTree;
  procedure FillTestTree(aTest: ITest); overload;
  procedure RunTheTest(aTest: ITest);

  function NodeToTest(aNode: TTreeViewItem): ITest;
  function TestToNode(test: ITest): TTreeViewItem;

  procedure SetError(const aNode: ITest);
  procedure SetFailed(const aNode: ITest);
  procedure SetSuccess(const aNode: ITest);
  procedure SetTreeNodeFont(aNode: TTreeViewItem; aColor: TAlphaColor); overload;
  procedure SetTreeNodeFont(const aNode: ITest; aColor: TAlphaColor); overload;

  function AddFailureNode(aFailure: TTestFailure; anError: Boolean): TListViewItem;

  procedure SetNodeEnabled(aNode: TTreeViewItem; aValue: Boolean);

  procedure ClearResult;


  procedure SetFailure(aFailure: TTestFailure; anError: Boolean);
  procedure UnCheckAllTest;
  procedure TraverseUp(const aNode: TTreeViewItem; aLambda: TDoSomethingWithNode);
 public
  property Suite: ITest
   read f_Suite
   write SetSuite;
  property TestResult: TTestResult read f_TestResult write f_TestResult;
  destructor Destroy; override;

  // IListener
  procedure TestingStarts;
  procedure StartTest(aTest: ITest);

  procedure AddSuccess(aTest: ITest);
  procedure AddError(aFailure: TTestFailure);
  procedure AddFailure(aFailure: TTestFailure);

  procedure EndTest(test: ITest);
  procedure TestingEnds(aTestResult: TTestResult);

  function ShouldRunTest(aTest: ITest): Boolean;
  // IStatusListener
  procedure Status(aTest: ITest; const aMessage: string);
 end;

type
 TTestNode = class(TTreeViewItem)
  private
   f_Test: ITest;
   f_Failed: Boolean;
  public
   constructor Create(aParent: TFmxObject; const aTest: ITest);
   property Test: ITest
    read f_Test;
   property Failed: Boolean
    read f_Failed
    write f_Failed;
 end;//TTestNode

procedure RunTestModeless(aTest: ITest);
procedure RunRegisteredTestsModeless;

const
 c_ConfigFile = '.DUnit.ini';

implementation

uses
 System.TypInfo,
 FMX.DUnit.msAppLog,
 FMX.DUnit.Settings
 ;

{$R *.fmx}

procedure RunTestModeless(aTest: ITest);
var
 l_GUI: TfmGUITestRunner;
begin
 l_GUI := TfmGUITestRunner.Create(Application);
 l_GUI.Suite := aTest;
 l_GUI.Show;
end;

procedure RunRegisteredTestsModeless;
begin
 RunTestModeless(registeredTests)
end;

const
 c_ColorOk = TAlphaColorRec.Green;
 c_ColorError = TAlphaColorRec.Red;
 c_ColorFailure = TAlphaColorRec.Fuchsia;

procedure TfmGUITestRunner.SetError(const aNode: ITest);
begin
 SetTreeNodeFont(aNode, c_ColorError);
end;

procedure TfmGUITestRunner.SetFailed(const aNode: ITest);
begin
 SetTreeNodeFont(aNode, c_ColorFailure);
end;

procedure TfmGUITestRunner.SetFailure(aFailure: TTestFailure; anError: Boolean);
begin
 if anError then
  SetError(aFailure.failedTest)
 else
  SetFailed(aFailure.failedTest);

 AddFailureNode(aFailure, anError);
end;

procedure TfmGUITestRunner.actCheckAllExecute(Sender: TObject);
var
 l_Done: Boolean;
begin
 l_Done := False;
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
  begin
   assert(aNode <> nil);
   aNode.IsChecked := True;
  end
 );
end;

procedure TfmGUITestRunner.actDelEtalonsExecute(Sender: TObject);
var
 l_Done: Boolean;
begin
 l_Done := False;
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
  var
   l_Test : ImsEtalonsHolder;
  begin
   assert(aNode <> nil);
   if (aNode.IsChecked and
       Supports(NodeToTest(aNode), ImsEtalonsHolder, l_Test)) then
    l_Test.DeleteEtalonFile(Self);
  end
 );
end;

procedure TfmGUITestRunner.actRunAllTestExecute(Sender: TObject);
begin
 if Suite = nil then
  Exit;
 ClearResult;
 RunTheTest(Suite);
end;

procedure TfmGUITestRunner.actRunDiffExecute(Sender: TObject);
var
 l_Prev: Boolean;
begin
 //ClearResult;
 l_Prev := TmsDUnitSettings.Instance.IsUseDiffer;
 TmsDUnitSettings.Instance.IsUseDiffer := true;
 try
  TraverseTree(tvTestTree,
   procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
   var
    l_Test : ITest;
    l_EtalonsHolder : ImsEtalonsHolder;
   begin
    assert(aNode <> nil);
    if aNode.IsChecked then
    begin
     l_Test := NodeToTest(aNode);
     if Supports(l_Test, ImsEtalonsHolder, l_EtalonsHolder) then
     try
      if l_EtalonsHolder.RunDiff(Self) then
       SetSuccess(l_Test);
     except
      SetError(l_Test);
     end;//try..finally
    end;//aNode.IsChecked
   end
  );//TraverseTree
 finally
  TmsDUnitSettings.Instance.IsUseDiffer := l_Prev;
 end;//try..finally
end;

procedure TfmGUITestRunner.actFindAndCheckExecute(Sender: TObject);
var
 l_SearchText : string;
begin
 l_SearchText := LowerCase(edtSearch.Text);
 if l_SearchText = '' then Exit;

 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
  var
   l_TestName : string;
  begin
   assert(aNode <> nil);

   l_TestName := LowerCase(aNode.Text);

   if pos(l_SearchText, l_TestName) > 0 then
    aNode.IsChecked := True;
  end
 );//TraverseTree
end;

procedure TfmGUITestRunner.actFindExecute(Sender: TObject);
var
 l_Item: TTreeViewItem;
 l_SearchText : string;
 l_IsCurrent : Boolean;
begin
 l_IsCurrent := False;

 l_SearchText := LowerCase(edtSearch.Text);
 if l_SearchText = '' then Exit;

 if not assigned(tvTestTree.Selected) then
 begin
  TraverseTree(tvTestTree,
   procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
   var
    l_TestName : string;
   begin
    assert(aNode <> nil);

    l_TestName := LowerCase(aNode.Text);

    if pos(l_SearchText, l_TestName) > 0 then
    begin
     aNode.IsSelected := True;
     l_Done := True;
    end //pos(l_SearchText, l_TestName) > 0
   end
  );//TraverseTree
 end // not assigned(tvTestTree.Selected)
 else
 begin
  l_Item := tvTestTree.Selected;

  TraverseTree(tvTestTree,
   procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
   var
    l_TestName : string;
   begin
    assert(aNode <> nil);

    // Пока не находим текущую выбранную ветку, пропускаем все остальные
    if not aNode.Equals(l_Item) then
     // l_IsCurrent означает что прошлая ветка была выбранной.
     if l_IsCurrent then
     begin
      l_TestName := LowerCase(aNode.Text);

      // здесь обычный поиск
      if pos(l_SearchText, l_TestName) > 0 then
      begin
       aNode.IsSelected := True;
       l_Done := True;
      end // pos(l_SearchText, l_TestName) > 0
     end // l_IsSelected
     else
      Exit

    else
     l_IsCurrent := True;

   end
  );//TraverseTree
 end; // assigned(tvTestTree.Selected)
end;

procedure TfmGUITestRunner.actLoadExecute(Sender: TObject);
var
 l_File: TStream;
 l_Tests: TStrings;
 l_OpenDlg: TOpenDialog;
begin
 l_OpenDlg := TOpenDialog.Create(self);

 l_OpenDlg.InitialDir := ExtractFilePath(ParamStr(0));
 if not l_OpenDlg.Execute then Exit;

 l_File := TFileStream.Create(l_OpenDlg.FileName, fmOpenRead);
 try
  l_Tests := TStringList.Create;
  try
   l_Tests.LoadFromStream(l_File);

   TraverseTree(tvTestTree,
    procedure (const aNode: TTreeViewItem; var l_Done : Boolean)
    var
     l_index: Integer;
    begin
     l_index := l_Tests.IndexOf(aNode.Text);
     aNode.IsChecked := (l_index >= 0);
     if l_index >= 0 then l_Tests.Delete(l_index);
    end
    );
  finally
    FreeAndNil(l_Tests);
  end;
 finally
   FreeAndNil(l_File);
 end;

 FreeAndNil(l_OpenDlg);
end;

procedure TfmGUITestRunner.actNextTestExecute(Sender: TObject);
var
 l_Item: TTreeViewItem;
 l_IsCurrent : Boolean;
begin
 if not assigned(tvTestTree.Selected) then
 begin
  tvTestTree.Items[0].IsSelected := True;
 end // not assigned(tvTestTree.Selected)
 else
 begin
  l_Item := tvTestTree.Selected;
  l_IsCurrent := False;

  TraverseTree(tvTestTree,
   procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
   begin
    assert(aNode <> nil);

    // Пока не находим текущую выбранную ветку, пропускаем все остальные
    if not aNode.Equals(l_Item) then
     // l_IsCurrent означает что прошлая ветка была текущей.
     if l_IsCurrent then
     begin
      if aNode.IsChecked then
      begin
       aNode.IsSelected := True;
       l_Done := True;
      end // aNode.IsChecked
      else
       Exit;

     end // l_IsCurrent
     else
      Exit

    else
     l_IsCurrent := True;

   end
  );//TraverseTree
 end; // not assigned(tvTestTree.Selected)
end;

procedure TfmGUITestRunner.actPrevTestExecute(Sender: TObject);
var
 l_Item: TTreeViewItem;
 l_IsCurrent : Boolean;

 l_PrevItem: TTreeViewItem;
begin
 if not assigned(tvTestTree.Selected) then
 begin
  tvTestTree.Items[0].IsSelected := True;
 end // not assigned(tvTestTree.Selected)
 else
 begin
  l_PrevItem := nil;
  l_Item := tvTestTree.Selected;
  l_IsCurrent := False;

  TraverseTree(tvTestTree,
   procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
   begin
    assert(aNode <> nil);

    // Пока не находим текущую выбранную ветку, пропускаем все остальные
    if not aNode.Equals(l_Item) then
     // l_IsCurrent означает что прошлая ветка была текущей.
     if l_IsCurrent then
     begin
      assert(l_PrevItem = nil, 'l_PrevItem <> nil' );
      l_PrevItem := aNode;

      if l_PrevItem.IsChecked then
      begin
       l_PrevItem.IsSelected := True;
       l_Done := True;
      end // aNode.IsChecked
      else
       Exit;
     end // l_IsCurrent
     else
      Exit

    else
     l_IsCurrent := True;

   end
  );//TraverseTree
 end; // not assigned(tvTestTree.Selected)
end;

procedure TfmGUITestRunner.actSaveExecute(Sender: TObject);
var
  l_FileWriter: TStreamWriter;
  l_SaveDlg: TSaveDialog;
begin
 l_SaveDlg := TSaveDialog.Create(self);
 l_SaveDlg.InitialDir := ExtractFilePath(ParamStr(0));
 if not l_SaveDlg.Execute then Exit;

 l_FileWriter := TStreamWriter.Create(
   TFileStream.Create(l_SaveDlg.FileName, fmCreate),
   TEncoding.Default
 );

 l_FileWriter.OwnStream;

 try
  TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
  begin
   if aNode.IsChecked then
    l_FileWriter.WriteLine(aNode.Text);
  end
  );
 finally
  FreeAndNil(l_FileWriter);
 end;

 FreeAndNil(l_SaveDlg);
end;

procedure TfmGUITestRunner.actSelectFailedExecute(Sender: TObject);
begin
 UnCheckAllTest;
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem; var aDone: Boolean)
  begin
   if (aNode as TTestNode).Failed then
   begin
    TraverseUp(aNode,
     procedure (const aNode: TTreeViewItem; var aDone: Boolean)
     begin
      aNode.IsChecked := True;
     end
    );
   end;//(aNode as TTestNode).Failure
  end
 );
end;

procedure TfmGUITestRunner.actUncheckAllExecute(Sender: TObject);
begin
 UnCheckAllTest;
end;

procedure TfmGUITestRunner.AddError(aFailure: TTestFailure);
begin
 SetFailure(aFailure, true);
end;

procedure TfmGUITestRunner.AddFailure(aFailure: TTestFailure);
begin
 SetFailure(aFailure, false);
end;

function TfmGUITestRunner.AddFailureNode(aFailure: TTestFailure; anError: Boolean): TListViewItem;
var
 l_Item: TListViewItem;
 l_Node: TTreeViewItem;
begin
 assert(assigned(aFailure));
 l_Item := lvFailureListView.Items.Add;

 l_Node := TestToNode(aFailure.failedTest);
 Assert(l_Node <> nil);
 (l_Node as TTestNode).Failed := True;
 l_Item.Text := l_Node.ParentItem.Text + '.' + aFailure.failedTest.Name + '; ' +
                aFailure.thrownExceptionName + '; ' + aFailure.thrownExceptionMessage + '; ' +
                aFailure.LocationInfo + '; ' + aFailure.AddressInfo + '; ' +
                aFailure.StackTrace;

 while l_Node <> nil do
 begin
  l_Node.Expand;
  l_Node := l_Node.ParentItem;
 end; // l_Node <> nil

 Result := l_Item;
end;

procedure TfmGUITestRunner.SetSuccess(const aNode: ITest);
begin
 SetTreeNodeFont(aNode, c_ColorOk);
end;

procedure TfmGUITestRunner.AddSuccess(aTest: ITest);
begin
 assert(assigned(aTest));
 SetSuccess(aTest);
end;


procedure TfmGUITestRunner.UnCheckAllTest;
begin
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem; var aDone: Boolean)
  begin
   assert(aNode <> nil);
   aNode.IsChecked := False;
  end
 );
end;

procedure TfmGUITestRunner.chkIsUseDifferChange(Sender: TObject);
begin
 TmsDUnitSettings.Instance.IsUseDiffer := chkIsUseDiffer.IsChecked;
end;

procedure TfmGUITestRunner.TraverseUp(const aNode: TTreeViewItem;
                                            aLambda: TDoSomethingWithNode);
var
 l_Node: TTreeViewItem;
 l_Done: Boolean;
begin
 l_Node := aNode;
 l_Done := False;
 repeat
  aLambda(l_Node, l_Done);
  l_Node := l_Node.ParentItem;
 until (l_Node = nil);
end;

procedure TfmGUITestRunner.ClearResult;
var
 l_Node: Boolean;
begin
 lvFailureListView.ClearItems;
 f_Runned := 0;
 l_Node := False;
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem; var l_Node: Boolean)
  begin
   SetTreeNodeFont(aNode, TAlphaColorRec.Black)
  end
 );
end;

destructor TfmGUITestRunner.Destroy;
begin
 f_Suite.SaveConfiguration(ParamStr(0) + c_ConfigFile, True, False);
 Suite := nil;
 inherited;
end;

procedure TfmGUITestRunner.EndTest(test: ITest);

   function FormatElapsedTime(milli: Int64):string;
   var
     h,nn,ss,zzz: Cardinal;
   begin
     h := milli div 3600000;
     milli := milli mod 3600000;
     nn := milli div 60000;
     milli := milli mod 60000;
     ss := milli div 1000;
     milli := milli mod 1000;
     zzz := milli;
     Result := Format('%d:%2.2d:%2.2d.%3.3d', [h, nn, ss, zzz]);
   end;

begin
 lblTimeCount.Text:= FormatElapsedTime (f_TestResult.TotalTime);
 lblErrorCount.Text:= IntToStr(f_TestResult.ErrorCount);
 lblFailureCount.Text:= IntToStr(f_TestResult.FailureCount);
 Inc(f_Runned);
 lblRunned.Text := IntToStr(f_Runned);
end;

constructor TTestNode.Create(aParent: TFmxObject; const aTest: ITest);
begin
 inherited Create(aParent);
 IsChecked := True;
 f_Test := aTest;
 Text := aTest.Name;
 aParent.AddObject(Self);
 aTest.GUIObject := Self;
end;

procedure TfmGUITestRunner.FillTestTree(aTest: ITest);
 procedure DoFillTestTree(aRootNode: TTestNode);
 var
  l_TestTests: IInterfaceList;
  l_Index: Integer;
 begin//DoFillTestTree
  l_TestTests := aRootNode.Test.Tests;
  for l_Index := 0 to l_TestTests.Count - 1 do
   DoFillTestTree(TTestNode.Create(aRootNode, (l_TestTests[l_Index] as ITest)));
 end;//DoFillTestTree

begin
 tvTestTree.Clear;
 tvTestTree.BeginUpdate;
 try
  DoFillTestTree(TTestNode.Create(tvTestTree, Suite));
 finally
  tvTestTree.EndUpdate;
 end;//try..finally
end;

procedure TfmGUITestRunner.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TfmGUITestRunner.FormCreate(Sender: TObject);
begin
 inherited;
 tvTestTree.ShowCheckboxes := True;
end;

procedure TfmGUITestRunner.InitTree;
var
 l_Node : TTreeViewItem;
 l_Test : ITest;
begin
 FillTestTree(Suite);
 tvTestTree.ExpandAll;
end;

function TfmGUITestRunner.NodeToTest(aNode: TTreeViewItem): ITest;
begin
 Result := (aNode As TTestNode).Test;
end;

procedure TfmGUITestRunner.RunTheTest(aTest: ITest);
begin
 TestResult := TTestResult.Create;
 try
  TestResult.addListener(self);
  aTest.run(TestResult);
 finally
  // FErrorCount := TestResult.ErrorCount;
  // FFailureCount := TestResult.FailureCount;
  FreeAndNil(f_TestResult);
 end; // try..finnaly
end;

procedure TfmGUITestRunner.SetSuite(aValue: ITest);
var
 l_Done: Boolean;
begin
 f_Suite := aValue;
 if (f_Suite <> nil) then
 begin
  // Проставляет всем тестам из набора Enabled := False, если находит их в конфиге
  f_Suite.LoadConfiguration(ParamStr(0) + c_ConfigFile, True, False);
  InitTree;

  TraverseTree(tvTestTree,
   procedure (const aNode: TTreeViewItem; var l_Done: Boolean)
   var
    l_Test: ITest;
   begin
    l_Done := False;
    l_Test := NodeToTest(aNode);

    assert(l_Test <> nil);

    if l_Test.Enabled then
    begin
     aNode.IsChecked := True;

     TraverseUp(aNode,
      procedure (const aParentNode: TTreeViewItem; var l_Done: Boolean)
      begin
       aParentNode.IsChecked := True;
      end
     );
    end // l_Test.Enabled
    else
     aNode.IsChecked := False;
   end
  );
 end; // FSuite <> nil
end;

procedure TfmGUITestRunner.SetTreeNodeFont(const aNode: ITest; aColor: TAlphaColor);
begin
 SetTreeNodeFont(TestToNode(aNode), aColor);
end;

procedure TfmGUITestRunner.SetTreeNodeFont(aNode: TTreeViewItem; aColor: TAlphaColor);
begin
 // Пока не укажешь какие из настроек стиля разрешены к работе, они работать не будут
 aNode.StyledSettings := aNode.StyledSettings -
{$IF DEFined(VER270) OR DEFined(VER280) OR DEFined(VER290)} [TStyledSetting.FontColor, TStyledSetting.Style];
{$ENDIF}
{$IFDEF VER260} [TStyledSetting.ssFontColor, TStyledSetting.ssStyle]
 ;
{$ENDIF}
 aNode.Font.Style := [TFontStyle.fsBold];
 aNode.FontColor := aColor;
end;

function TfmGUITestRunner.ShouldRunTest(aTest: ITest): Boolean;
var
 l_Test: ITest;
begin
 l_Test := aTest;
 Result := l_Test.Enabled
end;

procedure TfmGUITestRunner.StartTest(aTest: ITest);
var
 l_Node: TTreeViewItem;
begin
 assert(assigned(TestResult));
 assert(assigned(aTest));

 l_Node := TestToNode(aTest);

 assert(assigned(l_Node));
end;

procedure TfmGUITestRunner.Status(aTest: ITest; const aMessage: string);
begin
 assert(False);
end;

procedure TfmGUITestRunner.TestingEnds(aTestResult: TTestResult);
begin
end;

procedure TfmGUITestRunner.TestingStarts;
begin
end;

function TfmGUITestRunner.TestToNode(test: ITest): TTreeViewItem;
begin
 assert(assigned(test));

 Result := test.GUIObject as TTreeViewItem;

 assert(assigned(Result));
end;

procedure TfmGUITestRunner.tvTestTreeChangeCheck(Sender: TObject);
var
 l_Node: TTreeViewItem;
 l_IsChecked: Boolean;
 l_Done: Boolean;
begin
 if not (Sender is TTreeViewItem) then Exit;
 l_Node := Sender as TTreeViewItem;
 l_IsChecked := l_Node.IsChecked;

 TraverseUp(l_Node,
  procedure (const l_Node: TTreeViewItem; var l_Done: Boolean)
  begin
   if l_IsChecked then
    l_Node.IsChecked := l_IsChecked;
   SetNodeEnabled(l_Node, l_Node.IsChecked);
  end
  );
end;

procedure TfmGUITestRunner.SetNodeEnabled(aNode: TTreeViewItem; aValue: Boolean);
var
 l_Test: ITest;
begin
 l_Test := NodeToTest(aNode);
 if l_Test <> nil then
  l_Test.Enabled := aValue;
end;

end.
