unit unDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSAcc, FireDAC.Comp.DataSet, FireDAC.Phys.MSAccDef;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysMSAccessDriverLink: TFDPhysMSAccessDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDOperatorQuery: TFDQuery;
    FDPlugQuery: TFDQuery;
    FDCounterQuery: TFDQuery;
    FDCounterSelect: TFDQuery;
    FDAutomatsQuery: TFDQuery;
    FDAutoAddQuery: TFDQuery;
    FDAutoCounter: TFDQuery;
    FDAutoUpdate: TFDQuery;
    FDAutoDelete: TFDQuery;
    FDAdminQuery: TFDQuery;
    FDAdminTemp: TFDQuery;
    FDTake: TFDQuery;
    FDUsersQuery: TFDQuery;
    fdChangePass: TFDQuery;
    FDAddUser: TFDQuery;
    FDUpdateUser: TFDQuery;
    FDLoginQuery: TFDQuery;
    FDUpdateLog: TFDQuery;
    FDLogQuery: TFDQuery;
    FDSettings: TFDQuery;
    function Connect: boolean;
    procedure DataModuleCreate(Sender: TObject);
    procedure Plug(auto_id, tickets: integer; transaction_date: TDate; comment: AnsiString; user_id: integer; fromStorage: boolean = True);
    function ChangeCounter(auto_id, tickets: integer; transaction_date: TDate; comment: AnsiString; user_id: integer): boolean;
    procedure FDOperatorQueryBeforeOpen(DataSet: TDataSet);
    function GetBeginDate: TDate;
    procedure SetBeginDate(current_date: TDate);
    function GetEndDate: TDate;
    procedure SetEndDate(current_date: TDate);
    function GetActivePage: integer;
    procedure SetActivePage(page: integer);
    procedure FDAutomatsQueryBeforeOpen(DataSet: TDataSet);
    procedure FDPhysMSAccessDriverLinkDriverCreated(Sender: TObject);
    procedure FDAdminQueryBeforeOpen(DataSet: TDataSet);
    procedure FDAdminTempBeforeExecute(DataSet: TFDDataSet);
    procedure FDLogQueryBeforeOpen(DataSet: TDataSet);
    property DateBegin: TDate read GetBeginDate write SetBeginDate;
    property DateEnd: TDate read GetEndDate write SetEndDate;
    property ActivePage: integer read GetActivePage write SetActivePage;
    procedure ActivateQuery;
    procedure AutoAdd(auto_name: string; comment:AnsiString; counter: integer; date_add: TDate);
    procedure AutoUpdate(auto_id: integer; auto_name: string; comment: AnsiString);
    procedure AutoDelete(auto_id: integer);
    procedure GetTake(auto_id: integer; Take: Real; date_of_take: TDate );
    procedure AddUser(user_name, pass: string; reg_date: TDate; r_level: integer);
    procedure EditUser(user_name: string; r_level, user_id: integer);
    procedure ChangePass(user_id: integer; pass: String);
    procedure LoadLogo(path: string);
    procedure GetLogo(Var logo: TStream);
  private
    { Private declarations }
    fDateBegin, fDateEnd : TDate;
    fActivePage: integer;
  public
    { Public declarations }

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TDM.ActivateQuery;
begin
case fActivePage of
  0: begin
      FDOperatorQuery.Close;
      FDOperatorQuery.Open;
      end;
  1: begin
      FDAdminQuery.Close;
      FDConnection.ExecSQL('DELETE FROM AdminTemp');
      FDAdminTemp.ExecSQL;
      FDAdminQuery.Open;
     end;
  2: begin
      FDAutomatsQuery.Close;
      FDAutomatsQuery.Open;
     end;
  3: begin
      FDUsersQuery.Close;
      FDUsersQuery.Open;
     end;
  4: begin
      FDLogQuery.Close;
      FDLogQuery.Open;
     end;
  5: begin

     end;
  end;
end;

function TDM.GetActivePage;
begin
Result := fActivePage;
end;

procedure TDM.SetActivePage(page: integer);
begin
fActivePage:=page;
ActivateQuery;
end;

function TDM.GetBeginDate;
begin
  Result := fDateBegin;
end;

