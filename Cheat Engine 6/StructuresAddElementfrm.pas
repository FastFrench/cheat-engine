unit StructuresAddElementfrm;

{$MODE Delphi}

interface

uses
  LCLIntf, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LResources;

type
  TfrmStructuresAddElement = class(TForm)
    cbType: TComboBox;
    cbPointerto: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    edtDescription: TEdit;
    edtByteSize: TEdit;
    Label2: TLabel;
    edtOffset: TEdit;
    Label3: TLabel;
    procedure cbTypeChange(Sender: TObject);
    procedure edtByteSizeChange(Sender: TObject);
    procedure edtOffsetChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bytesize: integer;
  end;

var
  frmStructuresAddElement: TfrmStructuresAddElement;

implementation


procedure TfrmStructuresAddElement.cbTypeChange(Sender: TObject);
begin
  bytesize:=integer(cbtype.Items.Objects[cbtype.itemindex]);
  edtbytesize.Text:=inttostr(bytesize);
  edtByteSize.enabled:=(cbtype.ItemIndex=13) or (cbtype.itemindex=14);
end;

procedure TfrmStructuresAddElement.edtByteSizeChange(Sender: TObject);
begin
  bytesize:=strtoint(edtbytesize.text);
  cbtype.Items.Objects[cbtype.itemindex]:=pointer(bytesize);
end;

procedure TfrmStructuresAddElement.edtOffsetChange(Sender: TObject);
var x: integer;
begin
  button1.Enabled:=TryStrToInt('$'+edtOffset.Text,x);
end;

initialization
  {$i StructuresAddElementfrm.lrs}

end.
