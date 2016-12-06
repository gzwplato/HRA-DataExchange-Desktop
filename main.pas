unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynMemo, SynEdit, Forms, Controls, Graphics,
  Dialogs, Buttons, StdCtrls, ValEdit, DBGrids, ComCtrls, ExtCtrls,
  Grids, ActnList, Spin, DbCtrls, Ora, fpspreadsheetctrls, fpspreadsheetgrid,
  fpjson, jsonparser, fpjsonrpc, globals, DBSelect, DataM_Main, fpspreadsheet,
  DB, contnrs, types;

type
  TDBTreeNode = class(TTreeNode)

  public
   dbkey: integer;
   dbkey2: integer;
   dbtablename : string ;
   dbdataset : TDataSet ;
   dbKeyField : string ;
//  PopUpMenu: tvNodeType;
end;
type

  { TfrmMain }

  TfrmMain = class(TForm)
    actLoadOrgProject: TAction;
    actLoadOrganizations: TAction;
    ActionList1: TActionList;
    BitBtn2: TBitBtn;
    btnOpenFile: TBitBtn;
    btnOpenOrgMapping: TBitBtn;
    btnProcessFile: TBitBtn;
    btnLoadProjects: TButton;
    chk_ViewAllMapping: TCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    edtProjectConfigID: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBGrid2: TDBGrid;
    DBGrid_OrgMapItem: TDBGrid;
    DBLookup_FileImportTypeGlobal: TDBLookupComboBox;
    DBLookup_FileImportTypeGlobal1: TDBLookupComboBox;
    DBLookup_TableName: TDBLookupComboBox;
    DBLookup_ItemType: TDBLookupComboBox;
    DBLookup_FileImportType: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBText_Account: TDBText;
    DBText_Organization: TDBText;
    DBText_Project: TDBText;
    edtAccountID: TEdit;
    edtHeaderCount: TEdit;
    edtOrgID: TEdit;
    edtProjectID: TEdit;
    edt_locate3: TEdit;
    gridAccount: TDBGrid;
    edt_locate2: TEdit;
    gridOrganization: TDBGrid;
    gridProject: TDBGrid;
    gridProjectConfig: TDBGrid;
    grpSelectedProject: TGroupBox;
    ImageList1: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblAcctID3: TLabel;
    lblSelect: TLabel;
    lblAcctID: TLabel;
    lblAcctID1: TLabel;
    lblAcctID2: TLabel;
    lblOrgID: TLabel;
    lblProjID: TLabel;
    lblProjID1: TLabel;
    memoSQL: TMemo;
    OpenDialog1: TOpenDialog;
    dsDataProject: TOraDataSource;
    OraDataSource1: TOraDataSource;
    dsOrganization: TOraDataSource;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlImportControls: TPanel;
    pnlOrgMappingControls: TPanel;
    pnlLeftMapping: TPanel;
    pnlRightMap: TPanel;
    pnlTop: TPanel;
    pnl_accountLeft1: TPanel;
    pnl_accountGrids: TPanel;
    pnl_SearchAcctName2: TPanel;
    pnl_SearchAcctName3: TPanel;
    SaveDialog1: TSaveDialog;
    sgMapping: TStringGrid;
    ShapeMap: TShape;
    ShapeValidate: TShape;
    ShapeID: TShape;
    ShapeReg: TShape;
    ShapeRel: TShape;
    spnProcessCount: TSpinEdit;
    StatusBar3: TStatusBar;
    sWorkbookSource1: TsWorkbookSource;
    sWorksheetGrid1: TsWorksheetGrid;
    memoLog: TSynMemo;
    tbSelect: TTabSheet;
    TbImport: TTabSheet;
    tbMapping: TTabSheet;
    tbLog: TTabSheet;
    TreeView_AcctOrg: TTreeView;
    vleTableNames: TValueListEditor;
    vleUserID: TValueListEditor;
    procedure actLoadOrgProjectExecute(Sender: TObject);
    procedure actLoadOrganizationsExecute(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnOpenOrgMappingClick(Sender: TObject);
    procedure btnProcessFileClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnLoadProjectsClick(Sender: TObject);
    procedure btnLoadProjectsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure chk_ViewAllMappingChange(Sender: TObject);
    procedure DBCheckBox1Change(Sender: TObject);
    procedure DBLookup_FileImportTypeGlobal1CloseUp(Sender: TObject);
    procedure DBLookup_FileImportTypeGlobalCloseUp(Sender: TObject);
    procedure DBLookup_FileImportTypeGlobalSelect(Sender: TObject);
    procedure DBLookup_ItemTypeClick(Sender: TObject);
    procedure DBLookup_TableNameClick(Sender: TObject);
    procedure dsDataProjectDataChange(Sender: TObject; Field: TField);
    procedure dsOrganizationDataChange(Sender: TObject; Field: TField);

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure OraDataSource1DataChange(Sender: TObject; Field: TField);
    procedure PageControl1Change(Sender: TObject);
    procedure pnlRightMapClick(Sender: TObject);
    procedure sWorksheetGrid1Click(Sender: TObject);
    function OpenCoreMapItem(OrgID: integer):boolean;
    procedure ProcessCoreMapItem();
    procedure BeginImport();
    procedure ProcessFile();
    procedure tbMappingContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);


    procedure TreeView_AcctOrgChange(Sender: TObject; Node: TTreeNode);
    procedure TreeView_AcctOrgCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure TreeView_AcctOrgDeletion(Sender: TObject; Node: TTreeNode);
    procedure TreeView_OrgProjectCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure TreeView_OrgProjectDeletion(Sender: TObject; Node: TTreeNode);
     procedure TreeView_ProjectsCreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure TreeView_ProjectsDeletion(Sender: TObject; Node: TTreeNode);
    function DBTreeNode(Node:TTreeNode):TDBTreeNode;
    procedure OpenCoreDBFiles();
    procedure LoadAcctOrgIntoTree();
    Procedure InsertNewUser(row: integer; pp_ID: integer);
  private
    { private declarations }
    FRoot : TJSONData;
      FFileName : String;
      FSortObjectMembers,
      FStrict,
      FNewObject,
      FModified : Boolean;
      procedure OpenFile;

    //  FCurrentFind : TTreeNode;
      { public declarations }
      public
         bLoadOrgTree : boolean ;
         EnvVars : TStringList ;
        updateFromTree : boolean ;
         app : TApplication;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
var
I: Integer;
key : string ;
begin
   EnvVars := TStringList.create ;
    PageControl1.ActivePage := tbSelect;
    Dm_main.lu_FileImportTypeGlobal.active := true ;

For i := 0 to Application.ParamCount  do
begin
//  showMessage(Application.Params[i]);
end;
try
Application.GetEnvironmentList(EnvVars);

