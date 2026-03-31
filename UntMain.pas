unit UntMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Registry,
  Vcl.ExtCtrls;

type
  TFrmMain = class(TForm)
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnUpdate: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    TimerCreateNewFields: TTimer;
    Button8: TButton;
    PageControlInfo: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Memo2: TMemo;
    Panel3: TPanel;
    Label1: TLabel;
    MemoErrors: TMemo;
    procedure btnUpdateClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnConvertPasswordClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TimerCreateNewFieldsTimer(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    procedure UpdateOTC_PlanMedicoNo;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses UntDMModifyDatabase, UntDMePrescribe, UntFrmPickDate;

procedure TFrmMain.btnUpdateClick(Sender: TObject);
begin
  DMModifyDatabase.UpdatePOS;
  ShowMessage('Finish updating!') ;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  UpdateOTC_PlanMedicoNo;
end;

procedure TFrmMain.btnConvertPasswordClick(Sender: TObject);
Var
  I: Integer;
begin
 FrmMain.PageControlInfo.ActivePageIndex := 0;
 DMModifyDatabase.UpdateNullColumns('Passwords');
 DMModifyDatabase.AlterColumns('Passwords');

 { With DMModifyDatabase do
  begin
    //===================Constrains====================================
    //for I := 0 to 3-1 do
    begin
      cdsConstrains.Close;
      cdsConstrains.CommandText := 'SELECT TableName = t.Name, ColumnName = c.Name, dc.Name, dc.definition FROM sys.tables t ' +
      'INNER JOIN sys.default_constraints dc ON t.object_id = dc.parent_object_id ' +
      'INNER JOIN sys.columns c ON dc.parent_object_id = c.object_id AND c.column_id = dc.parent_column_id ' +
      ' ORDER BY t.Name';
      //'where t.Name = ' + chr(39) + 'inventarioPiso' + chr(39) + ' ORDER BY t.Name';
      cdsConstrains.Open;
      cdsConstrains.First;
      while not cdsConstrains.Eof do
      begin
        if (Trim(cdsConstrainsTableName.Value) = 'OTC') or
        (Trim(cdsConstrainsTableName.Value) = 'INVENTARIOPISO') or
        (Trim(cdsConstrainsTableName.Value) = 'PACIENTES') or
        (Trim(cdsConstrainsTableName.Value) = 'DAILYTOTALS') then
        begin
          ExecSql('Alter Table ' + Trim(cdsConstrainsTableName.Value) + ' DROP Constraint ' + Trim(cdsConstrainsName.Value));
        end;
        cdsConstrains.Next;
      end;
    end;
  end; }
end;

procedure TFrmMain.Button8Click(Sender: TObject);
begin

  Memo1.Clear;
  Memo1.Lines.Add('Reindexing Database...');
  DMModifyDatabase.Reindex.ExecSQL;
  Memo1.Lines.Add('Done...');
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMModifyDatabase.ExecSql('DROP PROCEDURE FIX_CONTROLADO');
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
//  TimerCreateNewFields.Enabled := True;
end;

procedure TFrmMain.TimerCreateNewFieldsTimer(Sender: TObject);
begin
  TimerCreateNewFields.Enabled := False;
  DMModifyDatabase.CreateNewFields;
  btnUpdate.Enabled := true;
  //DMModifyDatabase.DropAll;
end;

procedure TFrmMain.UpdateOTC_PlanMedicoNo;
begin
  With DMModifyDatabase do
  begin
    FDQuery1.SQL.Text := 'Select OTCNumber, PLAN_MEDICO from otc where FECHAOTC > ' + chr(39) + '01/01/2023' + chr(39) +' and NUMERORECETA > 0 and PLANESMEDICOSNO = 0';
    FDQuery1.Open;
    While not FDQuery1.Eof do
    begin
      try
      FDQuery2.Close;
      FDQuery2.SQL.Text := 'Select planesmedicosno from PlanesMedicos where Abreviatura = ' + chr(39) + FDQuery1.FieldByName('PLAN_MEDICO').value + chr(39) ;
      FDQuery2.Open;
      if (FDQuery2.RecordCount > 0) and (FDQuery1.FieldByName('otcnumber').isNull = false) and
      (FDQuery2.FieldByName('planesmedicosno').isNull = false) then
      begin
        FDQuery3.SQL.Text := 'Update otc set PLANESMEDICOSNO = ' + FDQuery2.FieldByName('planesmedicosno').AsString + ' where otcnumber = ' + FDQuery1.FieldByName('otcnumber').AsString;
        FDQuery3.ExecSQL;
      end;
      Except
        Memo1.Lines.Add(FDQuery3.SQL.Text);
      end;
      FDQuery1.Next;
    end;
    FDQuery1.SQL.Text := 'select PLANMEDICO, NUMEROPLAN, PLANESMEDICOSNO from PATPLAN where PLANESMEDICOSNO = 0 or PLANESMEDICOSNO IS NULL';
    FDQuery1.Open;
    While not FDQuery1.Eof do
    begin
      try
      FDQuery2.Close;
      FDQuery2.SQL.Text := 'Select planesmedicosno from PlanesMedicos where Abreviatura = ' + chr(39) + FDQuery1.FieldByName('PLANMEDICO').value + chr(39);
      FDQuery2.Open;
      if (FDQuery2.RecordCount > 0) and (FDQuery1.FieldByName('NUMEROPLAN').isNull = false) and
      (FDQuery2.FieldByName('planesmedicosno').isNull = false)  then
      begin
        FDQuery3.SQL.Text := 'Update PATPLAN set PLANESMEDICOSNO = ' + FDQuery2.FieldByName('planesmedicosno').AsString + ' where NUMEROPLAN = ' + FDQuery1.FieldByName('NUMEROPLAN').AsString;
        FDQuery3.ExecSQL;
      end;
      Except
        Memo1.Lines.Add(FDQuery3.SQL.Text);
      end;
      FDQuery1.Next;
    end;
  end;
end;

end.
