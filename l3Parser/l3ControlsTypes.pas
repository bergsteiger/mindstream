unit l3ControlsTypes;
 
{$Include l3Define.inc}

interface

uses
  Classes
  {$If not defined(NoVCL)}
  ,
  ImgList
  {$IfEnd} //not NoVCL
  
  ;

type
 TvtViewOption = (
  {* настройки отображения. }
   voShowInterRowSpace
 , voShowIcons
 , voShowExpandable
 , voShowRoot
 , voShowLines
 , voShowOpenChip
 , voVariableItemHeight
 , voWithoutImages // ImageList не используется, и не создается фиктивный из ресурса.
 , voShowItemEdgeLine
 , voShowSelectAsArrow
 , voDoNotShowFocusRect
 , voFullLineSelect
 );//TvtViewOption

 TvtViewOptions = set of TvtViewOption;

 Tl3GetItemImage = function (Sender: TObject;
  Index: Integer;
  var aImages: TCustomImageList): Integer of object;

 Tl3ActionElementMode = (
   l3_amDoubleClick
 , l3_amSingleClick
 , l3_amSecondSingleClick
 );//Tl3ActionElementMode

 TvlViewOption = voShowInterRowSpace..voShowInterRowSpace;

 TvlViewOptions = set of TvlViewOption;

const
  { Item Hit Type }
 ihtNone = 0;
 ihtText = 1;
 ihtIcon = 2;
 ihtPickIcon = 3;
 ihtOpenChip = 4;
 ihtFooter = 5;

type
 TvlOption = (
   vlMouseTrack
 , vlTooltips
 );//TvlOption

 TvlOptions = set of TvlOption;

implementation

end.