For i := 1 to Envvars.count - 1 do
begin
key:=EnvVars.Names[i];
 // vleTableNames.Keys[i] := key;
 // vleTableNames.Values[key] := EnvVars.ValueFromIndex[i];

  if key = 'USERNAME' then
      globals.UserName:= EnvVars.ValueFromIndex[i];
  if key = 'USERDNSDOMAIN' then
      globals.DNSDomain := EnvVars.ValueFromIndex[i];
  if key = 'COMPUTERNAME' then
      globals.Computername := EnvVars.ValueFromIndex[i];

 end;
//lstTableNames.Items := EnvVars;



finally

end;



TRY
   frm_DBSelect := Tfrm_DBSelect.create(nil);
   frm_DBSelect.ShowModal;

FINALLY
FreeAndNil(frm_DBSelect);
end;
if globals.ExitApplication then
exit ;
//DM_Main.OraSessionMain.connected := false ;

TRY
WITH  dm_main  do
begin
 SP_HMRC_USER_VERIFY.ParamByName('puniquename').ASString := globals.UserName;
 SP_HMRC_USER_VERIFY.Execute;
 IF SP_HMRC_USER_VERIFY.ParamByName('pAccessLevel').AsInteger > 0 then
 begin
      globals.UserAccessLevel:= SP_HMRC_USER_VERIFY.ParamByName('pAccessLevel').AsInteger;
      //ShowMessage('Access level: '+IntToStr( globals.UserAccessLevel));

 end else
 begin
       ShowMessage('Invalid or inactive user '+globals.UserName+' ... will exit program!');
       Application.Terminate;
 end;
end;

finally
end;

Caption := caption + ' USER: '+globals.Username+'  [DB: '+globals.DBType+']';

 OpenCoreDBFiles();
//OpenDBFiles();

end;

procedure TfrmMain.btnOpenFileClick(Sender: TObject);
begin
 OpenFile();


end;

procedure TfrmMain.actLoadOrganizationsExecute(Sender: TObject);
begin
    with DM_Main do
   begin
     dataAccount.active := false ;
    dataProject.active := false ;
    dataProjectConfig.active := false ;
    dataOrg_wProject.active := false;

     dataAccount.active := true ;
    dataProject.active := true ;
     dataProjectConfig.active := true ;
    dataOrg_wProject.active := true;
   end;


end;

procedure TfrmMain.actLoadOrgProjectExecute(Sender: TObject);
begin

With DM_Main do
  begin

      dataProjectConfig_Org.active := false;
      dataProjectConfig_Org.active := true;
    //  LoadOrgProjectIntoTree();
  end;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
var
  MyWorkBook : TsWorkbook ;
  MyWorkSheet : TsWorksheet;
  col, row: Cardinal;
   cell: PCell;
   sValue : string ;
 begin
   showMessage(DBLookup_FileImportTypeGlobal.KeyValue);
 exit;

 if  OpenDialog1.Execute then
 try

 MyWorkbook := Tsworkbook.create ;
 MyWorkBook.ReadFromFile(opendialog1.FileName);
      //sWorkbookSource1.FileName:= opendialog1.FileName ;
  //MyWorkBook.
 // MyWorksheet := TsWorksheet.create ;

  MyWorksheet := MyWorkBook.GetWorksheetByIndex(0);

  for row:=1 to 1 do
  begin
    for col := 1 to 1 do
    begin
      cell := MyWorksheet.FindCell(row, col);

       sValue := MyWorksheet.ReadAsUTF8Text(1,1);
       vleTableNames.InsertRow('col1',sValue,true);

     // WriteLn(MyWorksheet.ReadAsUTF8Text(cell));
    end;

  end;

 finally
   MyWorkBook.Free ;
 end;
end;

procedure TfrmMain.btnOpenOrgMappingClick(Sender: TObject);
begin
  with DM_Main, DM_Main.sql_core_OrgMapItem do
  begin;
        active := false ;
        ParamByName('Organization_id').AsInteger:=  dataOrganization.fieldbyname('organization_id').AsInteger;
        if chk_ViewAllMapping.checked then
        begin
          paramByName('fileimporttype_id').asInteger :=  1;
          paramByName('fileimporttype_id2').asInteger :=  99;


        end else
        begin

           paramByName('fileimporttype_id').asInteger :=  DBLookup_FileImportTypeGlobal1.KeyValue;
          paramByName('fileimporttype_id2').asInteger :=  DBLookup_FileImportTypeGlobal1.KeyValue;
         end;


        active := true ;

  end;
end;

procedure TfrmMain.btnProcessFileClick(Sender: TObject);
begin
  ProcessFile();
end;

procedure TfrmMain.btnTestClick(Sender: TObject);
begin

end;

procedure TfrmMain.Button6Click(Sender: TObject);
begin

end;

procedure TfrmMain.btnLoadProjectsClick(Sender: TObject);
begin
  LoadAcctOrgIntoTree();
  pnl_accountGrids.visible := true ;
end;

procedure TfrmMain.btnLoadProjectsContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TfrmMain.chk_ViewAllMappingChange(Sender: TObject);
begin
    dm_main.sql_core_OrgMapItem.Active:= false ;
    if chk_ViewAllMapping.checked then
            btnOpenOrgMapping.enabled := true else
              begin
                   if  DBLookup_FileImportTypeGlobal1.KeyValue  > 0 then
                          btnOpenOrgMapping.enabled := true else
                         btnOpenOrgMapping.enabled := false ;

              end;
end;

procedure TfrmMain.DBCheckBox1Change(Sender: TObject);
begin

end;

procedure TfrmMain.DBLookup_FileImportTypeGlobal1CloseUp(Sender: TObject);
begin
     if DBLookup_FileImportTypeGlobal1.KeyValue > 0 then
        btnOpenOrgMapping.enabled := true ;
          dm_main.sql_core_OrgMapItem.Active:= false ;

end;

procedure TfrmMain.DBLookup_FileImportTypeGlobalCloseUp(Sender: TObject);
begin
  if DBLookup_FileImportTypeGlobal.KeyValue > 0 then
  begin
       btnOpenFile.enabled := true ;
  end;
end;

procedure TfrmMain.DBLookup_FileImportTypeGlobalSelect(Sender: TObject);
begin

end;

procedure TfrmMain.DBLookup_ItemTypeClick(Sender: TObject);
begin
    if NOT(dm_main.sql_core_OrgMapItem.State in [dsEdit]) then
     dm_main.sql_core_OrgMapItem.Edit;
end;

procedure TfrmMain.DBLookup_TableNameClick(Sender: TObject);
begin
  if NOT(dm_main.sql_core_OrgMapItem.State in [dsEdit]) then
     dm_main.sql_core_OrgMapItem.Edit;

