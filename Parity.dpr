﻿program Project1;

{$APPTYPE CONSOLE}
uses
  SysUtils, Classes;

var
  line: string;
  fileFrom, fileTo: TextFile;
  fileToLength: Integer;
begin
  // Открытие in.txt для чтения
  AssignFile(fileFrom, 'in.txt');
  Reset(fileFrom);

  // Открытие out.txt для записи
  AssignFile(fileTo, 'out.txt');
  ReWrite(fileTo);

  // Обнуление переменной с длиной выходного файла
  fileToLength := 0;

  while not Eof(fileFrom) do
  begin
    // Чтение очередной строки
    Readln(fileFrom, line);

    // Сравнение первого и последнего символа строки
    if (line[1] = line[length(line)]) then
    begin
      // Изменение переменной с длиной выходного файла
      fileToLength := fileToLength + length(line);
      // Запись строки в выходной файл
      WriteLn(fileTo, line);
    end;
  end;

  // Закрытие файлов
  CloseFile(fileFrom);
  CloseFile(fileTo);

  // Вывод результатов
  WriteLn('The length of out.txt is: ' + IntToStr(fileToLength));
  ReadLn;
end.
