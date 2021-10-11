unit find;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Bevel1: TBevel;
    ListBox2: TListBox;
    Edit2: TEdit;
    Label3: TLabel;
    Button3: TButton;
    Edit3: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Bevel2: TBevel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FindFile(Dir:String);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 Dir1,Dir2:string;
 SR:TSearchRec;
 FindRes:Integer; // переменная для записи результата поиска
begin
 SelectDirectory('Просмотр каталога',Dir1,Dir2);
 ListBox1.Clear;
 FindRes:=FindFirst(Dir2+'\*.*',faAnyFile,SR);
 while FindRes=0 do // пока мы находим файлы (каталоги),
  begin             // то выполнять цикл
   // если найденный элемент каталог и
   if ((SR.Attr and faDirectory)=faDirectory) and
   // он имеет название "." или "..", тогда:
   ((SR.Name='.')or(SR.Name='..')) then
    begin
     FindRes:=FindNext(SR); // продолжить поиск
     Continue; // продолжить цикл
    end;
{   // если у файла (каталога) дата создания меньше,
   // чем установлено в DateTimePicker1, то
   if FileDateToDateTime(SR.Time)<DateTimePicker1.Date then
    begin
     FindRes:=FindNext(SR); // продолжить поиск
     Continue; // продолжить цикл
    end;   }
   ListBox1.Items.Add(SR.Name+'                   '+Dir2+'              '
     +IntToStr(SR.Size)+'  Bite');// добавление в список найденного эл-та
   if Application.Terminated then Break;
   Application.ProcessMessages;
   FindRes:=FindNext(SR); // продолжение поиска по заданным условиям
  end;
 FindClose(SR); // закрываем поиск
{
 Можно и faHidden+faDirectory и т.д.

 Атрибуты искомого элемента:

 faReadOnly - Файлы "только чтение".
 faHidden - Скрытые файлы.
 faSysFile - Системные файлы.
 faVolumeID - Файл метки диска(максимум 11 символов).
 faDirectory - Атрибут признака каталога.
 faArchive - Обычный файл.
 faAnyFile - Поиск по всем вышесказанным атрибутам.
}
 Label2.Caption:='Items: '+IntToStr(ListBox1.Items.Count);
end;

procedure TForm1.FindFile(Dir:String);
var
 i:integer;
 SR:TSearchRec;
 FindRes:Integer;
 Dir1,Dir2:string;
begin
 //SelectDirectory('Просмотр каталога',Dir1,Dir2);
 //Label4.Caption:='Path: - '+Dir2+'*.*';
 i:=0;
 FindRes:=FindFirst(Dir+'*.*',faAnyFile,SR);
 while FindRes=0 do
  begin
   if ((SR.Attr and faDirectory)=faDirectory) and
   ((SR.Name='.')or(SR.Name='..')) then
     begin
      FindRes:=FindNext(SR);
      Continue;
     end;
   // если найден каталог, то
   if ((SR.Attr and faDirectory)=faDirectory) then
    begin
     // входим в процедуру поиска с параметрами текущего каталога +
     // каталог, что мы нашли
     FindFile(Dir+SR.Name+'\');
     FindRes:=FindNext(SR);
     // после осмотра вложенного каталога мы продолжаем поиск
     // в этом каталоге
     Continue; // продолжить цикл
    end;
   ListBox2.Items.Add(SR.Name+'       -       '+Dir+'       -       '
                                            +IntToStr(SR.Size)+' - Bite');
   if Application.Terminated then Break;
   Application.ProcessMessages;
   FindRes:=FindNext(SR);
  end;
 FindClose(SR);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 ListBox2.Clear; // очистка списка файлов
 FindFile(Edit2.Text); // поиск файлов с начальными условиями, заданных в Edit1
 Label3.Caption:='Items: '+IntToStr(ListBox2.Items.Count);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 s:string;
begin
 s:=Edit3.Text;
 with ListBox1 do
 ItemIndex:=Perform(LB_SELECTSTRING, ItemIndex, LongInt(S));
/////////////////
 with ListBox2 do
 ItemIndex:=Perform(LB_SELECTSTRING, ItemIndex, LongInt(S));
// если Multiselect=true, то при поиске файла найденная строка цветом не
// выделяется 
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 SendMessage(ListBox1.Handle,LB_SetHorizontalExtent,1000,0);
 SendMessage(ListBox2.Handle,LB_SetHorizontalExtent,1000,0);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 Listbox2.Sorted:=true;
 ListBox2.Items.BeginUpdate;
 SendMessage(ListBox2.Handle,LB_SetHorizontalExtent,1000,0);
 ListBox2.Items.EndUpdate; 
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
 Listbox1.Sorted:=true;
 SendMessage(ListBox1.Handle,LB_SetHorizontalExtent,1000,0);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
 i:integer;
begin
 for i:=ListBox1.Items.Count-1 downto 0 do
  if ListBox1.Selected[i] then
   begin
    ListBox1.Items.Delete(i);
    ListBox1.Selected[i]:=true;
   end;
 for i:=ListBox2.Items.Count-1 downto 0 do
  if ListBox2.Selected[i] then
   begin
    ListBox2.Items.Delete(i);
    ListBox2.Selected[i]:=true;
   end;
end;

end.