end;

procedure TfrmMain.dsDataProjectDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TfrmMain.dsOrganizationDataChange(Sender: TObject; Field: TField);
begin
  DM_Main.sql_core_OrgMapItem.active := false ;
  DM_Main.sql_Core_OrgMapItem.ParamByName('ORGANIZATION_ID').value := DM_Main.dataorganization.fieldbyName('organization_id').value ;

end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
     EnvVars.Free;
end;

procedure TfrmMain.Label8Click(Sender: TObject);
begin

end;

procedure TfrmMain.OraDataSource1DataChange(Sender: TObject; Field: TField);
begin
  ShapeMap.visible := dm_main.sql_core_OrgMapItemMAPVALUE_FLG.asboolean ;
  ShapeID.visible := dm_main.sql_core_OrgMapItemUSERID_FLG.asboolean ;
  ShapeReg.visible := dm_main.sql_core_OrgMapItemUSERREGISTRATION_FLG.asBoolean ;
  ShapeRel.visible := dm_main.sql_core_OrgMapItemRELATIONSHIP_FLG.asboolean ;
  ShapeValidate.visible := dm_main.sql_core_OrgMapItemVALIDATEWVALUE_FLG.asboolean ;
 // ShapeID.visible := dm_main.sql_core_OrgMapItemMAPVALUE_FLG.asboolean ;
end;

procedure TfrmMain.PageControl1Change(Sender: TObject);
begin

end;

procedure TfrmMain.pnlRightMapClick(Sender: TObject);
begin

end;

procedure TfrmMain.sWorksheetGrid1Click(Sender: TObject);
begin

end;
function TfrmMain.OpenCoreMapItem(OrgID: integer): boolean ;
begin
with DM_Main.sql_core_OrgMapItem do
 begin;
       active := false ;
       ParamByName('Organization_id').AsInteger:= DM_Main.dataOrganizationORGANIZATION_ID.asInteger ;
       ParamByName('fileimporttype_id').asinteger :=  DBLookup_FileImportTypeGlobal.KeyValue;
       ParamByName('fileimporttype_id2').asinteger :=  DBLookup_FileImportTypeGlobal.KeyValue;

       active := true ;
       if RecordCount <=0 then
          Result := false else
            Result := true;

 end;
end;
procedure TfrmMain.ProcessCoreMapItem();
var
 sFieldName, sTableName, sColNameFile : string;
  isUserID : integer ;
  iRow, iVRow : integer ;

begin



   For iRow := 1 to sgMapping.RowCount - 1 do
   begin
       sColNameFile := LowerCase(sgMapping.cells[1,iRow] )  ;
       with DM_Main, DM_Main.sql_core_OrgMapItem do
       begin

           if Locate('columnname',sColNameFile,[loCaseInsensitive]) then
           begin
            sFieldName :=     sql_core_OrgMapItemFIELDNAME.asstring ;
            sTableName :=    sql_core_OrgMapItemTABLENAME.asstring ;
            isUserID :=      sql_core_OrgMapItemUSERID_FLG.asinteger ;
            // Find the row containing sTableName as the key
            if not (vleTableNames.FindRow(sTableName, iVRow)) then
            begin
                  vleTableNames.InsertRow(sTableName,'table',true);
            end;

            sgMapping.cells[2,iRow] := sFieldName ;
            sgMapping.cells[3,iRow] := sTableName ;
            sgMapping.cells[4,iRow] := inttostr(isUserId);
            sgMapping.cells[5,iRow] :=  sql_core_OrgMapItemMAPVALUE_FLG.asString;
            sgMapping.cells[6,iRow] := sql_core_OrgMapItemRELATIONSHIP_FLG.asString;
            sgMapping.cells[7,iRow] := sql_core_OrgMapItemVALIDATEWVALUE_FLG.AsString;
            sgMapping.cells[8,iRow] := sql_core_OrgMapItemORGMAPITEM_ID.asString ;
            sgMapping.cells[9,iRow] := sql_core_OrgMapItemDATEFORMAT.asString;
            if isUserId > 0 then
             if not (vleUserID.FindRow(inttostr(isUserId), iVRow)) then
             begin
                 // grid column number is one less than excel column
                 vleUserId.InsertRow(sFieldName, intToStr(iRow-1),true);
                 memoLog.Lines.add(sColNameFile +' [ Mapped to '+sTableName+'.'+sFieldName+']');
             end;

           end else
           begin
             //!!!! NEED TO MAP TO STANDARD FIELD NAMES
               sgMapping.cells[2,iRow] := 'No Mapping!';
            sgMapping.cells[4,iRow] := '0' ;
            sgMapping.cells[5,iRow] :=  '0';
            sgMapping.cells[6,iRow] := '0';
            sgMapping.cells[7,iRow] :='0';
            sgMapping.cells[8,iRow] := '' ;
            sgMapping.cells[9,iRow] := '' ;

               memoLog.Lines.add('WARNING: Column Not Found: '+ sColNameFile);
           end;
       end;
   end;

end;

procedure TfrmMain.BeginImport();
begin
     sgMapping.Clean([gzNormal, gzFixedRows]);
    vleTableNames.clean;
    vleUserID.clean ;
    memoLog.Lines.Clear ;


end;

procedure TfrmMain.OpenFile();
var
 MyWorksheet: TsWorksheet;
 col, row: Cardinal;
 cell: PCell;
 sValue : string ;
begin
  btnProcessFile.enabled := false ;
 if  OpenDialog1.Execute then
try
  sgMapping.Clean([gzNormal, gzFixedRows]);
  sWorkbookSource1.FileName:= opendialog1.FileName;
 //* Get column headers
 for row:=0 to 0 do
 begin
   for col := 0 to sWorksheetGrid1.Worksheet.GetLastColIndex do
   begin
     cell := sWorksheetGrid1.Worksheet.FindCell(row, col);
     sValue := sWorksheetGrid1.Worksheet.ReadAsUTF8Text(cell);

     sgMapping.RowCount := col+2;
     sgMapping.Cells[1,col+1] := sValue ;
     sgMapping.Cells[0,col+1] := intToStr(col+1);
     sgMapping.Cells[4,col+1] := intToStr(1); //isUserId

   end;

 end;

finally
    //  sgMapping.SortColRow(True,0);
end;
 if OpenCoreMapItem(dm_main.dataOrganizationORGANIZATION_ID.asInteger) then
 begin
   ProcessCoreMapItem();
   btnProcessFile.enabled := true ;
 end else
 begin
    showmessage('ERROR: No mapping data found for this organization');

 end;



end;