function TDM.GetEndDate;
begin
  Result := fDateEnd;
end;

procedure TDM.SetBeginDate;
begin
  fDateBegin := current_date;
  ActivateQuery;
end;

procedure TDM.SetEndDate;
begin
  fDateEnd := current_date;
  ActivateQuery;
end;


function TDM.Connect;
begin
    fActivePage := 0;
  try
    DM.FDConnection.Connected := True;
 finally
 DM.FDLoginQuery.Active := True;
 ActivateQuery;
 FDSettings.Open;
 end;
  Result :=  FDConnection.Connected;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
Var Year, Month, Day : word;
begin
DecodeDate(Date, Year, Month, Day);
fDateBegin := EncodeDate(Year, Month, 1);
fDateEnd := Date;
end;

procedure TDM.FDAdminQueryBeforeOpen(DataSet: TDataSet);
begin
FDAdminQuery.ParamByName('BeginDate').AsDate := fDateBegin;
FDAdminQuery.ParamByName('EndDate').AsDate   := fDateEnd;
end;

procedure TDM.FDAdminTempBeforeExecute(DataSet: TFDDataSet);
begin
FDAdminTemp.ParamByName('BeginDate').AsDate := fDateBegin;
FDAdminTemp.ParamByName('EndDate').AsDate   := fDateEnd;
end;

procedure TDM.FDAutomatsQueryBeforeOpen(DataSet: TDataSet);
begin
FDAutomatsQuery.ParamByName('date').AsDate := fDateEnd;
end;

procedure TDM.FDLogQueryBeforeOpen(DataSet: TDataSet);
begin
FDLogQuery.ParamByName('BeginDate').AsDateTime := fDateBegin;
FDLogQuery.ParamByName('EndDate').AsDateTime   := fDateEnd+1;
end;

procedure TDM.FDOperatorQueryBeforeOpen(DataSet: TDataSet);
begin
FDOperatorQuery.ParamByName('date').AsDate := fDateEnd;
end;

procedure TDM.FDPhysMSAccessDriverLinkDriverCreated(Sender: TObject);
begin

end;

//Процедура внесения билетов в автомат
procedure TDM.Plug(auto_id: Integer; tickets: Integer; transaction_date: TDate; comment: AnsiString; user_id: integer; fromStorage: Boolean = True);
begin
// заносим данные в регистр оборотов
  FDPlugQuery.ParamByName('auto_id').AsInteger := auto_id;
  FDPlugQuery.ParamByName('transaction_date').AsDate := transaction_date;
  FDPlugQuery.ParamByName('comment').AsMemo := comment;
  FDPlugQuery.ParamByName('tickets').AsInteger := tickets;
  FDPlugQuery.Execute;

  FDUpdateLog.ParamByName('user_id').AsInteger := user_id;
  FDUpdateLog.ParamByName('date').AsDateTime   := Now;
  FDUpdateLog.ExecSQL;


  if (auto_id <> 1) and fromStorage then begin // Если списываем со склада, то заносим отрицательный оборот
    FDPlugQuery.ParamByName('auto_id').AsInteger := 1;
    FDPlugQuery.ParamByName('tickets').AsInteger := -tickets;
    FDPlugQuery.Execute;
    FDUpdateLog.ExecSQL;
  end;

  //Рассчитать остатки

ActivateQuery;

end;

// Процедура внесения нового значения счетчика
function TDM.ChangeCounter(auto_id: Integer; tickets: Integer; transaction_date: TDate; comment: AnsiString; user_id: integer): boolean;
Var Calc_tickets: integer; // вычисленное количество выданны билетов
begin
  Result := True;
//рассчитываем количество выданных билетов
  FDCounterSelect.ParamByName('auto_id').AsInteger  := auto_id;
  //FDCounterSelect.ParamByName('date').AsDate        := transaction_date;
  FDCounterSelect.Close;
  FDCounterSelect.Open;

  Calc_tickets := tickets - FDCounterSelect.Fields[0].AsInteger;

  if transaction_date >= FDCounterSelect.Fields[1].AsDateTime then begin
        {

// заносим данные в регистр оборотов
  FDPlugQuery.ParamByName('auto_id').AsInteger        := auto_id;
  FDPlugQuery.ParamByName('transaction_date').AsDate  := transaction_date;
  FDPlugQuery.ParamByName('comment').AsMemo           := comment;

//списываем разницу
  FDPlugQuery.ParamByName('tickets').AsInteger := -Calc_tickets;
  FDPlugQuery.Execute;         }
