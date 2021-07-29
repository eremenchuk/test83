﻿&НаКлиенте
Процедура РезультатОбработкаРасшифровки(Элемент, Расшифровка, СтандартнаяОбработка)
	РезультатОбработкаРасшифровкиНаСервере(ДанныеРасшифровки, Расшифровка, СтандартнаяОбработка);
КонецПроцедуры

&НаСервереБезКонтекста
Процедура РезультатОбработкаРасшифровкиНаСервере(АдресДанныхРасшифровки, ИдентификаторРасшифровки, СтандартнаяОбработка)
	ДанныеРасшифровки = ПолучитьИзВременногоХранилища(АдресДанныхРасшифровки);
	Расшифровка = ДанныеРасшифровки.Элементы.Получить(ИдентификаторРасшифровки);
	ПоляРасшифровки = Расшифровка.ПолучитьПоля();
	ПолеТовар = ПоляРасшифровки.Найти("Товар");
	Если ПолеТовар = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	СтандартнаяОбработка = Ложь;
	Товар = ПолеТовар.Значение;
	Сообщить(Товар.Описание);
КонецПроцедуры