procedure TfrmMain.processFile();
var
 MyWorksheet: TsWorksheet;
 col, row: Cardinal;
 cell: PCell;
 sValue, sDateFormat : string ;
 sTable : string ;

 sParamName, sParamVal : string ;
 i, iCol, iRowProcess, iExists : integer ;
 sKey, sWhere : string ;
 iOrgKey, iProjKey : integer ;
 bMapFind : boolean ;
 sIsMap, sIsUserID : string ;
 person_ID, personproject_ID, demographic_id : integer ;
 sColName, sFldName :string ;
begin
   memosql.lines.clear ;
    iOrgKey := 0;
    iProjKey := 0;
   if edtOrgID.text <> '' then
    iOrgKey := strtointdef(edtOrgID.text,0);
   if edtProjectID.text <> '' then
    iProjKey:= strtointdef(edtProjectID.text,0);

   if (iOrgKey = 0 ) OR (iProjKey = 0) then
   begin
       showmessage('Select Organization and Project...');
       exit ;
   end;
  With DM_MAIN do
  begin

     sqlRecordExists.SQL.Clear ;
     sqlRecordExists.SQL.Add('DECLARE');
     sqlRecordExists.SQL.Add('  ExistFlg INTEGER;');
     sqlRecordExists.SQL.Add('  vID INTEGER;');

     sqlRecordExists.SQL.Add('BEGIN');
     sqlRecordExists.SQL.Add('    :vID := 0;');

     sqlRecordExists.SQL.Add('    SELECT count(*) INTO :ExistFlg');
     sqlRecordExists.SQL.Add('       FROM USER_PERSON ');
     sqlRecordExists.SQL.Add('  WHERE ');


      For i := 1 to vleUserID.RowCount-1  do
      begin
          sKey := vleUserID.Cells[0,i] ;
          sWhere := sKey +' = :'+skey ;
          if i > 1 then
             sqlRecordExists.SQL.Add(' AND ');
          sqlRecordExists.SQL.Add(sWhere);
          sqlRecordExists.ParamByName(sKey).DataType := ftString;
      end;
      sqlRecordExists.SQL.Add(' AND organization_ID = '+inttostr(iOrgKey));
      sqlRecordExists.SQL.Add(' ; ');

      sqlRecordExists.SQL.Add('If :ExistFlg > 0 then ');
      sqlRecordExists.SQL.Add(' SELECT person_ID into :vid');
      sqlRecordExists.SQL.Add('       FROM USER_PERSON ');
      sqlRecordExists.SQL.Add('  WHERE ');
      For i := 1 to vleUserID.RowCount-1  do
      begin
          sKey := vleUserID.Cells[0,i] ;
          sWhere := sKey +' = :'+skey ;
          if i > 1 then
             sqlRecordExists.SQL.Add(' AND ');
          sqlRecordExists.SQL.Add(sWhere);
          sqlRecordExists.ParamByName(sKey).DataType := ftString;
      end;

      sqlRecordExists.SQL.Add(' AND organization_ID = '+inttostr(iOrgKey));
        sqlRecordExists.SQL.Add('; ');
       sqlRecordExists.SQL.Add('end if; ');

       sqlRecordExists.SQL.Add('END;');

      sqlRecordExists.ParamByName('ExistFlg').DataType := ftInteger;
      sqlRecordExists.ParamByName('vID').DataType := ftInteger;

    //  memosql.lines.clear ;
      memosql.lines := sqlRecordExists.SQL;
      iRowProcess :=  sWorksheetGrid1.Worksheet.GetLastRowIndex -1;
      if spnProcessCount.value > 0 then
        iRowProcess := spnProcessCount.value ;

     for row :=1 to iRowProcess do
     begin
         // get unique id key and columnnumber
         For i := 1 to vleUserID.RowCount-1  do
         begin
          sKey := vleUserID.Cells[0,i] ;
          iCol := strtoint(vleUserID.Cells[1,i]);
          if iCol > 0 then
          begin
            cell := sWorksheetGrid1.Worksheet.FindCell(row, icol);
             sValue := sWorksheetGrid1.Worksheet.ReadAsUTF8Text(cell);
             if sValue <> '' then
                sqlRecordExists.parambyname(sKey).asString :=  sValue ;
          end;
          memosql.lines.add('SQL record: param('+skey+' = '+svalue);
          sqlRecordExists.Execute;
          iExists := sqlRecordExists.ParamByName('ExistFlg').AsInteger ;
          person_ID :=   sqlRecordExists.ParamByName('vID').AsInteger ;
          memosql.Lines.add(sValue +': '+IntToStr(iExists)+' person_id: '+IntToStr(person_id));


          //New Person
          if iExists <= 0 then
          begin
          memosql.Lines.add('Inserting new person record ');

             InsertNewUser(row, 0);
          end else
          begin
             //check if personproject_id, demographic_id exist
            //   PR_ELIG_FINDPPID(:PPERSON_ID, :PPERSONPROJECT_ID, :PUPDATE_DT, :PDEMOGRAPHIC_ID, :VRETURNCODE);
             with dm_main.sp_ELIG_FINDPPID do
             begin
                  params.parambyname('PPERSON_ID').asInteger := person_id;
                  execute ;
                  if params.parambyname('VRETURNCODE').AsInteger = 1 then
                  begin
                    personproject_id := params.parambyname('PPERSONPROJECT_ID').asInteger ;
                    demographic_id := params.parambyname('PDEMOGRAPHIC_ID').asInteger ;
                  end;
                  memosql.Lines.add(sValue +': '+IntToStr(iExists)+' personproject_id: '+IntToStr(personproject_id));
                  memosql.Lines.add(sValue +': '+IntToStr(iExists)+' demographic_id: '+IntToStr(demographic_id));
                  if (personproject_id > 0)  AND (demographic_id <= 0) then
                  begin
                     memosql.Lines.add('Inserting demographic record for personproject_id = '+inttostr(personproject_id));

                    InsertNewUser(row,personproject_id );
                  end;

             end;
           {
             with dm_main.sqlPersonProjectID do
             begin
                  active := false ;
                 params.parambyname('person_id').asInteger := person_id;
                 active := true ;
                 if sqlPersonProjectID.RecordCount > 0 then
                 begin
                    personproject_id := fieldbyName('personproject_id').asInteger ;
                      demographic_id := fieldbyName('demographic_id').asInteger ;
                      memosql.Lines.add(sValue +': '+IntToStr(iExists)+' personproject_id: '+IntToStr(personproject_id));
                      memosql.Lines.add(sValue +': '+IntToStr(iExists)+' demographic_id: '+IntToStr(demographic_id));
                      if (personproject_id > 0)  AND (demographic_id <= 0) then
                      begin
                         memosql.Lines.add('Inserting demographic record for personproject_id = '+inttostr(personproject_id));

                        InsertNewUser(row,personproject_id );
                      end;

                 end;
                 active := false ;
             end;
            end;
            }

          end;
         end;

     end; //row

   end; //dm_main
  EXIT;
