﻿
Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)
	ПараметрыСеанса.ТекущийПользователь = Справочники.Пользователи.НайтиПоНаименованию(ИмяПользователя());
	ПараметрыСеанса.СекретныйСклад = Константы.СекретныйСклад.Получить();
	ПараметрыСеанса.СекретныйКонтрагент = Константы.СекретныйКонтрагент.Получить();
КонецПроцедуры