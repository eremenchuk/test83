﻿
&НаСервере
Процедура ЗаписатьИзмененияВручнуюНаСервере()
	Узел = Элементы.Список.ТекущаяСтрока;
	Если Узел = ПланыОбмена.ДляРИБ.ЭтотУзел() Тогда
		Сообщить("Выполнять только для других узлов!!!");
		Возврат;
	КонецЕсли;
	ИмяФайла = КаталогВременныхФайлов() + ПланыОбмена.ДляРИБ.ЭтотУзел().Наименование + "_" + Узел.Наименование + ".xml"; 
	ЗаписьСообщения = ПланыОбмена.СоздатьЗаписьСообщения();
	Запись = Новый ЗаписьXML;
	Запись.ОткрытьФайл(ИмяФайла);
	ЗаписьСообщения.НачатьЗапись(Запись, Узел);
	Выб = ПланыОбмена.ВыбратьИзменения(ЗаписьСообщения.Получатель, ЗаписьСообщения.НомерСообщения);
	Пока Выб.Следующий() Цикл
	    Объект = Выб.Получить();
	    ЗаписатьXML(Запись, Объект);
	КонецЦикла;
	ЗаписьСообщения.ЗакончитьЗапись();
	Запись.Закрыть();
	Сообщить(ИмяФайла);
КонецПроцедуры

&НаКлиенте
Процедура ЗаписатьИзмененияВручную(Команда)
	ЗаписатьИзмененияВручнуюНаСервере();
КонецПроцедуры