try

with dm_main, dm_main.spUPSERT_PERSON_ELIG do
  begin;

       //PR_UPSERT_PERSON_ELIG(:PPERSON_ID, :PPERSON_ID_LINK, :PORGANIZATION_ID, :PPROJECT_ID, :PPROJECTCONFIG_ID, :PORGUNIQUEID, :PEMPLOYEEID, :PSSN4, :PSSN, :PGENDERCODE, :PRELATIONSHIPCODE, :PFIRSTNAME, :PMIDDLENAME, :PLASTNAME, :PEMAIL, :PEMAIL2, :PADDRESS1, :PADDRESS2, :PCITY, :PSTATE, :PZIPCODE, :PDOB_DT, :PBIRTH_MONTH, :PBIRTH_DAY, :PBIRTH_YEAR, :PPHONE_MOBILE, :PPHONE_MAIN, :VPERSON_ID, :VRETURNCODE, :VSEQUENCENUM, :VUPDATEINSERT, :PCOMMIT, :PINSERTONLY);
       ParamByName('pperson_id').IsNull;
       ParamByName('PORGANIZATION_ID').AsString := edtOrgID.text;
       ParamByName('PPROJECT_ID').AsString := edtProjectID.text;

  end;
 for row :=1 to iRowProcess do
 begin

   for col := 0 to sWorksheetGrid1.Worksheet.GetLastColIndex do
   begin
     cell := sWorksheetGrid1.Worksheet.FindCell(row, col);
     sValue := TRIM(sWorksheetGrid1.Worksheet.ReadAsUTF8Text(cell));

     sColName:= sgMapping.cells[1,col+1] ;
     sFldName :=  sgMapping.cells[2,col+1] ;
     sParamName := 'p'+sFldName ;
     sTable :=  lowercase(sgMapping.Cells[3,col+1]);
      sIsUserID:=  sgMapping.cells[4,col+1] ;
     sIsMap :=  sgMapping.cells[5,col+1] ;

     sDateFormat := sgMapping.cells[9,col+1] ;

     //instructions

     if sTable = 'user_person' then
     begin
        if sIsMap = '1' then
        begin
             bMapFind := false ;
             with DM_Main.sql_core_OrgMapItem do
             begin
              if  Locate('orgMapitem_id',sgMapping.cells[8,col+1],[]) then
              begin
                 with DM_Main.sql_core_OrgMapItemValue  do
                 begin
                   if locate('sValue', sValue, []) then
                   begin
                      sValue := DM_Main.sql_core_OrgMapItemValue.fieldByName('valueMapto').asstring;
                      bMapFind := true ;
                   end;
                 end;
              end; //locate
             end;  //sql_core_orgMapItem
             if not bMapFind then
             begin
                  memoLog.lines.add('ERROR: can not find mapping value '+svalue+' for col: '+sColName+' map for '+sFldName);
               sValue := '';
             end;
         end; //if mapvalue

        if (sDateFormat = '') AND (sValue <> '') then
        begin;

            dm_main.spUPSERT_PERSON_ELIG.ParamByName(sParamName).AsString := sValue  ;

        end;
     end;  // table userperson

    end; //columns

   for i := 0 to  dm_main.spUPSERT_PERSON_ELIG.Params.Count -1 do
   begin;
     sParamName :=  dm_Main.spUPSERT_PERSON_ELIG.params[i].Name  ;
     sParamVal:=dm_main.spUPSERT_PERSON_ELIG.Params[i].AsString ;
     if sParamVal <> '' then

     memoLog.lines.add(sParamName +' = '+sParamVal);

   end; //for i
   // sSqlFlds := sSQLFlds +' )';
   // sSqlValues := sSQLValues +' )';
  //  sSQL :=  sSQL + sSQLFlds + sSQLValues ;
  try
       dm_Main.spUPSERT_PERSON_ELIG.Execute;
  except
      showMessage('error');
  end;

 end; //for irow

  finally
      //  sgMapping.SortColRow(True,0);
  end;
end;

procedure TfrmMain.tbMappingContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;



procedure TfrmMain.TreeView_AcctOrgChange(Sender: TObject; Node: TTreeNode);
var
 table : string ;
 key : integer ;
 dataSet : TDataSet ;
 keyfield : string ;
 nextnode, parentnode, childnode : TTreeNode;

 i, iL : integer ;
 bFound : boolean ;
 treeList: TFPObjectList ;
begin

  btnProcessFile.Enabled := false ;

grpSelectedProject.visible := false;
edtProjectID.text := '';
edtOrgID.text := '';
pnlOrgMappingControls.enabled := false ;

if node <> nil then
begin
  nextnode  := node.GetNextSkipChildren;
  {
  MenuItem_EditAccount.Enabled := false ;
  MenuItem_EditOrg.enabled := false;
  MenuItem_EditProject.enabled := false ;
  MenuItem_NewAccount.enabled := false ;
  MenuItem_NewOrganization.enabled := false ;
  MenuItem_NewProject.enabled := false ;
   }

    if nextnode <> nil then
    nextnode.MakeVisible;


  if node.Level >= 0 then
  begin
      //  MenuItem_NewAccount.enabled := true ;

  end;
  // ORGANIZATION SELECTED (LEVEL = 1)
  if node.Level >= 1 then
  begin
     //    MenuItem_EditAccount.Enabled := true ;
      //   MenuItem_NewOrganization.enabled := true ;
      //   MenuItem_NewProject.enabled := true ;
           pnlOrgMappingControls.enabled := true ;

  end;
  if node.level >= 2 then
  Begin
     // MenuItem_EditProject.enabled := true ;

   end;
  if node.Level > 2 then
  begin
   //  MenuItem_EditOrg.Enabled := true else
   //  MenuItem_EditOrg.Enabled := false;

  end;

 // after recreating tree, node becomes nil

  table :=   DBTreeNode(node).dbtablename;
  key :=      DBTreeNode(node).dbkey;
  dataSet :=  DBTreeNode(node).dbdataset;
  keyfield :=    DBTreeNode(node).dbKeyField;

  if table <> '' then
  begin
      bFound := dataSet.Locate(keyfield,key,[]);
      if not (bFound) then
      try
         // go back through tree to get correct parent/child database relationship
          treeList := TFPObjectList.Create(false);
          iL := node.Level ;
        for i := iL downto 1 do
        begin
            if i = iL then
              nextNode := node else
              nextNode := nextNode.Parent;
              treeList.Add(nextNode);
        end;
        For i := treelist.Count-1 downto 0 do
        begin;
           nextnode := treeList.Items[i] AS TTreeNode;
           table :=   DBTreeNode(nextnode).dbtablename;
           key :=      DBTreeNode(nextnode).dbkey;
           dataSet :=  DBTreeNode(nextnode).dbdataset;
           keyfield :=    DBTreeNode(nextnode).dbKeyField;
           if table <> '' then
           begin
              bFound := dataSet.Locate(keyfield,key,[]);
              if not bFound then
                 showMessage('ERROR: not found '+keyfield+' '+table);
           end;
        end;


      finally
         //treeList.Destroy;
         treeList.Free ;
      end;

  end;
    if node.level >= 3 then
    begin
       with dm_Main do
       begin
        if dm_main.dataprojectconfig_org.RecordCount > 0  then
        begin
             edtProjectID.text :=  dataProjectConfig_Org.FieldByName('Project_Id').asString ;
        end;
        if dm_Main.dataOrganization.recordCount > 0 then
        begin
          edtOrgID.text := dataOrganizationORGANIZATION_ID.AsString ;
           edtAccountID.text := dataAccountACCOUNT_ID.asString;
          grpSelectedProject.visible := true;
          lblSelect.visible := false;
          pnlImportControls.enabled := true ;

        end;

        end ;



       //  TreeView_OrgProject.Items.Clear;
       // TreeView_OrgProject.Items.FreeAllNodeData;

   end else
   begin
         lblSelect.visible := true;
           pnlImportControls.enabled := false ;

   end;

