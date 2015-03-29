unit unMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, unDB, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Vcl.StdCtrls, Vcl.ComCtrls, unPlug, unAuto, unUsers, Vcl.Menus, Vcl.ExtCtrls,
  Data.Bind.Controls, Vcl.Buttons, Vcl.ToolWin, unMD5, ComObj, Vcl.ExtDlgs,
  PngImage, mimemess, mimepart, smtpsend, printers;

type
  TfmMain = class(TForm)
    bsOperator: TBindSourceDB;
    dtDateBegin: TDateTimePicker;
    PopupMenu: TPopupMenu;
    NPlug: TMenuItem;
    NCounter: TMenuItem;
    sgOperator: TStringGrid;
    BindingsL: TBindingsList;
    LinkOperator: TLinkGridToDataSource;
    dtDateEnd: TDateTimePicker;
    lbDate: TLabel;
    pnButtons: TPanel;
    pnOperator: TPanel;
    pnAdmin: TPanel;
    nbTabs: TNotebook;
    pnLog: TPanel;
    pnUsers: TPanel;
    pnAutomat: TPanel;
    sgAutomats: TStringGrid;
    bsAutomats: TBindSourceDB;
    LinkAutomats: TLinkGridToDataSource;
    tbAuto: TToolBar;
    btnAddAuto: TSpeedButton;
    btnEditAuto: TSpeedButton;
    btnDeleteAuto: TSpeedButton;
    sgAdmin: TStringGrid;
    bsAdmin: TBindSourceDB;
    LinkAdmin: TLinkGridToDataSource;
    tbUsers: TToolBar;
    sgUsers: TStringGrid;
    sgLog: TStringGrid;
    btnAddUser: TSpeedButton;
    btnEditUsers: TSpeedButton;
    btnChangePass: TSpeedButton;
    bsUsers: TBindSourceDB;
    LinkUsers: TLinkGridToDataSource;
    cbMonth: TComboBox;
    bsLog: TBindSourceDB;
    LinkLog: TLinkGridToDataSource;
    tbAdmin: TToolBar;
    btnExcelExp: TSpeedButton;
    pnSettings: TPanel;
    gbOrg: TGroupBox;
    edOrgName: TLabeledEdit;
    btnGetLogo: TButton;
    gbStorage: TGroupBox;
    lbLogo: TLabel;
    edQuantity: TLabeledEdit;
    cbEmail: TCheckBox;
    edReceiver: TLabeledEdit;
    edSender: TLabeledEdit;
    edSMTP: TLabeledEdit;
    edPass: TLabeledEdit;
    edPort: TLabeledEdit;
    bsSettings: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    OpenLogoDlg: TOpenPictureDialog;
    imgLogo: TImage;
    btnPrint: TSpeedButton;
    procedure sgOperatorDblClick(Sender: TObject);
    procedure sgOperatorKeyPress(Sender: TObject; var Key: Char);
    procedure NCounterClick(Sender: TObject);
    procedure pnChooseTab(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddAutoClick(Sender: TObject);
    procedure btnEditAutoClick(Sender: TObject);
    procedure btnDeleteAutoClick(Sender: TObject);
    procedure dtDateBeginCloseUp(Sender: TObject);
    procedure dtDateEndCloseUp(Sender: TObject);
    procedure sgAdminDblClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure btnChangePassClick(Sender: TObject);
    procedure btnAddUserClick(Sender: TObject);
    procedure btnEditUsersClick(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgAdminDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure btnExcelExpClick(Sender: TObject);
    function StringGridToExcelSheet(Grid: TStringGrid; SheetName, FileName: string; ShowExcel: Boolean): Boolean;
    procedure sgOperatorExit(Sender: TObject);
    procedure sgAdminExit(Sender: TObject);
    procedure tbAutoExit(Sender: TObject);
    procedure sgUsersExit(Sender: TObject);
    procedure sgLogExit(Sender: TObject);
    procedure SaveSettings(Sender: TObject);
    procedure btnGetLogoClick(Sender: TObject);
    procedure edOrgNameChange(Sender: TObject);
    procedure cbEmailClick(Sender: TObject);
    procedure Alert;
    procedure btnPrintClick(Sender: TObject);
    procedure sgDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TUser = record
    id: integer;
    name: string;
    level: integer;
  end;
  
var
  fmMain: TfmMain;
  User: TUser;
  tickets_lack: boolean;


implementation

{$R *.dfm}



procedure TfmMain.dtDateBeginCloseUp(Sender: TObject);
begin
if dtDateBegin.Date <= dtDateEnd.Date  then
  DM.DateBegin := dtDateBegin.Date
  else begin
    dtDateBegin.Date := dtDateEnd.Date;
    MessageBox(0,
               Pchar('Дата начала периода не может быть больше даты окончания!'),
               'Ошибка',
               MB_OK or MB_ICONERROR );
  end;
end;

procedure TfmMain.dtDateEndCloseUp(Sender: TObject);
begin
  if dtDateEnd.Date >= dtDateBegin.Date then
    DM.DateEnd := dtDateEnd.Date
    else begin
      dtDateEnd.Date := dtDateBegin.Date;
      MessageBox(0,
                 Pchar('Дата окончания периода не может быть больше даты Начала!'),
                 'Ошибка',
                 MB_OK or MB_ICONERROR );
    end;
end;

procedure TfmMain.edOrgNameChange(Sender: TObject);
begin
  Caption := 'Учет билетов - ' + edOrgName.Text;
end;

// Сохранить настройки
procedure TfmMain.SaveSettings(Sender: TObject);
begin
If fmMain.Visible then DM.FDSettings.Refresh
end;

procedure TfmMain.FormCreate(Sender: TObject);
Var Year, Month, Day : word;
begin
DecodeDate(Date, Year, Month, Day);
dtDateBegin.Date := EncodeDate(Year, Month, 1);
dtDateEnd.Date := Date;
cbMonth.ItemIndex := Month-1;
nbTabs.PageIndex := 0;
end;


 // Установка видимости компонентов в соответствии с правами
procedure TfmMain.FormShow(Sender: TObject);
var bmp : TGraphic;
    BS: TStream;
    s: Word;

function Balance : integer ;
begin
if sgOperator.Cells[2,1]= '' then Balance := 0
    else Balance := sgOperator.Cells[2,1].ToInteger
end;
begin
if (sgOperator.Cells[2,1]<>'') and (edQuantity.Text<>'') then tickets_lack := sgOperator.Cells[2,1].ToInteger < StrToInt(edQuantity.Text) else tickets_lack := True;
cbEmailClick(Sender);
if User.level < 2  then begin     //   Если не админ
  pnButtons.Hide;
  dtDateBegin.Enabled := False;
  dtDateEnd.Enabled   := False;
  cbMonth.Enabled     := False;
  cbMonth.Left        := 3;
  nbTabs.Align        := alBottom;
  Width               := 600;
  nbTabs.Anchors      := [akTop, akRight, akLeft, akBottom];
  fmPlug.dtDate.Enabled := False;
  fmAuto.Free;
  fmUsers.Free;
end else begin
        // загрузка лого из базы
Caption := 'Учет билетов - ' + edOrgName.Text;
bmp := TBitmap.Create;
DM.GetLogo(BS);
BS.ReadBuffer(s,2);
case s of
  19778: bmp := TBitmap.Create;
  20617: bmp := TPngImage.Create;
end;
BS.Position := 0;
bmp.LoadFromStream(bs);
imgLogo.Picture.Graphic := bmp;
bmp.Free;
end;

if (DM.FDSettings.Fields.FieldByName('last_alert').AsDateTime <> Date) and (Balance < StrToInt(edQuantity.Text)) then
    begin
    Alert;
    DM.FDSettings.Edit;
    DM.FDSettings.Fields.FieldByName('last_alert').AsDateTime := Date;
    DM.FDSettings.Post;
    end;

end;




//Процедура обработки бокового преключателя
procedure TfmMain.pnChooseTab(Sender: TObject);
var i: integer;
begin
for i := 0 to ComponentCount-1 do if (Components[i] is TPanel) then TPanel(Components[i]).Color := clBtnFace;
TPanel(Sender).Color := clBtnShadow;
nbTabs.PageIndex := TPanel(Sender).Tag;
DM.ActivePage := TPanel(Sender).Tag;
end;

//Процедуры работы со вкладкой оператора
procedure TfmMain.sgOperatorDblClick(Sender: TObject);
begin
With fmPlug do begin
  lbAutoName.Caption := sgOperator.Cells[1,sgOperator.Row];
  edPlug.Text := 2000.ToString;
  fmType := ftPlug;
  if (User.level>1) or (sgOperator.Cells[0,sgOperator.Row]<>'1') then // Оператор не может приходовать на склад
  if  (ShowModal = mrOk) and (edPlug.Text <> '') then DM.Plug(sgOperator.Cells[0,sgOperator.Row].ToInteger,
                                                              StrToInt(edPlug.Text),
                                                              dtDate.Date,
                                                              mmComment.Text,
                                                              User.id);
  end;
// проверка и сообщение о нехватке

if (not tickets_lack) and (sgOperator.Cells[2,1].ToInteger < StrToInt(edQuantity.Text)) then
    begin
      tickets_lack := True;
        Alert;
    end;
end;

procedure TfmMain.sgDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var new_rect: TRect;
begin
new_rect := Rect;
new_rect.Left := Rect.Left -4;
With TStringGrid(Sender) do
if ARow > 1 then
if (not Odd(ARow)) and (not (gdSelected in State)) then begin
  Canvas.Brush.Color := $F4F4F4;
  Canvas.FillRect(new_rect);
  Canvas.TextOut(Rect.Left+2, Rect.Top+5, Cells[aCol, ARow]);
  Canvas.Brush.Color := clWindow;
end;
end;

procedure TfmMain.Alert;

Procedure SendMail (Host, Subject, pTo, From , TextBody, HTMLBody, login,password, port : string);
var Msg : TMimeMess; //собщение
    StringList : TStringList; //содержимое письма
    MIMEPart : TMimePart; //части сообщения (на будущее)
begin
  Msg := TMimeMess.Create; //создаем новое сообщение
  StringList := TStringList.Create;
  try
// Добавляем заголовки
    Msg.Header.Subject := Subject;//тема сообщения
    Msg.Header.From := From; //имя и адрес отправителя
    Msg.Header.ToList.Add(pTo); //имя и адрес получателя
// создаем корневой элемент
    MIMEPart := Msg.AddPartMultipart('alternative', nil);
    if length(TextBody) > 0 then
      begin
        StringList.Text := TextBody;
        Msg.AddPartText(StringList, MIMEPart);
      end
    else
      begin
        StringList.Text := HTMLBody;
        Msg.AddPartHTML(StringList, MIMEPart);
      end;
// Кодируем и отправляем
    Msg.EncodeMessage;
    smtpsend.SendToRaw(From, pTo, Host, Msg.Lines, login, password, port);
 finally
   Msg.Free;
   StringList.Free;
 end;
end;

begin
MessageBox(0,
           Pchar('Заканчиваются билеты на складе!'),
           'Внимание',
           MB_OK or MB_ICONWARNING);
if cbEmail.Checked then
if (((((edReceiver.Text  = '') or (edSender.Text = '')) or (edSMTP.Text = '')) or (edPass.Text = '')) or (edPort.Text = ''))  then
  MessageBox(0,
           Pchar('Не заполнены настройки отправки уведомлений по электронной почте!'),
           'Невозможно отправить уведомление',
           MB_OK or MB_ICONERROR) else
SendMail(edSMTP.Text,
         'Заканчиваются билеты на складе!',
         edReceiver.Text,
         edSender.Text,
         'На складе центра ' + edOrgName.Text + ' заканчиваются билеты! Осталось ' + sgOperator.Cells[2,1],
         '',
         edSender.Text,
         edPass.Text,
         edPort.Text
         );
end;

procedure TfmMain.sgOperatorExit(Sender: TObject);
Var i: integer;
begin
  for i := 0 to sgOperator.ColCount-1 do LinkOperator.Columns.Items[i].Width := sgOperator.ColWidths[i];
end;

procedure TfmMain.NCounterClick(Sender: TObject);
begin
if sgOperator.Cells[0,sgOperator.Row] <> '1' then
With fmPlug do begin
  lbAutoName.Caption := sgOperator.Cells[1,sgOperator.Row];
  edPlug.Text := '';
  fmType := ftCounter;
  if  (ShowModal = mrOk) and (edPlug.Text <> '') then
    if not DM.ChangeCounter(sgOperator.Cells[0,sgOperator.Row].ToInteger,
                            StrToInt(edPlug.Text),
                            dtDate.Date,
                            mmComment.Text,
                            User.id) then
                                MessageBox(0,
                                           Pchar('Нельзя редактировать показания счетчика ранее последнего обновления!'),
                                           'Внимание',
                                           MB_OK or MB_ICONWARNING);
  end;
end;

procedure TfmMain.sgOperatorKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then sgOperatorDblClick(Sender);
end;



procedure TfmMain.sgUsersExit(Sender: TObject);
Var i: integer;
begin
  for i := 0 to sgUsers.ColCount-1 do LinkUsers.Columns.Items[i].Width := sgUsers.ColWidths[i];
end;

procedure TfmMain.btnExcelExpClick(Sender: TObject);
begin
  StringGridToExcelSheet(sgAdmin, 'Отчет', 'Отчет.xls', True);
end;

procedure TfmMain.btnGetLogoClick(Sender: TObject);
begin
 if OpenLogoDlg.Execute then    begin
  imgLogo.Picture.LoadFromFile(OpenLogoDlg.FileName);
  DM.LoadLogo(OpenLogoDlg.FileName);
 end;

end;

procedure TfmMain.btnPrintClick(Sender: TObject);

procedure PrintGrid(sGrid: TStringGrid; sTitle: string);
var
  X1, X2: Integer;
  Y1, Y2: Integer;
  TmpI: Integer;
  F: Integer;
  TR: TRect;
begin
  Printer.Title := sTitle;
  Printer.Orientation := poLandscape;
  Printer.BeginDoc;
  Printer.Canvas.Pen.Color  := 0;
  Printer.Canvas.Font.Name  := 'Times New Roman';
  Printer.Canvas.Font.Size  := 12;
  Printer.Canvas.Font.Style := [fsBold, fsUnderline];
  Printer.Canvas.TextOut(100, 100, Printer.Title);
  for F := 1 to sGrid.ColCount - 1 do
  begin
    X1 := 100;
    for TmpI := 1 to (F - 1) do
      X1 := X1 + 5 * (sGrid.ColWidths[TmpI]);
    Y1 := 300;
    X2 := 0;
    for TmpI := 1 to F do
      X2 := X2 + 5 * (sGrid.ColWidths[TmpI]);
    Y2 := 450;
    TR := Rect(X1, Y1, X2 - 30, Y2);
    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.Font.Size := 7;
    Printer.Canvas.TextRect(TR, X1 + 50, 350, sGrid.Cells[F, 0]);
    Printer.Canvas.Font.Style := [];
    for TmpI := 1 to sGrid.RowCount - 1 do
    begin
      Y1 := 150 * TmpI + 300;
      Y2 := 150 * (TmpI + 1) + 300;
      TR := Rect(X1, Y1, X2 - 30, Y2);
      Printer.Canvas.TextRect(TR, X1 + 50, Y1 + 50, sGrid.Cells[F, TmpI]);
    end;
  end;
  Printer.EndDoc;
end;

begin
PrintGrid(sgAdmin,'Отчет администратора c '+ DateToStr(dtDateBegin.Date) + ' по ' + DateToStr(dtDateEnd.Date) + ' - ' + edOrgName.Text);
end;

// Процедура добавления пользователя
procedure TfmMain.btnAddUserClick(Sender: TObject);
begin
With fmUsers do begin
  if ShowModal = mrOk then begin
     DM.AddUser(edUser.Text,md5(InputBox('Пароль', 'Введите пароль', '')),Date,cbLevel.ItemIndex);
     end;
  end;
end;

// Изменить данные пользователя
procedure TfmMain.btnEditUsersClick(Sender: TObject);
begin
With fmUsers do begin
  edUser.Text := sgUsers.Cells[1,sgUsers.Row];
  cbLevel.ItemIndex := sgUsers.Cells[3,sgUsers.Row].ToInteger;
  if ShowModal = mrOk then DM.EditUser(edUser.Text,cbLevel.ItemIndex, sgUsers.Cells[0,sgUsers.Row].ToInteger);
end;
end;

procedure TfmMain.cbEmailClick(Sender: TObject);
begin
edReceiver.Enabled := cbEmail.Checked;
edSender.Enabled   := cbEmail.Checked;
edPass.Enabled     := cbEmail.Checked;
edPort.Enabled     := cbEmail.Checked;
edSMTP.Enabled     := cbEmail.Checked;
SaveSettings(Sender);
end;

procedure TfmMain.cbMonthChange(Sender: TObject);
Var Year, Month, Day : word;
begin
DecodeDate(Date, Year, Month, Day);
Month :=  cbMonth.ItemIndex+1;
dtDateBegin.Date := EncodeDate(Year, month, 1);
Inc(month);
if month = 13 then begin
  Inc(year);
  month := 1;
end;
dtDateEnd.Date   := EncodeDate(Year, month, 1)-1;
dtDateBeginCloseUp(Sender);
dtDateEndCloseUp(Sender);
end;

//Процедура смены пароля
procedure TfmMain.btnChangePassClick(Sender: TObject);
begin
  DM.ChangePass(StrToInt(sgUsers.Cells[0,sgUsers.Row]), md5(InputBox('Пароль', 'Введите пароль', '')));
end;



// Процедуры работы со списком автоматов


procedure TfmMain.btnAddAutoClick(Sender: TObject);
begin
With fmAuto do begin
   fmType_add := True;
  if  ShowModal = mrOk then DM.AutoAdd(edAuto_name.Text,mmComment.Text,StrToInt(edCounter.Text),dtDate.Date);
  end;
end;

procedure TfmMain.btnEditAutoClick(Sender: TObject);
begin
With fmAuto do begin
  edAuto_name.Text := sgAutomats.Cells[1,sgAutomats.Row];
  edCounter.Text   := sgAutomats.Cells[2,sgAutomats.Row];
  if sgAutomats.Cells[3,sgAutomats.Row]<>'' then dtDate.Date := StrToDate(sgAutomats.Cells[3,sgAutomats.Row]);
  mmComment.Text   := sgAutomats.Cells[4,sgAutomats.Row];
  fmType_add := False;
  if ShowModal = mrOk then DM.AutoUpdate(StrToInt(sgAutomats.Cells[0,sgAutomats.Row]),edAuto_name.Text,mmComment.Text);
  end;
end;



// процедура удаления автомата
procedure TfmMain.btnDeleteAutoClick(Sender: TObject);
begin
if MessageBox(0,
             Pchar('Вы действительно хотите удалить автомат'+#13+sgAutomats.Cells[1,sgAutomats.Row]+#13+'и все связанные с ним данные?'),
             'Удаление автомата',
             MB_YESNO or MB_ICONWARNING) = mrYes then begin
                if sgAutomats.Cells[0,sgAutomats.Row] = '1' then MessageBox(0,
                                                                            Pchar('Нельзя удалить склад!'),
                                                                            'Ошибка',
                                                                            MB_OK or MB_ICONERROR)
                  else DM.AutoDelete(StrToInt(sgAutomats.Cells[0,sgAutomats.Row]));
             end;
end;

procedure TfmMain.btnDeleteUserClick(Sender: TObject);
begin

end;

// процедура добавления выручки
procedure TfmMain.sgAdminDblClick(Sender: TObject);
begin
With fmPlug do begin
  fmType := ftTake;
  lbAutoName.Caption := sgAdmin.Cells[1,sgAdmin.Row];
  edPlug.Text := '';
  if ShowModal = mrOk then DM.GetTake(sgAdmin.Cells[0,sgAdmin.Row].ToInteger,
                                    StrToFloat(edPlug.Text),
                                    dtDate.Date);
  end;
end;

procedure TfmMain.sgAdminDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var new_rect: TRect;
begin
new_rect := Rect;
new_rect.Left := Rect.Left -4;
With TStringGrid(Sender) do
if ARow > 1 then
if (not Odd(ARow)) and (not (gdSelected in State)) then begin
  Canvas.Brush.Color := $F4F4F4;
  Canvas.FillRect(new_rect);
  Canvas.TextOut(Rect.Left+2, Rect.Top+5, Cells[aCol, ARow]);
  if ((ARow > 0) and (Cells[6,ARow] <> '')) and (ACol = 6) then
  if (Cells[6,ARow].ToInteger < 0) or (Cells[6,ARow].ToInteger > 3000) then begin
    Canvas.Font.Color := clRed;
    Canvas.TextOut(Rect.Left+2, Rect.Top+5, Cells[aCol, ARow]);
    Canvas.Font.Color := clWindowText;
  end;
  Canvas.Brush.Color := clWindow;
end;
end;

procedure TfmMain.sgAdminExit(Sender: TObject);
Var i: integer;
begin
  for i := 0 to sgAdmin.ColCount-1 do LinkAdmin.Columns.Items[i].Width := sgAdmin.ColWidths[i];
end;

procedure TfmMain.sgLogExit(Sender: TObject);
Var i: integer;
begin
  for i := 0 to sgLog.ColCount-1 do LinkLog.Columns.Items[i].Width := sgLog.ColWidths[i];
end;

// Экспорт в эксель
 // StringGrid Inhalt in Excel exportieren
// Export StringGrid contents to Excel
function TfmMain.StringGridToExcelSheet(Grid: TStringGrid; SheetName, FileName: string; ShowExcel: Boolean): Boolean;
 const
   xlWBATWorksheet = -4167;
 var
   SheetCount, SheetColCount, SheetRowCount, BookCount: Integer;
   XLApp, Sheet, Data: OLEVariant;
   I, J, N, M: Integer;
   SaveFileName: string;

 function RefToCell(RowID, ColID: Integer): string;
 var
   ACount, APos: Integer;
 begin
   ACount := ColID div 26;
   APos := ColID mod 26;
   if APos = 0 then
   begin
     ACount := ACount - 1;
     APos := 26;
   end;

   if ACount = 0 then
     Result := Chr(Ord('A') + ColID - 1) + IntToStr(RowID);

   if ACount = 1 then
     Result := 'A' + Chr(Ord('A') + APos - 1) + IntToStr(RowID);

   if ACount > 1 then
     Result := Chr(Ord('A') + ACount - 1) + Chr(Ord('A') + APos - 1) + IntToStr(RowID);
 end;

 begin
   //notwendige Sheetanzahl feststellen
  SheetCount := (Grid.ColCount div 256) + 1;
   if Grid.ColCount mod 256 = 0 then SheetCount := SheetCount - 1;
   //notwendige Bookanzahl feststellen
  BookCount := (Grid.RowCount div 65536) + 1;
   if Grid.RowCount mod 65536 = 0 then  BookCount := BookCount - 1;
   //Create Excel-OLE Object
  Result := False;
   XLApp  := CreateOleObject('Excel.Application');
   try
     //Excelsheet anzeigen
    if ShowExcel = False then XLApp.Visible := False
     else XLApp.Visible := True;
     //Workbook hinzufugen
    for M := 1 to BookCount do
     begin
       XLApp.Workbooks.Add(xlWBATWorksheet);
       //Sheets anlegen
      for N := 1 to SheetCount - 1 do
       begin
         XLApp.Worksheets.Add;
       end;
     end;
     //Sheet ColAnzahl feststellen
    if Grid.ColCount <= 256 then  SheetColCount := Grid.ColCount
     else   SheetColCount := 256;
     //Sheet RowAnzahl feststellen
    if Grid.RowCount <= 65536 then  SheetRowCount := Grid.RowCount
     else   SheetRowCount := 65536;
     //Sheets befullen
    for M := 1 to BookCount do
     begin
       for N := 1 to SheetCount do
       begin
         //Daten aus Grid holen
        Data := VarArrayCreate([1, Grid.RowCount, 1, SheetColCount], varVariant);
         for I := 0 to SheetColCount - 1 do
           for J := 0 to SheetRowCount - 1 do
             if ((I + 256 * (N - 1)) <= Grid.ColCount) and
               ((J + 65536 * (M - 1)) <= Grid.RowCount) then
               Data[J + 1, I + 1] := Grid.Cells[I + 256 * (N - 1), J + 65536 * (M - 1)];
         //-------------------------
        XLApp.Worksheets[N].Select;
         XLApp.Workbooks[M].Worksheets[N].Name := SheetName + IntToStr(N);
         //Zellen als String Formatieren
        XLApp.Workbooks[M].Worksheets[N].Range[RefToCell(1, 1),
           RefToCell(SheetRowCount, SheetColCount)].Select;
         //XLApp.Selection.NumberFormat := '@';
         XLApp.Workbooks[M].Worksheets[N].Range['A1'].Select;
         //Daten dem Excelsheet ubergeben
        Sheet := XLApp.Workbooks[M].WorkSheets[N];
         Sheet.Range[RefToCell(1, 1), RefToCell(SheetRowCount, SheetColCount)].Value := Data;
         Sheet.Range[RefToCell(1, 1), RefToCell(SheetRowCount, SheetColCount)].EntireColumn.AutoFit;
       end;
     end;
     //Save Excel Worksheet
    try
       for M := 1 to BookCount do
       begin
         SaveFileName := Copy(FileName, 1,Pos('.', FileName) - 1) + IntToStr(M) +
           Copy(FileName, Pos('.', FileName),
           Length(FileName) - Pos('.', FileName) + 1);
         XLApp.Workbooks[M].SaveAs(SaveFileName);
       end;
       Result := True;
     except
       // Error ?
    end;
   finally
     //Excel Beenden
    if (not VarIsEmpty(XLApp)) and (ShowExcel = False) then
     begin
       XLApp.DisplayAlerts := False;
       XLApp.Quit;
       XLAPP := Unassigned;
       Sheet := Unassigned;
     end;
   end;
 end;


procedure TfmMain.tbAutoExit(Sender: TObject);
Var i: integer;
begin
  for i := 0 to sgAutomats.ColCount-1 do LinkAutomats.Columns.Items[i].Width := sgAutomats.ColWidths[i];
end;

// Конец экспорта в эксель


end.
