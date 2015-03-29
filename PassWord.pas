unit PASSWORD;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ImgList, Vcl.ExtCtrls, unDB,
  Vcl.Dialogs, unMain, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, unMD5;

type
  TPasswordDlg = class(TForm)
    lbPass: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    cbUser: TComboBox;
    lbUser: TLabel;
    OpenDialog: TOpenDialog;
    lbDB: TLabel;
    edDB: TButtonedEdit;
    ImageList: TImageList;
    BindSourceDB: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    procedure edDBRightButtonClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Connect;
    procedure edDBKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;
  Config : TStringList;
  dir: string;

implementation

{$R *.dfm}

procedure TPasswordDlg.Connect;
begin

 DM.FDConnection.Params.Strings[1] := 'Database=' + edDB.Text;
 DM.Connect;
end;

procedure TPasswordDlg.edDBKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then Connect;
end;

procedure TPasswordDlg.edDBRightButtonClick(Sender: TObject);
begin
 if OpenDialog.Execute then edDB.Text := OpenDialog.FileName;
 Connect;
end;

procedure TPasswordDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
fmMain.Close;
end;

procedure TPasswordDlg.FormCreate(Sender: TObject);
begin
dir := GetCurrentDir;
Config := TStringList.Create;
if FileExists('tickets.cfg') then begin
  Config.LoadFromFile('tickets.cfg');
  edDB.Text := Config.Strings[0];
  DM.FDConnection.Params.Strings[1] := 'Database=' + edDB.Text;
  DM.Connect;
  cbUser.ItemIndex := Config.Strings[1].ToInteger;
end;
end;

procedure TPasswordDlg.OKBtnClick(Sender: TObject);
var i: integer;
begin
if edDB.Text <> '' then
  if  DM.FDConnection.Connected then
    if cbUser.Text <> '' then begin
      for i := 1 to cbUser.ItemIndex do DM.FDLoginQuery.Next;                  // выбираем нужную запись в запросе
        if md5(Password.Text) = DM.FDLoginQuery.Fields[2].AsString then begin   // ѕровер€ем пароль. если ок, то сохран€ем пользовател€ и открываем форму
          User.id   := DM.FDLoginQuery.Fields[0].AsInteger;
          User.name := DM.FDLoginQuery.Fields[1].AsString;
          User.level:= DM.FDLoginQuery.Fields[4].AsInteger;
          Config.Clear;
          Config.Add(edDB.Text);
          Config.Add(cbUser.ItemIndex.ToString);
          Config.SaveToFile(dir + '\tickets.cfg');
          Config.Free;
          Hide;
          fmMain.Show;
          Free;
        end else ShowMessage('Ќеправильный пароль!');
      end else ShowMessage('¬ыберите пользовател€!')
    else Connect
else ShowMessage('¬ыберите базу данных!') ;
end;

end.