end;


end;

procedure TfrmMain.TreeView_AcctOrgCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
   NodeClass := TDBTreeNode ;
end;

procedure TfrmMain.TreeView_AcctOrgDeletion(Sender: TObject; Node: TTreeNode);
begin
  TDBTreeNode(Node.Data).Free;
end;

procedure TfrmMain.TreeView_OrgProjectCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
   NodeClass := TDBTreeNode ;
end;

procedure TfrmMain.TreeView_OrgProjectDeletion(Sender: TObject; Node: TTreeNode
  );
begin
     TDBTreeNode(Node.Data).Free;
end;



procedure TfrmMain.TreeView_ProjectsCreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
   NodeClass := TDBTreeNode ;
end;

procedure TfrmMain.TreeView_ProjectsDeletion(Sender: TObject; Node: TTreeNode);
begin
     TDBTreeNode(Node.Data).Free;
end;
 function TfrmMain.DBTreeNode(Node:TTreeNode):TDBTreeNode;
begin
  result := TDBTreeNode(Node); //you could even use AS here for extra safety
end;
procedure TfrmMain.OpenCoreDBFiles();
var
   lf : string;
begin
  bLoadOrgTree:= false ;
  With DM_Main do
  begin
      OraSessionMain.Connected := false;

      dataAccount.active := false ;
      dataOrganization.active := false ;
      dataProject.active := false ;
   //     dataProjectConfig_DEFAULT.Active := false ;

     dataProjectConfig.Active := false ;
     dataOrg_wProject.active := false;
     dataProjectConfig_Org.active := false;


//     luStatus.active := false;
//     luProjectGroup.active := false ;
//     lu_Account_Type.active := false ;

     //---**** OPEN TABLES
     dataAccount.active := true ;
     dataOrganization.active := true ;
     dataProject.active := true ;
     dataProjectConfig.Active := true ;
      dataOrg_wProject.active := true;


 //    luStatus.active := true;
 //    luProjectGroup.active := true ;
 //    lu_Account_Type.active := true ;

    dataAccount.First ;
        dataProjectConfig_Org.active := true;
  end;


end;

procedure TfrmMain.LoadAcctOrgIntoTree();
var
   tRoot, tNode , tNodeSib, tNodeChild, tNodeSelected, tNodeCurrent, tNodeOrg : TTreeNode ;
   bNoChild, bNoProject : boolean;
   iLoop : integer ;