// обновляем показания счетчика
  FDCounterQuery.ParamByName('auto_id').AsInteger := auto_id;
  FDCounterQuery.ParamByName('date').AsDate       := transaction_date;
  FDCounterQuery.ParamByName('counter').AsInteger := tickets;
  FDCounterQuery.Execute;

  Plug(auto_id, -Calc_tickets, transaction_date, comment, user_id, False);
  end else Result := False; // Сигнализируем об ошибке
end;

// Процедура добавления автомата
procedure TDM.AutoAdd(auto_name: string; comment: AnsiString; counter: Integer; date_add: TDate);
begin
// добавление автомата
  FDAutoAddQuery.ParamByName('auto_name').AsString := auto_name;
  FDAutoAddQuery.ParamByName('comment').AsMemo     := comment;
  FDAutoAddQuery.ExecSQL;
// добавление  начального значения счетчика
  FDAutoCounter.ParamByName('date').AsDate       :=date_add;
  FDAutoCounter.ParamByName('counter').AsInteger := counter;
  FDAutoCounter.ExecSQL;

  ActivateQuery;
end;

// Процедура изменения данных автомата
procedure TDM.AutoUpdate(auto_id: Integer; auto_name: string; comment: AnsiString);
begin
  FDAutoUpdate.ParamByName('auto_id').AsInteger  := auto_id;
  FDAutoUpdate.ParamByName('auto_name').AsString := auto_name;
  FDAutoUpdate.ParamByName('comment').AsMemo     := comment;
  FDAutoUpdate.ExecSQL;

  ActivateQuery;
end;

// Удаление автомата
procedure TDM.AutoDelete(auto_id: Integer);
begin
  FDAutoDelete.ParamByName('auto_id').AsInteger := auto_id;
  FDAutoDelete.ExecSQL;

  ActivateQuery;
end;

// Процедура внесения выручки
procedure TDM.GetTake(auto_id: Integer; Take: Real; date_of_take: TDate );
begin
  FDTake.ParamByName('auto_id').AsInteger := auto_id;
  FDTake.ParamByName('date').AsDate       := date_of_take;
  FDTake.ParamByName('take').AsFloat      := take;
  FDTake.ExecSQL;

  ActivateQuery;
end;

// Процедура добавления пользователя
procedure TDM.AddUser(user_name, pass: string; reg_date: TDate; r_level: integer);
begin
FDAddUser.ParamByName('name').AsString := user_name;
FDAddUser.ParamByName('date').AsDate   := reg_date;
FDAddUser.ParamByName('level').AsByte  := r_level;
FDAddUser.ParamByName('pass').AsString := pass;
FDAddUser.ExecSQL;

ActivateQuery;
end;

// процедура редактирования пользователя
procedure TDM.EditUser(user_name: string; r_level, user_id: integer);
begin
FDUpdateUser.ParamByName('name').AsString := user_name;
FDUpdateUser.ParamByName('level').AsByte  := r_level;
FDUpdateUser.ParamByName('user_id').AsInteger := user_id;
FDUpdateUser.ExecSQL;

ActivateQuery;
end;

//Процедура обновления пароля
procedure TDM.ChangePass(user_id: Integer; pass: String);
begin
  fdChangePass.ParamByName('user_id').AsInteger := user_id;
  fdChangePass.ParamByName('pass').AsString := pass;
  fdChangePass.ExecSQL;

  ActivateQuery;
end;

procedure TDM.LoadLogo(path: string);
begin
   FDSettings.Edit;
   TBlobField(FDSettings.FieldByName('logo')).LoadFromFile(path);
   FDSettings.Post;
end;

procedure TDM.GetLogo(Var logo: Tstream);
begin
  try
    logo:= DM.FDSettings.CreateBlobStream(DM.FDSettings.FieldByName('logo'), bmRead);
  finally
  end;
end;

end.

