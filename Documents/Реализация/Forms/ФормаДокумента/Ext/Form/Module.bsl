
&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	// Вставить содержимое обработчика.
	ПОПЫТКА
	ЗначениеКонстанты = Константы.Константа2.Получить();
	Константы.Константа2.Установить(ЗначениеКонстанты + 1);
	
	ВызватьИсключение "Исключение в попытке!"
	
	ИСКЛЮЧЕНИЕ
	КОНЕЦПОПЫТКИ
	//Отказ = Истина;
КонецПроцедуры


&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	// Вставить содержимое обработчика.
	//Отказ = Истина;
КонецПроцедуры