begin
   updateFromTree:= false;
   bLoadOrgTree:= false ;
   with DM_Main do
   begin
    dataOrg_wProject.active := true;
    dataProjectConfig.active := false ;
   end;

    TreeView_AcctOrg.Items.Clear;
    TreeView_AcctOrg.Items.FreeAllNodeData;

    TreeView_AcctOrg.BeginUpdate;
   //   tNodeSelected := TreeView_Projects.Selected;
  //        dbgrid5.BeginUpdate;
  gridAccount.BeginUpdate;
  gridOrganization.beginupdate;
  gridProject.beginupdate;
  gridProjectConfig.beginUpdate;

  For iLoop := 0 to 0 do
  begin
    if iLoop = 0 then
       tRoot := TreeView_AcctOrg.Items.Add(nil,'Accounts with Projects') ;
     if iLoop = 1 then
       tRoot := TreeView_AcctOrg.Items.Add(nil,'Accounts (Active)');
    if iLoop = 2 then
      tRoot := TreeView_AcctOrg.Items.Add(nil,'Inactive Accounts');

    with DBTreeNode(tRoot) do
     begin
         dbkey := -1;
         dbkey2 := -1 ;
         dbtablename := 'Account';
         dbdataset := DM_Main.dataAccount ;
         dbKeyField:= '';
     end  ;


    With DM_Main do
    begin
      dataAccount.Filtered := true;
      if iLoop = 0 then
      begin
       // dataAccount.DisableControls;
        dataAccount.Filter := 'isinactive = 0';

      end;
        if iLoop = 1 then
        begin
         // dataAccount.DisableControls;
          dataAccount.Filter:= 'isinactive = 0';
        end;
        if iLoop = 2 then
        begin
         // dataAccount.DisableControls;
          dataAccount.Filter:= 'isinactive = 1';
        end;
          dataAccount.first ;
          While NOT dataAccount.eof do
          begin
           bNoChild := False ;
           bNoProject := false ;
           //Later may want to only have active projects
           if (dataProject.RecordCount = 0) then
           begin
                bNoProject := true ;
           end ;

              if (bNoProject = false ) AND (iLoop = 0) or (iLoop = 2) then
              begin
                  tNode :=  TreeView_AcctOrg.Items.AddChild(tRoot, dataAccountACCOUNTNAME.asString);
                   with DBTreeNode(tNode) do
                   begin
                       dbkey := dataAccountACCOUNT_ID.AsInteger;
                       dbkey2 := -1 ;
                       dbtablename := 'CORE_ACCOUNT';
                       dbdataset := DM_Main.dataAccount ;
                       dbKeyField:= 'ACCOUNT_ID';
                   end  ;
                   tNodeCurrent := tNode;
                    if bNoChild then
                     tNodeCurrent.ImageIndex:= 3
                    else
                     tNodeCurrent.ImageIndex:= 2;

                    tNodeCurrent.SelectedIndex:= 0;

                   if NOT dataOrganization.RecordCount <=0  then
                   begin
                       While NOT dataOrganization.EOF do
                        begin

                            tNodeChild := TreeView_AcctOrg.Items.AddChild(tnode,   dataOrganizationORGNAME.asString  );
                             tNodeCurrent := tNodeChild ;

                                 if dataOrganizationISINACTIVE.asInteger = 1 then
                                 begin
                                  //tNodeCurrent.ImageIndex:= 18;

                                 end else
                                 begin
                                      tNodeCurrent.ImageIndex:= 18;
                                      tNodeCurrent.selectedIndex:= 17;
                                 end;
                            with DBTreeNode(tNodeCurrent) do
                          begin
                            dbkey := dataOrganizationORGANIZATION_ID.AsInteger;
                            dbkey2 :=  dataOrganizationACCOUNT_ID.AsInteger;
                           dbtablename := 'CORE_ORGANIZATION';
                            dbdataSet := DM_Main.dataOrganization;
                              dbKeyField:= 'Organization_ID';
                          end  ;


                           WITH dataProjectConfig_Org do
                           BEGIN

                             While Not dataProjectConfig_Org.EOF do
                             begin
                                  tNodeChild := TreeView_AcctOrg.Items.AddChild(tNodeCurrent, FieldByName('projectname').AsString);
                                  tNodeOrg := tNodeChild ;
                                    tNodeOrg.ImageIndex:= 20;
                                    tNodeOrg.SelectedIndex:= 19;
                                  with DBTreeNode(tNodeOrg) do
                                  begin
                                    dbkey := fieldbyname('ProjectConfig_ID').AsInteger;
                                    dbkey2 := fieldbyname('Organization_ID').AsInteger ;
                                     dbtablename := 'PROJECTCONFIG';
                                    dbdataSet := DM_MAIN.dataProjectConfig_Org;
 ;
                                   dbKeyField:= 'ProjectConfig_ID';
                                  end  ;
                                   dataProjectConfig_Org.next ;
                             end;   //data0rg_wProject.eof
                            end;   //WITH dataOrg_wProject do


                          dataOrganization.NEXT;
                        end; //dataProject.EOF

                   end; //not dataProject.EOF



              end else
              begin
                  //  if (bNoChild = true ) and (iLoop = 1) then
                  if (iLoop >= 1) then
                    begin
                        bNoChild := false ;
                        tNode :=  TreeView_AcctOrg.Items.AddChild(tRoot, dataAccountACCOUNTNAME.asString);
                        with DBTreeNode(tNode) do
                        begin
                           dbkey := dataAccountACCOUNT_ID.AsInteger;
                           dbkey2 := -1 ;
                           dbtablename := 'CORE_ACCOUNT';
                           dbdataset := DM_Main.dataAccount ;
                           dbKeyField:= 'ACCOUNT_ID';
                        end  ;
                        tNodeCurrent := tNode;


                        tNodeCurrent.SelectedIndex:= 0;
                       dataOrganization.first ;
                       if dataOrganization.RecordCount = 0 then
                         bNoChild := true ;
                        if bNoChild then
                         tNodeCurrent.ImageIndex:= 3
                        else
                         tNodeCurrent.ImageIndex:= 2;

                       if bNoChild = false then
                       begin

                       While NOT dataOrganization.EOF do
                       begin
                          if cntOrgProject.fieldbyName('ProjectCnt').asInteger  <= 0 then
                          begin
                            tNodeChild := TreeView_AcctOrg.Items.AddChild(tnode,   dataOrganizationORGNAME.asString  );
                             tNodeCurrent := tNodeChild ;
                                 if dataOrganizationISINACTIVE.asInteger = 1 then
                                 begin
                                  //tNodeCurrent.ImageIndex:= 18;

                                 end else
                                 begin
                                      tNodeCurrent.ImageIndex:= 18;
                                      tNodeCurrent.selectedIndex:= 17;
                                 end;
                            with DBTreeNode(tNodeCurrent) do

                            begin
                            dbkey := dataOrganizationORGANIZATION_ID.AsInteger;
                            dbkey2 :=  dataOrganizationACCOUNT_ID.AsInteger;
                           dbtablename := 'CORE_ORGANIZATION';
                            dbdataSet := DM_Main.dataOrganization;
                              dbKeyField:= 'Organization_ID';
                             end  ;
                          end;
                         dataOrganization.Next ;
                         end;
                       end;
                    end; // iLoop 1
              end;

              dataAccount.Next;
          end; // dataAccount.EOF
          dataAccount.EnableControls;

    end; //with DM_DataMain
  end;   //iloop


    //     tNode :=  TreeView_Projects.Items.AddFirst(tNodeSelected,'First');
         //tNodeChild := TreeView_Projects.Items.AddChild(tnode, 'Child');
         // with DBTreeNode(tNodeChild) do
         // begin
         //         dbkey := 2 ;
         //         //dbTable := 'Child';
         //end ;

         TreeView_AcctOrg.Selected := nil ;
        TreeView_AcctOrg.EndUpdate;


          gridAccount.EndUpdate;
  gridOrganization.EndUpdate;
  gridProject.EndUpdate;
  gridProjectConfig.EndUpdate;
         //dbgrid5.EndUpdate;
         //
       DM_Main.dataAccount.first;
       TreeView_AcctOrg.Selected := nil ;     // to avoid an error

    DM_Main.dataProjectConfig.active := true ;
    DM_Main.dataAccount.Filtered := false;
    bLoadOrgTree:= true;

end;

Procedure TfrmMain.InsertNewUser(row: integer; pp_Id: integer );
var
 col :integer ;
  cell: PCell;
 sValue, sDateFormat : string ;
 sTable : string ;
  sColName, sFldName : string ;
  sParamName, sParamVal : string ;
 i : integer ;
 bMapFind : boolean ;
 sIsMap, sIsUserID : string ;
 person_id , personProject_id, demographic_id : integer ;
 bDemographic : boolean ; // are there any params for user_demograpic

