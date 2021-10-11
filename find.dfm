object Form1: TForm1
  Left = 192
  Top = 121
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Find files'
  ClientHeight = 472
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label2: TLabel
    Left = 16
    Top = 72
    Width = 35
    Height = 16
    Caption = 'Items:'
  end
  object Bevel1: TBevel
    Left = 384
    Top = 16
    Width = 9
    Height = 441
    Shape = bsLeftLine
  end
  object Label3: TLabel
    Left = 400
    Top = 72
    Width = 35
    Height = 16
    Caption = 'Items:'
  end
  object Bevel2: TBevel
    Left = 16
    Top = 48
    Width = 737
    Height = 10
    Shape = bsBottomLine
  end
  object Button1: TButton
    Left = 16
    Top = 96
    Width = 145
    Height = 25
    Caption = 'Find all files in DIR ...'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 16
    Top = 136
    Width = 353
    Height = 321
    ItemHeight = 16
    TabOrder = 1
  end
  object Button2: TButton
    Left = 400
    Top = 96
    Width = 113
    Height = 25
    Caption = 'Find file in DIR'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 184
    Top = 96
    Width = 105
    Height = 24
    Date = 36526.906161226800000000
    Time = 36526.906161226800000000
    TabOrder = 3
  end
  object ListBox2: TListBox
    Left = 400
    Top = 136
    Width = 353
    Height = 321
    ItemHeight = 16
    MultiSelect = True
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 528
    Top = 96
    Width = 225
    Height = 24
    TabOrder = 5
    Text = 'c:\'
  end
  object Button3: TButton
    Left = 16
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Search in spiski'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 160
    Top = 16
    Width = 129
    Height = 24
    TabOrder = 7
    Text = 'price.html'
  end
  object CheckBox1: TCheckBox
    Left = 528
    Top = 72
    Width = 73
    Height = 17
    Caption = 'Sorted'
    TabOrder = 8
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 312
    Top = 104
    Width = 65
    Height = 17
    Caption = 'Sorted'
    TabOrder = 9
    OnClick = CheckBox2Click
  end
  object Button4: TButton
    Left = 400
    Top = 16
    Width = 113
    Height = 25
    Caption = 'Delete'
    TabOrder = 10
    OnClick = Button4Click
  end
end