begin
   bDemographic:= false;
   person_id := 0;
   demographic_id := 0;

   if pp_id <= 0 then
     personProject_id := 0 else
     personProject_id := pp_Id ;

  with dm_main, dm_main.spUPSERT_PERSON_ELIG do
  begin;
       ParamByName('pperson_id').IsNull;
       ParamByName('VPERSON_ID').IsNull;
       ParamByName('VPERSONPROJECT_ID').IsNull;
       ParamByName('PORGANIZATION_ID').AsString := edtOrgID.text;
       ParamByName('PPROJECT_ID').AsString := edtProjectID.text;
       ParamByName('pPROJECTCONFIG_ID').asString := edtProjectConfigID.text ;

  end;
  with dm_main, dm_main.spUPSERT_USER_DEMOGRAPHIC do
  begin;
        ParamByName('PDEMOGRAPHIC_ID').IsNull;
  end;
   for col := 0 to sWorksheetGrid1.Worksheet.GetLastColIndex do
   begin

     cell := sWorksheetGrid1.Worksheet.FindCell(row, col);
     sValue := TRIM(sWorksheetGrid1.Worksheet.ReadAsUTF8Text(cell));

     sColName:= sgMapping.cells[1,col+1] ;
     sFldName :=  sgMapping.cells[2,col+1] ;
     sParamName := 'p'+sFldName ;
     sTable :=  lowercase(sgMapping.Cells[3,col+1]);
      sIsUserID:=  sgMapping.cells[4,col+1] ;
     sIsMap :=  sgMapping.cells[5,col+1] ;
     sDateFormat := sgMapping.cells[9,col+1] ;
        if sIsMap = '1' then
        begin
             bMapFind := false ;
             with DM_Main.sql_core_OrgMapItem do
             begin
              if  Locate('orgMapitem_id',sgMapping.cells[8,col+1],[]) then
              begin
                 with DM_Main.sql_core_OrgMapItemValue  do
                 begin
                   if locate('sValue', sValue, []) then
                   begin
                      sValue := DM_Main.sql_core_OrgMapItemValue.fieldByName('valueMapto').asstring;
                      bMapFind := true ;
                   end;
                 end;
              end; //locate
             end;  //sql_core_orgMapItem
             if not bMapFind then
             begin
                  memoLog.lines.add('ERROR: can not find mapping value '+svalue+' for col: '+sColName+' map for '+sFldName);
               sValue := '';
             end;
         end; //if mapvalue

          if (sDateFormat = '') AND (sValue <> '') then
          begin;
               if sTable = 'user_person' then
               begin
                   dm_main.spUPSERT_PERSON_ELIG.ParamByName(sParamName).AsString := sValue  ;
               end;
               if sTable = 'user_demographic' then
               begin
                    bDemographic:= true;
                    dm_main.spUPSERT_USER_DEMOGRAPHIC.ParamByName(sParamName).AsString := sValue  ;
               end;
            end;   //tablename user_demographic

    end; //columns


   //write out parameters (DEBUG)
     memoLog.lines.add('PR_UPSERT_PERSON_ELIG');
   for i := 0 to  dm_main.spUPSERT_PERSON_ELIG.Params.Count -1 do
   begin;
     sParamName :=  dm_Main.spUPSERT_PERSON_ELIG.params[i].Name  ;
     sParamVal   := dm_main.spUPSERT_PERSON_ELIG.Params[i].AsString ;
     if sParamVal <> '' then
         memoLog.lines.add(sParamName +' = '+sParamVal);

   end; //for i


  if pp_id <= 0 then
  try
       //PR_UPSERT_PERSON_ELIG(:PPERSON_ID, :PPERSON_ID_LINK, :PORGANIZATION_ID, :PPROJECT_ID, :PPROJECTCONFIG_ID, :PORGUNIQUEID, :PEMPLOYEEID, :PSSN4, :PSSN, :PGENDERCODE, :PRELATIONSHIPCODE, :PFIRSTNAME, :PMIDDLENAME, :PLASTNAME, :PEMAIL, :PEMAIL2, :PADDRESS1, :PADDRESS2, :PCITY, :PSTATE, :PZIPCODE, :PDOB_DT, :PBIRTH_MONTH, :PBIRTH_DAY, :PBIRTH_YEAR, :PPHONE_MOBILE, :PPHONE_MAIN, :VPERSON_ID, :VRETURNCODE, :VSEQUENCENUM, :VUPDATEINSERT, :PCOMMIT, :PINSERTONLY);

      dm_Main.spUPSERT_PERSON_ELIG.Execute;

       person_id:=   dm_Main.spUPSERT_PERSON_ELIG.ParamByName('VPERSON_ID').AsInteger ;
       personProject_id:= dm_Main.spUPSERT_PERSON_ELIG.ParamByName('VPERSONPROJECT_ID').AsInteger ;

       memoSQL.lines.add('ADDED person_id: '+inttostr(person_id));
       memoSQL.lines.add('ADDED personProject_id: '+inttostr(personProject_id));
       memoLog.lines.add('INSERT person_id: '+inttostr(person_id));
       memoLog.lines.add('INSERT personProject_id: '+inttostr(personProject_id));
  except
      showMessage('error insert person');
  end;

  if (bDemographic = true) And (personProject_id > 0) then
  try
        //  PR_UPSERT_USER_DEMOGRAPHIC(:PDEMOGRAPHIC_ID, :PPERSONPROJECT_ID, :PDEPTCODE, :PDIVISIONCODE, :PFUNCTIONCODE, :PGROUPCODE, :PLOCATIONCODE, :PREGIONCODE, :PCOUNTRYCODE, :PREPORTSTO_PERSON_ID, :PREPORTSTOCODE, :PDEMO_N01, :PDEMO_N02, :PDEMO_N03, :PDEMO_N04, :PDEMO_N05, :PDEMO_N06, :PDEMO_N07, :PDEMO_S01, :PDEMO_S02, :PDEMO_S03, :PDEMO_S04, :PDEMO_S05, :PDEMO_S06, :PDEMO_S07, :VDEMOGRAPHIC_ID, :VRETURNCODE, :VSEQUENCENUM, :VUPDATEINSERT, :VEXISTSFLG, :PCOMMIT, :PINSERTONLY);
             dm_main.spUPSERT_USER_DEMOGRAPHIC.ParamByName('pCommit').asInteger :=1;
            dm_main.spUPSERT_USER_DEMOGRAPHIC.ParamByName('PPERSONPROJECT_ID').asInteger := personProject_id;
                 memoLog.lines.add('PR_UPSERT_USER_DEMOGRAPHIC');
               for i := 0 to  dm_main.spUPSERT_USER_DEMOGRAPHIC.Params.Count -1 do
               begin;
                 sParamName :=  dm_Main.spUPSERT_USER_DEMOGRAPHIC.params[i].Name  ;
                 sParamVal   := dm_main.spUPSERT_USER_DEMOGRAPHIC.Params[i].AsString ;
                 if sParamVal <> '' then
                     memoLog.lines.add(sParamName +' = '+sParamVal);
               end; //for i

               dm_main.spUPSERT_USER_DEMOGRAPHIC.Execute;
            //   dm_main.spUPSERT_USER_DEMOGRAPHIC.Execute ;


               demographic_id:= dm_Main.spUPSERT_USER_DEMOGRAPHIC.ParamByName('vDEMOGRAPHIC_ID').AsInteger ;
               memoSQL.lines.add('ADDED demographic_id: '+inttostr(demographic_id));
               memoLog.lines.add('INSERT  demographic_id: '+inttostr( demographic_id));

  except
      showMessage('error insert user_demographic');
  end;




end;




end.

